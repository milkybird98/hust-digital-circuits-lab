`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:41:35 03/25/2019 
// Design Name: 
// Module Name:    StepMotorDriver 
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
module StepMotorDriver(
	input clk,
	input cr,
	input M,
	output reg a,b,c
    );
	
	wire clk_low;
	reg [2:0] current_status,next_status;
	parameter s0=3'b100,s1=3'b110,s2=3'b010,s3=3'b011,s4=3'b001,s5=3'b101,s6=3'b000,s7=3'b111;
	
	Divider D1(clk,cr,clk_low);
	
	always@(posedge clk_low or negedge cr)
	begin
		if(~cr)
			current_status<=s0;
		else
			current_status<=next_status;
	end
	
	always@(current_status or M)
	begin
		case(current_status)
		s0:begin 
			a=1;b=0;c=0;
			next_status =(M==1)?s5:s1;
			end
		s1:begin
			a=1;b=1;c=0;
			next_status =(M==1)?s0:s2;
			end
		s2:begin 
			a=0;b=1;c=0;
			next_status =(M==1)?s1:s3;
			end
		s3:begin
			a=0;b=1;c=1;
			next_status =(M==1)?s2:s4;
			end
		s4:begin
			a=0;b=0;c=1;
			next_status =(M==1)?s3:s5;
			end
		s5:begin
			a=1;b=0;c=1;
			next_status =(M==1)?s4:s0;
			end
		s6:begin
			a=0;b=0;c=0;
			next_status =s0;
			end
		s7:begin
			a=0;b=0;c=0;
			next_status =s0;
			end
		default:begin
			a=0;b=0;c=0;
			next_status =s0;			
			end
		endcase
	end
endmodule

module Divider(
	input clk_high,
	input cr,
	output reg clk_low
	);
	reg [32:0] count;
	parameter CLK_GET=50000000;
	
	initial clk_low=0;
	always@(posedge clk_high or negedge cr)
	begin
		if(~cr)
		begin
			count <= 0;
			clk_low <= 0;
		end
		else if(count < CLK_GET)
			count <= count+1'b1;
		else 
		begin
			count <= 0;
			clk_low <= ~clk_low;
		end
	end
endmodule
