`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:53:19 03/23/2019 
// Design Name: 
// Module Name:    Mix6to1 
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
module Mix6to1(
    input [3:0] select,
    input [3:0] bcd0,
    input [3:0] bcd1,
    input [3:0] bcd2,
    input [3:0] bcd3,
    input [3:0] bcd4,
    input [3:0] bcd5,
    output reg [3:0] bcd
    );
always@(select,bcd0,bcd1,bcd2,bcd3,bcd4,bcd5)
case(select)
4'b0000:bcd<=bcd0;
4'b0001:bcd<=bcd1;
4'b0010:bcd<=bcd2;
4'b0011:bcd<=bcd3;
4'b0100:bcd<=bcd4;
4'b0101:bcd<=bcd5;
default:bcd<=4'b0000;
endcase


endmodule
