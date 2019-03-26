`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:54:30 03/23/2019 
// Design Name: 
// Module Name:    Day24or12 
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
module Day24or12(
    input [7:0] hour,
    input day_set,
    output pm_or_am,
    output [7:0] hour_out
    );

    wire modify,borr,mid_night,noon;
    wire [7:0] hour_tmp,hour_out_tmp;
    assign noon=(hour==8'h12);
    assign modify=(hour[7:4]>1)||((hour[7:4]==1))&&(hour[3:0]>2);
    assign borr=(hour[3:0]<2)?1:0;
    assign hour_tmp[3:0]=borr?(hour[3:0]+4'b1010-4'b0010):(hour[3:0]-4'b0010);
    assign hour_tmp[7:4]=borr?(hour[7:4]-4'b0010):(hour[7:4]-4'b0001);
    assign mid_night= (hour==8'h00);
    assign hour_out_tmp=(modify&day_set)?hour_tmp:hour;
    assign hour_out=(mid_night&day_set)?8'h12:hour_out_tmp;
    assign pm_or_am=(modify|noon)&day_set;

endmodule
