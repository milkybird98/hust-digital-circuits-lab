`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:42:33 03/23/2019 
// Design Name: 
// Module Name:    AlarmSet 
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
module AlarmSet(
    input clk,
    input cr,
    input en,
    input [1:0] alarm_set_select,
    input set_confirm,
    output [7:0] hour,
    output [7:0] minute
    );

    wire minute_en,hour_en,up_tmp;
    assign minute_en=en&(set_confirm&(alarm_set_select==2'b01));
    assign hour_en=en&(set_confirm&(alarm_set_select==2'b10));

    counter60 aminute(clk,cr,minute_en,up_tmp,minute);
    counter24 ahour(clk,cr,hour_en,hour);



endmodule
