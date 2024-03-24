/* Vectoring mode
*
 * Input (cartesian coordinates): x,y = I/Q signals, z = 0
 *
 * Output (polar coordinates): x = magnitude, y = 0, z = phase
*/

package Tb;

import ClientServer::*;
import GetPut::*;
import Real::*;
import Vector::*;

import CORDIC::*;

(* synthesize *)
module mkPipelineCORDIC_v (CORDICServer#(16, 16, 16));
   //let m <- mkPipelineCORDIC(vectoring);
   CORDICServer#(16, 16, 16) m <- mkPipelineCORDIC(vectoring);
   return m;
endmodule

module mkTb(Empty);
   Reg#(int)                 in_cycles <- mkReg(0);
   Reg#(int)                 out_cycles <- mkReg(0);
   Reg#(Int#(16))            phase <- mkReg(0);
   CORDICServer#(16, 16, 16) dut <- mkPipelineCORDIC_v;
   Reg#(File)                fh <- mkReg(InvalidFile);
   
   function Int#(16) cosFunc(Integer i) = fromInteger(round((2**(16-1) - 1) * cos(2 * pi * fromInteger(127 * i) / 'h10000)));
   function Int#(16) sinFunc(Integer i) = fromInteger(round((2**(16-1) - 1) * sin(2 * pi * fromInteger(127 * i) / 'h10000)));
   
   Vector#('h400, Int#(16)) c = map(cosFunc, genVector());
   Vector#('h400, Int#(16)) s = map(sinFunc, genVector());
   
   rule fopen (fh == InvalidFile);
      let lfh <- $fopen("rsp_pipelined_vectoring.csv", "w");
      fh <= lfh;
      $fdisplay(lfh, "x,y,z");
   endrule

   rule run;
      let i = in_cycles;
      CORDICRequest#(16, 16) req = CORDICRequest {x: c[i],
                                                  y: s[i],
                                                  z: 0};
      //$display("%t req=", $time, fshow(req));
      dut.request.put(req);
      phase <= phase + 1;
      in_cycles <= in_cycles + 1;
   endrule

   rule monitor;
      let rsp <- dut.response.get();
      //$display("%t rsp=", $time, fshow(rsp));
      $fdisplay(fh, "%0d,%0d,%0d", rsp.x, rsp.y, rsp.z);
      out_cycles <= out_cycles + 1;
      if (out_cycles == fromInteger('h400 - 1)) $finish;
   endrule
endmodule

endpackage
