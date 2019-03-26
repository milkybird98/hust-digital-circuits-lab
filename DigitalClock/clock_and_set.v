`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:10:49 03/23/2019 
// Design Name: 
// Module Name:    clock_and_set 
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
module clock_and_set(
    input clk,
    input cr,
    input [1:0] clock_set_select,
    input set_confirm,
    output [7:0] hour,minute,second
    );

    wire minute_en,hour_en,up_minute,up_second,second_set;
    assign minute_en =up_second|(clock_set_select==2'b10);
    assign hour_en=(up_minute&up_second)|(clock_set_select==2'b11);
    assign second_set=~((clock_set_select==2'b01)&set_confirm);
    counter60 csecond(clk,cr|second_set,1'b1,up_second,second,1'b0);
    counter60 cminute(clk,cr,minute_en,up_minute,minute,set_confirm&(clock_set_select==2'b10));
    counter24 chour(clk,cr,hour_en,hour,set_confirm&(clock_set_select==2'b11));

endmodule
