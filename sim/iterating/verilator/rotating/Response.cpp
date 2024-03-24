#include <complex>
#include <fstream>
#include <iostream>
#include <gsl/gsl_complex_math.h>
#include <gsl/gsl_errno.h>
#include <gsl/gsl_fft_halfcomplex.h>
#include <gsl/gsl_fft_real.h>
#include "Response.h"
#include "cordic_config.h"

// https://graphics.stanford.edu/~seander/bithacks.html#FixedSignExtend
template <typename T, unsigned B>
inline T signextend(const T x)
{
  struct {T x:B;} s;
  return s.x = x;
}

// SXY -> SXY + 1, because the outputs X and Y are one bit larger than the inputs X0, Y0.
void unpack(const uint64_t rsp, int32_t& x, int32_t& y, int32_t& z) {
  int64_t xx = rsp & (((1ULL << (SXY + 1)) - 1) << (SXY + 1 + SZ));
  int64_t yy = rsp & (((1ULL << (SXY + 1)) - 1) << SZ);
  int64_t zz = rsp & ((1ULL << SZ) - 1);

  x = signextend<int32_t, (SXY + 1)>(xx >> (SXY + 1 + SZ));
  y = signextend<int32_t, (SXY + 1)>(yy >> SZ);
  z = signextend<int32_t, SZ>(zz);
}

void Response::get(uint64_t t) {
  if (dut->CLK && dut->RST_N  && dut->RDY_response_get && i < x.size()) {
    int64_t rsp = dut->response_get;
    unpack(rsp, x[i], y[i], z[i]);
    //VL_PRINTF("get(): t=%" PRIu64 " i=%zu rsp=0x%" PRIx64 " x=%" PRId32 " y=%" PRId32 " z=%" PRId32 "\n", t, i, rsp, x[i], y[i], z[i]);
    ++i;
  }
}

void Response::calc_err() {
  auto   n   = x.size();
  double A   = 1.0;
  double ssx = 0.0;
  double ssy = 0.0;
  double ssz = 0.0;

  /* scale factor */
  for (int i = 0; i < ITERATIONS; ++i) {
    A *= sqrt(1.0 + exp2(-2 * i));
  }
  //printf("A=%f\n", A);

  /* standard deviation */
  for (auto i = 0; i < n; ++i) {
    double phi = M_PI * (static_cast<double>(i) / (1 << (SZ - 1)));
    double xr = A * ((1 << (SXY - 1)) - 1) * cos(phi);
    double yr = A * ((1 << (SXY - 1)) - 1) * sin(phi);
    double zr = 0.0;
    double xd = x[i] - xr;
    double yd = y[i] - yr;
    double zd = z[i] - zr;
    ssx += xd * xd;
    ssy += yd * yd;
    ssz += zd * zd;
#if 0
    printf("x[%0d]=%0d xr=%f sxx=%f y[%0d]=%0d yr=%f syy=%f z[%0d]=%0d zr=%f szz=%f  \n",
           i, x[i], xr, ssx,
           i, y[i], yr, ssy,
           i, z[i], zr, ssz);
#endif
  }
  xerr = sqrt(ssx / (n - 1));
  yerr = sqrt(ssy / (n - 1));
  zerr = sqrt(ssz / (n - 1));
}

void Response::enob(const size_t bin) {
  // FFT of x and y
  auto n = x.size();
  auto xh = std::vector<double>(x.begin(), x.end());
  auto yh = std::vector<double>(y.begin(), y.end());

  int err;
  err = gsl_fft_real_radix2_transform(xh.data(), 1, n);
  if (err) fprintf(stderr, "gsl_fft_real_radix2_transform(xh, 1, %zu): %s\n", n, gsl_strerror(err));

  err = gsl_fft_real_radix2_transform(yh.data(), 1, n);
  if (err) fprintf(stderr, "gsl_fft_real_radix2_transform(yh, 1, %zu): %s\n", n, gsl_strerror(err));

  // convert half complex array to complex array
  auto xc = std::vector<double>(2*n);
  auto yc = std::vector<double>(2*n);

  err = gsl_fft_halfcomplex_radix2_unpack(xh.data(), xc.data(), 1, n);
  if (err) fprintf(stderr, "gsl_fft_halfcomplex_radix2_unpack(xh, xc, 1, %zu): %s\n", n, gsl_strerror(err));

  err = gsl_fft_halfcomplex_radix2_unpack(yh.data(), yc.data(), 1, n);
  if (err) fprintf(stderr, "gsl_fft_halfcomplex_radix2_unpack(yh, yc, 1, %zu): %s\n", n, gsl_strerror(err));

  // calculate power
  auto x2 = std::vector<double>(n);
  auto y2 = std::vector<double>(n);

  for (auto i = 0; i < n; ++i) {
    gsl_complex zx, zy;
    GSL_SET_COMPLEX(&zx, xc[2*i], xc[2*i+1]);
    GSL_SET_COMPLEX(&zy, yc[2*i], yc[2*i+1]);
    x2[i] = gsl_complex_abs2(zx);
    y2[i] = gsl_complex_abs2(zy);
    //printf("i=%zu x=%f y=%f\n", i, sqrt(x2[i]), sqrt(y2[i]));
  }


  // noise and distortions
  // omit DC component and fundamental frequency
  double sxx = 0.0;
  double syy = 0.0;
  for (auto i = 1; i < n / 2; ++i)
    if (i != bin) {
      sxx += x2[i] + x2[n-i];
      syy += y2[i] + y2[n-i];
    }
  // add bin at Nyquist frequency
  if (bin != n/2) {
    sxx += x2[n/2];
    syy += y2[n/2];
  }
  // adjust bias for the two missing bins
  // (n - 1) -> (n - 3)
  sxx /= n * (n - 3);
  syy /= n * (n - 3);

  double sdx = sqrt(sxx);
  double sdy = sqrt(syy);
  //printf("sdx=%f sdy=%f\n", sdx, sdy); // should be the same like xerr, yerr

  // fundamental frequency
  double xf = (x2[bin] + x2[n-bin]) / (n * (n - 1));
  double yf = (y2[bin] + y2[n-bin]) / (n * (n - 1));
  printf("peak(xf)=%f peak(yf)=%f\n", sqrt(2 * xf), sqrt(2 * yf)); // amplitude = sqrt(2) * RMS

  // ENOB
  // https://scdn.rohde-schwarz.com/ur/pws/dl_downloads/dl_application/application_notes/1er03/ENOB_Technical_Paper_1ER03_1e.pdf
  xenob = 0.5 * (log2(xf / sxx) - log2(1.5));
  yenob = 0.5 * (log2(yf / syy) - log2(1.5));
}

void Response::write_csv(const std::string file_name) {
  std::ofstream fh;
  fh.open(file_name);

  if (fh.fail()) {
    perror(file_name.c_str());
    exit(1);
  }

  fh << "x,y,z\n";
  for (auto i = 0; i < x.size(); ++i) {
    fh << x[i] << "," << y[i] << "," << z[i] << "\n";
  }
  fh.close();
}
