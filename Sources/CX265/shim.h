#include <x265.h>

static inline __attribute__((__always_inline__))
x265_encoder* swift_x265_encoder_open(x265_param *p) {
  return x265_encoder_open(p);
}

static inline __attribute__((__always_inline__))
x265_api* swift_x265_api_get(int bitDepth) {
  return x265_api_get(bitDepth);
}
