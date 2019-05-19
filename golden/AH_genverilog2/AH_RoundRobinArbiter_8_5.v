
module AH_RoundRobinArbiter_8_5 (clk
,rstn
,req
,grant);

input clk;
input rstn;
input [7:0] req;
output [7:0] grant;

input [5:0] cfg_weight0;
input [5:0] cfg_weight1;
input [5:0] cfg_weight2;
input [5:0] cfg_weight3;
input [5:0] cfg_weight4;
input [5:0] cfg_weight5;
input [5:0] cfg_weight6;
input [5:0] cfg_weight7;

reg	[2:0]	rotate_ptr;  
reg	[7:0]	shift_req;
reg	[7:0]	shift_grant;
reg	[7:0]	grant_comb;
reg	[7:0]	grant;

input [5:0] cfg_weight0;
input [5:0] cfg_weight1;
input [5:0] cfg_weight2;
input [5:0] cfg_weight3;
input [5:0] cfg_weight4;
input [5:0] cfg_weight5;
input [5:0] cfg_weight6;
input [5:0] cfg_weight7;


always @ (*)
begin
case (rotate_ptr[2:0])
			3'b000: shift_req[7:0] = req[7:0];
			3'b001: shift_req[7:0] = {req[0],req[7:1]};
			3'b010: shift_req[7:0] = {req[1:0],req[7:2]};
			3'b011: shift_req[7:0] = {req[2:0],req[7:3]};
			3'b100: shift_req[7:0] = {req[3:0],req[7:4]};
			3'b101: shift_req[7:0] = {req[4:0],req[7:5]};
			3'b110: shift_req[7:0] = {req[5:0],req[7:6]};
			3'b111: shift_req[7:0] = {req[6:0],req[7]};

	endcase
end

always @ (*)
begin
shift_grant[7:0] = 8'b0;
			if (shift_req[0])	shift_grant[0] = 1'b1;
			else if (shift_req[1])	shift_grant[1] = 1'b1;
			else if (shift_req[2])	shift_grant[2] = 1'b1;
			else if (shift_req[3])	shift_grant[3] = 1'b1;
			else if (shift_req[4])	shift_grant[4] = 1'b1;
			else if (shift_req[5])	shift_grant[5] = 1'b1;
			else if (shift_req[6])	shift_grant[6] = 1'b1;
			else if (shift_req[7])	shift_grant[7] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[2:0])
			3'b000: grant_comb[7:0] = shift_grant[7:0];
			3'b001: grant_comb[7:0] = {shift_grant[6:0],shift_grant[7]};
			3'b010: grant_comb[7:0] = {shift_grant[5:0],shift_grant[7:6]};
			3'b011: grant_comb[7:0] = {shift_grant[4:0],shift_grant[7:5]};
			3'b100: grant_comb[7:0] = {shift_grant[3:0],shift_grant[7:4]};
			3'b101: grant_comb[7:0] = {shift_grant[2:0],shift_grant[7:3]};
			3'b110: grant_comb[7:0] = {shift_grant[1:0],shift_grant[7:2]};
			3'b111: grant_comb[7:0] = {shift_grant[0],shift_grant[7:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[7:0] <= 8'b0;
	else		grant[7:0] <= grant_comb[7:0] & ~grant[7:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[2:0] <= 3'b0;
	else 
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[2:0] <= | nweight0 ?  : rotate_ptr :3'd1;
			grant[1]: rotate_ptr[2:0] <= | nweight1 ?  : rotate_ptr :3'd2;
			grant[2]: rotate_ptr[2:0] <= | nweight2 ?  : rotate_ptr :3'd3;
			grant[3]: rotate_ptr[2:0] <= | nweight3 ?  : rotate_ptr :3'd4;
			grant[4]: rotate_ptr[2:0] <= | nweight4 ?  : rotate_ptr :3'd5;
			grant[5]: rotate_ptr[2:0] <= | nweight5 ?  : rotate_ptr :3'd6;
			grant[6]: rotate_ptr[2:0] <= | nweight6 ?  : rotate_ptr :3'd7;
			grant[7]: rotate_ptr[2:0] <= | nweight7 ?  : rotate_ptr :3'd0;
			

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
end else beginweight0 <= nweight0;
weight1 <= nweight1;
weight2 <= nweight2;
weight3 <= nweight3;
weight4 <= nweight4;
weight5 <= nweight5;
weight6 <= nweight6;
weight7 <= nweight7;
		end
	end
assign refresh_weights = (~|weight0) & (~|weight1) & (~|weight2) & (~|weight3) & (~|weight4) & (~|weight5) & (~|weight6) & (~|weight7);


assign nweight0 = refresh_weights ? cfg_weight0 :  (req[0] & gnt[0]) ? weight0 - 1'b1 :   weight0;
assign nweight1 = refresh_weights ? cfg_weight1 :  (req[1] & gnt[1]) ? weight1 - 1'b1 :   weight1;
assign nweight2 = refresh_weights ? cfg_weight2 :  (req[2] & gnt[2]) ? weight2 - 1'b1 :   weight2;
assign nweight3 = refresh_weights ? cfg_weight3 :  (req[3] & gnt[3]) ? weight3 - 1'b1 :   weight3;
assign nweight4 = refresh_weights ? cfg_weight4 :  (req[4] & gnt[4]) ? weight4 - 1'b1 :   weight4;
assign nweight5 = refresh_weights ? cfg_weight5 :  (req[5] & gnt[5]) ? weight5 - 1'b1 :   weight5;
assign nweight6 = refresh_weights ? cfg_weight6 :  (req[6] & gnt[6]) ? weight6 - 1'b1 :   weight6;
assign nweight7 = refresh_weights ? cfg_weight7 :  (req[7] & gnt[7]) ? weight7 - 1'b1 :   weight7;



endmodule
