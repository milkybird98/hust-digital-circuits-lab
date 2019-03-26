////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: CloclSystem_map.v
// /___/   /\     Timestamp: Sat Mar 23 11:18:35 2019
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -s 4 -pcf CloclSystem.pcf -sdf_anno true -sdf_path netgen/map -insert_glbl true -w -dir netgen/map -ofmt verilog -sim CloclSystem_map.ncd CloclSystem_map.v 
// Device	: 3s100ecp132-4 (PRODUCTION 1.27 2013-10-13)
// Input file	: CloclSystem_map.ncd
// Output file	: /home/milkybird98/Xilinx/14.7/ISE_DS/DigitalClock/netgen/map/CloclSystem_map.v
// # of Modules	: 1
// Design Name	: CloclSystem
// Xilinx        : /home/milkybird98/Xilinx/14.7/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module CloclSystem (
  CR, dat_set, EN, confirm, alarm, clk_50M, alarm_en, clock_set, alarm_set, HEX0, HEX1, HEX2, HEX3, HEX4, HEX5
);
  input CR;
  input dat_set;
  input EN;
  input confirm;
  output alarm;
  input clk_50M;
  input alarm_en;
  input clock_set;
  input alarm_set;
  output [6 : 0] HEX0;
  output [6 : 0] HEX1;
  output [6 : 0] HEX2;
  output [6 : 0] HEX3;
  output [6 : 0] HEX4;
  output [6 : 0] HEX5;
  wire \alarm/O ;
  wire \alarm/OUTPUT/OFF/O1INV_11 ;
  initial $sdf_annotate("netgen/map/CloclSystem_map.sdf");
  X_OPAD   \alarm/PAD  (
    .PAD(alarm)
  );
  X_OBUF   alarm_OBUF (
    .I(\alarm/O ),
    .O(alarm)
  );
  X_BUF   \alarm/OUTPUT/OFF/OMUX  (
    .I(\alarm/OUTPUT/OFF/O1INV_11 ),
    .O(\alarm/O )
  );
  X_BUF   \alarm/OUTPUT/OFF/O1INV  (
    .I(1'b0),
    .O(\alarm/OUTPUT/OFF/O1INV_11 )
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

