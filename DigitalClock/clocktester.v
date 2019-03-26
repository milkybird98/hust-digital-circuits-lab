`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:51:24 03/23/2019
// Design Name:   ClockAndSet
// Module Name:   /home/milkybird98/Xilinx/14.7/ISE_DS/DigitalClock/clocktester.v
// Project Name:  DigitalClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ClockAndSet
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module clocktester;

	// Inputs
	reg clk;
	reg cr;
	reg [1:0] clock_set_select;
	reg set_confirm;

	// Outputs
	wire [7:0] hour;
	wire [7:0] minute;
	wire [7:0] second;

	// Instantiate the Unit Under Test (UUT)
	ClockAndSet uut (
		.clk(clk), 
		.cr(cr), 
		.clock_set_select(clock_set_select), 
		.set_confirm(set_confirm), 
		.hour(hour), 
		.minute(minute), 
		.second(second)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		cr = 1;
		clock_set_select = 0;
		set_confirm = 0;

		// Wait 100 ns for global reset to finish
		#1;
		cr=0;
		#1
		cr=1;
      #10000
		clock_set_select=2'b10;
		set_confirm=1;
		#100
		set_confirm=0;
		#10
		cr=0;
		#1
		cr=1;
		#100
		clock_set_select=2'b11;
		set_confirm=1;
		#100
		set_confirm=0;
		// Add stimulus here

	end
      always clk=#1~clk;
endmodule

