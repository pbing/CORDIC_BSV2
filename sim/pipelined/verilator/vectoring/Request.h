#pragma once

#include <verilated.h>
#include "VmkPipelineCORDIC_v.h"

class Request {
  std::shared_ptr<VmkPipelineCORDIC_v> dut;
  size_t n;
  size_t i = 0;

public:
  Request(std::shared_ptr<VmkPipelineCORDIC_v> dut, size_t n) : dut(dut), n(n) {}

  void put(uint64_t t);
};
