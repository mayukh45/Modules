
module AH_RoundRobinArbiter_64_10 (req
,gnt);

input [63:0] req;
output [63:0] gnt;


/f_f/
if(weight != None):
    code="\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/
reg	[5:0]	rotate_ptr;
reg	[63:0]	shift_req;
reg	[63:0]	shift_grant;
reg	[63:0]	grant_comb;
reg	[63:0]	grant;

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
	if (!rst_n)	grant[63:0] <= 64'b0;
	else		grant[63:0] <= grant_comb[63:0] & ~grant[63:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[5:0] <= 6'b0;
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


input [10:0] cfg_weight0;
input [10:0] cfg_weight1;
input [10:0] cfg_weight2;
input [10:0] cfg_weight3;
input [10:0] cfg_weight4;
input [10:0] cfg_weight5;
input [10:0] cfg_weight6;
input [10:0] cfg_weight7;
input [10:0] cfg_weight8;
input [10:0] cfg_weight9;
input [10:0] cfg_weight10;
input [10:0] cfg_weight11;
input [10:0] cfg_weight12;
input [10:0] cfg_weight13;
input [10:0] cfg_weight14;
input [10:0] cfg_weight15;
input [10:0] cfg_weight16;
input [10:0] cfg_weight17;
input [10:0] cfg_weight18;
input [10:0] cfg_weight19;
input [10:0] cfg_weight20;
input [10:0] cfg_weight21;
input [10:0] cfg_weight22;
input [10:0] cfg_weight23;
input [10:0] cfg_weight24;
input [10:0] cfg_weight25;
input [10:0] cfg_weight26;
input [10:0] cfg_weight27;
input [10:0] cfg_weight28;
input [10:0] cfg_weight29;
input [10:0] cfg_weight30;
input [10:0] cfg_weight31;
input [10:0] cfg_weight32;
input [10:0] cfg_weight33;
input [10:0] cfg_weight34;
input [10:0] cfg_weight35;
input [10:0] cfg_weight36;
input [10:0] cfg_weight37;
input [10:0] cfg_weight38;
input [10:0] cfg_weight39;
input [10:0] cfg_weight40;
input [10:0] cfg_weight41;
input [10:0] cfg_weight42;
input [10:0] cfg_weight43;
input [10:0] cfg_weight44;
input [10:0] cfg_weight45;
input [10:0] cfg_weight46;
input [10:0] cfg_weight47;
input [10:0] cfg_weight48;
input [10:0] cfg_weight49;
input [10:0] cfg_weight50;
input [10:0] cfg_weight51;
input [10:0] cfg_weight52;
input [10:0] cfg_weight53;
input [10:0] cfg_weight54;
input [10:0] cfg_weight55;
input [10:0] cfg_weight56;
input [10:0] cfg_weight57;
input [10:0] cfg_weight58;
input [10:0] cfg_weight59;
input [10:0] cfg_weight60;
input [10:0] cfg_weight61;
input [10:0] cfg_weight62;
input [10:0] cfg_weight63;

reg	[5:0]	rotate_ptr;
reg	[63:0]	shift_req;
reg	[63:0]	shift_grant;
reg	[63:0]	grant_comb;
reg	[63:0]	grant;

input [10:0] cfg_weight0;
input [10:0] cfg_weight1;
input [10:0] cfg_weight2;
input [10:0] cfg_weight3;
input [10:0] cfg_weight4;
input [10:0] cfg_weight5;
input [10:0] cfg_weight6;
input [10:0] cfg_weight7;
input [10:0] cfg_weight8;
input [10:0] cfg_weight9;
input [10:0] cfg_weight10;
input [10:0] cfg_weight11;
input [10:0] cfg_weight12;
input [10:0] cfg_weight13;
input [10:0] cfg_weight14;
input [10:0] cfg_weight15;
input [10:0] cfg_weight16;
input [10:0] cfg_weight17;
input [10:0] cfg_weight18;
input [10:0] cfg_weight19;
input [10:0] cfg_weight20;
input [10:0] cfg_weight21;
input [10:0] cfg_weight22;
input [10:0] cfg_weight23;
input [10:0] cfg_weight24;
input [10:0] cfg_weight25;
input [10:0] cfg_weight26;
input [10:0] cfg_weight27;
input [10:0] cfg_weight28;
input [10:0] cfg_weight29;
input [10:0] cfg_weight30;
input [10:0] cfg_weight31;
input [10:0] cfg_weight32;
input [10:0] cfg_weight33;
input [10:0] cfg_weight34;
input [10:0] cfg_weight35;
input [10:0] cfg_weight36;
input [10:0] cfg_weight37;
input [10:0] cfg_weight38;
input [10:0] cfg_weight39;
input [10:0] cfg_weight40;
input [10:0] cfg_weight41;
input [10:0] cfg_weight42;
input [10:0] cfg_weight43;
input [10:0] cfg_weight44;
input [10:0] cfg_weight45;
input [10:0] cfg_weight46;
input [10:0] cfg_weight47;
input [10:0] cfg_weight48;
input [10:0] cfg_weight49;
input [10:0] cfg_weight50;
input [10:0] cfg_weight51;
input [10:0] cfg_weight52;
input [10:0] cfg_weight53;
input [10:0] cfg_weight54;
input [10:0] cfg_weight55;
input [10:0] cfg_weight56;
input [10:0] cfg_weight57;
input [10:0] cfg_weight58;
input [10:0] cfg_weight59;
input [10:0] cfg_weight60;
input [10:0] cfg_weight61;
input [10:0] cfg_weight62;
input [10:0] cfg_weight63;


always @ (*)
begin
case (rotate_ptr[5:0])
			6'b000000: shift_req[63:0] = req[63:0];
			6'b000001: shift_req[63:0] = {req[0],req[63:1]};
			6'b000010: shift_req[63:0] = {req[1:0],req[63:2]};
			6'b000011: shift_req[63:0] = {req[2:0],req[63:3]};
			6'b000100: shift_req[63:0] = {req[3:0],req[63:4]};
			6'b000101: shift_req[63:0] = {req[4:0],req[63:5]};
			6'b000110: shift_req[63:0] = {req[5:0],req[63:6]};
			6'b000111: shift_req[63:0] = {req[6:0],req[63:7]};
			6'b001000: shift_req[63:0] = {req[7:0],req[63:8]};
			6'b001001: shift_req[63:0] = {req[8:0],req[63:9]};
			6'b001010: shift_req[63:0] = {req[9:0],req[63:10]};
			6'b001011: shift_req[63:0] = {req[10:0],req[63:11]};
			6'b001100: shift_req[63:0] = {req[11:0],req[63:12]};
			6'b001101: shift_req[63:0] = {req[12:0],req[63:13]};
			6'b001110: shift_req[63:0] = {req[13:0],req[63:14]};
			6'b001111: shift_req[63:0] = {req[14:0],req[63:15]};
			6'b010000: shift_req[63:0] = {req[15:0],req[63:16]};
			6'b010001: shift_req[63:0] = {req[16:0],req[63:17]};
			6'b010010: shift_req[63:0] = {req[17:0],req[63:18]};
			6'b010011: shift_req[63:0] = {req[18:0],req[63:19]};
			6'b010100: shift_req[63:0] = {req[19:0],req[63:20]};
			6'b010101: shift_req[63:0] = {req[20:0],req[63:21]};
			6'b010110: shift_req[63:0] = {req[21:0],req[63:22]};
			6'b010111: shift_req[63:0] = {req[22:0],req[63:23]};
			6'b011000: shift_req[63:0] = {req[23:0],req[63:24]};
			6'b011001: shift_req[63:0] = {req[24:0],req[63:25]};
			6'b011010: shift_req[63:0] = {req[25:0],req[63:26]};
			6'b011011: shift_req[63:0] = {req[26:0],req[63:27]};
			6'b011100: shift_req[63:0] = {req[27:0],req[63:28]};
			6'b011101: shift_req[63:0] = {req[28:0],req[63:29]};
			6'b011110: shift_req[63:0] = {req[29:0],req[63:30]};
			6'b011111: shift_req[63:0] = {req[30:0],req[63:31]};
			6'b100000: shift_req[63:0] = {req[31:0],req[63:32]};
			6'b100001: shift_req[63:0] = {req[32:0],req[63:33]};
			6'b100010: shift_req[63:0] = {req[33:0],req[63:34]};
			6'b100011: shift_req[63:0] = {req[34:0],req[63:35]};
			6'b100100: shift_req[63:0] = {req[35:0],req[63:36]};
			6'b100101: shift_req[63:0] = {req[36:0],req[63:37]};
			6'b100110: shift_req[63:0] = {req[37:0],req[63:38]};
			6'b100111: shift_req[63:0] = {req[38:0],req[63:39]};
			6'b101000: shift_req[63:0] = {req[39:0],req[63:40]};
			6'b101001: shift_req[63:0] = {req[40:0],req[63:41]};
			6'b101010: shift_req[63:0] = {req[41:0],req[63:42]};
			6'b101011: shift_req[63:0] = {req[42:0],req[63:43]};
			6'b101100: shift_req[63:0] = {req[43:0],req[63:44]};
			6'b101101: shift_req[63:0] = {req[44:0],req[63:45]};
			6'b101110: shift_req[63:0] = {req[45:0],req[63:46]};
			6'b101111: shift_req[63:0] = {req[46:0],req[63:47]};
			6'b110000: shift_req[63:0] = {req[47:0],req[63:48]};
			6'b110001: shift_req[63:0] = {req[48:0],req[63:49]};
			6'b110010: shift_req[63:0] = {req[49:0],req[63:50]};
			6'b110011: shift_req[63:0] = {req[50:0],req[63:51]};
			6'b110100: shift_req[63:0] = {req[51:0],req[63:52]};
			6'b110101: shift_req[63:0] = {req[52:0],req[63:53]};
			6'b110110: shift_req[63:0] = {req[53:0],req[63:54]};
			6'b110111: shift_req[63:0] = {req[54:0],req[63:55]};
			6'b111000: shift_req[63:0] = {req[55:0],req[63:56]};
			6'b111001: shift_req[63:0] = {req[56:0],req[63:57]};
			6'b111010: shift_req[63:0] = {req[57:0],req[63:58]};
			6'b111011: shift_req[63:0] = {req[58:0],req[63:59]};
			6'b111100: shift_req[63:0] = {req[59:0],req[63:60]};
			6'b111101: shift_req[63:0] = {req[60:0],req[63:61]};
			6'b111110: shift_req[63:0] = {req[61:0],req[63:62]};
			6'b111111: shift_req[63:0] = {req[62:0],req[63]};

	endcase
end

always @ (*)
begin
shift_grant[63:0] = 64'b0;
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
			else if (shift_req[32])	shift_grant[32] = 1'b1;
			else if (shift_req[33])	shift_grant[33] = 1'b1;
			else if (shift_req[34])	shift_grant[34] = 1'b1;
			else if (shift_req[35])	shift_grant[35] = 1'b1;
			else if (shift_req[36])	shift_grant[36] = 1'b1;
			else if (shift_req[37])	shift_grant[37] = 1'b1;
			else if (shift_req[38])	shift_grant[38] = 1'b1;
			else if (shift_req[39])	shift_grant[39] = 1'b1;
			else if (shift_req[40])	shift_grant[40] = 1'b1;
			else if (shift_req[41])	shift_grant[41] = 1'b1;
			else if (shift_req[42])	shift_grant[42] = 1'b1;
			else if (shift_req[43])	shift_grant[43] = 1'b1;
			else if (shift_req[44])	shift_grant[44] = 1'b1;
			else if (shift_req[45])	shift_grant[45] = 1'b1;
			else if (shift_req[46])	shift_grant[46] = 1'b1;
			else if (shift_req[47])	shift_grant[47] = 1'b1;
			else if (shift_req[48])	shift_grant[48] = 1'b1;
			else if (shift_req[49])	shift_grant[49] = 1'b1;
			else if (shift_req[50])	shift_grant[50] = 1'b1;
			else if (shift_req[51])	shift_grant[51] = 1'b1;
			else if (shift_req[52])	shift_grant[52] = 1'b1;
			else if (shift_req[53])	shift_grant[53] = 1'b1;
			else if (shift_req[54])	shift_grant[54] = 1'b1;
			else if (shift_req[55])	shift_grant[55] = 1'b1;
			else if (shift_req[56])	shift_grant[56] = 1'b1;
			else if (shift_req[57])	shift_grant[57] = 1'b1;
			else if (shift_req[58])	shift_grant[58] = 1'b1;
			else if (shift_req[59])	shift_grant[59] = 1'b1;
			else if (shift_req[60])	shift_grant[60] = 1'b1;
			else if (shift_req[61])	shift_grant[61] = 1'b1;
			else if (shift_req[62])	shift_grant[62] = 1'b1;
			else if (shift_req[63])	shift_grant[63] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[5:0])
			6'b000000: grant_comb[63:0] = shift_grant[63:0];
			6'b000001: grant_comb[63:0] = {shift_grant[62:0],shift_grant[63]};
			6'b000010: grant_comb[63:0] = {shift_grant[61:0],shift_grant[63:62]};
			6'b000011: grant_comb[63:0] = {shift_grant[60:0],shift_grant[63:61]};
			6'b000100: grant_comb[63:0] = {shift_grant[59:0],shift_grant[63:60]};
			6'b000101: grant_comb[63:0] = {shift_grant[58:0],shift_grant[63:59]};
			6'b000110: grant_comb[63:0] = {shift_grant[57:0],shift_grant[63:58]};
			6'b000111: grant_comb[63:0] = {shift_grant[56:0],shift_grant[63:57]};
			6'b001000: grant_comb[63:0] = {shift_grant[55:0],shift_grant[63:56]};
			6'b001001: grant_comb[63:0] = {shift_grant[54:0],shift_grant[63:55]};
			6'b001010: grant_comb[63:0] = {shift_grant[53:0],shift_grant[63:54]};
			6'b001011: grant_comb[63:0] = {shift_grant[52:0],shift_grant[63:53]};
			6'b001100: grant_comb[63:0] = {shift_grant[51:0],shift_grant[63:52]};
			6'b001101: grant_comb[63:0] = {shift_grant[50:0],shift_grant[63:51]};
			6'b001110: grant_comb[63:0] = {shift_grant[49:0],shift_grant[63:50]};
			6'b001111: grant_comb[63:0] = {shift_grant[48:0],shift_grant[63:49]};
			6'b010000: grant_comb[63:0] = {shift_grant[47:0],shift_grant[63:48]};
			6'b010001: grant_comb[63:0] = {shift_grant[46:0],shift_grant[63:47]};
			6'b010010: grant_comb[63:0] = {shift_grant[45:0],shift_grant[63:46]};
			6'b010011: grant_comb[63:0] = {shift_grant[44:0],shift_grant[63:45]};
			6'b010100: grant_comb[63:0] = {shift_grant[43:0],shift_grant[63:44]};
			6'b010101: grant_comb[63:0] = {shift_grant[42:0],shift_grant[63:43]};
			6'b010110: grant_comb[63:0] = {shift_grant[41:0],shift_grant[63:42]};
			6'b010111: grant_comb[63:0] = {shift_grant[40:0],shift_grant[63:41]};
			6'b011000: grant_comb[63:0] = {shift_grant[39:0],shift_grant[63:40]};
			6'b011001: grant_comb[63:0] = {shift_grant[38:0],shift_grant[63:39]};
			6'b011010: grant_comb[63:0] = {shift_grant[37:0],shift_grant[63:38]};
			6'b011011: grant_comb[63:0] = {shift_grant[36:0],shift_grant[63:37]};
			6'b011100: grant_comb[63:0] = {shift_grant[35:0],shift_grant[63:36]};
			6'b011101: grant_comb[63:0] = {shift_grant[34:0],shift_grant[63:35]};
			6'b011110: grant_comb[63:0] = {shift_grant[33:0],shift_grant[63:34]};
			6'b011111: grant_comb[63:0] = {shift_grant[32:0],shift_grant[63:33]};
			6'b100000: grant_comb[63:0] = {shift_grant[31:0],shift_grant[63:32]};
			6'b100001: grant_comb[63:0] = {shift_grant[30:0],shift_grant[63:31]};
			6'b100010: grant_comb[63:0] = {shift_grant[29:0],shift_grant[63:30]};
			6'b100011: grant_comb[63:0] = {shift_grant[28:0],shift_grant[63:29]};
			6'b100100: grant_comb[63:0] = {shift_grant[27:0],shift_grant[63:28]};
			6'b100101: grant_comb[63:0] = {shift_grant[26:0],shift_grant[63:27]};
			6'b100110: grant_comb[63:0] = {shift_grant[25:0],shift_grant[63:26]};
			6'b100111: grant_comb[63:0] = {shift_grant[24:0],shift_grant[63:25]};
			6'b101000: grant_comb[63:0] = {shift_grant[23:0],shift_grant[63:24]};
			6'b101001: grant_comb[63:0] = {shift_grant[22:0],shift_grant[63:23]};
			6'b101010: grant_comb[63:0] = {shift_grant[21:0],shift_grant[63:22]};
			6'b101011: grant_comb[63:0] = {shift_grant[20:0],shift_grant[63:21]};
			6'b101100: grant_comb[63:0] = {shift_grant[19:0],shift_grant[63:20]};
			6'b101101: grant_comb[63:0] = {shift_grant[18:0],shift_grant[63:19]};
			6'b101110: grant_comb[63:0] = {shift_grant[17:0],shift_grant[63:18]};
			6'b101111: grant_comb[63:0] = {shift_grant[16:0],shift_grant[63:17]};
			6'b110000: grant_comb[63:0] = {shift_grant[15:0],shift_grant[63:16]};
			6'b110001: grant_comb[63:0] = {shift_grant[14:0],shift_grant[63:15]};
			6'b110010: grant_comb[63:0] = {shift_grant[13:0],shift_grant[63:14]};
			6'b110011: grant_comb[63:0] = {shift_grant[12:0],shift_grant[63:13]};
			6'b110100: grant_comb[63:0] = {shift_grant[11:0],shift_grant[63:12]};
			6'b110101: grant_comb[63:0] = {shift_grant[10:0],shift_grant[63:11]};
			6'b110110: grant_comb[63:0] = {shift_grant[9:0],shift_grant[63:10]};
			6'b110111: grant_comb[63:0] = {shift_grant[8:0],shift_grant[63:9]};
			6'b111000: grant_comb[63:0] = {shift_grant[7:0],shift_grant[63:8]};
			6'b111001: grant_comb[63:0] = {shift_grant[6:0],shift_grant[63:7]};
			6'b111010: grant_comb[63:0] = {shift_grant[5:0],shift_grant[63:6]};
			6'b111011: grant_comb[63:0] = {shift_grant[4:0],shift_grant[63:5]};
			6'b111100: grant_comb[63:0] = {shift_grant[3:0],shift_grant[63:4]};
			6'b111101: grant_comb[63:0] = {shift_grant[2:0],shift_grant[63:3]};
			6'b111110: grant_comb[63:0] = {shift_grant[1:0],shift_grant[63:2]};
			6'b111111: grant_comb[63:0] = {shift_grant[0],shift_grant[63:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[63:0] <= 64'b0;
	else		grant[63:0] <= grant_comb[63:0] & ~grant[63:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[5:0] <= 6'b0;
	else
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[5:0] <= | nweight0 ?  : rotate_ptr :6'd1;
			grant[1]: rotate_ptr[5:0] <= | nweight1 ?  : rotate_ptr :6'd2;
			grant[2]: rotate_ptr[5:0] <= | nweight2 ?  : rotate_ptr :6'd3;
			grant[3]: rotate_ptr[5:0] <= | nweight3 ?  : rotate_ptr :6'd4;
			grant[4]: rotate_ptr[5:0] <= | nweight4 ?  : rotate_ptr :6'd5;
			grant[5]: rotate_ptr[5:0] <= | nweight5 ?  : rotate_ptr :6'd6;
			grant[6]: rotate_ptr[5:0] <= | nweight6 ?  : rotate_ptr :6'd7;
			grant[7]: rotate_ptr[5:0] <= | nweight7 ?  : rotate_ptr :6'd8;
			grant[8]: rotate_ptr[5:0] <= | nweight8 ?  : rotate_ptr :6'd9;
			grant[9]: rotate_ptr[5:0] <= | nweight9 ?  : rotate_ptr :6'd10;
			grant[10]: rotate_ptr[5:0] <= | nweight10 ?  : rotate_ptr :6'd11;
			grant[11]: rotate_ptr[5:0] <= | nweight11 ?  : rotate_ptr :6'd12;
			grant[12]: rotate_ptr[5:0] <= | nweight12 ?  : rotate_ptr :6'd13;
			grant[13]: rotate_ptr[5:0] <= | nweight13 ?  : rotate_ptr :6'd14;
			grant[14]: rotate_ptr[5:0] <= | nweight14 ?  : rotate_ptr :6'd15;
			grant[15]: rotate_ptr[5:0] <= | nweight15 ?  : rotate_ptr :6'd16;
			grant[16]: rotate_ptr[5:0] <= | nweight16 ?  : rotate_ptr :6'd17;
			grant[17]: rotate_ptr[5:0] <= | nweight17 ?  : rotate_ptr :6'd18;
			grant[18]: rotate_ptr[5:0] <= | nweight18 ?  : rotate_ptr :6'd19;
			grant[19]: rotate_ptr[5:0] <= | nweight19 ?  : rotate_ptr :6'd20;
			grant[20]: rotate_ptr[5:0] <= | nweight20 ?  : rotate_ptr :6'd21;
			grant[21]: rotate_ptr[5:0] <= | nweight21 ?  : rotate_ptr :6'd22;
			grant[22]: rotate_ptr[5:0] <= | nweight22 ?  : rotate_ptr :6'd23;
			grant[23]: rotate_ptr[5:0] <= | nweight23 ?  : rotate_ptr :6'd24;
			grant[24]: rotate_ptr[5:0] <= | nweight24 ?  : rotate_ptr :6'd25;
			grant[25]: rotate_ptr[5:0] <= | nweight25 ?  : rotate_ptr :6'd26;
			grant[26]: rotate_ptr[5:0] <= | nweight26 ?  : rotate_ptr :6'd27;
			grant[27]: rotate_ptr[5:0] <= | nweight27 ?  : rotate_ptr :6'd28;
			grant[28]: rotate_ptr[5:0] <= | nweight28 ?  : rotate_ptr :6'd29;
			grant[29]: rotate_ptr[5:0] <= | nweight29 ?  : rotate_ptr :6'd30;
			grant[30]: rotate_ptr[5:0] <= | nweight30 ?  : rotate_ptr :6'd31;
			grant[31]: rotate_ptr[5:0] <= | nweight31 ?  : rotate_ptr :6'd32;
			grant[32]: rotate_ptr[5:0] <= | nweight32 ?  : rotate_ptr :6'd33;
			grant[33]: rotate_ptr[5:0] <= | nweight33 ?  : rotate_ptr :6'd34;
			grant[34]: rotate_ptr[5:0] <= | nweight34 ?  : rotate_ptr :6'd35;
			grant[35]: rotate_ptr[5:0] <= | nweight35 ?  : rotate_ptr :6'd36;
			grant[36]: rotate_ptr[5:0] <= | nweight36 ?  : rotate_ptr :6'd37;
			grant[37]: rotate_ptr[5:0] <= | nweight37 ?  : rotate_ptr :6'd38;
			grant[38]: rotate_ptr[5:0] <= | nweight38 ?  : rotate_ptr :6'd39;
			grant[39]: rotate_ptr[5:0] <= | nweight39 ?  : rotate_ptr :6'd40;
			grant[40]: rotate_ptr[5:0] <= | nweight40 ?  : rotate_ptr :6'd41;
			grant[41]: rotate_ptr[5:0] <= | nweight41 ?  : rotate_ptr :6'd42;
			grant[42]: rotate_ptr[5:0] <= | nweight42 ?  : rotate_ptr :6'd43;
			grant[43]: rotate_ptr[5:0] <= | nweight43 ?  : rotate_ptr :6'd44;
			grant[44]: rotate_ptr[5:0] <= | nweight44 ?  : rotate_ptr :6'd45;
			grant[45]: rotate_ptr[5:0] <= | nweight45 ?  : rotate_ptr :6'd46;
			grant[46]: rotate_ptr[5:0] <= | nweight46 ?  : rotate_ptr :6'd47;
			grant[47]: rotate_ptr[5:0] <= | nweight47 ?  : rotate_ptr :6'd48;
			grant[48]: rotate_ptr[5:0] <= | nweight48 ?  : rotate_ptr :6'd49;
			grant[49]: rotate_ptr[5:0] <= | nweight49 ?  : rotate_ptr :6'd50;
			grant[50]: rotate_ptr[5:0] <= | nweight50 ?  : rotate_ptr :6'd51;
			grant[51]: rotate_ptr[5:0] <= | nweight51 ?  : rotate_ptr :6'd52;
			grant[52]: rotate_ptr[5:0] <= | nweight52 ?  : rotate_ptr :6'd53;
			grant[53]: rotate_ptr[5:0] <= | nweight53 ?  : rotate_ptr :6'd54;
			grant[54]: rotate_ptr[5:0] <= | nweight54 ?  : rotate_ptr :6'd55;
			grant[55]: rotate_ptr[5:0] <= | nweight55 ?  : rotate_ptr :6'd56;
			grant[56]: rotate_ptr[5:0] <= | nweight56 ?  : rotate_ptr :6'd57;
			grant[57]: rotate_ptr[5:0] <= | nweight57 ?  : rotate_ptr :6'd58;
			grant[58]: rotate_ptr[5:0] <= | nweight58 ?  : rotate_ptr :6'd59;
			grant[59]: rotate_ptr[5:0] <= | nweight59 ?  : rotate_ptr :6'd60;
			grant[60]: rotate_ptr[5:0] <= | nweight60 ?  : rotate_ptr :6'd61;
			grant[61]: rotate_ptr[5:0] <= | nweight61 ?  : rotate_ptr :6'd62;
			grant[62]: rotate_ptr[5:0] <= | nweight62 ?  : rotate_ptr :6'd63;
			grant[63]: rotate_ptr[5:0] <= | nweight63 ?  : rotate_ptr :6'd0;
			

		endcase
end

always @ (posedge clk or negedge rst_an) 
	begin 
 if (!rst_an) begin weight0 <= 11'd0;
weight1 <= 11'd0;
weight2 <= 11'd0;
weight3 <= 11'd0;
weight4 <= 11'd0;
weight5 <= 11'd0;
weight6 <= 11'd0;
weight7 <= 11'd0;
weight8 <= 11'd0;
weight9 <= 11'd0;
weight10 <= 11'd0;
weight11 <= 11'd0;
weight12 <= 11'd0;
weight13 <= 11'd0;
weight14 <= 11'd0;
weight15 <= 11'd0;
weight16 <= 11'd0;
weight17 <= 11'd0;
weight18 <= 11'd0;
weight19 <= 11'd0;
weight20 <= 11'd0;
weight21 <= 11'd0;
weight22 <= 11'd0;
weight23 <= 11'd0;
weight24 <= 11'd0;
weight25 <= 11'd0;
weight26 <= 11'd0;
weight27 <= 11'd0;
weight28 <= 11'd0;
weight29 <= 11'd0;
weight30 <= 11'd0;
weight31 <= 11'd0;
weight32 <= 11'd0;
weight33 <= 11'd0;
weight34 <= 11'd0;
weight35 <= 11'd0;
weight36 <= 11'd0;
weight37 <= 11'd0;
weight38 <= 11'd0;
weight39 <= 11'd0;
weight40 <= 11'd0;
weight41 <= 11'd0;
weight42 <= 11'd0;
weight43 <= 11'd0;
weight44 <= 11'd0;
weight45 <= 11'd0;
weight46 <= 11'd0;
weight47 <= 11'd0;
weight48 <= 11'd0;
weight49 <= 11'd0;
weight50 <= 11'd0;
weight51 <= 11'd0;
weight52 <= 11'd0;
weight53 <= 11'd0;
weight54 <= 11'd0;
weight55 <= 11'd0;
weight56 <= 11'd0;
weight57 <= 11'd0;
weight58 <= 11'd0;
weight59 <= 11'd0;
weight60 <= 11'd0;
weight61 <= 11'd0;
weight62 <= 11'd0;
weight63 <= 11'd0;
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
weight16 <= nweight16;
weight17 <= nweight17;
weight18 <= nweight18;
weight19 <= nweight19;
weight20 <= nweight20;
weight21 <= nweight21;
weight22 <= nweight22;
weight23 <= nweight23;
weight24 <= nweight24;
weight25 <= nweight25;
weight26 <= nweight26;
weight27 <= nweight27;
weight28 <= nweight28;
weight29 <= nweight29;
weight30 <= nweight30;
weight31 <= nweight31;
weight32 <= nweight32;
weight33 <= nweight33;
weight34 <= nweight34;
weight35 <= nweight35;
weight36 <= nweight36;
weight37 <= nweight37;
weight38 <= nweight38;
weight39 <= nweight39;
weight40 <= nweight40;
weight41 <= nweight41;
weight42 <= nweight42;
weight43 <= nweight43;
weight44 <= nweight44;
weight45 <= nweight45;
weight46 <= nweight46;
weight47 <= nweight47;
weight48 <= nweight48;
weight49 <= nweight49;
weight50 <= nweight50;
weight51 <= nweight51;
weight52 <= nweight52;
weight53 <= nweight53;
weight54 <= nweight54;
weight55 <= nweight55;
weight56 <= nweight56;
weight57 <= nweight57;
weight58 <= nweight58;
weight59 <= nweight59;
weight60 <= nweight60;
weight61 <= nweight61;
weight62 <= nweight62;
weight63 <= nweight63;
		end
	end
assign refresh_weights = (~|weight0) & (~|weight1) & (~|weight2) & (~|weight3) & (~|weight4) & (~|weight5) & (~|weight6) & (~|weight7) & (~|weight8) & (~|weight9) & (~|weight10) & (~|weight11) & (~|weight12) & (~|weight13) & (~|weight14) & (~|weight15) & (~|weight16) & (~|weight17) & (~|weight18) & (~|weight19) & (~|weight20) & (~|weight21) & (~|weight22) & (~|weight23) & (~|weight24) & (~|weight25) & (~|weight26) & (~|weight27) & (~|weight28) & (~|weight29) & (~|weight30) & (~|weight31) & (~|weight32) & (~|weight33) & (~|weight34) & (~|weight35) & (~|weight36) & (~|weight37) & (~|weight38) & (~|weight39) & (~|weight40) & (~|weight41) & (~|weight42) & (~|weight43) & (~|weight44) & (~|weight45) & (~|weight46) & (~|weight47) & (~|weight48) & (~|weight49) & (~|weight50) & (~|weight51) & (~|weight52) & (~|weight53) & (~|weight54) & (~|weight55) & (~|weight56) & (~|weight57) & (~|weight58) & (~|weight59) & (~|weight60) & (~|weight61) & (~|weight62) & (~|weight63);


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
assign nweight16 = refresh_weights ? cfg_weight16 :  (req[16] & gnt[16]) ? weight16 - 1'b1 :   weight16;
assign nweight17 = refresh_weights ? cfg_weight17 :  (req[17] & gnt[17]) ? weight17 - 1'b1 :   weight17;
assign nweight18 = refresh_weights ? cfg_weight18 :  (req[18] & gnt[18]) ? weight18 - 1'b1 :   weight18;
assign nweight19 = refresh_weights ? cfg_weight19 :  (req[19] & gnt[19]) ? weight19 - 1'b1 :   weight19;
assign nweight20 = refresh_weights ? cfg_weight20 :  (req[20] & gnt[20]) ? weight20 - 1'b1 :   weight20;
assign nweight21 = refresh_weights ? cfg_weight21 :  (req[21] & gnt[21]) ? weight21 - 1'b1 :   weight21;
assign nweight22 = refresh_weights ? cfg_weight22 :  (req[22] & gnt[22]) ? weight22 - 1'b1 :   weight22;
assign nweight23 = refresh_weights ? cfg_weight23 :  (req[23] & gnt[23]) ? weight23 - 1'b1 :   weight23;
assign nweight24 = refresh_weights ? cfg_weight24 :  (req[24] & gnt[24]) ? weight24 - 1'b1 :   weight24;
assign nweight25 = refresh_weights ? cfg_weight25 :  (req[25] & gnt[25]) ? weight25 - 1'b1 :   weight25;
assign nweight26 = refresh_weights ? cfg_weight26 :  (req[26] & gnt[26]) ? weight26 - 1'b1 :   weight26;
assign nweight27 = refresh_weights ? cfg_weight27 :  (req[27] & gnt[27]) ? weight27 - 1'b1 :   weight27;
assign nweight28 = refresh_weights ? cfg_weight28 :  (req[28] & gnt[28]) ? weight28 - 1'b1 :   weight28;
assign nweight29 = refresh_weights ? cfg_weight29 :  (req[29] & gnt[29]) ? weight29 - 1'b1 :   weight29;
assign nweight30 = refresh_weights ? cfg_weight30 :  (req[30] & gnt[30]) ? weight30 - 1'b1 :   weight30;
assign nweight31 = refresh_weights ? cfg_weight31 :  (req[31] & gnt[31]) ? weight31 - 1'b1 :   weight31;
assign nweight32 = refresh_weights ? cfg_weight32 :  (req[32] & gnt[32]) ? weight32 - 1'b1 :   weight32;
assign nweight33 = refresh_weights ? cfg_weight33 :  (req[33] & gnt[33]) ? weight33 - 1'b1 :   weight33;
assign nweight34 = refresh_weights ? cfg_weight34 :  (req[34] & gnt[34]) ? weight34 - 1'b1 :   weight34;
assign nweight35 = refresh_weights ? cfg_weight35 :  (req[35] & gnt[35]) ? weight35 - 1'b1 :   weight35;
assign nweight36 = refresh_weights ? cfg_weight36 :  (req[36] & gnt[36]) ? weight36 - 1'b1 :   weight36;
assign nweight37 = refresh_weights ? cfg_weight37 :  (req[37] & gnt[37]) ? weight37 - 1'b1 :   weight37;
assign nweight38 = refresh_weights ? cfg_weight38 :  (req[38] & gnt[38]) ? weight38 - 1'b1 :   weight38;
assign nweight39 = refresh_weights ? cfg_weight39 :  (req[39] & gnt[39]) ? weight39 - 1'b1 :   weight39;
assign nweight40 = refresh_weights ? cfg_weight40 :  (req[40] & gnt[40]) ? weight40 - 1'b1 :   weight40;
assign nweight41 = refresh_weights ? cfg_weight41 :  (req[41] & gnt[41]) ? weight41 - 1'b1 :   weight41;
assign nweight42 = refresh_weights ? cfg_weight42 :  (req[42] & gnt[42]) ? weight42 - 1'b1 :   weight42;
assign nweight43 = refresh_weights ? cfg_weight43 :  (req[43] & gnt[43]) ? weight43 - 1'b1 :   weight43;
assign nweight44 = refresh_weights ? cfg_weight44 :  (req[44] & gnt[44]) ? weight44 - 1'b1 :   weight44;
assign nweight45 = refresh_weights ? cfg_weight45 :  (req[45] & gnt[45]) ? weight45 - 1'b1 :   weight45;
assign nweight46 = refresh_weights ? cfg_weight46 :  (req[46] & gnt[46]) ? weight46 - 1'b1 :   weight46;
assign nweight47 = refresh_weights ? cfg_weight47 :  (req[47] & gnt[47]) ? weight47 - 1'b1 :   weight47;
assign nweight48 = refresh_weights ? cfg_weight48 :  (req[48] & gnt[48]) ? weight48 - 1'b1 :   weight48;
assign nweight49 = refresh_weights ? cfg_weight49 :  (req[49] & gnt[49]) ? weight49 - 1'b1 :   weight49;
assign nweight50 = refresh_weights ? cfg_weight50 :  (req[50] & gnt[50]) ? weight50 - 1'b1 :   weight50;
assign nweight51 = refresh_weights ? cfg_weight51 :  (req[51] & gnt[51]) ? weight51 - 1'b1 :   weight51;
assign nweight52 = refresh_weights ? cfg_weight52 :  (req[52] & gnt[52]) ? weight52 - 1'b1 :   weight52;
assign nweight53 = refresh_weights ? cfg_weight53 :  (req[53] & gnt[53]) ? weight53 - 1'b1 :   weight53;
assign nweight54 = refresh_weights ? cfg_weight54 :  (req[54] & gnt[54]) ? weight54 - 1'b1 :   weight54;
assign nweight55 = refresh_weights ? cfg_weight55 :  (req[55] & gnt[55]) ? weight55 - 1'b1 :   weight55;
assign nweight56 = refresh_weights ? cfg_weight56 :  (req[56] & gnt[56]) ? weight56 - 1'b1 :   weight56;
assign nweight57 = refresh_weights ? cfg_weight57 :  (req[57] & gnt[57]) ? weight57 - 1'b1 :   weight57;
assign nweight58 = refresh_weights ? cfg_weight58 :  (req[58] & gnt[58]) ? weight58 - 1'b1 :   weight58;
assign nweight59 = refresh_weights ? cfg_weight59 :  (req[59] & gnt[59]) ? weight59 - 1'b1 :   weight59;
assign nweight60 = refresh_weights ? cfg_weight60 :  (req[60] & gnt[60]) ? weight60 - 1'b1 :   weight60;
assign nweight61 = refresh_weights ? cfg_weight61 :  (req[61] & gnt[61]) ? weight61 - 1'b1 :   weight61;
assign nweight62 = refresh_weights ? cfg_weight62 :  (req[62] & gnt[62]) ? weight62 - 1'b1 :   weight62;
assign nweight63 = refresh_weights ? cfg_weight63 :  (req[63] & gnt[63]) ? weight63 - 1'b1 :   weight63;



endmodule
