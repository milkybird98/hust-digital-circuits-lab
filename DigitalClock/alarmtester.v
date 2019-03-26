`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:05:40 03/23/2019
// Design Name:   ClockAlarm
// Module Name:   /home/milkybird98/Xilinx/14.7/ISE_DS/DigitalClock/alarmtester.v
// Project Name:  DigitalClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ClockAlarm
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alarmtester;

	// Inputs
	reg clk_1hz;
	reg clk_2hz;
	reg cr;
	reg en;
	reg [1:0] alarm_set_select;
	reg set_confirm;
	reg [7:0] clock_hour;
	reg [7:0] clock_minute;

	// Outputs
	wire [7:0] alarm_hour;
	wire [7:0] alarm_minute;
	wire alarm;

	// Instantiate the Unit Under Test (UUT)
	ClockAlarm uut (
		.clk_1hz(clk_1hz), 
		.clk_2hz(clk_2hz), 
		.cr(cr), 
		.en(en), 
		.alarm_set_select(alarm_set_select), 
		.set_confirm(set_confirm), 
		.clock_hour(clock_hour), 
		.clock_minute(clock_minute), 
		.alarm_hour(alarm_hour), 
		.alarm_minute(alarm_minute), 
		.alarm(alarm)
	);

	initial begin
		// Initialize Inputs
		clk_1hz = 0;
		clk_2hz = 0;
		cr = 1;
		en = 0;
		alarm_set_select = 2'b10;
		set_confirm = 0;
		clock_hour = 8'h00;
		clock_minute = 8'h10;

		// Wait 100 ns for global reset to finish
		#100;
		en=1;
		#1;
		cr=0;
		#1;
		cr=1;
      set_confirm=1;
		#30
		set_confirm=0;
		#20
		clock_minute = 8'h07;
		// Add stimulus here

	end
      always clk_1hz=#2~clk_1hz;
		always clk_2hz=#1~clk_2hz;
endmodule

