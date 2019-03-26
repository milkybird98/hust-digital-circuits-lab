`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:35:44 03/23/2019 
// Design Name: 
// Module Name:    BCD7SEG 
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
module BCD7SEG(
    input [3:0] bcd,
    output reg [6:0] seg
    );

    always@(bcd)
        case(bcd)
            4'b0000:seg <= 7'b000_0001;
            4'b0001:seg <= 7'b100_1111;
            4'b0010:seg <= 7'b001_0010;
            4'b0011:seg <= 7'b000_0110;
            4'b0100:seg <= 7'b100_1100;
            4'b0101:seg <= 7'b010_0100;
            4'b0110:seg <= 7'b010_0000;
            4'b0111:seg <= 7'b000_1111;
            4'b1000:seg <= 7'b000_0000;
            4'b1001:seg <= 7'b000_0100;
            default:seg <= 7'b011_0000;
        endcase
endmodule
