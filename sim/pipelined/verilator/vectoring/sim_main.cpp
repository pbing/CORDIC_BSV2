/* https://www.itsembedded.com/dhd/verilator_4/ */

#include <verilated.h>
#include <verilated_fst_c.h>
#include "VmkPipelineCORDIC_v.h"
#include "Request.h"
#include "Response.h"
#include "cordic_config.h"

static_assert(SZ == 16); // all tests must run with 16 bit Z port

// Legacy function required only so linking works
double sc_time_stamp() { return 0; }

int main(int argc, char** argv) {
  const std::unique_ptr<VerilatedContext> contextp{new VerilatedContext};
  contextp->commandArgs(argc, argv);

  auto dut = std::make_shared<VmkPipelineCORDIC_v>();
  auto req = std::make_unique<Request>(dut, 0x10000);
  auto rsp = std::make_unique<Response>(dut, 0x10000);

  contextp->traceEverOn(true);
  auto tfp = std::make_unique<VerilatedFstC>();
  dut->trace(tfp.get(), 99);
  tfp->open("dump.fst");

  dut->CLK   = 0;
  dut->RST_N = 0;
  dut->eval();

  while (contextp->time() < (2 * 0x10000 + 100) && !contextp->gotFinish()) {
    dut->CLK ^= 1;
    dut->EN_request_put = dut->RDY_request_put; 
    dut->EN_response_get = dut->RDY_response_get;
    req->put(contextp->time());
    rsp->get(contextp->time());
    dut->eval();

    if (dut->CLK == 1 && contextp->time() > 3) {
      dut->RST_N = 1;
    }

    tfp->dump(contextp->time());
    contextp->timeInc(1);
  }

  dut->final();
  tfp->close();

  rsp->calc_err();
  printf("xerr=%f yerr=%f zerr=%f\n", rsp->xerr, rsp->yerr, rsp->zerr);
  
  rsp->write_csv("../../python/vectoring/rsp.csv");
  return 0;
}
