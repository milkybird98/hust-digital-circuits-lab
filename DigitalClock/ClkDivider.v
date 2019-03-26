`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:02:06 03/23/2019 
// Design Name: 
// Module Name:    ClkDivider 
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
module ClkDivider(
    input clk_50m,
    input cr,
    output reg clk_1hz,
    output reg clk_2hz,
    output reg clk_1k
    );

    reg [32:0] count1k;
    reg [32:0] count1hz;
    reg [32:0] count2hz;

initial count1k=0;
always@(posedge clk_50m or negedge cr)
    if(!cr)
    begin 
        count1k <= 0;
        clk_1k <= 1'b0;
    end
    else
    begin
        //if(count1k==16'd24999)
		  if(count1k==16'd24999999)
        begin
            count1k<=0;
            clk_1k<=~clk_1k;
        end
        else
            count1k<=count1k+1'b1;
    end

initial count1hz=0;
always@(posedge clk_50m or negedge cr)
    if(!cr)
    begin 
        count1hz <= 0;
        clk_1hz <= 1'b0;
    end
    else
    begin
        if(count1hz==32'd24999999)
		  //if(count1hz==32'd249)
        begin
            count1hz<=0;
            clk_1hz<=~clk_1hz;
        end
        else
            count1hz<=count1hz+1'b1;
    end  
    
initial count2hz=0;
always@(posedge clk_50m or negedge cr)
    if(!cr)
    begin 
        count2hz <= 0;
        clk_2hz <= 1'b0;
    end
    else
    begin
        if(count2hz==32'd12499999)
		  //if(count2hz==32'd124)
        begin
            count2hz<=0;
            clk_2hz<=~clk_2hz;
        end
        else
            count2hz<=count2hz+1'b1;
    end  
endmodule
