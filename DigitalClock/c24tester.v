`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:47:08 03/23/2019
// Design Name:   counter24
// Module Name:   /home/milkybird98/Xilinx/14.7/ISE_DS/DigitalClock/c24tester.v
// Project Name:  DigitalClock
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter24
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module c24tester;

	// Inputs
	reg clk;
	reg cr;
	reg en;

	// Outputs
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	counter24 uut (
		.clk(clk), 
		.cr(cr), 
		.en(en), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		cr = 1;
		en = 1;

		// Wait 100 ns for global reset to finish
		#1;
		cr=0;
		#1
		cr=1;
        
		// Add stimulus here
	end
	
      always clk=#1~clk;
endmodule

