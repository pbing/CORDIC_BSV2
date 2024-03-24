#include "Request.h"
#include "cordic_config.h"

uint64_t pack(const int32_t x, const int32_t y, const int32_t z) {
  uint64_t xx = ((int64_t)x << (SXY + SZ)) & (((1ULL << SXY) - 1) << (SXY + SZ)); 
  uint64_t yy = ((int64_t)y << SZ)         & (((1ULL << SXY) - 1) << SZ);
  uint64_t zz =  (int64_t)z                &  ((1ULL << SZ)  - 1);
  return xx | yy | zz;
}

void Request::put(uint64_t t) {
  if (dut->CLK && dut->RST_N && dut->RDY_request_put && i < n) {
    double phi = M_PI * ((double)i / (double)0x8000u);
    int32_t x = lround(((1 << (SXY - 1)) - 1) * cos(phi));
    int32_t y = lround(((1 << (SXY - 1)) - 1) * sin(phi));
    int32_t z = 0;
    int64_t req = pack(x, y, z);
    dut->request_put = req;
    //VL_PRINTF("put(): i=%zu x=%" PRId32 " y=%" PRId32 " z=%" PRId32 " req=0x%" PRIx64"\n", i, x, y, z, req);
    ++i;
  }
}
