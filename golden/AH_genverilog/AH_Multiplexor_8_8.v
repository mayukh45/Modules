
module AH_Multiplexor_8_8 (
in_data0,
in_data1,
in_data2,
in_data3,
in_data4,
in_data5,
in_data6,
in_data7,
out_data,
 mux_select );


 input [7:0] in_data0;
 input [7:0] in_data1;
 input [7:0] in_data2;
 input [7:0] in_data3;
 input [7:0] in_data4;
 input [7:0] in_data5;
 input [7:0] in_data6;
 input [7:0] in_data7;
 output [7:0] out_data;
 input [7:0] mux_select;


 wire assign out_data = 8'd0 |(mux_select[0]? in_data0 : 8'd0) |
 (mux_select[1]? in_data1 : 8'd0) |
 (mux_select[2]? in_data2 : 8'd0) |
 (mux_select[3]? in_data3 : 8'd0) |
 (mux_select[4]? in_data4 : 8'd0) |
 (mux_select[5]? in_data5 : 8'd0) |
 (mux_select[6]? in_data6 : 8'd0) |
 (mux_select[7]? in_data7 : 8'd0)


end module
