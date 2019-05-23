
module AH_RoundRobinArbiter_32 (req
,gnt);

input [31:0] req;
output [31:0] gnt;


/f_f/
if(weight != None):
    code="\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/
reg	[4:0]	rotate_ptr;
reg	[31:0]	shift_req;
reg	[31:0]	shift_grant;
reg	[31:0]	grant_comb;
reg	[31:0]	grant;

/f_f/
if(weight != None):
    code="\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/

always @ (*)
begin
/f_f/
code="case (rotate_ptr["+str(EncodedNum_Clients - 1)+":0])\n			"                         + str(EncodedNum_Clients)+"'b"+"0"*EncodedNum_Clients + ": shift_req["+str(Num_Clients-1)+":0] = "                         "req["+str(Num_Clients-1)+":0];\n			" +                         str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-1)+"1: shift_req[" + str(Num_Clients-1)+":0] = "                         "{req[0],req["+str(Num_Clients-1)+":1]};\n			"
for i in range(2, Num_Clients-1):
    code+=str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-len(bin(i)[2:]))+bin(i)[2:]+":"                             " shift_req["+str(Num_Clients-1)+":0] = {req["+str(i-1)+":0],req["+str(Num_Clients-1)+":"                             + str(i)+"]};\n			"

code+=str(EncodedNum_Clients)+"'b"+bin(Num_Clients-1)[2:]+": shift_req["+str(Num_Clients-1)+":0] = "                          "{req["+str(Num_Clients-2)+":0],req["+str(Num_Clients-1)+"]};"
/f_f/
	endcase
end

always @ (*)
begin
/f_f/
code="shift_grant["+str(Num_Clients-1)+":0] = " +str(Num_Clients)+""                             "'b0;\n			if (shift_req[0])	shift_grant[0] = 1'b1;\n			"
for i in range(1,Num_Clients):
    code += "else if (shift_req["+str(i)+"])	shift_grant["+str(i)+"] = 1'b1;\n			"
/f_f/
	endcase
end

always @ (*)
begin
/f_f/
code="case (rotate_ptr["+str(EncodedNum_Clients - 1)+":0])\n			"                         + str(EncodedNum_Clients)+"'b"+"0"*EncodedNum_Clients + ": grant_comb["+str(Num_Clients-1)+":0] = "                         "shift_grant["+str(Num_Clients-1)+":0];\n			" +                         str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-1)+"1: grant_comb[" + str(Num_Clients-1)+":0] = "                         "{shift_grant["+str(Num_Clients-2)+":0],"                         "shift_grant["+str(Num_Clients-1)+"]};\n			"

for i in range(Num_Clients-3, 0, -1):
    code += str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-len(bin(Num_Clients-i-1)[2:]))+bin(Num_Clients-i-1)[2:]+":"                             " grant_comb["+str(Num_Clients-1)+":0] = {shift_grant["+str(i)+":0],shift_grant["+str(Num_Clients-1)+":"                             + str(i+1)+"]};\n			"
