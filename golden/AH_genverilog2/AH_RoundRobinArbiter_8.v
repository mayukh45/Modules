
module AH_RoundRobinArbiter_8 (req
,gnt);

input [7:0] req;
output [7:0] gnt;



reg	[2:0]	rotate_ptr;
reg	[7:0]	shift_req;
reg	[7:0]	shift_grant;
reg	[7:0]	grant_comb;
reg	[7:0]	grant;




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
grant[0]: rotate_ptr[2:0] <= 3'd1;
			grant[1]: rotate_ptr[2:0] <= 3'd2;
			grant[2]: rotate_ptr[2:0] <= 3'd3;
			grant[3]: rotate_ptr[2:0] <= 3'd4;
			grant[4]: rotate_ptr[2:0] <= 3'd5;
			grant[5]: rotate_ptr[2:0] <= 3'd6;
			grant[6]: rotate_ptr[2:0] <= 3'd7;
			grant[7]: rotate_ptr[2:0] <= 3'd0;
			

		endcase
end






endmodule
