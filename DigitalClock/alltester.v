`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:53:09 03/26/2019
// Design Name:   CloclSystem
// Module Name:   C:/Users/Administrator/Desktop/hust-digital-circuits-lab-master/DigitalClock/alltester.v
// Project Name:  DigitalClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CloclSystem
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alltester;

	// Inputs
	reg clk_50m;
	reg cr;
	reg en;
	reg [1:0] clock_set_select;
	reg [1:0] alarm_set_select;
	reg alarm_and_ratio_en;
	reg confirm;
	reg day_set;

	// Outputs
	wire alarm;
	wire is_pm;
	wire [6:0] seg;
	wire [7:0] pos;
	wire [7:0] output_second;

	// Instantiate the Unit Under Test (UUT)
	CloclSystem uut (
		.clk_50m(clk_50m), 
		.cr(cr), 
		.en(en), 
		.clock_set_select(clock_set_select), 
		.alarm_set_select(alarm_set_select), 
		.alarm_and_ratio_en(alarm_and_ratio_en), 
		.confirm(confirm), 
		.day_set(day_set), 
		.alarm(alarm), 
		.is_pm(is_pm), 
		.seg(seg), 
		.pos(pos), 
		.output_second(output_second)
	);

	initial begin
		// Initialize Inputs
		clk_50m = 0;
		cr = 1;
		en = 1;
		clock_set_select = 0;
		alarm_set_select = 0;
		alarm_and_ratio_en = 0;
		confirm = 0;
		day_set = 1;

		// Wait 100 ns for global reset to finish
		#1;
		cr=0;
		#1;
		cr=1;
		#100
		clock_set_select=2'b10;
		confirm=1;
		alarm_and_ratio_en=1;
		#3000
		clock_set_select=2'b11;
		#3000
		clock_set_select=2'b00;
		confirm=0;        
		// Add stimulus here

	end
      always clk_50m=#1~clk_50m;
endmodule

