`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:55:18 03/23/2019 
// Design Name: 
// Module Name:    BCDCounterx10 
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
module BCDCounterx10(
    input clk,
    input cr,
    input en,
    output up_signal,
    output reg [3:0] bcd10
    );

    assign up_signal=(bcd10==9)?1'b1:1'b0;
	 
	 initial
	 bcd10=4'b0000;
    always@(posedge clk or negedge cr)
        if(!cr)
            bcd10 <= 0;
        else if(en)
            if(bcd10!=9)
                bcd10<=bcd10+1'b1;
            else
                bcd10<=0;
        else
            bcd10<=bcd10;
endmodule
