
module AH_RoundRobinArbiter_24 (clk
,rstn
,req
,grant);

input clk;
input rstn;
input [23:0] req;
output [23:0] grant;



reg	[4:0]	rotate_ptr;  
reg	[23:0]	shift_req;
reg	[23:0]	shift_grant;
reg	[23:0]	grant_comb;
reg	[23:0]	grant;




always @ (*)
begin
case (rotate_ptr[4:0])
			5'b00000: shift_req[23:0] = req[23:0];
			5'b00001: shift_req[23:0] = {req[0],req[23:1]};
			5'b00010: shift_req[23:0] = {req[1:0],req[23:2]};
			5'b00011: shift_req[23:0] = {req[2:0],req[23:3]};
			5'b00100: shift_req[23:0] = {req[3:0],req[23:4]};
			5'b00101: shift_req[23:0] = {req[4:0],req[23:5]};
			5'b00110: shift_req[23:0] = {req[5:0],req[23:6]};
			5'b00111: shift_req[23:0] = {req[6:0],req[23:7]};
			5'b01000: shift_req[23:0] = {req[7:0],req[23:8]};
			5'b01001: shift_req[23:0] = {req[8:0],req[23:9]};
			5'b01010: shift_req[23:0] = {req[9:0],req[23:10]};
			5'b01011: shift_req[23:0] = {req[10:0],req[23:11]};
			5'b01100: shift_req[23:0] = {req[11:0],req[23:12]};
			5'b01101: shift_req[23:0] = {req[12:0],req[23:13]};
			5'b01110: shift_req[23:0] = {req[13:0],req[23:14]};
			5'b01111: shift_req[23:0] = {req[14:0],req[23:15]};
			5'b10000: shift_req[23:0] = {req[15:0],req[23:16]};
			5'b10001: shift_req[23:0] = {req[16:0],req[23:17]};
			5'b10010: shift_req[23:0] = {req[17:0],req[23:18]};
			5'b10011: shift_req[23:0] = {req[18:0],req[23:19]};
			5'b10100: shift_req[23:0] = {req[19:0],req[23:20]};
			5'b10101: shift_req[23:0] = {req[20:0],req[23:21]};
			5'b10110: shift_req[23:0] = {req[21:0],req[23:22]};
			5'b10111: shift_req[23:0] = {req[22:0],req[23]};

	endcase
end

always @ (*)
begin
shift_grant[23:0] = 24'b0;
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
			else if (shift_req[16])	shift_grant[16] = 1'b1;
			else if (shift_req[17])	shift_grant[17] = 1'b1;
			else if (shift_req[18])	shift_grant[18] = 1'b1;
			else if (shift_req[19])	shift_grant[19] = 1'b1;
			else if (shift_req[20])	shift_grant[20] = 1'b1;
			else if (shift_req[21])	shift_grant[21] = 1'b1;
			else if (shift_req[22])	shift_grant[22] = 1'b1;
			else if (shift_req[23])	shift_grant[23] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[4:0])
			5'b00000: grant_comb[23:0] = shift_grant[23:0];
			5'b00001: grant_comb[23:0] = {shift_grant[22:0],shift_grant[23]};
			5'b00010: grant_comb[23:0] = {shift_grant[21:0],shift_grant[23:22]};
			5'b00011: grant_comb[23:0] = {shift_grant[20:0],shift_grant[23:21]};
			5'b00100: grant_comb[23:0] = {shift_grant[19:0],shift_grant[23:20]};
			5'b00101: grant_comb[23:0] = {shift_grant[18:0],shift_grant[23:19]};
			5'b00110: grant_comb[23:0] = {shift_grant[17:0],shift_grant[23:18]};
			5'b00111: grant_comb[23:0] = {shift_grant[16:0],shift_grant[23:17]};
			5'b01000: grant_comb[23:0] = {shift_grant[15:0],shift_grant[23:16]};
			5'b01001: grant_comb[23:0] = {shift_grant[14:0],shift_grant[23:15]};
			5'b01010: grant_comb[23:0] = {shift_grant[13:0],shift_grant[23:14]};
			5'b01011: grant_comb[23:0] = {shift_grant[12:0],shift_grant[23:13]};
			5'b01100: grant_comb[23:0] = {shift_grant[11:0],shift_grant[23:12]};
			5'b01101: grant_comb[23:0] = {shift_grant[10:0],shift_grant[23:11]};
			5'b01110: grant_comb[23:0] = {shift_grant[9:0],shift_grant[23:10]};
			5'b01111: grant_comb[23:0] = {shift_grant[8:0],shift_grant[23:9]};
			5'b10000: grant_comb[23:0] = {shift_grant[7:0],shift_grant[23:8]};
			5'b10001: grant_comb[23:0] = {shift_grant[6:0],shift_grant[23:7]};
			5'b10010: grant_comb[23:0] = {shift_grant[5:0],shift_grant[23:6]};
			5'b10011: grant_comb[23:0] = {shift_grant[4:0],shift_grant[23:5]};
			5'b10100: grant_comb[23:0] = {shift_grant[3:0],shift_grant[23:4]};
			5'b10101: grant_comb[23:0] = {shift_grant[2:0],shift_grant[23:3]};
			5'b10110: grant_comb[23:0] = {shift_grant[1:0],shift_grant[23:2]};
			5'b10111: grant_comb[23:0] = {shift_grant[0],shift_grant[23:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[23:0] <= 24'b0;
	else		grant[23:0] <= grant_comb[23:0] & ~grant[23:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[4:0] <= 5'b0;
	else 
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[4:0] <= 5'd1;
			grant[1]: rotate_ptr[4:0] <= 5'd2;
			grant[2]: rotate_ptr[4:0] <= 5'd3;
			grant[3]: rotate_ptr[4:0] <= 5'd4;
			grant[4]: rotate_ptr[4:0] <= 5'd5;
			grant[5]: rotate_ptr[4:0] <= 5'd6;
			grant[6]: rotate_ptr[4:0] <= 5'd7;
			grant[7]: rotate_ptr[4:0] <= 5'd8;
			grant[8]: rotate_ptr[4:0] <= 5'd9;
			grant[9]: rotate_ptr[4:0] <= 5'd10;
			grant[10]: rotate_ptr[4:0] <= 5'd11;
			grant[11]: rotate_ptr[4:0] <= 5'd12;
			grant[12]: rotate_ptr[4:0] <= 5'd13;
			grant[13]: rotate_ptr[4:0] <= 5'd14;
			grant[14]: rotate_ptr[4:0] <= 5'd15;
			grant[15]: rotate_ptr[4:0] <= 5'd16;
			grant[16]: rotate_ptr[4:0] <= 5'd17;
			grant[17]: rotate_ptr[4:0] <= 5'd18;
			grant[18]: rotate_ptr[4:0] <= 5'd19;
			grant[19]: rotate_ptr[4:0] <= 5'd20;
			grant[20]: rotate_ptr[4:0] <= 5'd21;
			grant[21]: rotate_ptr[4:0] <= 5'd22;
			grant[22]: rotate_ptr[4:0] <= 5'd23;
			grant[23]: rotate_ptr[4:0] <= 5'd0;
			

		endcase
end






endmodule
