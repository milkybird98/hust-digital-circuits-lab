`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:05:22 03/23/2019 
// Design Name: 
// Module Name:    counter24 
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
module counter24(
    input clk,
    input cr,
    input en,
    output [7:0]data
    );

    reg [3:0] bcd_hr,bcd_lr;
    assign data[7:4] = bcd_hr;
    assign data[3:0] = bcd_lr;
	 
	 initial
	 begin
	 bcd_hr=4'b0000;
	 bcd_lr=4'b0000;
	 end
	 
    always@(posedge clk or negedge cr)
        if(!cr)
            begin
            bcd_hr<=0;
            bcd_lr<=0;
            end
        else if(en)
            if((bcd_hr==2)&(bcd_lr==3))
                begin
                bcd_hr<=0;
                bcd_lr<=0;
                end
            else if(bcd_lr==9)
                begin
                bcd_hr<=bcd_hr+1'b1;
                bcd_lr<=0;
                end
            else
                bcd_lr<=bcd_lr+1'b1;
endmodule
