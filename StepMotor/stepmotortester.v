`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:55:54 03/25/2019
// Design Name:   StepMotorDriver
// Module Name:   /home/milky/step_motor/stepmotortester.v
// Project Name:  step_motor
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: StepMotorDriver
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module stepmotortester;

	// Inputs
	reg clk;
	reg cr;
	reg M;

	// Outputs
	wire a;
	wire b;
	wire c;

	// Instantiate the Unit Under Test (UUT)
	StepMotorDriver uut (
		.clk(clk), 
		.cr(cr), 
		.M(M), 
		.a(a), 
		.b(b), 
		.c(c)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		cr = 1;
		M = 0;

		// Wait 100 ns for global reset to finish
		#100;
        cr=0;
		 #10;
		 cr=1;
		 #1000;
		 M=1;
		 #100;
		 cr=0;
		 #10;
		 cr=1;
		// Add stimulus here

	end
     always clk=#1~clk;
endmodule

