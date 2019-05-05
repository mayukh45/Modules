
module AH_RoundRobinArbiter_12 (clk
,rstn
,req
,grant);

input clk;
input rstn;
input [11:0] req;
output [11:0] grant;



reg	[3:0]	rotate_ptr;  
reg	[11:0]	shift_req;
reg	[11:0]	shift_grant;
reg	[11:0]	grant_comb;
reg	[11:0]	grant;




always @ (*)
begin
case (rotate_ptr[3:0])
			4'b0000: shift_req[11:0] = req[11:0];
			4'b0001: shift_req[11:0] = {req[0],req[11:1]};
			4'b0010: shift_req[11:0] = {req[1:0],req[11:2]};
			4'b0011: shift_req[11:0] = {req[2:0],req[11:3]};
			4'b0100: shift_req[11:0] = {req[3:0],req[11:4]};
			4'b0101: shift_req[11:0] = {req[4:0],req[11:5]};
			4'b0110: shift_req[11:0] = {req[5:0],req[11:6]};
			4'b0111: shift_req[11:0] = {req[6:0],req[11:7]};
			4'b1000: shift_req[11:0] = {req[7:0],req[11:8]};
			4'b1001: shift_req[11:0] = {req[8:0],req[11:9]};
			4'b1010: shift_req[11:0] = {req[9:0],req[11:10]};
			4'b1011: shift_req[11:0] = {req[10:0],req[11]};

	endcase
end

always @ (*)
begin
shift_grant[11:0] = 12'b0;
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
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[3:0])
			4'b0000: grant_comb[11:0] = shift_grant[11:0];
			4'b0001: grant_comb[11:0] = {shift_grant[10:0],shift_grant[11]};
			4'b0010: grant_comb[11:0] = {shift_grant[9:0],shift_grant[11:10]};
			4'b0011: grant_comb[11:0] = {shift_grant[8:0],shift_grant[11:9]};
			4'b0100: grant_comb[11:0] = {shift_grant[7:0],shift_grant[11:8]};
			4'b0101: grant_comb[11:0] = {shift_grant[6:0],shift_grant[11:7]};
			4'b0110: grant_comb[11:0] = {shift_grant[5:0],shift_grant[11:6]};
			4'b0111: grant_comb[11:0] = {shift_grant[4:0],shift_grant[11:5]};
			4'b1000: grant_comb[11:0] = {shift_grant[3:0],shift_grant[11:4]};
			4'b1001: grant_comb[11:0] = {shift_grant[2:0],shift_grant[11:3]};
			4'b1010: grant_comb[11:0] = {shift_grant[1:0],shift_grant[11:2]};
			4'b1011: grant_comb[11:0] = {shift_grant[0],shift_grant[11:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[11:0] <= 12'b0;
	else		grant[11:0] <= grant_comb[11:0] & ~grant[11:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[3:0] <= 4'b0;
	else 
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[3:0] <= 4'd1;
			grant[1]: rotate_ptr[3:0] <= 4'd2;
			grant[2]: rotate_ptr[3:0] <= 4'd3;
			grant[3]: rotate_ptr[3:0] <= 4'd4;
			grant[4]: rotate_ptr[3:0] <= 4'd5;
			grant[5]: rotate_ptr[3:0] <= 4'd6;
			grant[6]: rotate_ptr[3:0] <= 4'd7;
			grant[7]: rotate_ptr[3:0] <= 4'd8;
			grant[8]: rotate_ptr[3:0] <= 4'd9;
			grant[9]: rotate_ptr[3:0] <= 4'd10;
			grant[10]: rotate_ptr[3:0] <= 4'd11;
			grant[11]: rotate_ptr[3:0] <= 4'd0;
			

		endcase
end






endmodule