code += str(EncodedNum_Clients)+"'b"+bin(Num_Clients-1)[2:]+":"                             " grant_comb["+str(Num_Clients-1)+":0] = {shift_grant[0],shift_grant["+str(Num_Clients-1)+":1]};\n"
/f_f/
    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[31:0] <= 32'b0;
	else		grant[31:0] <= grant_comb[31:0] & ~grant[31:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[4:0] <= 5'b0;
	else
		case (1'b1) // synthesis parallel_case
/f_f/
code=""
for i in range(Num_Clients):
    code += "grant["+str(i)+"]: rotate_ptr["+str(EncodedNum_Clients-1)+":0] <= "              + ("| nweight"+str(i)+" ?  : rotate_ptr :" if weight is not None else "")+str(EncodedNum_Clients)+"'d"+str((i+1) % Num_Clients)+";"+"\n			"

/f_f/
		endcase
end
/f_f/
code=""
if(weight!=None):
    code+="\nalways @ (posedge clk or negedge rst_an) \n	begin \n if (!rst_an) begin "
    code+="\n".join(["weight" + str(i) + " <= "+str(weight+1)+"'d0;" for i in range(Num_Clients)])
    code+="\nend else begin"
    code+="\n".join(["weight" + str(i) + " <= " + "nweight" + str(i) + ";" for i in range(Num_Clients)])
    code+="\n		end\n	end\nassign refresh_weights = "
    code+= " & ".join(["(~|weight" + str(i)+")" for i in range(Num_Clients)]) + ";"
/f_f/

/f_f/
code=""
if(weight!=None):
    for i in range(Num_Clients):
        code += "assign nweight"+str(i)+" = refresh_weights ? cfg_weight"+str(i)+" :  (req["+str(i)+"] & gnt["+str(i)+"]) ? weight"+str(i)+" - 1'b1 :   weight"+str(i)+";\n"
/f_f/




reg	[4:0]	rotate_ptr;
reg	[31:0]	shift_req;
reg	[31:0]	shift_grant;
reg	[31:0]	grant_comb;
reg	[31:0]	grant;




always @ (*)
begin
case (rotate_ptr[4:0])
			5'b00000: shift_req[31:0] = req[31:0];
			5'b00001: shift_req[31:0] = {req[0],req[31:1]};
			5'b00010: shift_req[31:0] = {req[1:0],req[31:2]};
			5'b00011: shift_req[31:0] = {req[2:0],req[31:3]};
			5'b00100: shift_req[31:0] = {req[3:0],req[31:4]};
			5'b00101: shift_req[31:0] = {req[4:0],req[31:5]};
			5'b00110: shift_req[31:0] = {req[5:0],req[31:6]};
			5'b00111: shift_req[31:0] = {req[6:0],req[31:7]};
			5'b01000: shift_req[31:0] = {req[7:0],req[31:8]};
			5'b01001: shift_req[31:0] = {req[8:0],req[31:9]};
			5'b01010: shift_req[31:0] = {req[9:0],req[31:10]};
			5'b01011: shift_req[31:0] = {req[10:0],req[31:11]};
			5'b01100: shift_req[31:0] = {req[11:0],req[31:12]};
			5'b01101: shift_req[31:0] = {req[12:0],req[31:13]};
			5'b01110: shift_req[31:0] = {req[13:0],req[31:14]};
			5'b01111: shift_req[31:0] = {req[14:0],req[31:15]};
			5'b10000: shift_req[31:0] = {req[15:0],req[31:16]};
			5'b10001: shift_req[31:0] = {req[16:0],req[31:17]};
			5'b10010: shift_req[31:0] = {req[17:0],req[31:18]};
			5'b10011: shift_req[31:0] = {req[18:0],req[31:19]};
			5'b10100: shift_req[31:0] = {req[19:0],req[31:20]};
			5'b10101: shift_req[31:0] = {req[20:0],req[31:21]};
			5'b10110: shift_req[31:0] = {req[21:0],req[31:22]};
			5'b10111: shift_req[31:0] = {req[22:0],req[31:23]};
			5'b11000: shift_req[31:0] = {req[23:0],req[31:24]};
			5'b11001: shift_req[31:0] = {req[24:0],req[31:25]};
			5'b11010: shift_req[31:0] = {req[25:0],req[31:26]};
			5'b11011: shift_req[31:0] = {req[26:0],req[31:27]};
			5'b11100: shift_req[31:0] = {req[27:0],req[31:28]};
			5'b11101: shift_req[31:0] = {req[28:0],req[31:29]};
			5'b11110: shift_req[31:0] = {req[29:0],req[31:30]};
			5'b11111: shift_req[31:0] = {req[30:0],req[31]};

	endcase
end

always @ (*)
begin
shift_grant[31:0] = 32'b0;
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
			else if (shift_req[24])	shift_grant[24] = 1'b1;
			else if (shift_req[25])	shift_grant[25] = 1'b1;
			else if (shift_req[26])	shift_grant[26] = 1'b1;
			else if (shift_req[27])	shift_grant[27] = 1'b1;
			else if (shift_req[28])	shift_grant[28] = 1'b1;
			else if (shift_req[29])	shift_grant[29] = 1'b1;
			else if (shift_req[30])	shift_grant[30] = 1'b1;
			else if (shift_req[31])	shift_grant[31] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[4:0])
			5'b00000: grant_comb[31:0] = shift_grant[31:0];
			5'b00001: grant_comb[31:0] = {shift_grant[30:0],shift_grant[31]};
			5'b00010: grant_comb[31:0] = {shift_grant[29:0],shift_grant[31:30]};
			5'b00011: grant_comb[31:0] = {shift_grant[28:0],shift_grant[31:29]};
			5'b00100: grant_comb[31:0] = {shift_grant[27:0],shift_grant[31:28]};
			5'b00101: grant_comb[31:0] = {shift_grant[26:0],shift_grant[31:27]};
			5'b00110: grant_comb[31:0] = {shift_grant[25:0],shift_grant[31:26]};
			5'b00111: grant_comb[31:0] = {shift_grant[24:0],shift_grant[31:25]};
			5'b01000: grant_comb[31:0] = {shift_grant[23:0],shift_grant[31:24]};
			5'b01001: grant_comb[31:0] = {shift_grant[22:0],shift_grant[31:23]};
			5'b01010: grant_comb[31:0] = {shift_grant[21:0],shift_grant[31:22]};
			5'b01011: grant_comb[31:0] = {shift_grant[20:0],shift_grant[31:21]};
			5'b01100: grant_comb[31:0] = {shift_grant[19:0],shift_grant[31:20]};
			5'b01101: grant_comb[31:0] = {shift_grant[18:0],shift_grant[31:19]};
			5'b01110: grant_comb[31:0] = {shift_grant[17:0],shift_grant[31:18]};
			5'b01111: grant_comb[31:0] = {shift_grant[16:0],shift_grant[31:17]};
			5'b10000: grant_comb[31:0] = {shift_grant[15:0],shift_grant[31:16]};
			5'b10001: grant_comb[31:0] = {shift_grant[14:0],shift_grant[31:15]};
			5'b10010: grant_comb[31:0] = {shift_grant[13:0],shift_grant[31:14]};
			5'b10011: grant_comb[31:0] = {shift_grant[12:0],shift_grant[31:13]};
			5'b10100: grant_comb[31:0] = {shift_grant[11:0],shift_grant[31:12]};
			5'b10101: grant_comb[31:0] = {shift_grant[10:0],shift_grant[31:11]};
			5'b10110: grant_comb[31:0] = {shift_grant[9:0],shift_grant[31:10]};
			5'b10111: grant_comb[31:0] = {shift_grant[8:0],shift_grant[31:9]};
			5'b11000: grant_comb[31:0] = {shift_grant[7:0],shift_grant[31:8]};
			5'b11001: grant_comb[31:0] = {shift_grant[6:0],shift_grant[31:7]};
			5'b11010: grant_comb[31:0] = {shift_grant[5:0],shift_grant[31:6]};
			5'b11011: grant_comb[31:0] = {shift_grant[4:0],shift_grant[31:5]};
			5'b11100: grant_comb[31:0] = {shift_grant[3:0],shift_grant[31:4]};
			5'b11101: grant_comb[31:0] = {shift_grant[2:0],shift_grant[31:3]};
			5'b11110: grant_comb[31:0] = {shift_grant[1:0],shift_grant[31:2]};
			5'b11111: grant_comb[31:0] = {shift_grant[0],shift_grant[31:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[31:0] <= 32'b0;
	else		grant[31:0] <= grant_comb[31:0] & ~grant[31:0];
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
			grant[23]: rotate_ptr[4:0] <= 5'd24;
			grant[24]: rotate_ptr[4:0] <= 5'd25;
			grant[25]: rotate_ptr[4:0] <= 5'd26;
			grant[26]: rotate_ptr[4:0] <= 5'd27;
			grant[27]: rotate_ptr[4:0] <= 5'd28;
			grant[28]: rotate_ptr[4:0] <= 5'd29;
			grant[29]: rotate_ptr[4:0] <= 5'd30;
			grant[30]: rotate_ptr[4:0] <= 5'd31;
			grant[31]: rotate_ptr[4:0] <= 5'd0;
			

		endcase
end






endmodule
