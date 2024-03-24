//
// Generated by Bluespec Compiler, version 2024.01 (build ae2a2fc)
//
// On Sat Mar 23 14:07:18 CET 2024
//
//
// Ports:
// Name                         I/O  size props
// RDY_request_put                O     1
// response_get                   O    50 reg
// RDY_response_get               O     1 reg
// CLK                            I     1 clock
// RST_N                          I     1 reset
// request_put                    I    48
// EN_request_put                 I     1
// EN_response_get                I     1
//
// Combinational paths from inputs to outputs:
//   EN_response_get -> RDY_request_put
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkPipelineCORDIC_v(CLK,
			  RST_N,

			  request_put,
			  EN_request_put,
			  RDY_request_put,

			  EN_response_get,
			  response_get,
			  RDY_response_get);
  input  CLK;
  input  RST_N;

  // action method request_put
  input  [47 : 0] request_put;
  input  EN_request_put;
  output RDY_request_put;

  // actionvalue method response_get
  input  EN_response_get;
  output [49 : 0] response_get;
  output RDY_response_get;

  // signals for module outputs
  wire [49 : 0] response_get;
  wire RDY_request_put, RDY_response_get;

  // ports of submodule m_stg_0
  wire [49 : 0] m_stg_0$D_IN, m_stg_0$D_OUT;
  wire m_stg_0$CLR, m_stg_0$DEQ, m_stg_0$EMPTY_N, m_stg_0$ENQ, m_stg_0$FULL_N;

  // ports of submodule m_stg_1
  wire [49 : 0] m_stg_1$D_IN, m_stg_1$D_OUT;
  wire m_stg_1$CLR, m_stg_1$DEQ, m_stg_1$EMPTY_N, m_stg_1$ENQ, m_stg_1$FULL_N;

  // ports of submodule m_stg_10
  wire [49 : 0] m_stg_10$D_IN, m_stg_10$D_OUT;
  wire m_stg_10$CLR,
       m_stg_10$DEQ,
       m_stg_10$EMPTY_N,
       m_stg_10$ENQ,
       m_stg_10$FULL_N;

  // ports of submodule m_stg_11
  wire [49 : 0] m_stg_11$D_IN, m_stg_11$D_OUT;
  wire m_stg_11$CLR,
       m_stg_11$DEQ,
       m_stg_11$EMPTY_N,
       m_stg_11$ENQ,
       m_stg_11$FULL_N;

  // ports of submodule m_stg_12
  wire [49 : 0] m_stg_12$D_IN, m_stg_12$D_OUT;
  wire m_stg_12$CLR,
       m_stg_12$DEQ,
       m_stg_12$EMPTY_N,
       m_stg_12$ENQ,
       m_stg_12$FULL_N;

  // ports of submodule m_stg_13
  wire [49 : 0] m_stg_13$D_IN, m_stg_13$D_OUT;
  wire m_stg_13$CLR,
       m_stg_13$DEQ,
       m_stg_13$EMPTY_N,
       m_stg_13$ENQ,
       m_stg_13$FULL_N;

  // ports of submodule m_stg_14
  wire [49 : 0] m_stg_14$D_IN, m_stg_14$D_OUT;
  wire m_stg_14$CLR,
       m_stg_14$DEQ,
       m_stg_14$EMPTY_N,
       m_stg_14$ENQ,
       m_stg_14$FULL_N;

  // ports of submodule m_stg_15
  wire [49 : 0] m_stg_15$D_IN, m_stg_15$D_OUT;
  wire m_stg_15$CLR,
       m_stg_15$DEQ,
       m_stg_15$EMPTY_N,
       m_stg_15$ENQ,
       m_stg_15$FULL_N;

  // ports of submodule m_stg_16
  wire [49 : 0] m_stg_16$D_IN, m_stg_16$D_OUT;
  wire m_stg_16$CLR,
       m_stg_16$DEQ,
       m_stg_16$EMPTY_N,
       m_stg_16$ENQ,
       m_stg_16$FULL_N;

  // ports of submodule m_stg_2
  wire [49 : 0] m_stg_2$D_IN, m_stg_2$D_OUT;
  wire m_stg_2$CLR, m_stg_2$DEQ, m_stg_2$EMPTY_N, m_stg_2$ENQ, m_stg_2$FULL_N;

  // ports of submodule m_stg_3
  wire [49 : 0] m_stg_3$D_IN, m_stg_3$D_OUT;
  wire m_stg_3$CLR, m_stg_3$DEQ, m_stg_3$EMPTY_N, m_stg_3$ENQ, m_stg_3$FULL_N;

  // ports of submodule m_stg_4
  wire [49 : 0] m_stg_4$D_IN, m_stg_4$D_OUT;
  wire m_stg_4$CLR, m_stg_4$DEQ, m_stg_4$EMPTY_N, m_stg_4$ENQ, m_stg_4$FULL_N;

  // ports of submodule m_stg_5
  wire [49 : 0] m_stg_5$D_IN, m_stg_5$D_OUT;
  wire m_stg_5$CLR, m_stg_5$DEQ, m_stg_5$EMPTY_N, m_stg_5$ENQ, m_stg_5$FULL_N;

  // ports of submodule m_stg_6
  wire [49 : 0] m_stg_6$D_IN, m_stg_6$D_OUT;
  wire m_stg_6$CLR, m_stg_6$DEQ, m_stg_6$EMPTY_N, m_stg_6$ENQ, m_stg_6$FULL_N;

  // ports of submodule m_stg_7
  wire [49 : 0] m_stg_7$D_IN, m_stg_7$D_OUT;
  wire m_stg_7$CLR, m_stg_7$DEQ, m_stg_7$EMPTY_N, m_stg_7$ENQ, m_stg_7$FULL_N;

  // ports of submodule m_stg_8
  wire [49 : 0] m_stg_8$D_IN, m_stg_8$D_OUT;
  wire m_stg_8$CLR, m_stg_8$DEQ, m_stg_8$EMPTY_N, m_stg_8$ENQ, m_stg_8$FULL_N;

  // ports of submodule m_stg_9
  wire [49 : 0] m_stg_9$D_IN, m_stg_9$D_OUT;
  wire m_stg_9$CLR, m_stg_9$DEQ, m_stg_9$EMPTY_N, m_stg_9$ENQ, m_stg_9$FULL_N;

  // remaining internal signals
  wire [49 : 0] IF_SEXT_request_put_BITS_47_TO_32_03_04_BIT_16_ETC___d320;
  wire [16 : 0] SEXT_request_put_BITS_31_TO_16_06___d307,
		SEXT_request_put_BITS_47_TO_32_03___d304,
		m_stg_0D_OUT_BITS_32_TO_16__q1,
		m_stg_0D_OUT_BITS_49_TO_33__q36,
		m_stg_0_first_BITS_32_TO_16_SRA_0___d8,
		m_stg_0_first_BITS_49_TO_33_SRA_0___d10,
		m_stg_10D_OUT_BITS_32_TO_16__q22,
		m_stg_10D_OUT_BITS_49_TO_33__q55,
		m_stg_10_first__94_BITS_32_TO_16_97_SRA_10___d198,
		m_stg_10_first__94_BITS_49_TO_33_96_SRA_10___d200,
		m_stg_11D_OUT_BITS_32_TO_16__q20,
		m_stg_11D_OUT_BITS_49_TO_33__q59,
		m_stg_11_first__13_BITS_32_TO_16_16_SRA_11___d217,
		m_stg_11_first__13_BITS_49_TO_33_15_SRA_11___d219,
		m_stg_12D_OUT_BITS_32_TO_16__q24,
		m_stg_12D_OUT_BITS_49_TO_33__q57,
		m_stg_12_first__32_BITS_32_TO_16_35_SRA_12___d236,
		m_stg_12_first__32_BITS_49_TO_33_34_SRA_12___d238,
		m_stg_13D_OUT_BITS_32_TO_16__q26,
		m_stg_13D_OUT_BITS_49_TO_33__q61,
		m_stg_13_first__51_BITS_32_TO_16_54_SRA_13___d255,
		m_stg_13_first__51_BITS_49_TO_33_53_SRA_13___d257,
		m_stg_14D_OUT_BITS_32_TO_16__q28,
		m_stg_14D_OUT_BITS_49_TO_33__q63,
		m_stg_14_first__70_BITS_32_TO_16_73_SRA_14___d274,
		m_stg_14_first__70_BITS_49_TO_33_72_SRA_14___d276,
		m_stg_15D_OUT_BITS_32_TO_16__q32,
		m_stg_15D_OUT_BITS_49_TO_33__q30,
		m_stg_15_first__89_BITS_32_TO_16_92_SRA_15___d293,
		m_stg_15_first__89_BITS_49_TO_33_91_SRA_15___d297,
		m_stg_1D_OUT_BITS_32_TO_16__q2,
		m_stg_1D_OUT_BITS_49_TO_33__q37,
		m_stg_1_first__3_BITS_32_TO_16_6_SRA_1___d27,
		m_stg_1_first__3_BITS_49_TO_33_5_SRA_1___d29,
		m_stg_2D_OUT_BITS_32_TO_16__q4,
		m_stg_2D_OUT_BITS_49_TO_33__q39,
		m_stg_2_first__2_BITS_32_TO_16_5_SRA_2___d46,
		m_stg_2_first__2_BITS_49_TO_33_4_SRA_2___d48,
		m_stg_3D_OUT_BITS_32_TO_16__q8,
		m_stg_3D_OUT_BITS_49_TO_33__q41,
		m_stg_3_first__1_BITS_32_TO_16_4_SRA_3___d65,
		m_stg_3_first__1_BITS_49_TO_33_3_SRA_3___d67,
		m_stg_4D_OUT_BITS_32_TO_16__q6,
		m_stg_4D_OUT_BITS_49_TO_33__q45,
		m_stg_4_first__0_BITS_32_TO_16_3_SRA_4___d84,
		m_stg_4_first__0_BITS_49_TO_33_2_SRA_4___d86,
		m_stg_5D_OUT_BITS_32_TO_16__q10,
		m_stg_5D_OUT_BITS_49_TO_33__q43,
		m_stg_5_first__9_BITS_32_TO_16_02_SRA_5___d103,
		m_stg_5_first__9_BITS_49_TO_33_01_SRA_5___d105,
		m_stg_6D_OUT_BITS_32_TO_16__q12,
		m_stg_6D_OUT_BITS_49_TO_33__q47,
		m_stg_6_first__18_BITS_32_TO_16_21_SRA_6___d122,
		m_stg_6_first__18_BITS_49_TO_33_20_SRA_6___d124,
		m_stg_7D_OUT_BITS_32_TO_16__q14,
		m_stg_7D_OUT_BITS_49_TO_33__q49,
		m_stg_7_first__37_BITS_32_TO_16_40_SRA_7___d141,
		m_stg_7_first__37_BITS_49_TO_33_39_SRA_7___d143,
		m_stg_8D_OUT_BITS_32_TO_16__q16,
		m_stg_8D_OUT_BITS_49_TO_33__q51,
		m_stg_8_first__56_BITS_32_TO_16_59_SRA_8___d160,
		m_stg_8_first__56_BITS_49_TO_33_58_SRA_8___d162,
		m_stg_9D_OUT_BITS_32_TO_16__q18,
		m_stg_9D_OUT_BITS_49_TO_33__q53,
		m_stg_9_first__75_BITS_32_TO_16_78_SRA_9___d179,
		m_stg_9_first__75_BITS_49_TO_33_77_SRA_9___d181;
  wire [15 : 0] m_stg_1D_OUT_BITS_32_TO_16_BITS_16_TO_1__q3,
		m_stg_1D_OUT_BITS_49_TO_337_BITS_16_TO_1__q38,
		request_put_BITS_31_TO_16__q35,
		request_put_BITS_47_TO_32__q34;
  wire [14 : 0] m_stg_2D_OUT_BITS_32_TO_16_BITS_16_TO_2__q5,
		m_stg_2D_OUT_BITS_49_TO_339_BITS_16_TO_2__q40;
  wire [13 : 0] m_stg_3D_OUT_BITS_32_TO_16_BITS_16_TO_3__q9,
		m_stg_3D_OUT_BITS_49_TO_331_BITS_16_TO_3__q42;
  wire [12 : 0] m_stg_4D_OUT_BITS_32_TO_16_BITS_16_TO_4__q7,
		m_stg_4D_OUT_BITS_49_TO_335_BITS_16_TO_4__q46;
  wire [11 : 0] m_stg_5D_OUT_BITS_32_TO_160_BITS_16_TO_5__q11,
		m_stg_5D_OUT_BITS_49_TO_333_BITS_16_TO_5__q44;
  wire [10 : 0] m_stg_6D_OUT_BITS_32_TO_162_BITS_16_TO_6__q13,
		m_stg_6D_OUT_BITS_49_TO_337_BITS_16_TO_6__q48;
  wire [9 : 0] m_stg_7D_OUT_BITS_32_TO_164_BITS_16_TO_7__q15,
	       m_stg_7D_OUT_BITS_49_TO_339_BITS_16_TO_7__q50;
  wire [8 : 0] m_stg_8D_OUT_BITS_32_TO_166_BITS_16_TO_8__q17,
	       m_stg_8D_OUT_BITS_49_TO_331_BITS_16_TO_8__q52;
  wire [7 : 0] m_stg_9D_OUT_BITS_32_TO_168_BITS_16_TO_9__q19,
	       m_stg_9D_OUT_BITS_49_TO_333_BITS_16_TO_9__q54;
  wire [6 : 0] m_stg_10D_OUT_BITS_32_TO_162_BITS_16_TO_10__q23,
	       m_stg_10D_OUT_BITS_49_TO_335_BITS_16_TO_10__q56;
  wire [5 : 0] m_stg_11D_OUT_BITS_32_TO_160_BITS_16_TO_11__q21,
	       m_stg_11D_OUT_BITS_49_TO_339_BITS_16_TO_11__q60;
  wire [4 : 0] m_stg_12D_OUT_BITS_32_TO_164_BITS_16_TO_12__q25,
	       m_stg_12D_OUT_BITS_49_TO_337_BITS_16_TO_12__q58;
  wire [3 : 0] m_stg_13D_OUT_BITS_32_TO_166_BITS_16_TO_13__q27,
	       m_stg_13D_OUT_BITS_49_TO_331_BITS_16_TO_13__q62;
  wire [2 : 0] m_stg_14D_OUT_BITS_32_TO_168_BITS_16_TO_14__q29,
	       m_stg_14D_OUT_BITS_49_TO_333_BITS_16_TO_14__q64;
  wire [1 : 0] m_stg_15D_OUT_BITS_32_TO_162_BITS_16_TO_15__q33,
	       m_stg_15D_OUT_BITS_49_TO_330_BITS_16_TO_15__q31;

  // action method request_put
  assign RDY_request_put = m_stg_0$FULL_N ;

  // actionvalue method response_get
  assign response_get = m_stg_16$D_OUT ;
  assign RDY_response_get = m_stg_16$EMPTY_N ;

  // submodule m_stg_0
  FIFOL1 #(.width(32'd50)) m_stg_0(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_0$D_IN),
				   .ENQ(m_stg_0$ENQ),
				   .DEQ(m_stg_0$DEQ),
				   .CLR(m_stg_0$CLR),
				   .D_OUT(m_stg_0$D_OUT),
				   .FULL_N(m_stg_0$FULL_N),
				   .EMPTY_N(m_stg_0$EMPTY_N));

  // submodule m_stg_1
  FIFOL1 #(.width(32'd50)) m_stg_1(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_1$D_IN),
				   .ENQ(m_stg_1$ENQ),
				   .DEQ(m_stg_1$DEQ),
				   .CLR(m_stg_1$CLR),
				   .D_OUT(m_stg_1$D_OUT),
				   .FULL_N(m_stg_1$FULL_N),
				   .EMPTY_N(m_stg_1$EMPTY_N));

  // submodule m_stg_10
  FIFOL1 #(.width(32'd50)) m_stg_10(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_10$D_IN),
				    .ENQ(m_stg_10$ENQ),
				    .DEQ(m_stg_10$DEQ),
				    .CLR(m_stg_10$CLR),
				    .D_OUT(m_stg_10$D_OUT),
				    .FULL_N(m_stg_10$FULL_N),
				    .EMPTY_N(m_stg_10$EMPTY_N));

  // submodule m_stg_11
  FIFOL1 #(.width(32'd50)) m_stg_11(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_11$D_IN),
				    .ENQ(m_stg_11$ENQ),
				    .DEQ(m_stg_11$DEQ),
				    .CLR(m_stg_11$CLR),
				    .D_OUT(m_stg_11$D_OUT),
				    .FULL_N(m_stg_11$FULL_N),
				    .EMPTY_N(m_stg_11$EMPTY_N));

  // submodule m_stg_12
  FIFOL1 #(.width(32'd50)) m_stg_12(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_12$D_IN),
				    .ENQ(m_stg_12$ENQ),
				    .DEQ(m_stg_12$DEQ),
				    .CLR(m_stg_12$CLR),
				    .D_OUT(m_stg_12$D_OUT),
				    .FULL_N(m_stg_12$FULL_N),
				    .EMPTY_N(m_stg_12$EMPTY_N));

  // submodule m_stg_13
  FIFOL1 #(.width(32'd50)) m_stg_13(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_13$D_IN),
				    .ENQ(m_stg_13$ENQ),
				    .DEQ(m_stg_13$DEQ),
				    .CLR(m_stg_13$CLR),
				    .D_OUT(m_stg_13$D_OUT),
				    .FULL_N(m_stg_13$FULL_N),
				    .EMPTY_N(m_stg_13$EMPTY_N));

  // submodule m_stg_14
  FIFOL1 #(.width(32'd50)) m_stg_14(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_14$D_IN),
				    .ENQ(m_stg_14$ENQ),
				    .DEQ(m_stg_14$DEQ),
				    .CLR(m_stg_14$CLR),
				    .D_OUT(m_stg_14$D_OUT),
				    .FULL_N(m_stg_14$FULL_N),
				    .EMPTY_N(m_stg_14$EMPTY_N));

  // submodule m_stg_15
  FIFOL1 #(.width(32'd50)) m_stg_15(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_15$D_IN),
				    .ENQ(m_stg_15$ENQ),
				    .DEQ(m_stg_15$DEQ),
				    .CLR(m_stg_15$CLR),
				    .D_OUT(m_stg_15$D_OUT),
				    .FULL_N(m_stg_15$FULL_N),
				    .EMPTY_N(m_stg_15$EMPTY_N));

  // submodule m_stg_16
  FIFOL1 #(.width(32'd50)) m_stg_16(.RST(RST_N),
				    .CLK(CLK),
				    .D_IN(m_stg_16$D_IN),
				    .ENQ(m_stg_16$ENQ),
				    .DEQ(m_stg_16$DEQ),
				    .CLR(m_stg_16$CLR),
				    .D_OUT(m_stg_16$D_OUT),
				    .FULL_N(m_stg_16$FULL_N),
				    .EMPTY_N(m_stg_16$EMPTY_N));

  // submodule m_stg_2
  FIFOL1 #(.width(32'd50)) m_stg_2(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_2$D_IN),
				   .ENQ(m_stg_2$ENQ),
				   .DEQ(m_stg_2$DEQ),
				   .CLR(m_stg_2$CLR),
				   .D_OUT(m_stg_2$D_OUT),
				   .FULL_N(m_stg_2$FULL_N),
				   .EMPTY_N(m_stg_2$EMPTY_N));

  // submodule m_stg_3
  FIFOL1 #(.width(32'd50)) m_stg_3(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_3$D_IN),
				   .ENQ(m_stg_3$ENQ),
				   .DEQ(m_stg_3$DEQ),
				   .CLR(m_stg_3$CLR),
				   .D_OUT(m_stg_3$D_OUT),
				   .FULL_N(m_stg_3$FULL_N),
				   .EMPTY_N(m_stg_3$EMPTY_N));

  // submodule m_stg_4
  FIFOL1 #(.width(32'd50)) m_stg_4(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_4$D_IN),
				   .ENQ(m_stg_4$ENQ),
				   .DEQ(m_stg_4$DEQ),
				   .CLR(m_stg_4$CLR),
				   .D_OUT(m_stg_4$D_OUT),
				   .FULL_N(m_stg_4$FULL_N),
				   .EMPTY_N(m_stg_4$EMPTY_N));

  // submodule m_stg_5
  FIFOL1 #(.width(32'd50)) m_stg_5(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_5$D_IN),
				   .ENQ(m_stg_5$ENQ),
				   .DEQ(m_stg_5$DEQ),
				   .CLR(m_stg_5$CLR),
				   .D_OUT(m_stg_5$D_OUT),
				   .FULL_N(m_stg_5$FULL_N),
				   .EMPTY_N(m_stg_5$EMPTY_N));

  // submodule m_stg_6
  FIFOL1 #(.width(32'd50)) m_stg_6(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_6$D_IN),
				   .ENQ(m_stg_6$ENQ),
				   .DEQ(m_stg_6$DEQ),
				   .CLR(m_stg_6$CLR),
				   .D_OUT(m_stg_6$D_OUT),
				   .FULL_N(m_stg_6$FULL_N),
				   .EMPTY_N(m_stg_6$EMPTY_N));

  // submodule m_stg_7
  FIFOL1 #(.width(32'd50)) m_stg_7(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_7$D_IN),
				   .ENQ(m_stg_7$ENQ),
				   .DEQ(m_stg_7$DEQ),
				   .CLR(m_stg_7$CLR),
				   .D_OUT(m_stg_7$D_OUT),
				   .FULL_N(m_stg_7$FULL_N),
				   .EMPTY_N(m_stg_7$EMPTY_N));

  // submodule m_stg_8
  FIFOL1 #(.width(32'd50)) m_stg_8(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_8$D_IN),
				   .ENQ(m_stg_8$ENQ),
				   .DEQ(m_stg_8$DEQ),
				   .CLR(m_stg_8$CLR),
				   .D_OUT(m_stg_8$D_OUT),
				   .FULL_N(m_stg_8$FULL_N),
				   .EMPTY_N(m_stg_8$EMPTY_N));

  // submodule m_stg_9
  FIFOL1 #(.width(32'd50)) m_stg_9(.RST(RST_N),
				   .CLK(CLK),
				   .D_IN(m_stg_9$D_IN),
				   .ENQ(m_stg_9$ENQ),
				   .DEQ(m_stg_9$DEQ),
				   .CLR(m_stg_9$CLR),
				   .D_OUT(m_stg_9$D_OUT),
				   .FULL_N(m_stg_9$FULL_N),
				   .EMPTY_N(m_stg_9$EMPTY_N));

  // submodule m_stg_0
  assign m_stg_0$D_IN =
	     (SEXT_request_put_BITS_47_TO_32_03___d304[16] &&
	      !SEXT_request_put_BITS_31_TO_16_06___d307[16]) ?
	       { SEXT_request_put_BITS_31_TO_16_06___d307,
		 -SEXT_request_put_BITS_47_TO_32_03___d304,
		 request_put[15:0] + 16'd16384 } :
	       IF_SEXT_request_put_BITS_47_TO_32_03_04_BIT_16_ETC___d320 ;
  assign m_stg_0$ENQ = EN_request_put ;
  assign m_stg_0$DEQ = m_stg_0$EMPTY_N && m_stg_1$FULL_N ;
  assign m_stg_0$CLR = 1'b0 ;

  // submodule m_stg_1
  assign m_stg_1$D_IN =
	     m_stg_0$D_OUT[32] ?
	       { m_stg_0$D_OUT[49:33] -
		 m_stg_0_first_BITS_32_TO_16_SRA_0___d8,
		 m_stg_0$D_OUT[32:16] +
		 m_stg_0_first_BITS_49_TO_33_SRA_0___d10,
		 m_stg_0$D_OUT[15:0] - 16'd8192 } :
	       { m_stg_0$D_OUT[49:33] +
		 m_stg_0_first_BITS_32_TO_16_SRA_0___d8,
		 m_stg_0$D_OUT[32:16] -
		 m_stg_0_first_BITS_49_TO_33_SRA_0___d10,
		 m_stg_0$D_OUT[15:0] + 16'd8192 } ;
  assign m_stg_1$ENQ = m_stg_0$EMPTY_N && m_stg_1$FULL_N ;
  assign m_stg_1$DEQ = m_stg_1$EMPTY_N && m_stg_2$FULL_N ;
  assign m_stg_1$CLR = 1'b0 ;

  // submodule m_stg_10
  assign m_stg_10$D_IN =
	     m_stg_9$D_OUT[32] ?
	       { m_stg_9$D_OUT[49:33] -
		 m_stg_9_first__75_BITS_32_TO_16_78_SRA_9___d179,
		 m_stg_9$D_OUT[32:16] +
		 m_stg_9_first__75_BITS_49_TO_33_77_SRA_9___d181,
		 m_stg_9$D_OUT[15:0] - 16'd20 } :
	       { m_stg_9$D_OUT[49:33] +
		 m_stg_9_first__75_BITS_32_TO_16_78_SRA_9___d179,
		 m_stg_9$D_OUT[32:16] -
		 m_stg_9_first__75_BITS_49_TO_33_77_SRA_9___d181,
		 m_stg_9$D_OUT[15:0] + 16'd20 } ;
  assign m_stg_10$ENQ = m_stg_9$EMPTY_N && m_stg_10$FULL_N ;
  assign m_stg_10$DEQ = m_stg_10$EMPTY_N && m_stg_11$FULL_N ;
  assign m_stg_10$CLR = 1'b0 ;

  // submodule m_stg_11
  assign m_stg_11$D_IN =
	     m_stg_10$D_OUT[32] ?
	       { m_stg_10$D_OUT[49:33] -
		 m_stg_10_first__94_BITS_32_TO_16_97_SRA_10___d198,
		 m_stg_10$D_OUT[32:16] +
		 m_stg_10_first__94_BITS_49_TO_33_96_SRA_10___d200,
		 m_stg_10$D_OUT[15:0] - 16'd10 } :
	       { m_stg_10$D_OUT[49:33] +
		 m_stg_10_first__94_BITS_32_TO_16_97_SRA_10___d198,
		 m_stg_10$D_OUT[32:16] -
		 m_stg_10_first__94_BITS_49_TO_33_96_SRA_10___d200,
		 m_stg_10$D_OUT[15:0] + 16'd10 } ;
  assign m_stg_11$ENQ = m_stg_10$EMPTY_N && m_stg_11$FULL_N ;
  assign m_stg_11$DEQ = m_stg_11$EMPTY_N && m_stg_12$FULL_N ;
  assign m_stg_11$CLR = 1'b0 ;

  // submodule m_stg_12
  assign m_stg_12$D_IN =
	     m_stg_11$D_OUT[32] ?
	       { m_stg_11$D_OUT[49:33] -
		 m_stg_11_first__13_BITS_32_TO_16_16_SRA_11___d217,
		 m_stg_11$D_OUT[32:16] +
		 m_stg_11_first__13_BITS_49_TO_33_15_SRA_11___d219,
		 m_stg_11$D_OUT[15:0] - 16'd5 } :
	       { m_stg_11$D_OUT[49:33] +
		 m_stg_11_first__13_BITS_32_TO_16_16_SRA_11___d217,
		 m_stg_11$D_OUT[32:16] -
		 m_stg_11_first__13_BITS_49_TO_33_15_SRA_11___d219,
		 m_stg_11$D_OUT[15:0] + 16'd5 } ;
  assign m_stg_12$ENQ = m_stg_11$EMPTY_N && m_stg_12$FULL_N ;
  assign m_stg_12$DEQ = m_stg_12$EMPTY_N && m_stg_13$FULL_N ;
  assign m_stg_12$CLR = 1'b0 ;

  // submodule m_stg_13
  assign m_stg_13$D_IN =
	     m_stg_12$D_OUT[32] ?
	       { m_stg_12$D_OUT[49:33] -
		 m_stg_12_first__32_BITS_32_TO_16_35_SRA_12___d236,
		 m_stg_12$D_OUT[32:16] +
		 m_stg_12_first__32_BITS_49_TO_33_34_SRA_12___d238,
		 m_stg_12$D_OUT[15:0] - 16'd3 } :
	       { m_stg_12$D_OUT[49:33] +
		 m_stg_12_first__32_BITS_32_TO_16_35_SRA_12___d236,
		 m_stg_12$D_OUT[32:16] -
		 m_stg_12_first__32_BITS_49_TO_33_34_SRA_12___d238,
		 m_stg_12$D_OUT[15:0] + 16'd3 } ;
  assign m_stg_13$ENQ = m_stg_12$EMPTY_N && m_stg_13$FULL_N ;
  assign m_stg_13$DEQ = m_stg_13$EMPTY_N && m_stg_14$FULL_N ;
  assign m_stg_13$CLR = 1'b0 ;

  // submodule m_stg_14
  assign m_stg_14$D_IN =
	     m_stg_13$D_OUT[32] ?
	       { m_stg_13$D_OUT[49:33] -
		 m_stg_13_first__51_BITS_32_TO_16_54_SRA_13___d255,
		 m_stg_13$D_OUT[32:16] +
		 m_stg_13_first__51_BITS_49_TO_33_53_SRA_13___d257,
		 m_stg_13$D_OUT[15:0] - 16'd1 } :
	       { m_stg_13$D_OUT[49:33] +
		 m_stg_13_first__51_BITS_32_TO_16_54_SRA_13___d255,
		 m_stg_13$D_OUT[32:16] -
		 m_stg_13_first__51_BITS_49_TO_33_53_SRA_13___d257,
		 m_stg_13$D_OUT[15:0] + 16'd1 } ;
  assign m_stg_14$ENQ = m_stg_13$EMPTY_N && m_stg_14$FULL_N ;
  assign m_stg_14$DEQ = m_stg_14$EMPTY_N && m_stg_15$FULL_N ;
  assign m_stg_14$CLR = 1'b0 ;

  // submodule m_stg_15
  assign m_stg_15$D_IN =
	     m_stg_14$D_OUT[32] ?
	       { m_stg_14$D_OUT[49:33] -
		 m_stg_14_first__70_BITS_32_TO_16_73_SRA_14___d274,
		 m_stg_14$D_OUT[32:16] +
		 m_stg_14_first__70_BITS_49_TO_33_72_SRA_14___d276,
		 m_stg_14$D_OUT[15:0] - 16'd1 } :
	       { m_stg_14$D_OUT[49:33] +
		 m_stg_14_first__70_BITS_32_TO_16_73_SRA_14___d274,
		 m_stg_14$D_OUT[32:16] -
		 m_stg_14_first__70_BITS_49_TO_33_72_SRA_14___d276,
		 m_stg_14$D_OUT[15:0] + 16'd1 } ;
  assign m_stg_15$ENQ = m_stg_14$EMPTY_N && m_stg_15$FULL_N ;
  assign m_stg_15$DEQ = m_stg_15$EMPTY_N && m_stg_16$FULL_N ;
  assign m_stg_15$CLR = 1'b0 ;

  // submodule m_stg_16
  assign m_stg_16$D_IN =
	     { m_stg_15$D_OUT[32] ?
		 m_stg_15$D_OUT[49:33] -
		 m_stg_15_first__89_BITS_32_TO_16_92_SRA_15___d293 :
		 m_stg_15$D_OUT[49:33] +
		 m_stg_15_first__89_BITS_32_TO_16_92_SRA_15___d293,
	       m_stg_15$D_OUT[32] ?
		 m_stg_15$D_OUT[32:16] +
		 m_stg_15_first__89_BITS_49_TO_33_91_SRA_15___d297 :
		 m_stg_15$D_OUT[32:16] -
		 m_stg_15_first__89_BITS_49_TO_33_91_SRA_15___d297,
	       m_stg_15$D_OUT[15:0] } ;
  assign m_stg_16$ENQ = m_stg_15$EMPTY_N && m_stg_16$FULL_N ;
  assign m_stg_16$DEQ = EN_response_get ;
  assign m_stg_16$CLR = 1'b0 ;

  // submodule m_stg_2
  assign m_stg_2$D_IN =
	     m_stg_1$D_OUT[32] ?
	       { m_stg_1$D_OUT[49:33] -
		 m_stg_1_first__3_BITS_32_TO_16_6_SRA_1___d27,
		 m_stg_1$D_OUT[32:16] +
		 m_stg_1_first__3_BITS_49_TO_33_5_SRA_1___d29,
		 m_stg_1$D_OUT[15:0] - 16'd4836 } :
	       { m_stg_1$D_OUT[49:33] +
		 m_stg_1_first__3_BITS_32_TO_16_6_SRA_1___d27,
		 m_stg_1$D_OUT[32:16] -
		 m_stg_1_first__3_BITS_49_TO_33_5_SRA_1___d29,
		 m_stg_1$D_OUT[15:0] + 16'd4836 } ;
  assign m_stg_2$ENQ = m_stg_1$EMPTY_N && m_stg_2$FULL_N ;
  assign m_stg_2$DEQ = m_stg_2$EMPTY_N && m_stg_3$FULL_N ;
  assign m_stg_2$CLR = 1'b0 ;

  // submodule m_stg_3
  assign m_stg_3$D_IN =
	     m_stg_2$D_OUT[32] ?
	       { m_stg_2$D_OUT[49:33] -
		 m_stg_2_first__2_BITS_32_TO_16_5_SRA_2___d46,
		 m_stg_2$D_OUT[32:16] +
		 m_stg_2_first__2_BITS_49_TO_33_4_SRA_2___d48,
		 m_stg_2$D_OUT[15:0] - 16'd2555 } :
	       { m_stg_2$D_OUT[49:33] +
		 m_stg_2_first__2_BITS_32_TO_16_5_SRA_2___d46,
		 m_stg_2$D_OUT[32:16] -
		 m_stg_2_first__2_BITS_49_TO_33_4_SRA_2___d48,
		 m_stg_2$D_OUT[15:0] + 16'd2555 } ;
  assign m_stg_3$ENQ = m_stg_2$EMPTY_N && m_stg_3$FULL_N ;
  assign m_stg_3$DEQ = m_stg_3$EMPTY_N && m_stg_4$FULL_N ;
  assign m_stg_3$CLR = 1'b0 ;

  // submodule m_stg_4
  assign m_stg_4$D_IN =
	     m_stg_3$D_OUT[32] ?
	       { m_stg_3$D_OUT[49:33] -
		 m_stg_3_first__1_BITS_32_TO_16_4_SRA_3___d65,
		 m_stg_3$D_OUT[32:16] +
		 m_stg_3_first__1_BITS_49_TO_33_3_SRA_3___d67,
		 m_stg_3$D_OUT[15:0] - 16'd1297 } :
	       { m_stg_3$D_OUT[49:33] +
		 m_stg_3_first__1_BITS_32_TO_16_4_SRA_3___d65,
		 m_stg_3$D_OUT[32:16] -
		 m_stg_3_first__1_BITS_49_TO_33_3_SRA_3___d67,
		 m_stg_3$D_OUT[15:0] + 16'd1297 } ;
  assign m_stg_4$ENQ = m_stg_3$EMPTY_N && m_stg_4$FULL_N ;
  assign m_stg_4$DEQ = m_stg_4$EMPTY_N && m_stg_5$FULL_N ;
  assign m_stg_4$CLR = 1'b0 ;

  // submodule m_stg_5
  assign m_stg_5$D_IN =
	     m_stg_4$D_OUT[32] ?
	       { m_stg_4$D_OUT[49:33] -
		 m_stg_4_first__0_BITS_32_TO_16_3_SRA_4___d84,
		 m_stg_4$D_OUT[32:16] +
		 m_stg_4_first__0_BITS_49_TO_33_2_SRA_4___d86,
		 m_stg_4$D_OUT[15:0] - 16'd651 } :
	       { m_stg_4$D_OUT[49:33] +
		 m_stg_4_first__0_BITS_32_TO_16_3_SRA_4___d84,
		 m_stg_4$D_OUT[32:16] -
		 m_stg_4_first__0_BITS_49_TO_33_2_SRA_4___d86,
		 m_stg_4$D_OUT[15:0] + 16'd651 } ;
  assign m_stg_5$ENQ = m_stg_4$EMPTY_N && m_stg_5$FULL_N ;
  assign m_stg_5$DEQ = m_stg_5$EMPTY_N && m_stg_6$FULL_N ;
  assign m_stg_5$CLR = 1'b0 ;

  // submodule m_stg_6
  assign m_stg_6$D_IN =
	     m_stg_5$D_OUT[32] ?
	       { m_stg_5$D_OUT[49:33] -
		 m_stg_5_first__9_BITS_32_TO_16_02_SRA_5___d103,
		 m_stg_5$D_OUT[32:16] +
		 m_stg_5_first__9_BITS_49_TO_33_01_SRA_5___d105,
		 m_stg_5$D_OUT[15:0] - 16'd326 } :
	       { m_stg_5$D_OUT[49:33] +
		 m_stg_5_first__9_BITS_32_TO_16_02_SRA_5___d103,
		 m_stg_5$D_OUT[32:16] -
		 m_stg_5_first__9_BITS_49_TO_33_01_SRA_5___d105,
		 m_stg_5$D_OUT[15:0] + 16'd326 } ;
  assign m_stg_6$ENQ = m_stg_5$EMPTY_N && m_stg_6$FULL_N ;
  assign m_stg_6$DEQ = m_stg_6$EMPTY_N && m_stg_7$FULL_N ;
  assign m_stg_6$CLR = 1'b0 ;

  // submodule m_stg_7
  assign m_stg_7$D_IN =
	     m_stg_6$D_OUT[32] ?
	       { m_stg_6$D_OUT[49:33] -
		 m_stg_6_first__18_BITS_32_TO_16_21_SRA_6___d122,
		 m_stg_6$D_OUT[32:16] +
		 m_stg_6_first__18_BITS_49_TO_33_20_SRA_6___d124,
		 m_stg_6$D_OUT[15:0] - 16'd163 } :
	       { m_stg_6$D_OUT[49:33] +
		 m_stg_6_first__18_BITS_32_TO_16_21_SRA_6___d122,
		 m_stg_6$D_OUT[32:16] -
		 m_stg_6_first__18_BITS_49_TO_33_20_SRA_6___d124,
		 m_stg_6$D_OUT[15:0] + 16'd163 } ;
  assign m_stg_7$ENQ = m_stg_6$EMPTY_N && m_stg_7$FULL_N ;
  assign m_stg_7$DEQ = m_stg_7$EMPTY_N && m_stg_8$FULL_N ;
  assign m_stg_7$CLR = 1'b0 ;

  // submodule m_stg_8
  assign m_stg_8$D_IN =
	     m_stg_7$D_OUT[32] ?
	       { m_stg_7$D_OUT[49:33] -
		 m_stg_7_first__37_BITS_32_TO_16_40_SRA_7___d141,
		 m_stg_7$D_OUT[32:16] +
		 m_stg_7_first__37_BITS_49_TO_33_39_SRA_7___d143,
		 m_stg_7$D_OUT[15:0] - 16'd81 } :
	       { m_stg_7$D_OUT[49:33] +
		 m_stg_7_first__37_BITS_32_TO_16_40_SRA_7___d141,
		 m_stg_7$D_OUT[32:16] -
		 m_stg_7_first__37_BITS_49_TO_33_39_SRA_7___d143,
		 m_stg_7$D_OUT[15:0] + 16'd81 } ;
  assign m_stg_8$ENQ = m_stg_7$EMPTY_N && m_stg_8$FULL_N ;
  assign m_stg_8$DEQ = m_stg_8$EMPTY_N && m_stg_9$FULL_N ;
  assign m_stg_8$CLR = 1'b0 ;

  // submodule m_stg_9
  assign m_stg_9$D_IN =
	     m_stg_8$D_OUT[32] ?
	       { m_stg_8$D_OUT[49:33] -
		 m_stg_8_first__56_BITS_32_TO_16_59_SRA_8___d160,
		 m_stg_8$D_OUT[32:16] +
		 m_stg_8_first__56_BITS_49_TO_33_58_SRA_8___d162,
		 m_stg_8$D_OUT[15:0] - 16'd41 } :
	       { m_stg_8$D_OUT[49:33] +
		 m_stg_8_first__56_BITS_32_TO_16_59_SRA_8___d160,
		 m_stg_8$D_OUT[32:16] -
		 m_stg_8_first__56_BITS_49_TO_33_58_SRA_8___d162,
		 m_stg_8$D_OUT[15:0] + 16'd41 } ;
  assign m_stg_9$ENQ = m_stg_8$EMPTY_N && m_stg_9$FULL_N ;
  assign m_stg_9$DEQ = m_stg_9$EMPTY_N && m_stg_10$FULL_N ;
  assign m_stg_9$CLR = 1'b0 ;

  // remaining internal signals
  assign IF_SEXT_request_put_BITS_47_TO_32_03_04_BIT_16_ETC___d320 =
	     (SEXT_request_put_BITS_47_TO_32_03___d304[16] &&
	      SEXT_request_put_BITS_31_TO_16_06___d307[16]) ?
	       { -SEXT_request_put_BITS_31_TO_16_06___d307,
		 SEXT_request_put_BITS_47_TO_32_03___d304,
		 request_put[15:0] - 16'd16384 } :
	       { SEXT_request_put_BITS_47_TO_32_03___d304,
		 SEXT_request_put_BITS_31_TO_16_06___d307,
		 request_put[15:0] } ;
  assign SEXT_request_put_BITS_31_TO_16_06___d307 =
	     { request_put_BITS_31_TO_16__q35[15],
	       request_put_BITS_31_TO_16__q35 } ;
  assign SEXT_request_put_BITS_47_TO_32_03___d304 =
	     { request_put_BITS_47_TO_32__q34[15],
	       request_put_BITS_47_TO_32__q34 } ;
  assign m_stg_0D_OUT_BITS_32_TO_16__q1 = m_stg_0$D_OUT[32:16] ;
  assign m_stg_0D_OUT_BITS_49_TO_33__q36 = m_stg_0$D_OUT[49:33] ;
  assign m_stg_0_first_BITS_32_TO_16_SRA_0___d8 =
	     m_stg_0D_OUT_BITS_32_TO_16__q1 ;
  assign m_stg_0_first_BITS_49_TO_33_SRA_0___d10 =
	     m_stg_0D_OUT_BITS_49_TO_33__q36 ;
  assign m_stg_10D_OUT_BITS_32_TO_162_BITS_16_TO_10__q23 =
	     m_stg_10D_OUT_BITS_32_TO_16__q22[16:10] ;
  assign m_stg_10D_OUT_BITS_32_TO_16__q22 = m_stg_10$D_OUT[32:16] ;
  assign m_stg_10D_OUT_BITS_49_TO_335_BITS_16_TO_10__q56 =
	     m_stg_10D_OUT_BITS_49_TO_33__q55[16:10] ;
  assign m_stg_10D_OUT_BITS_49_TO_33__q55 = m_stg_10$D_OUT[49:33] ;
  assign m_stg_10_first__94_BITS_32_TO_16_97_SRA_10___d198 =
	     { {10{m_stg_10D_OUT_BITS_32_TO_162_BITS_16_TO_10__q23[6]}},
	       m_stg_10D_OUT_BITS_32_TO_162_BITS_16_TO_10__q23 } ;
  assign m_stg_10_first__94_BITS_49_TO_33_96_SRA_10___d200 =
	     { {10{m_stg_10D_OUT_BITS_49_TO_335_BITS_16_TO_10__q56[6]}},
	       m_stg_10D_OUT_BITS_49_TO_335_BITS_16_TO_10__q56 } ;
  assign m_stg_11D_OUT_BITS_32_TO_160_BITS_16_TO_11__q21 =
	     m_stg_11D_OUT_BITS_32_TO_16__q20[16:11] ;
  assign m_stg_11D_OUT_BITS_32_TO_16__q20 = m_stg_11$D_OUT[32:16] ;
  assign m_stg_11D_OUT_BITS_49_TO_339_BITS_16_TO_11__q60 =
	     m_stg_11D_OUT_BITS_49_TO_33__q59[16:11] ;
  assign m_stg_11D_OUT_BITS_49_TO_33__q59 = m_stg_11$D_OUT[49:33] ;
  assign m_stg_11_first__13_BITS_32_TO_16_16_SRA_11___d217 =
	     { {11{m_stg_11D_OUT_BITS_32_TO_160_BITS_16_TO_11__q21[5]}},
	       m_stg_11D_OUT_BITS_32_TO_160_BITS_16_TO_11__q21 } ;
  assign m_stg_11_first__13_BITS_49_TO_33_15_SRA_11___d219 =
	     { {11{m_stg_11D_OUT_BITS_49_TO_339_BITS_16_TO_11__q60[5]}},
	       m_stg_11D_OUT_BITS_49_TO_339_BITS_16_TO_11__q60 } ;
  assign m_stg_12D_OUT_BITS_32_TO_164_BITS_16_TO_12__q25 =
	     m_stg_12D_OUT_BITS_32_TO_16__q24[16:12] ;
  assign m_stg_12D_OUT_BITS_32_TO_16__q24 = m_stg_12$D_OUT[32:16] ;
  assign m_stg_12D_OUT_BITS_49_TO_337_BITS_16_TO_12__q58 =
	     m_stg_12D_OUT_BITS_49_TO_33__q57[16:12] ;
  assign m_stg_12D_OUT_BITS_49_TO_33__q57 = m_stg_12$D_OUT[49:33] ;
  assign m_stg_12_first__32_BITS_32_TO_16_35_SRA_12___d236 =
	     { {12{m_stg_12D_OUT_BITS_32_TO_164_BITS_16_TO_12__q25[4]}},
	       m_stg_12D_OUT_BITS_32_TO_164_BITS_16_TO_12__q25 } ;
  assign m_stg_12_first__32_BITS_49_TO_33_34_SRA_12___d238 =
	     { {12{m_stg_12D_OUT_BITS_49_TO_337_BITS_16_TO_12__q58[4]}},
	       m_stg_12D_OUT_BITS_49_TO_337_BITS_16_TO_12__q58 } ;
  assign m_stg_13D_OUT_BITS_32_TO_166_BITS_16_TO_13__q27 =
	     m_stg_13D_OUT_BITS_32_TO_16__q26[16:13] ;
  assign m_stg_13D_OUT_BITS_32_TO_16__q26 = m_stg_13$D_OUT[32:16] ;
  assign m_stg_13D_OUT_BITS_49_TO_331_BITS_16_TO_13__q62 =
	     m_stg_13D_OUT_BITS_49_TO_33__q61[16:13] ;
  assign m_stg_13D_OUT_BITS_49_TO_33__q61 = m_stg_13$D_OUT[49:33] ;
  assign m_stg_13_first__51_BITS_32_TO_16_54_SRA_13___d255 =
	     { {13{m_stg_13D_OUT_BITS_32_TO_166_BITS_16_TO_13__q27[3]}},
	       m_stg_13D_OUT_BITS_32_TO_166_BITS_16_TO_13__q27 } ;
  assign m_stg_13_first__51_BITS_49_TO_33_53_SRA_13___d257 =
	     { {13{m_stg_13D_OUT_BITS_49_TO_331_BITS_16_TO_13__q62[3]}},
	       m_stg_13D_OUT_BITS_49_TO_331_BITS_16_TO_13__q62 } ;
  assign m_stg_14D_OUT_BITS_32_TO_168_BITS_16_TO_14__q29 =
	     m_stg_14D_OUT_BITS_32_TO_16__q28[16:14] ;
  assign m_stg_14D_OUT_BITS_32_TO_16__q28 = m_stg_14$D_OUT[32:16] ;
  assign m_stg_14D_OUT_BITS_49_TO_333_BITS_16_TO_14__q64 =
	     m_stg_14D_OUT_BITS_49_TO_33__q63[16:14] ;
  assign m_stg_14D_OUT_BITS_49_TO_33__q63 = m_stg_14$D_OUT[49:33] ;
  assign m_stg_14_first__70_BITS_32_TO_16_73_SRA_14___d274 =
	     { {14{m_stg_14D_OUT_BITS_32_TO_168_BITS_16_TO_14__q29[2]}},
	       m_stg_14D_OUT_BITS_32_TO_168_BITS_16_TO_14__q29 } ;
  assign m_stg_14_first__70_BITS_49_TO_33_72_SRA_14___d276 =
	     { {14{m_stg_14D_OUT_BITS_49_TO_333_BITS_16_TO_14__q64[2]}},
	       m_stg_14D_OUT_BITS_49_TO_333_BITS_16_TO_14__q64 } ;
  assign m_stg_15D_OUT_BITS_32_TO_162_BITS_16_TO_15__q33 =
	     m_stg_15D_OUT_BITS_32_TO_16__q32[16:15] ;
  assign m_stg_15D_OUT_BITS_32_TO_16__q32 = m_stg_15$D_OUT[32:16] ;
  assign m_stg_15D_OUT_BITS_49_TO_330_BITS_16_TO_15__q31 =
	     m_stg_15D_OUT_BITS_49_TO_33__q30[16:15] ;
  assign m_stg_15D_OUT_BITS_49_TO_33__q30 = m_stg_15$D_OUT[49:33] ;
  assign m_stg_15_first__89_BITS_32_TO_16_92_SRA_15___d293 =
	     { {15{m_stg_15D_OUT_BITS_32_TO_162_BITS_16_TO_15__q33[1]}},
	       m_stg_15D_OUT_BITS_32_TO_162_BITS_16_TO_15__q33 } ;
  assign m_stg_15_first__89_BITS_49_TO_33_91_SRA_15___d297 =
	     { {15{m_stg_15D_OUT_BITS_49_TO_330_BITS_16_TO_15__q31[1]}},
	       m_stg_15D_OUT_BITS_49_TO_330_BITS_16_TO_15__q31 } ;
  assign m_stg_1D_OUT_BITS_32_TO_16_BITS_16_TO_1__q3 =
	     m_stg_1D_OUT_BITS_32_TO_16__q2[16:1] ;
  assign m_stg_1D_OUT_BITS_32_TO_16__q2 = m_stg_1$D_OUT[32:16] ;
  assign m_stg_1D_OUT_BITS_49_TO_337_BITS_16_TO_1__q38 =
	     m_stg_1D_OUT_BITS_49_TO_33__q37[16:1] ;
  assign m_stg_1D_OUT_BITS_49_TO_33__q37 = m_stg_1$D_OUT[49:33] ;
  assign m_stg_1_first__3_BITS_32_TO_16_6_SRA_1___d27 =
	     { m_stg_1D_OUT_BITS_32_TO_16_BITS_16_TO_1__q3[15],
	       m_stg_1D_OUT_BITS_32_TO_16_BITS_16_TO_1__q3 } ;
  assign m_stg_1_first__3_BITS_49_TO_33_5_SRA_1___d29 =
	     { m_stg_1D_OUT_BITS_49_TO_337_BITS_16_TO_1__q38[15],
	       m_stg_1D_OUT_BITS_49_TO_337_BITS_16_TO_1__q38 } ;
  assign m_stg_2D_OUT_BITS_32_TO_16_BITS_16_TO_2__q5 =
	     m_stg_2D_OUT_BITS_32_TO_16__q4[16:2] ;
  assign m_stg_2D_OUT_BITS_32_TO_16__q4 = m_stg_2$D_OUT[32:16] ;
  assign m_stg_2D_OUT_BITS_49_TO_339_BITS_16_TO_2__q40 =
	     m_stg_2D_OUT_BITS_49_TO_33__q39[16:2] ;
  assign m_stg_2D_OUT_BITS_49_TO_33__q39 = m_stg_2$D_OUT[49:33] ;
  assign m_stg_2_first__2_BITS_32_TO_16_5_SRA_2___d46 =
	     { {2{m_stg_2D_OUT_BITS_32_TO_16_BITS_16_TO_2__q5[14]}},
	       m_stg_2D_OUT_BITS_32_TO_16_BITS_16_TO_2__q5 } ;
  assign m_stg_2_first__2_BITS_49_TO_33_4_SRA_2___d48 =
	     { {2{m_stg_2D_OUT_BITS_49_TO_339_BITS_16_TO_2__q40[14]}},
	       m_stg_2D_OUT_BITS_49_TO_339_BITS_16_TO_2__q40 } ;
  assign m_stg_3D_OUT_BITS_32_TO_16_BITS_16_TO_3__q9 =
	     m_stg_3D_OUT_BITS_32_TO_16__q8[16:3] ;
  assign m_stg_3D_OUT_BITS_32_TO_16__q8 = m_stg_3$D_OUT[32:16] ;
  assign m_stg_3D_OUT_BITS_49_TO_331_BITS_16_TO_3__q42 =
	     m_stg_3D_OUT_BITS_49_TO_33__q41[16:3] ;
  assign m_stg_3D_OUT_BITS_49_TO_33__q41 = m_stg_3$D_OUT[49:33] ;
  assign m_stg_3_first__1_BITS_32_TO_16_4_SRA_3___d65 =
	     { {3{m_stg_3D_OUT_BITS_32_TO_16_BITS_16_TO_3__q9[13]}},
	       m_stg_3D_OUT_BITS_32_TO_16_BITS_16_TO_3__q9 } ;
  assign m_stg_3_first__1_BITS_49_TO_33_3_SRA_3___d67 =
	     { {3{m_stg_3D_OUT_BITS_49_TO_331_BITS_16_TO_3__q42[13]}},
	       m_stg_3D_OUT_BITS_49_TO_331_BITS_16_TO_3__q42 } ;
  assign m_stg_4D_OUT_BITS_32_TO_16_BITS_16_TO_4__q7 =
	     m_stg_4D_OUT_BITS_32_TO_16__q6[16:4] ;
  assign m_stg_4D_OUT_BITS_32_TO_16__q6 = m_stg_4$D_OUT[32:16] ;
  assign m_stg_4D_OUT_BITS_49_TO_335_BITS_16_TO_4__q46 =
	     m_stg_4D_OUT_BITS_49_TO_33__q45[16:4] ;
  assign m_stg_4D_OUT_BITS_49_TO_33__q45 = m_stg_4$D_OUT[49:33] ;
  assign m_stg_4_first__0_BITS_32_TO_16_3_SRA_4___d84 =
	     { {4{m_stg_4D_OUT_BITS_32_TO_16_BITS_16_TO_4__q7[12]}},
	       m_stg_4D_OUT_BITS_32_TO_16_BITS_16_TO_4__q7 } ;
  assign m_stg_4_first__0_BITS_49_TO_33_2_SRA_4___d86 =
	     { {4{m_stg_4D_OUT_BITS_49_TO_335_BITS_16_TO_4__q46[12]}},
	       m_stg_4D_OUT_BITS_49_TO_335_BITS_16_TO_4__q46 } ;
  assign m_stg_5D_OUT_BITS_32_TO_160_BITS_16_TO_5__q11 =
	     m_stg_5D_OUT_BITS_32_TO_16__q10[16:5] ;
  assign m_stg_5D_OUT_BITS_32_TO_16__q10 = m_stg_5$D_OUT[32:16] ;
  assign m_stg_5D_OUT_BITS_49_TO_333_BITS_16_TO_5__q44 =
	     m_stg_5D_OUT_BITS_49_TO_33__q43[16:5] ;
  assign m_stg_5D_OUT_BITS_49_TO_33__q43 = m_stg_5$D_OUT[49:33] ;
  assign m_stg_5_first__9_BITS_32_TO_16_02_SRA_5___d103 =
	     { {5{m_stg_5D_OUT_BITS_32_TO_160_BITS_16_TO_5__q11[11]}},
	       m_stg_5D_OUT_BITS_32_TO_160_BITS_16_TO_5__q11 } ;
  assign m_stg_5_first__9_BITS_49_TO_33_01_SRA_5___d105 =
	     { {5{m_stg_5D_OUT_BITS_49_TO_333_BITS_16_TO_5__q44[11]}},
	       m_stg_5D_OUT_BITS_49_TO_333_BITS_16_TO_5__q44 } ;
  assign m_stg_6D_OUT_BITS_32_TO_162_BITS_16_TO_6__q13 =
	     m_stg_6D_OUT_BITS_32_TO_16__q12[16:6] ;
  assign m_stg_6D_OUT_BITS_32_TO_16__q12 = m_stg_6$D_OUT[32:16] ;
  assign m_stg_6D_OUT_BITS_49_TO_337_BITS_16_TO_6__q48 =
	     m_stg_6D_OUT_BITS_49_TO_33__q47[16:6] ;
  assign m_stg_6D_OUT_BITS_49_TO_33__q47 = m_stg_6$D_OUT[49:33] ;
  assign m_stg_6_first__18_BITS_32_TO_16_21_SRA_6___d122 =
	     { {6{m_stg_6D_OUT_BITS_32_TO_162_BITS_16_TO_6__q13[10]}},
	       m_stg_6D_OUT_BITS_32_TO_162_BITS_16_TO_6__q13 } ;
  assign m_stg_6_first__18_BITS_49_TO_33_20_SRA_6___d124 =
	     { {6{m_stg_6D_OUT_BITS_49_TO_337_BITS_16_TO_6__q48[10]}},
	       m_stg_6D_OUT_BITS_49_TO_337_BITS_16_TO_6__q48 } ;
  assign m_stg_7D_OUT_BITS_32_TO_164_BITS_16_TO_7__q15 =
	     m_stg_7D_OUT_BITS_32_TO_16__q14[16:7] ;
  assign m_stg_7D_OUT_BITS_32_TO_16__q14 = m_stg_7$D_OUT[32:16] ;
  assign m_stg_7D_OUT_BITS_49_TO_339_BITS_16_TO_7__q50 =
	     m_stg_7D_OUT_BITS_49_TO_33__q49[16:7] ;
  assign m_stg_7D_OUT_BITS_49_TO_33__q49 = m_stg_7$D_OUT[49:33] ;
  assign m_stg_7_first__37_BITS_32_TO_16_40_SRA_7___d141 =
	     { {7{m_stg_7D_OUT_BITS_32_TO_164_BITS_16_TO_7__q15[9]}},
	       m_stg_7D_OUT_BITS_32_TO_164_BITS_16_TO_7__q15 } ;
  assign m_stg_7_first__37_BITS_49_TO_33_39_SRA_7___d143 =
	     { {7{m_stg_7D_OUT_BITS_49_TO_339_BITS_16_TO_7__q50[9]}},
	       m_stg_7D_OUT_BITS_49_TO_339_BITS_16_TO_7__q50 } ;
  assign m_stg_8D_OUT_BITS_32_TO_166_BITS_16_TO_8__q17 =
	     m_stg_8D_OUT_BITS_32_TO_16__q16[16:8] ;
  assign m_stg_8D_OUT_BITS_32_TO_16__q16 = m_stg_8$D_OUT[32:16] ;
  assign m_stg_8D_OUT_BITS_49_TO_331_BITS_16_TO_8__q52 =
	     m_stg_8D_OUT_BITS_49_TO_33__q51[16:8] ;
  assign m_stg_8D_OUT_BITS_49_TO_33__q51 = m_stg_8$D_OUT[49:33] ;
  assign m_stg_8_first__56_BITS_32_TO_16_59_SRA_8___d160 =
	     { {8{m_stg_8D_OUT_BITS_32_TO_166_BITS_16_TO_8__q17[8]}},
	       m_stg_8D_OUT_BITS_32_TO_166_BITS_16_TO_8__q17 } ;
  assign m_stg_8_first__56_BITS_49_TO_33_58_SRA_8___d162 =
	     { {8{m_stg_8D_OUT_BITS_49_TO_331_BITS_16_TO_8__q52[8]}},
	       m_stg_8D_OUT_BITS_49_TO_331_BITS_16_TO_8__q52 } ;
  assign m_stg_9D_OUT_BITS_32_TO_168_BITS_16_TO_9__q19 =
	     m_stg_9D_OUT_BITS_32_TO_16__q18[16:9] ;
  assign m_stg_9D_OUT_BITS_32_TO_16__q18 = m_stg_9$D_OUT[32:16] ;
  assign m_stg_9D_OUT_BITS_49_TO_333_BITS_16_TO_9__q54 =
	     m_stg_9D_OUT_BITS_49_TO_33__q53[16:9] ;
  assign m_stg_9D_OUT_BITS_49_TO_33__q53 = m_stg_9$D_OUT[49:33] ;
  assign m_stg_9_first__75_BITS_32_TO_16_78_SRA_9___d179 =
	     { {9{m_stg_9D_OUT_BITS_32_TO_168_BITS_16_TO_9__q19[7]}},
	       m_stg_9D_OUT_BITS_32_TO_168_BITS_16_TO_9__q19 } ;
  assign m_stg_9_first__75_BITS_49_TO_33_77_SRA_9___d181 =
	     { {9{m_stg_9D_OUT_BITS_49_TO_333_BITS_16_TO_9__q54[7]}},
	       m_stg_9D_OUT_BITS_49_TO_333_BITS_16_TO_9__q54 } ;
  assign request_put_BITS_31_TO_16__q35 = request_put[31:16] ;
  assign request_put_BITS_47_TO_32__q34 = request_put[47:32] ;
endmodule  // mkPipelineCORDIC_v

