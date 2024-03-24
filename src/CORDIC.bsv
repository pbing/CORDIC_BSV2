package CORDIC;

import ClientServer::*;
import FIFO::*;
import GetPut::*;
import Real::*;
import Vector::*;

export rotating, vectoring,
       CORDICRequest(..), CORDICResponse(..),
       CORDICServer, CORDICClient,
       mkCORDIC, mkPipelineCORDIC;

Bool rotating  = False;
Bool vectoring = True;

typedef struct {
   Int#(sxy) x;
   Int#(sxy) y;
   Int#(sz)  z; // π = 2**(sz - 1)
   } CORDICRequest#(numeric type sxy, numeric type sz) deriving (Bits, Eq, FShow);

typedef struct {
   Int#(sxy) x; // scaled by K
   Int#(sxy) y; // scaled by K
   Int#(sz)  z; // π = 2**(sz - 1)
   } CORDICResponse#(numeric type sxy, numeric type sz) deriving (Bits, Eq, FShow);

typedef Server#(CORDICRequest#(sxy, sz), CORDICResponse#(TAdd#(sxy, 1), sz)) CORDICServer#(numeric type n, numeric type sxy, numeric type sz);
typedef Client#(CORDICRequest#(sxy, sz), CORDICResponse#(TAdd#(sxy, 1), sz)) CORDICClient#(numeric type sxy, numeric type sz);

function Int#(n) theta(Integer i);
   return fromInteger(round(atan(2**(fromInteger(-i))) * 2**(fromInteger(valueOf(n) - 1)) / pi));
endfunction

/* Iterative CORDIC implementation */
module mkCORDIC #(parameter Bool mode) (CORDICServer#(n, sxy, sz))
   provisos (Add#(sxy, 1, sxy2));

   Reg#(Bit#(TLog#(n)))             itercount <- mkReg(0);
   FIFO#(CORDICResponse#(sxy2, sz)) f_in <- mkFIFO;
   FIFO#(CORDICResponse#(sxy2, sz)) f_out <- mkFIFO;
   Reg#(Int#(sxy2))                 x <- mkRegU;
   Reg#(Int#(sxy2))                 y <- mkRegU;
   Reg#(Int#(sz))                   z <- mkRegU;

   // build the arctan table
   Vector#(n, Int#(sz)) th = map(theta, genVector());

   rule iterate0 if (itercount == 0);
      let i = itercount;
      let s = f_in.first;
      f_in.deq();

      if ((mode == vectoring && s.y >= 0) || (mode == rotating && s.z < 0)) begin
         x <= s.x + (s.y >> i);
         y <= s.y - (s.x >> i);
         z <= s.z + th[i];
      end
      else begin
         x <= s.x - (s.y >> i);
         y <= s.y + (s.x >> i);
         z <= s.z - th[i];
      end

      itercount <= itercount + 1;
   endrule

   rule iterate if (itercount > 0 && itercount < fromInteger(valueOf(n)-1));
      let i = itercount;

      if ((mode == vectoring && y >= 0) || (mode == rotating && z < 0)) begin
         x <= x + (y >> i);
         y <= y - (x >> i);
         z <= z + th[i];
      end
      else begin
         x <= x - (y >> i);
         y <= y + (x >> i);
         z <= z - th[i];
      end

      itercount <= itercount + 1;
   endrule

   rule iterate_final if (itercount == fromInteger(valueOf(n)-1));
      let i = itercount;
      CORDICResponse#(sxy2, sz) s;

      if ((mode == vectoring && y >= 0) || (mode == rotating && z < 0)) begin
         s.x = x + (y >> i);
         s.y = y - (x >> i);
         s.z = z + th[i];
      end
      else begin
         s.x = x - (y >> i);
         s.y = y + (x >> i);
         s.z = z - th[i];
      end

      f_out.enq(s);
      itercount <= 0;
   endrule

   interface Put request;
      method Action put(CORDICRequest#(sxy, sz) req);
         Int#(sxy2) x    = extend(req.x);
         Int#(sxy2) y    = extend(req.y);
         let        z    = req.z;
         let        pi_2 = fromInteger(2**(valueOf(sz) - 2)); // π/2
         CORDICResponse#(sxy2, sz) s;

         /* map argument -π...π to -π/2...π/2 */
         if ((mode == vectoring && x < 0 && y >= 0) || (mode == rotating && z <= (-pi_2))) begin
            s.x = y;
            s.y = -x;
            s.z = z + pi_2;
         end
         else if ((mode == vectoring && x < 0 && y < 0) || (mode == rotating && z >= pi_2)) begin
            s.x = -y;
            s.y = x;
            s.z = z - pi_2;
         end
         else begin
            s.x = x;
            s.y = y;
            s.z = z;
         end

         f_in.enq(s);
      endmethod
   endinterface

   interface Get response = toGet(f_out);
endmodule: mkCORDIC

/* Pipelined CORDIC implementation */
module mkPipelineCORDIC #(parameter Bool mode) (CORDICServer#(n, sxy, sz))
   provisos (Add#(sxy, 1, sxy2));
   /*
   stage[0]   : mapped inputs
   stage[1..n]: iterations
   */
   Vector#(TAdd#(n, 1), FIFO#(CORDICResponse#(sxy2, sz))) stg <- replicateM(mkLFIFO);

   for (Integer i = 0; i < valueOf(n); i = i + 1)
      rule iterate;
         let s = stg[i].first;
         stg[i].deq;

         let x = s.x;
         let y = s.y;
         let z = s.z;
         CORDICResponse#(sxy2, sz) s1;

         if ((mode == vectoring && y >= 0) || (mode == rotating && z < 0)) begin
            s1.x = x + (y >> i);
            s1.y = y - (x >> i);
            s1.z = z + theta(i);
         end
         else begin
            s1.x = x - (y >> i);
            s1.y = y + (x >> i);
            s1.z = z - theta(i);
         end

         stg[i+1].enq(s1);
      endrule

   interface Put request;
      method Action put(CORDICRequest#(sxy, sz) req);
         Int#(sxy2) x    = extend(req.x);
         Int#(sxy2) y    = extend(req.y);
         let        z    = req.z;
         let        pi_2 = fromInteger(2**(valueOf(sz) - 2)); // π/2
         CORDICResponse#(sxy2, sz) s;

         /* map argument -π...π to -π/2...π/2 */
         if ((mode == vectoring && x < 0 && y >= 0) || (mode == rotating && z <= (-pi_2))) begin
            s.x = y;
            s.y = -x;
            s.z = z + pi_2;
         end
         else if ((mode == vectoring && x < 0 && y < 0) || (mode == rotating && z >= pi_2)) begin
            s.x = -y;
            s.y = x;
            s.z = z - pi_2;
         end
         else begin
            s.x = x;
            s.y = y;
            s.z = z;
         end

         head(stg).enq(s);
      endmethod
   endinterface

   interface Get response = toGet(last(stg));
endmodule: mkPipelineCORDIC

endpackage
