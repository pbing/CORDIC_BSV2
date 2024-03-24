/* Generate Verilog simulation modules */

package Modules;

import CORDIC::*;

(* synthesize *)
module mkCORDIC_r (CORDICServer#(12, 13, 16));
   //let m <- mkCORDIC(rotating);
   CORDICServer#(12, 13, 16) m <- mkCORDIC(rotating);
   return m;
endmodule

(* synthesize *)
module mkPipelineCORDIC_r (CORDICServer#(12, 13, 16));
   //let m <- mkPipelineCORDIC(rotating);
   CORDICServer#(12, 13, 16) m <- mkPipelineCORDIC(rotating);
   return m;
endmodule

(* synthesize *)
module mkCORDIC_v (CORDICServer#(16, 16, 16));
   //let m <- mkCORDIC(vectoring);
   CORDICServer#(16, 16, 16) m <- mkCORDIC(vectoring);
   return m;
endmodule

(* synthesize *)
module mkPipelineCORDIC_v (CORDICServer#(16, 16, 16));
   //let m <- mkPipelineCORDIC(vectoring);
   CORDICServer#(16, 16, 16) m <- mkPipelineCORDIC(vectoring);
   return m;
endmodule

endpackage
