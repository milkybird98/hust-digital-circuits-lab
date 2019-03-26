`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:38:11 03/23/2019 
// Design Name: 
// Module Name:    HourAlarm 
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
module HourAlarm(
    input [7:0] hour,minute,second,
    input clk_1hz,
    input cr,
    input en,
    input day_set,
    output hour_alarm,
	 output reg [7:0] last,
	 output [7:0] hour_out_tmp
    );

    wire modify,borr,mid_night;
    wire [7:0] hour_tmp/*,hour_out_tmp*/;
    //reg [7:0] last;
    reg blink_en;
    assign modify=(hour[7:4]>1)||((hour[7:4]==1))&&(hour[3:0]>2);
    assign borr=(hour[3:0]<2)?1:0;
    assign hour_tmp[3:0]=borr?(hour[3:0]+4'b1010-4'b0010):(hour[3:0]-4'b0010);
    assign hour_tmp[7:4]=borr?(hour[7:4]-4'b0010):(hour[7:4]-4'b0001);
    assign mid_night= (hour==8'h00);
    assign hour_out_tmp=(mid_night&day_set)?8'h12:((modify&day_set)?hour_tmp:hour);
    assign hour_alarm=en&clk_1hz&blink_en;


	initial 
	begin
	blink_en<=0;
	last<=0;
	end
	
    always@(posedge clk_1hz or negedge cr)
    if(!cr)
        begin
        last<=0;
        blink_en<=0;
        end
    else if(en)
        if({minute,second}==16'h0000 && hour_out_tmp!=8'h00)
            begin
            last<=hour_out_tmp[3:0]+hour_out_tmp[7:4]*10-1;
            blink_en<=1;
            end
        else if(last==0)
            blink_en<=0;
        else last<=last-1'b1;
    else last<=last;

endmodule