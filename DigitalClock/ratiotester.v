`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:57:20 03/23/2019
// Design Name:   HourAlarm
// Module Name:   /home/milkybird98/Xilinx/14.7/ISE_DS/DigitalClock/ratiotester.v
// Project Name:  DigitalClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: HourAlarm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ratiotester;

	// Inputs
	reg [7:0] hour;
	reg [7:0] minute;
	reg [7:0] second;
	reg clk_1hz;
	reg cr;
	reg en;
	reg day_set;

	// Outputs
	wire hour_alarm;
	wire [7:0] last;
	wire [7:0] hour_out_tmp;

	// Instantiate the Unit Under Test (UUT)
	HourAlarm uut (
		.hour(hour), 
		.minute(minute), 
		.second(second), 
		.clk_1hz(clk_1hz), 
		.cr(cr), 
		.en(en), 
		.day_set(day_set), 
		.hour_alarm(hour_alarm), 
		.last(last), 
		.hour_out_tmp(hour_out_tmp)
	);

	initial begin
		// Initialize Inputs
		hour = 0;
		minute = 0;
		second = 0;
		clk_1hz = 0;
		cr = 1;
		en = 1;
		day_set = 1;
		
		#2;
		cr=0;
		#2
		cr=1;
		hour=8'h13;
      #4 
		second=1;
		#1000
		second=0;
		hour=8'h15;
		#4 
		second=1;
		#1000
		second=0;
		hour=8'h19;
		#4 
		second=1;
		#1000
		second=0;
		hour=8'h21;
		#4 
		second=1;
		#1000
		second=0;
		hour=8'h23;
		#4 
		second=1;
		#1000
		second=0;
		hour=8'h24;
				#4 
		second=1;
		// Add stimulus here

	end
      always clk_1hz=#2~clk_1hz;
endmodule

