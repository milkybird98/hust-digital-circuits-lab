`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:54:59 03/23/2019 
// Design Name: 
// Module Name:    BCDCounterx6 
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
module BCDCounterx6(
    input clk,
    input cr,
    input en,
    output up_signal,
    output reg [3:0] bcd6
    );

    assign up_signal=(bcd6==5)?1'b1:1'b0;

	 initial
	 bcd6=4'b0000;
    always@(posedge clk or negedge cr)
        if(!cr)
            bcd6 <= 4'b0000;
            else if(en)
                if(bcd6!=5)
                    bcd6<=bcd6+1'b1;
                else
                    bcd6<=0;
            else
                bcd6<=bcd6;
endmodule
