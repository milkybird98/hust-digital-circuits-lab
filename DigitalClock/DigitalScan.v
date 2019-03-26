`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:50:13 03/23/2019 
// Design Name: 
// Module Name:    DigitalScan 
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
module DigitalScan(
    input clk,
    input cr,
    input en,
    input [3:0] bcd0,
    input [3:0] bcd1,
    input [3:0] bcd2,
    input [3:0] bcd3,
    input [3:0] bcd4,
    input [3:0] bcd5,
    output [6:0] seg,
    output [7:0] pos
    );

    wire up;
    wire [3:0] bcd_select,bcd_data;

    BCDCounterx6 ucount(clk,cr,en,up,bcd_select);
    Mix6to1 umix(bcd_select,bcd0,bcd1,bcd2,bcd3,bcd4,bcd5,bcd_data);
    PoseDecode upos(bcd_select,pos);
    BCD7SEG useg(bcd_data,seg);

endmodule
