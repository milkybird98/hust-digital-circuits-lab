`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:46:00 03/23/2019 
// Design Name: 
// Module Name:    ClockAlarm 
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
module ClockAlarm(
    input clk_1hz,
    input clk_2hz,
    input cr,
    input en,
    input [1:0] alarm_set_select,
    input set_confirm,
    input [7:0] clock_hour,clock_minute,
    output [7:0] alarm_hour,alarm_minute,
    output alarm
    );
    
    wire eq;
    assign eq=(clock_hour==alarm_hour)&(clock_minute==alarm_minute);
    assign alarm=clk_2hz&eq;
    AlarmSet calarm(clk_1hz,cr,en,alarm_set_select,set_confirm,alarm_hour,alarm_minute);
endmodule
