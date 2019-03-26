`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:37:11 03/23/2019 
// Design Name: 
// Module Name:    CloclSystem 
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
module CloclSystem(
    input clk_50m,
	input cr,
	input en,
	input [1:0] clock_set_select,alarm_set_select,
    input alarm_en,
	 input ratio_en,
    input confirm,
	input day_set,
    output alarm,
    output is_pm,
    output [6:0] seg,
    output [7:0] pos,
	 output [7:0] output_hour_day,output_minute,output_second
    );

    wire clk_1hz,clk_2hz,clk_1k,hour_alarm,clock_alarm,is_alarm_set_mode;
    wire [7:0] clock_hour,clock_minute,clock_second;
    wire [7:0] alarm_hour,alarm_minute;
    wire [7:0] output_hour;//,output_minute,output_second;
	 //wire [7:0] output_hour_day;
    assign alarm = ((hour_alarm&ratio_en)|(clock_alarm&alarm_en))&(clock_set_select==2'b00)&(alarm_set_select==2'b00);
    assign is_alarm_set_mode = (alarm_set_select==2'b01)||(alarm_set_select==2'b10);
    assign {output_hour,output_minute,output_second}=is_alarm_set_mode?{alarm_hour,alarm_minute,8'b0000_0000}:{clock_hour,clock_minute,clock_second};

    ClkDivider udiv(clk_50m,cr,clk_1hz,clk_2hz,clk_1k);
    ClockAndSet uclock(clk_1hz,cr,clock_set_select,confirm,clock_hour,clock_minute,clock_second);
    ClockAlarm ualarm(clk_1hz,clk_2hz,cr,en,alarm_set_select,confirm,clock_hour,clock_minute,alarm_hour,alarm_minute,clock_alarm);
    Day24or12 udaysel(output_hour,day_set,is_pm,output_hour_day);
    HourAlarm uration(clock_hour,clock_minute,clock_second,clk_1hz,cr,en,day_set,hour_alarm);
    DigitalScan uscan(clk_1k,cr,en,output_second[3:0],output_second[7:4],output_minute[3:0],output_minute[7:4],output_hour_day[3:0],output_hour_day[7:4],seg,pos);

endmodule