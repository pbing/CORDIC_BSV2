#pragma once

#include <verilated.h>
#include "VmkPipelineCORDIC_r.h"

class Response {
  std::shared_ptr<VmkPipelineCORDIC_r> dut;
  size_t i = 0;
  std::vector<int32_t> x;
  std::vector<int32_t> y;
  std::vector<int32_t> z; 

 public:
  double xerr, yerr, zerr;
  double xenob, yenob; 

  Response(std::shared_ptr<VmkPipelineCORDIC_r> dut, size_t n) : dut(dut) {
    x = std::vector<int32_t>(n);
    y = std::vector<int32_t>(n);
    z = std::vector<int32_t>(n);
  }

  void get(uint64_t t);
  void calc_err();
  void enob(size_t bin);
  void write_csv(const std::string file_name);
};
