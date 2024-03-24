#include <fstream>
#include <iostream>
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
    //VL_PRINTF("get(): i=%zu rsp=0x%" PRIx64 " x=%" PRId32" y=%" PRId32 " z=%" PRId32"\n", i, rsp, x[i], y[i], z[i]);
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
    double xr = A * ((1 << (SXY - 1)) - 1);
    double yr = 0.0;
    double zr = (i < 0x8000) ? i : (i - 0x10000);
    double xd = x[i] - xr;
    double yd = y[i] - yr;
    double zz = z[i] - zr;
    double zd = (zz < -0x8000) ? zz + 0x10000 : zz;

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
