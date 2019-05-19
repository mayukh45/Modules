
module AH_Demultiplexor_8_8 (
out_data0,
out_data1,
out_data2,
out_data3,
out_data4,
out_data5,
out_data6,
out_data7,
 in_data,
 demux_select );


 output [7:0] out_data0;
 output [7:0] out_data1;
 output [7:0] out_data2;
 output [7:0] out_data3;
 output [7:0] out_data4;
 output [7:0] out_data5;
 output [7:0] out_data6;
 output [7:0] out_data7;
 input [7:0] in_data;
 input [7:0] demux_select;


wire assign out_data0 = demux_select[0]? in_data : 25'd0;
wire assign out_data1 = demux_select[1]? in_data : 25'd0;
wire assign out_data2 = demux_select[2]? in_data : 25'd0;
wire assign out_data3 = demux_select[3]? in_data : 25'd0;
wire assign out_data4 = demux_select[4]? in_data : 25'd0;
wire assign out_data5 = demux_select[5]? in_data : 25'd0;
wire assign out_data6 = demux_select[6]? in_data : 25'd0;
wire assign out_data7 = demux_select[7]? in_data : 25'd0;


end module
