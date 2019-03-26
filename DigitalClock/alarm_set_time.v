`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:26:47 03/23/2019 
// Design Name: 
// Module Name:    alarm_set_time 
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
module alarm_set_time(
    input clk,
    input cr,
    input en,
    input [1:0] alarm_set_select,
    input set_confirm,
    output [7:0] hour,minute
    );

    wire minute_en,hour_en,up_tmp;
    assign minute_en=en&(alarm_set_select==2'b01);
    assign hour_en=en&(alarm_set_select==2'b10);

    counter60 aminute(clk,cr,minute_en,up_tmp,minute,set_confirm&(alarm_set_select==2'b01));
    counter24 ahour(clk,cr,hour_en,hour,set_confirm&(alarm_set_select==2'b10));

endmodule
