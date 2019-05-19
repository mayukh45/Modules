
module AH_RoundRobinArbiter_16_5 (req
,gnt);

input [15:0] req;
output [15:0] gnt;

input [5:0] cfg_weight0;
input [5:0] cfg_weight1;
input [5:0] cfg_weight2;
input [5:0] cfg_weight3;
input [5:0] cfg_weight4;
input [5:0] cfg_weight5;
input [5:0] cfg_weight6;
input [5:0] cfg_weight7;
input [5:0] cfg_weight8;
input [5:0] cfg_weight9;
input [5:0] cfg_weight10;
input [5:0] cfg_weight11;
input [5:0] cfg_weight12;
input [5:0] cfg_weight13;
input [5:0] cfg_weight14;
input [5:0] cfg_weight15;

reg	[3:0]	rotate_ptr;
reg	[15:0]	shift_req;
reg	[15:0]	shift_grant;
reg	[15:0]	grant_comb;
reg	[15:0]	grant;

input [5:0] cfg_weight0;
input [5:0] cfg_weight1;
input [5:0] cfg_weight2;
input [5:0] cfg_weight3;
input [5:0] cfg_weight4;
input [5:0] cfg_weight5;
input [5:0] cfg_weight6;
input [5:0] cfg_weight7;
input [5:0] cfg_weight8;
input [5:0] cfg_weight9;
input [5:0] cfg_weight10;
input [5:0] cfg_weight11;
input [5:0] cfg_weight12;
input [5:0] cfg_weight13;
input [5:0] cfg_weight14;
input [5:0] cfg_weight15;


always @ (*)
begin
case (rotate_ptr[3:0])
			4'b0000: shift_req[15:0] = req[15:0];
			4'b0001: shift_req[15:0] = {req[0],req[15:1]};
			4'b0010: shift_req[15:0] = {req[1:0],req[15:2]};
			4'b0011: shift_req[15:0] = {req[2:0],req[15:3]};
			4'b0100: shift_req[15:0] = {req[3:0],req[15:4]};
			4'b0101: shift_req[15:0] = {req[4:0],req[15:5]};
			4'b0110: shift_req[15:0] = {req[5:0],req[15:6]};
			4'b0111: shift_req[15:0] = {req[6:0],req[15:7]};
			4'b1000: shift_req[15:0] = {req[7:0],req[15:8]};
			4'b1001: shift_req[15:0] = {req[8:0],req[15:9]};
			4'b1010: shift_req[15:0] = {req[9:0],req[15:10]};
			4'b1011: shift_req[15:0] = {req[10:0],req[15:11]};
			4'b1100: shift_req[15:0] = {req[11:0],req[15:12]};
			4'b1101: shift_req[15:0] = {req[12:0],req[15:13]};
			4'b1110: shift_req[15:0] = {req[13:0],req[15:14]};
			4'b1111: shift_req[15:0] = {req[14:0],req[15]};

	endcase
end

