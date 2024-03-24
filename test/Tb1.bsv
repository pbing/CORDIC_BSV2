/* Rotating mode
*
* Input (polar coordinates): x = magnitude, y = 0 , z = phase
* 
* Output (cartesian coordinates): x,y = I/Q signals, z = 0
*/

package Tb;

import ClientServer::*;
import GetPut::*;

import CORDIC::*;

(* synthesize *)
module mkCORDIC_r (CORDICServer#(12, 13, 16));
   //let m <- mkCORDIC(rotating);
   CORDICServer#(12, 13, 16) m <- mkCORDIC(rotating);
   return m;
endmodule

module mkTb(Empty);
   Reg#(int)                 cycles <- mkReg(0);
   Reg#(Int#(16))            phase <- mkReg(0);
   CORDICServer#(12, 13, 16) dut <- mkCORDIC_r;
  
   Reg#(File) fh <- mkReg(InvalidFile);
   
   
   rule fopen (fh == InvalidFile);
      let lfh <- $fopen("rsp_iterating_rotating.csv", "w");
      fh <= lfh;
      $fdisplay(lfh, "x,y,z");
   endrule

   rule run;
      CORDICRequest#(13, 16) req = CORDICRequest {x: fromInteger(2**(13-1) - 1),
                                                  y: 0,
                                                  z: phase};
      //$display("%t req=", $time, fshow(req));
      dut.request.put(req);
      phase <= phase + 1;
   endrule

   rule monitor;
      let rsp <- dut.response.get();
      //$display("%t rsp=", $time, fshow(rsp));
      $fdisplay(fh, "%0d,%0d,%0d", rsp.x, rsp.y, rsp.z);
      cycles <= cycles + 1;
      if (cycles == fromInteger(2**16 - 1)) $finish;
   endrule
endmodule

endpackage
