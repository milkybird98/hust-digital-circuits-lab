`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:42:25 03/23/2019 
// Design Name: 
// Module Name:    PoseDecode 
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
module PoseDecode(
    input [3:0] bcd_pos,
    output reg [7:0] pos
    );
    always@(bcd_pos)
    case(bcd_pos)
	 /*
    4'b0000:pos <= 8'b0000_0001;
    4'b0001:pos <= 8'b0000_0010;
    4'b0010:pos <= 8'b0000_0100;
    4'b0011:pos <= 8'b0000_1000;
	 4'b0100:pos <= 8'b0001_0000;
	 4'b0101:pos <= 8'b0010_0000;
    default:pos <= 8'b0000_0000;
	 */
	 4'b0000:pos <= 8'b1111_1110;
    4'b0001:pos <= 8'b1111_1101;
    4'b0010:pos <= 8'b1111_1011;
    4'b0011:pos <= 8'b1111_0111;
	 4'b0100:pos <= 8'b1110_1111;
	 4'b0101:pos <= 8'b1101_1111;
    default:pos <= 8'b1111_1111;
    endcase


endmodule