always @ (*)
begin
shift_grant[15:0] = 16'b0;
			if (shift_req[0])	shift_grant[0] = 1'b1;
			else if (shift_req[1])	shift_grant[1] = 1'b1;
			else if (shift_req[2])	shift_grant[2] = 1'b1;
			else if (shift_req[3])	shift_grant[3] = 1'b1;
			else if (shift_req[4])	shift_grant[4] = 1'b1;
			else if (shift_req[5])	shift_grant[5] = 1'b1;
			else if (shift_req[6])	shift_grant[6] = 1'b1;
			else if (shift_req[7])	shift_grant[7] = 1'b1;
			else if (shift_req[8])	shift_grant[8] = 1'b1;
			else if (shift_req[9])	shift_grant[9] = 1'b1;
			else if (shift_req[10])	shift_grant[10] = 1'b1;
			else if (shift_req[11])	shift_grant[11] = 1'b1;
			else if (shift_req[12])	shift_grant[12] = 1'b1;
			else if (shift_req[13])	shift_grant[13] = 1'b1;
			else if (shift_req[14])	shift_grant[14] = 1'b1;
			else if (shift_req[15])	shift_grant[15] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[3:0])
			4'b0000: grant_comb[15:0] = shift_grant[15:0];
			4'b0001: grant_comb[15:0] = {shift_grant[14:0],shift_grant[15]};
			4'b0010: grant_comb[15:0] = {shift_grant[13:0],shift_grant[15:14]};
			4'b0011: grant_comb[15:0] = {shift_grant[12:0],shift_grant[15:13]};
			4'b0100: grant_comb[15:0] = {shift_grant[11:0],shift_grant[15:12]};
			4'b0101: grant_comb[15:0] = {shift_grant[10:0],shift_grant[15:11]};
			4'b0110: grant_comb[15:0] = {shift_grant[9:0],shift_grant[15:10]};
			4'b0111: grant_comb[15:0] = {shift_grant[8:0],shift_grant[15:9]};
			4'b1000: grant_comb[15:0] = {shift_grant[7:0],shift_grant[15:8]};
			4'b1001: grant_comb[15:0] = {shift_grant[6:0],shift_grant[15:7]};
			4'b1010: grant_comb[15:0] = {shift_grant[5:0],shift_grant[15:6]};
			4'b1011: grant_comb[15:0] = {shift_grant[4:0],shift_grant[15:5]};
			4'b1100: grant_comb[15:0] = {shift_grant[3:0],shift_grant[15:4]};
			4'b1101: grant_comb[15:0] = {shift_grant[2:0],shift_grant[15:3]};
			4'b1110: grant_comb[15:0] = {shift_grant[1:0],shift_grant[15:2]};
			4'b1111: grant_comb[15:0] = {shift_grant[0],shift_grant[15:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[15:0] <= 16'b0;
	else		grant[15:0] <= grant_comb[15:0] & ~grant[15:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[3:0] <= 4'b0;
	else
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[3:0] <= | nweight0 ?  : rotate_ptr :4'd1;
			grant[1]: rotate_ptr[3:0] <= | nweight1 ?  : rotate_ptr :4'd2;
			grant[2]: rotate_ptr[3:0] <= | nweight2 ?  : rotate_ptr :4'd3;
			grant[3]: rotate_ptr[3:0] <= | nweight3 ?  : rotate_ptr :4'd4;
			grant[4]: rotate_ptr[3:0] <= | nweight4 ?  : rotate_ptr :4'd5;
			grant[5]: rotate_ptr[3:0] <= | nweight5 ?  : rotate_ptr :4'd6;
			grant[6]: rotate_ptr[3:0] <= | nweight6 ?  : rotate_ptr :4'd7;
			grant[7]: rotate_ptr[3:0] <= | nweight7 ?  : rotate_ptr :4'd8;
			grant[8]: rotate_ptr[3:0] <= | nweight8 ?  : rotate_ptr :4'd9;
			grant[9]: rotate_ptr[3:0] <= | nweight9 ?  : rotate_ptr :4'd10;
			grant[10]: rotate_ptr[3:0] <= | nweight10 ?  : rotate_ptr :4'd11;
			grant[11]: rotate_ptr[3:0] <= | nweight11 ?  : rotate_ptr :4'd12;
			grant[12]: rotate_ptr[3:0] <= | nweight12 ?  : rotate_ptr :4'd13;
			grant[13]: rotate_ptr[3:0] <= | nweight13 ?  : rotate_ptr :4'd14;
			grant[14]: rotate_ptr[3:0] <= | nweight14 ?  : rotate_ptr :4'd15;
			grant[15]: rotate_ptr[3:0] <= | nweight15 ?  : rotate_ptr :4'd0;
			

		endcase
end

always @ (posedge clk or negedge rst_an) 
	begin 
 if (!rst_an) begin weight0 <= 6'd0;
weight1 <= 6'd0;
weight2 <= 6'd0;
weight3 <= 6'd0;
weight4 <= 6'd0;
weight5 <= 6'd0;
weight6 <= 6'd0;
weight7 <= 6'd0;
weight8 <= 6'd0;
weight9 <= 6'd0;
weight10 <= 6'd0;
weight11 <= 6'd0;
weight12 <= 6'd0;
weight13 <= 6'd0;
weight14 <= 6'd0;
weight15 <= 6'd0;
end else beginweight0 <= nweight0;
weight1 <= nweight1;
weight2 <= nweight2;
weight3 <= nweight3;
weight4 <= nweight4;
weight5 <= nweight5;
weight6 <= nweight6;
weight7 <= nweight7;
weight8 <= nweight8;
weight9 <= nweight9;
weight10 <= nweight10;
weight11 <= nweight11;
weight12 <= nweight12;
weight13 <= nweight13;
weight14 <= nweight14;
weight15 <= nweight15;
		end
	end
assign refresh_weights = (~|weight0) & (~|weight1) & (~|weight2) & (~|weight3) & (~|weight4) & (~|weight5) & (~|weight6) & (~|weight7) & (~|weight8) & (~|weight9) & (~|weight10) & (~|weight11) & (~|weight12) & (~|weight13) & (~|weight14) & (~|weight15);


assign nweight0 = refresh_weights ? cfg_weight0 :  (req[0] & gnt[0]) ? weight0 - 1'b1 :   weight0;
assign nweight1 = refresh_weights ? cfg_weight1 :  (req[1] & gnt[1]) ? weight1 - 1'b1 :   weight1;
assign nweight2 = refresh_weights ? cfg_weight2 :  (req[2] & gnt[2]) ? weight2 - 1'b1 :   weight2;
assign nweight3 = refresh_weights ? cfg_weight3 :  (req[3] & gnt[3]) ? weight3 - 1'b1 :   weight3;
assign nweight4 = refresh_weights ? cfg_weight4 :  (req[4] & gnt[4]) ? weight4 - 1'b1 :   weight4;
assign nweight5 = refresh_weights ? cfg_weight5 :  (req[5] & gnt[5]) ? weight5 - 1'b1 :   weight5;
assign nweight6 = refresh_weights ? cfg_weight6 :  (req[6] & gnt[6]) ? weight6 - 1'b1 :   weight6;
assign nweight7 = refresh_weights ? cfg_weight7 :  (req[7] & gnt[7]) ? weight7 - 1'b1 :   weight7;
assign nweight8 = refresh_weights ? cfg_weight8 :  (req[8] & gnt[8]) ? weight8 - 1'b1 :   weight8;
assign nweight9 = refresh_weights ? cfg_weight9 :  (req[9] & gnt[9]) ? weight9 - 1'b1 :   weight9;
assign nweight10 = refresh_weights ? cfg_weight10 :  (req[10] & gnt[10]) ? weight10 - 1'b1 :   weight10;
assign nweight11 = refresh_weights ? cfg_weight11 :  (req[11] & gnt[11]) ? weight11 - 1'b1 :   weight11;
assign nweight12 = refresh_weights ? cfg_weight12 :  (req[12] & gnt[12]) ? weight12 - 1'b1 :   weight12;
assign nweight13 = refresh_weights ? cfg_weight13 :  (req[13] & gnt[13]) ? weight13 - 1'b1 :   weight13;
assign nweight14 = refresh_weights ? cfg_weight14 :  (req[14] & gnt[14]) ? weight14 - 1'b1 :   weight14;
assign nweight15 = refresh_weights ? cfg_weight15 :  (req[15] & gnt[15]) ? weight15 - 1'b1 :   weight15;



endmodule
