`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:00:14 03/23/2019 
// Design Name: 
// Module Name:    counter60 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter60(
    input clk,
    input cr,
    input en,
    output up_siganl,
    output [7:0] data
    );

    wire bcd_up_l,bcd_up_h;
    assign up_siganl=bcd_up_l&bcd_up_h;
    BCDCounterx10 c10(clk,cr,en,bcd_up_l,data[3:0]);
    BCDCounterx6 c6(clk,cr,bcd_up_l&en,bcd_up_h,data[7:4]);
	 
endmodule
