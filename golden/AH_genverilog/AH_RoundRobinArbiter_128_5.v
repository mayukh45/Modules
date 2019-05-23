
module AH_RoundRobinArbiter_128_5 (req
,gnt);

input [127:0] req;
output [127:0] gnt;


/f_f/
if(weight != None):
    code="\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/
reg	[6:0]	rotate_ptr;
reg	[127:0]	shift_req;
reg	[127:0]	shift_grant;
reg	[127:0]	grant_comb;
reg	[127:0]	grant;

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
	if (!rst_n)	grant[127:0] <= 128'b0;
	else		grant[127:0] <= grant_comb[127:0] & ~grant[127:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[6:0] <= 7'b0;
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
input [5:0] cfg_weight16;
input [5:0] cfg_weight17;
input [5:0] cfg_weight18;
input [5:0] cfg_weight19;
input [5:0] cfg_weight20;
input [5:0] cfg_weight21;
input [5:0] cfg_weight22;
input [5:0] cfg_weight23;
input [5:0] cfg_weight24;
input [5:0] cfg_weight25;
input [5:0] cfg_weight26;
input [5:0] cfg_weight27;
input [5:0] cfg_weight28;
input [5:0] cfg_weight29;
input [5:0] cfg_weight30;
input [5:0] cfg_weight31;
input [5:0] cfg_weight32;
input [5:0] cfg_weight33;
input [5:0] cfg_weight34;
input [5:0] cfg_weight35;
input [5:0] cfg_weight36;
input [5:0] cfg_weight37;
input [5:0] cfg_weight38;
input [5:0] cfg_weight39;
input [5:0] cfg_weight40;
input [5:0] cfg_weight41;
input [5:0] cfg_weight42;
input [5:0] cfg_weight43;
input [5:0] cfg_weight44;
input [5:0] cfg_weight45;
input [5:0] cfg_weight46;
input [5:0] cfg_weight47;
input [5:0] cfg_weight48;
input [5:0] cfg_weight49;
input [5:0] cfg_weight50;
input [5:0] cfg_weight51;
input [5:0] cfg_weight52;
input [5:0] cfg_weight53;
input [5:0] cfg_weight54;
input [5:0] cfg_weight55;
input [5:0] cfg_weight56;
input [5:0] cfg_weight57;
input [5:0] cfg_weight58;
input [5:0] cfg_weight59;
input [5:0] cfg_weight60;
input [5:0] cfg_weight61;
input [5:0] cfg_weight62;
input [5:0] cfg_weight63;
input [5:0] cfg_weight64;
input [5:0] cfg_weight65;
input [5:0] cfg_weight66;
input [5:0] cfg_weight67;
input [5:0] cfg_weight68;
input [5:0] cfg_weight69;
input [5:0] cfg_weight70;
input [5:0] cfg_weight71;
input [5:0] cfg_weight72;
input [5:0] cfg_weight73;
input [5:0] cfg_weight74;
input [5:0] cfg_weight75;
input [5:0] cfg_weight76;
input [5:0] cfg_weight77;
input [5:0] cfg_weight78;
input [5:0] cfg_weight79;
input [5:0] cfg_weight80;
input [5:0] cfg_weight81;
input [5:0] cfg_weight82;
input [5:0] cfg_weight83;
input [5:0] cfg_weight84;
input [5:0] cfg_weight85;
input [5:0] cfg_weight86;
input [5:0] cfg_weight87;
input [5:0] cfg_weight88;
input [5:0] cfg_weight89;
input [5:0] cfg_weight90;
input [5:0] cfg_weight91;
input [5:0] cfg_weight92;
input [5:0] cfg_weight93;
input [5:0] cfg_weight94;
input [5:0] cfg_weight95;
input [5:0] cfg_weight96;
input [5:0] cfg_weight97;
input [5:0] cfg_weight98;
input [5:0] cfg_weight99;
input [5:0] cfg_weight100;
input [5:0] cfg_weight101;
input [5:0] cfg_weight102;
input [5:0] cfg_weight103;
input [5:0] cfg_weight104;
input [5:0] cfg_weight105;
input [5:0] cfg_weight106;
input [5:0] cfg_weight107;
input [5:0] cfg_weight108;
input [5:0] cfg_weight109;
input [5:0] cfg_weight110;
input [5:0] cfg_weight111;
input [5:0] cfg_weight112;
input [5:0] cfg_weight113;
input [5:0] cfg_weight114;
input [5:0] cfg_weight115;
input [5:0] cfg_weight116;
input [5:0] cfg_weight117;
input [5:0] cfg_weight118;
input [5:0] cfg_weight119;
input [5:0] cfg_weight120;
input [5:0] cfg_weight121;
input [5:0] cfg_weight122;
input [5:0] cfg_weight123;
input [5:0] cfg_weight124;
input [5:0] cfg_weight125;
input [5:0] cfg_weight126;
input [5:0] cfg_weight127;

reg	[6:0]	rotate_ptr;
reg	[127:0]	shift_req;
reg	[127:0]	shift_grant;
reg	[127:0]	grant_comb;
reg	[127:0]	grant;

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
input [5:0] cfg_weight16;
input [5:0] cfg_weight17;
input [5:0] cfg_weight18;
input [5:0] cfg_weight19;
input [5:0] cfg_weight20;
input [5:0] cfg_weight21;
input [5:0] cfg_weight22;
input [5:0] cfg_weight23;
input [5:0] cfg_weight24;
input [5:0] cfg_weight25;
input [5:0] cfg_weight26;
input [5:0] cfg_weight27;
input [5:0] cfg_weight28;
input [5:0] cfg_weight29;
input [5:0] cfg_weight30;
input [5:0] cfg_weight31;
input [5:0] cfg_weight32;
input [5:0] cfg_weight33;
input [5:0] cfg_weight34;
input [5:0] cfg_weight35;
input [5:0] cfg_weight36;
input [5:0] cfg_weight37;
input [5:0] cfg_weight38;
input [5:0] cfg_weight39;
input [5:0] cfg_weight40;
input [5:0] cfg_weight41;
input [5:0] cfg_weight42;
input [5:0] cfg_weight43;
input [5:0] cfg_weight44;
input [5:0] cfg_weight45;
input [5:0] cfg_weight46;
input [5:0] cfg_weight47;
input [5:0] cfg_weight48;
input [5:0] cfg_weight49;
input [5:0] cfg_weight50;
input [5:0] cfg_weight51;
input [5:0] cfg_weight52;
input [5:0] cfg_weight53;
input [5:0] cfg_weight54;
input [5:0] cfg_weight55;
input [5:0] cfg_weight56;
input [5:0] cfg_weight57;
input [5:0] cfg_weight58;
input [5:0] cfg_weight59;
input [5:0] cfg_weight60;
input [5:0] cfg_weight61;
input [5:0] cfg_weight62;
input [5:0] cfg_weight63;
input [5:0] cfg_weight64;
input [5:0] cfg_weight65;
input [5:0] cfg_weight66;
input [5:0] cfg_weight67;
input [5:0] cfg_weight68;
input [5:0] cfg_weight69;
input [5:0] cfg_weight70;
input [5:0] cfg_weight71;
input [5:0] cfg_weight72;
input [5:0] cfg_weight73;
input [5:0] cfg_weight74;
input [5:0] cfg_weight75;
input [5:0] cfg_weight76;
input [5:0] cfg_weight77;
input [5:0] cfg_weight78;
input [5:0] cfg_weight79;
input [5:0] cfg_weight80;
input [5:0] cfg_weight81;
input [5:0] cfg_weight82;
input [5:0] cfg_weight83;
input [5:0] cfg_weight84;
input [5:0] cfg_weight85;
input [5:0] cfg_weight86;
input [5:0] cfg_weight87;
input [5:0] cfg_weight88;
input [5:0] cfg_weight89;
input [5:0] cfg_weight90;
input [5:0] cfg_weight91;
input [5:0] cfg_weight92;
input [5:0] cfg_weight93;
input [5:0] cfg_weight94;
input [5:0] cfg_weight95;
input [5:0] cfg_weight96;
input [5:0] cfg_weight97;
input [5:0] cfg_weight98;
input [5:0] cfg_weight99;
input [5:0] cfg_weight100;
input [5:0] cfg_weight101;
input [5:0] cfg_weight102;
input [5:0] cfg_weight103;
input [5:0] cfg_weight104;
input [5:0] cfg_weight105;
input [5:0] cfg_weight106;
input [5:0] cfg_weight107;
input [5:0] cfg_weight108;
input [5:0] cfg_weight109;
input [5:0] cfg_weight110;
input [5:0] cfg_weight111;
input [5:0] cfg_weight112;
input [5:0] cfg_weight113;
input [5:0] cfg_weight114;
input [5:0] cfg_weight115;
input [5:0] cfg_weight116;
input [5:0] cfg_weight117;
input [5:0] cfg_weight118;
input [5:0] cfg_weight119;
input [5:0] cfg_weight120;
input [5:0] cfg_weight121;
input [5:0] cfg_weight122;
input [5:0] cfg_weight123;
input [5:0] cfg_weight124;
input [5:0] cfg_weight125;
input [5:0] cfg_weight126;
input [5:0] cfg_weight127;


always @ (*)
begin
case (rotate_ptr[6:0])
			7'b0000000: shift_req[127:0] = req[127:0];
			7'b0000001: shift_req[127:0] = {req[0],req[127:1]};
			7'b0000010: shift_req[127:0] = {req[1:0],req[127:2]};
			7'b0000011: shift_req[127:0] = {req[2:0],req[127:3]};
			7'b0000100: shift_req[127:0] = {req[3:0],req[127:4]};
			7'b0000101: shift_req[127:0] = {req[4:0],req[127:5]};
			7'b0000110: shift_req[127:0] = {req[5:0],req[127:6]};
			7'b0000111: shift_req[127:0] = {req[6:0],req[127:7]};
			7'b0001000: shift_req[127:0] = {req[7:0],req[127:8]};
			7'b0001001: shift_req[127:0] = {req[8:0],req[127:9]};
			7'b0001010: shift_req[127:0] = {req[9:0],req[127:10]};
			7'b0001011: shift_req[127:0] = {req[10:0],req[127:11]};
			7'b0001100: shift_req[127:0] = {req[11:0],req[127:12]};
			7'b0001101: shift_req[127:0] = {req[12:0],req[127:13]};
			7'b0001110: shift_req[127:0] = {req[13:0],req[127:14]};
			7'b0001111: shift_req[127:0] = {req[14:0],req[127:15]};
			7'b0010000: shift_req[127:0] = {req[15:0],req[127:16]};
			7'b0010001: shift_req[127:0] = {req[16:0],req[127:17]};
			7'b0010010: shift_req[127:0] = {req[17:0],req[127:18]};
			7'b0010011: shift_req[127:0] = {req[18:0],req[127:19]};
			7'b0010100: shift_req[127:0] = {req[19:0],req[127:20]};
			7'b0010101: shift_req[127:0] = {req[20:0],req[127:21]};
			7'b0010110: shift_req[127:0] = {req[21:0],req[127:22]};
			7'b0010111: shift_req[127:0] = {req[22:0],req[127:23]};
			7'b0011000: shift_req[127:0] = {req[23:0],req[127:24]};
			7'b0011001: shift_req[127:0] = {req[24:0],req[127:25]};
			7'b0011010: shift_req[127:0] = {req[25:0],req[127:26]};
			7'b0011011: shift_req[127:0] = {req[26:0],req[127:27]};
			7'b0011100: shift_req[127:0] = {req[27:0],req[127:28]};
			7'b0011101: shift_req[127:0] = {req[28:0],req[127:29]};
			7'b0011110: shift_req[127:0] = {req[29:0],req[127:30]};
			7'b0011111: shift_req[127:0] = {req[30:0],req[127:31]};
			7'b0100000: shift_req[127:0] = {req[31:0],req[127:32]};
			7'b0100001: shift_req[127:0] = {req[32:0],req[127:33]};
			7'b0100010: shift_req[127:0] = {req[33:0],req[127:34]};
			7'b0100011: shift_req[127:0] = {req[34:0],req[127:35]};
			7'b0100100: shift_req[127:0] = {req[35:0],req[127:36]};
			7'b0100101: shift_req[127:0] = {req[36:0],req[127:37]};
			7'b0100110: shift_req[127:0] = {req[37:0],req[127:38]};
			7'b0100111: shift_req[127:0] = {req[38:0],req[127:39]};
			7'b0101000: shift_req[127:0] = {req[39:0],req[127:40]};
			7'b0101001: shift_req[127:0] = {req[40:0],req[127:41]};
			7'b0101010: shift_req[127:0] = {req[41:0],req[127:42]};
			7'b0101011: shift_req[127:0] = {req[42:0],req[127:43]};
			7'b0101100: shift_req[127:0] = {req[43:0],req[127:44]};
			7'b0101101: shift_req[127:0] = {req[44:0],req[127:45]};
			7'b0101110: shift_req[127:0] = {req[45:0],req[127:46]};
			7'b0101111: shift_req[127:0] = {req[46:0],req[127:47]};
			7'b0110000: shift_req[127:0] = {req[47:0],req[127:48]};
			7'b0110001: shift_req[127:0] = {req[48:0],req[127:49]};
			7'b0110010: shift_req[127:0] = {req[49:0],req[127:50]};
			7'b0110011: shift_req[127:0] = {req[50:0],req[127:51]};
			7'b0110100: shift_req[127:0] = {req[51:0],req[127:52]};
			7'b0110101: shift_req[127:0] = {req[52:0],req[127:53]};
			7'b0110110: shift_req[127:0] = {req[53:0],req[127:54]};
			7'b0110111: shift_req[127:0] = {req[54:0],req[127:55]};
			7'b0111000: shift_req[127:0] = {req[55:0],req[127:56]};
			7'b0111001: shift_req[127:0] = {req[56:0],req[127:57]};
			7'b0111010: shift_req[127:0] = {req[57:0],req[127:58]};
			7'b0111011: shift_req[127:0] = {req[58:0],req[127:59]};
			7'b0111100: shift_req[127:0] = {req[59:0],req[127:60]};
			7'b0111101: shift_req[127:0] = {req[60:0],req[127:61]};
			7'b0111110: shift_req[127:0] = {req[61:0],req[127:62]};
			7'b0111111: shift_req[127:0] = {req[62:0],req[127:63]};
			7'b1000000: shift_req[127:0] = {req[63:0],req[127:64]};
			7'b1000001: shift_req[127:0] = {req[64:0],req[127:65]};
			7'b1000010: shift_req[127:0] = {req[65:0],req[127:66]};
			7'b1000011: shift_req[127:0] = {req[66:0],req[127:67]};
			7'b1000100: shift_req[127:0] = {req[67:0],req[127:68]};
			7'b1000101: shift_req[127:0] = {req[68:0],req[127:69]};
			7'b1000110: shift_req[127:0] = {req[69:0],req[127:70]};
			7'b1000111: shift_req[127:0] = {req[70:0],req[127:71]};
			7'b1001000: shift_req[127:0] = {req[71:0],req[127:72]};
			7'b1001001: shift_req[127:0] = {req[72:0],req[127:73]};
			7'b1001010: shift_req[127:0] = {req[73:0],req[127:74]};
			7'b1001011: shift_req[127:0] = {req[74:0],req[127:75]};
			7'b1001100: shift_req[127:0] = {req[75:0],req[127:76]};
			7'b1001101: shift_req[127:0] = {req[76:0],req[127:77]};
			7'b1001110: shift_req[127:0] = {req[77:0],req[127:78]};
			7'b1001111: shift_req[127:0] = {req[78:0],req[127:79]};
			7'b1010000: shift_req[127:0] = {req[79:0],req[127:80]};
			7'b1010001: shift_req[127:0] = {req[80:0],req[127:81]};
			7'b1010010: shift_req[127:0] = {req[81:0],req[127:82]};
			7'b1010011: shift_req[127:0] = {req[82:0],req[127:83]};
			7'b1010100: shift_req[127:0] = {req[83:0],req[127:84]};
			7'b1010101: shift_req[127:0] = {req[84:0],req[127:85]};
			7'b1010110: shift_req[127:0] = {req[85:0],req[127:86]};
			7'b1010111: shift_req[127:0] = {req[86:0],req[127:87]};
			7'b1011000: shift_req[127:0] = {req[87:0],req[127:88]};
			7'b1011001: shift_req[127:0] = {req[88:0],req[127:89]};
			7'b1011010: shift_req[127:0] = {req[89:0],req[127:90]};
			7'b1011011: shift_req[127:0] = {req[90:0],req[127:91]};
			7'b1011100: shift_req[127:0] = {req[91:0],req[127:92]};
			7'b1011101: shift_req[127:0] = {req[92:0],req[127:93]};
			7'b1011110: shift_req[127:0] = {req[93:0],req[127:94]};
			7'b1011111: shift_req[127:0] = {req[94:0],req[127:95]};
			7'b1100000: shift_req[127:0] = {req[95:0],req[127:96]};
			7'b1100001: shift_req[127:0] = {req[96:0],req[127:97]};
			7'b1100010: shift_req[127:0] = {req[97:0],req[127:98]};
			7'b1100011: shift_req[127:0] = {req[98:0],req[127:99]};
			7'b1100100: shift_req[127:0] = {req[99:0],req[127:100]};
			7'b1100101: shift_req[127:0] = {req[100:0],req[127:101]};
			7'b1100110: shift_req[127:0] = {req[101:0],req[127:102]};
			7'b1100111: shift_req[127:0] = {req[102:0],req[127:103]};
			7'b1101000: shift_req[127:0] = {req[103:0],req[127:104]};
			7'b1101001: shift_req[127:0] = {req[104:0],req[127:105]};
			7'b1101010: shift_req[127:0] = {req[105:0],req[127:106]};
			7'b1101011: shift_req[127:0] = {req[106:0],req[127:107]};
			7'b1101100: shift_req[127:0] = {req[107:0],req[127:108]};
			7'b1101101: shift_req[127:0] = {req[108:0],req[127:109]};
			7'b1101110: shift_req[127:0] = {req[109:0],req[127:110]};
			7'b1101111: shift_req[127:0] = {req[110:0],req[127:111]};
			7'b1110000: shift_req[127:0] = {req[111:0],req[127:112]};
			7'b1110001: shift_req[127:0] = {req[112:0],req[127:113]};
			7'b1110010: shift_req[127:0] = {req[113:0],req[127:114]};
			7'b1110011: shift_req[127:0] = {req[114:0],req[127:115]};
			7'b1110100: shift_req[127:0] = {req[115:0],req[127:116]};
			7'b1110101: shift_req[127:0] = {req[116:0],req[127:117]};
			7'b1110110: shift_req[127:0] = {req[117:0],req[127:118]};
			7'b1110111: shift_req[127:0] = {req[118:0],req[127:119]};
			7'b1111000: shift_req[127:0] = {req[119:0],req[127:120]};
			7'b1111001: shift_req[127:0] = {req[120:0],req[127:121]};
			7'b1111010: shift_req[127:0] = {req[121:0],req[127:122]};
			7'b1111011: shift_req[127:0] = {req[122:0],req[127:123]};
			7'b1111100: shift_req[127:0] = {req[123:0],req[127:124]};
			7'b1111101: shift_req[127:0] = {req[124:0],req[127:125]};
			7'b1111110: shift_req[127:0] = {req[125:0],req[127:126]};
			7'b1111111: shift_req[127:0] = {req[126:0],req[127]};

	endcase
end

always @ (*)
begin
shift_grant[127:0] = 128'b0;
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
			else if (shift_req[64])	shift_grant[64] = 1'b1;
			else if (shift_req[65])	shift_grant[65] = 1'b1;
			else if (shift_req[66])	shift_grant[66] = 1'b1;
			else if (shift_req[67])	shift_grant[67] = 1'b1;
			else if (shift_req[68])	shift_grant[68] = 1'b1;
			else if (shift_req[69])	shift_grant[69] = 1'b1;
			else if (shift_req[70])	shift_grant[70] = 1'b1;
			else if (shift_req[71])	shift_grant[71] = 1'b1;
			else if (shift_req[72])	shift_grant[72] = 1'b1;
			else if (shift_req[73])	shift_grant[73] = 1'b1;
			else if (shift_req[74])	shift_grant[74] = 1'b1;
			else if (shift_req[75])	shift_grant[75] = 1'b1;
			else if (shift_req[76])	shift_grant[76] = 1'b1;
			else if (shift_req[77])	shift_grant[77] = 1'b1;
			else if (shift_req[78])	shift_grant[78] = 1'b1;
			else if (shift_req[79])	shift_grant[79] = 1'b1;
			else if (shift_req[80])	shift_grant[80] = 1'b1;
			else if (shift_req[81])	shift_grant[81] = 1'b1;
			else if (shift_req[82])	shift_grant[82] = 1'b1;
			else if (shift_req[83])	shift_grant[83] = 1'b1;
			else if (shift_req[84])	shift_grant[84] = 1'b1;
			else if (shift_req[85])	shift_grant[85] = 1'b1;
			else if (shift_req[86])	shift_grant[86] = 1'b1;
			else if (shift_req[87])	shift_grant[87] = 1'b1;
			else if (shift_req[88])	shift_grant[88] = 1'b1;
			else if (shift_req[89])	shift_grant[89] = 1'b1;
			else if (shift_req[90])	shift_grant[90] = 1'b1;
			else if (shift_req[91])	shift_grant[91] = 1'b1;
			else if (shift_req[92])	shift_grant[92] = 1'b1;
			else if (shift_req[93])	shift_grant[93] = 1'b1;
			else if (shift_req[94])	shift_grant[94] = 1'b1;
			else if (shift_req[95])	shift_grant[95] = 1'b1;
			else if (shift_req[96])	shift_grant[96] = 1'b1;
			else if (shift_req[97])	shift_grant[97] = 1'b1;
			else if (shift_req[98])	shift_grant[98] = 1'b1;
			else if (shift_req[99])	shift_grant[99] = 1'b1;
			else if (shift_req[100])	shift_grant[100] = 1'b1;
			else if (shift_req[101])	shift_grant[101] = 1'b1;
			else if (shift_req[102])	shift_grant[102] = 1'b1;
			else if (shift_req[103])	shift_grant[103] = 1'b1;
			else if (shift_req[104])	shift_grant[104] = 1'b1;
			else if (shift_req[105])	shift_grant[105] = 1'b1;
			else if (shift_req[106])	shift_grant[106] = 1'b1;
			else if (shift_req[107])	shift_grant[107] = 1'b1;
			else if (shift_req[108])	shift_grant[108] = 1'b1;
			else if (shift_req[109])	shift_grant[109] = 1'b1;
			else if (shift_req[110])	shift_grant[110] = 1'b1;
			else if (shift_req[111])	shift_grant[111] = 1'b1;
			else if (shift_req[112])	shift_grant[112] = 1'b1;
			else if (shift_req[113])	shift_grant[113] = 1'b1;
			else if (shift_req[114])	shift_grant[114] = 1'b1;
			else if (shift_req[115])	shift_grant[115] = 1'b1;
			else if (shift_req[116])	shift_grant[116] = 1'b1;
			else if (shift_req[117])	shift_grant[117] = 1'b1;
			else if (shift_req[118])	shift_grant[118] = 1'b1;
			else if (shift_req[119])	shift_grant[119] = 1'b1;
			else if (shift_req[120])	shift_grant[120] = 1'b1;
			else if (shift_req[121])	shift_grant[121] = 1'b1;
			else if (shift_req[122])	shift_grant[122] = 1'b1;
			else if (shift_req[123])	shift_grant[123] = 1'b1;
			else if (shift_req[124])	shift_grant[124] = 1'b1;
			else if (shift_req[125])	shift_grant[125] = 1'b1;
			else if (shift_req[126])	shift_grant[126] = 1'b1;
			else if (shift_req[127])	shift_grant[127] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[6:0])
			7'b0000000: grant_comb[127:0] = shift_grant[127:0];
			7'b0000001: grant_comb[127:0] = {shift_grant[126:0],shift_grant[127]};
			7'b0000010: grant_comb[127:0] = {shift_grant[125:0],shift_grant[127:126]};
			7'b0000011: grant_comb[127:0] = {shift_grant[124:0],shift_grant[127:125]};
			7'b0000100: grant_comb[127:0] = {shift_grant[123:0],shift_grant[127:124]};
			7'b0000101: grant_comb[127:0] = {shift_grant[122:0],shift_grant[127:123]};
			7'b0000110: grant_comb[127:0] = {shift_grant[121:0],shift_grant[127:122]};
			7'b0000111: grant_comb[127:0] = {shift_grant[120:0],shift_grant[127:121]};
			7'b0001000: grant_comb[127:0] = {shift_grant[119:0],shift_grant[127:120]};
			7'b0001001: grant_comb[127:0] = {shift_grant[118:0],shift_grant[127:119]};
			7'b0001010: grant_comb[127:0] = {shift_grant[117:0],shift_grant[127:118]};
			7'b0001011: grant_comb[127:0] = {shift_grant[116:0],shift_grant[127:117]};
			7'b0001100: grant_comb[127:0] = {shift_grant[115:0],shift_grant[127:116]};
			7'b0001101: grant_comb[127:0] = {shift_grant[114:0],shift_grant[127:115]};
			7'b0001110: grant_comb[127:0] = {shift_grant[113:0],shift_grant[127:114]};
			7'b0001111: grant_comb[127:0] = {shift_grant[112:0],shift_grant[127:113]};
			7'b0010000: grant_comb[127:0] = {shift_grant[111:0],shift_grant[127:112]};
			7'b0010001: grant_comb[127:0] = {shift_grant[110:0],shift_grant[127:111]};
			7'b0010010: grant_comb[127:0] = {shift_grant[109:0],shift_grant[127:110]};
			7'b0010011: grant_comb[127:0] = {shift_grant[108:0],shift_grant[127:109]};
			7'b0010100: grant_comb[127:0] = {shift_grant[107:0],shift_grant[127:108]};
			7'b0010101: grant_comb[127:0] = {shift_grant[106:0],shift_grant[127:107]};
			7'b0010110: grant_comb[127:0] = {shift_grant[105:0],shift_grant[127:106]};
			7'b0010111: grant_comb[127:0] = {shift_grant[104:0],shift_grant[127:105]};
			7'b0011000: grant_comb[127:0] = {shift_grant[103:0],shift_grant[127:104]};
			7'b0011001: grant_comb[127:0] = {shift_grant[102:0],shift_grant[127:103]};
			7'b0011010: grant_comb[127:0] = {shift_grant[101:0],shift_grant[127:102]};
			7'b0011011: grant_comb[127:0] = {shift_grant[100:0],shift_grant[127:101]};
			7'b0011100: grant_comb[127:0] = {shift_grant[99:0],shift_grant[127:100]};
			7'b0011101: grant_comb[127:0] = {shift_grant[98:0],shift_grant[127:99]};
			7'b0011110: grant_comb[127:0] = {shift_grant[97:0],shift_grant[127:98]};
			7'b0011111: grant_comb[127:0] = {shift_grant[96:0],shift_grant[127:97]};
			7'b0100000: grant_comb[127:0] = {shift_grant[95:0],shift_grant[127:96]};
			7'b0100001: grant_comb[127:0] = {shift_grant[94:0],shift_grant[127:95]};
			7'b0100010: grant_comb[127:0] = {shift_grant[93:0],shift_grant[127:94]};
			7'b0100011: grant_comb[127:0] = {shift_grant[92:0],shift_grant[127:93]};
			7'b0100100: grant_comb[127:0] = {shift_grant[91:0],shift_grant[127:92]};
			7'b0100101: grant_comb[127:0] = {shift_grant[90:0],shift_grant[127:91]};
			7'b0100110: grant_comb[127:0] = {shift_grant[89:0],shift_grant[127:90]};
			7'b0100111: grant_comb[127:0] = {shift_grant[88:0],shift_grant[127:89]};
			7'b0101000: grant_comb[127:0] = {shift_grant[87:0],shift_grant[127:88]};
			7'b0101001: grant_comb[127:0] = {shift_grant[86:0],shift_grant[127:87]};
			7'b0101010: grant_comb[127:0] = {shift_grant[85:0],shift_grant[127:86]};
			7'b0101011: grant_comb[127:0] = {shift_grant[84:0],shift_grant[127:85]};
			7'b0101100: grant_comb[127:0] = {shift_grant[83:0],shift_grant[127:84]};
			7'b0101101: grant_comb[127:0] = {shift_grant[82:0],shift_grant[127:83]};
			7'b0101110: grant_comb[127:0] = {shift_grant[81:0],shift_grant[127:82]};
			7'b0101111: grant_comb[127:0] = {shift_grant[80:0],shift_grant[127:81]};
			7'b0110000: grant_comb[127:0] = {shift_grant[79:0],shift_grant[127:80]};
			7'b0110001: grant_comb[127:0] = {shift_grant[78:0],shift_grant[127:79]};
			7'b0110010: grant_comb[127:0] = {shift_grant[77:0],shift_grant[127:78]};
			7'b0110011: grant_comb[127:0] = {shift_grant[76:0],shift_grant[127:77]};
			7'b0110100: grant_comb[127:0] = {shift_grant[75:0],shift_grant[127:76]};
			7'b0110101: grant_comb[127:0] = {shift_grant[74:0],shift_grant[127:75]};
			7'b0110110: grant_comb[127:0] = {shift_grant[73:0],shift_grant[127:74]};
			7'b0110111: grant_comb[127:0] = {shift_grant[72:0],shift_grant[127:73]};
			7'b0111000: grant_comb[127:0] = {shift_grant[71:0],shift_grant[127:72]};
			7'b0111001: grant_comb[127:0] = {shift_grant[70:0],shift_grant[127:71]};
			7'b0111010: grant_comb[127:0] = {shift_grant[69:0],shift_grant[127:70]};
			7'b0111011: grant_comb[127:0] = {shift_grant[68:0],shift_grant[127:69]};
			7'b0111100: grant_comb[127:0] = {shift_grant[67:0],shift_grant[127:68]};
			7'b0111101: grant_comb[127:0] = {shift_grant[66:0],shift_grant[127:67]};
			7'b0111110: grant_comb[127:0] = {shift_grant[65:0],shift_grant[127:66]};
			7'b0111111: grant_comb[127:0] = {shift_grant[64:0],shift_grant[127:65]};
			7'b1000000: grant_comb[127:0] = {shift_grant[63:0],shift_grant[127:64]};
			7'b1000001: grant_comb[127:0] = {shift_grant[62:0],shift_grant[127:63]};
			7'b1000010: grant_comb[127:0] = {shift_grant[61:0],shift_grant[127:62]};
			7'b1000011: grant_comb[127:0] = {shift_grant[60:0],shift_grant[127:61]};
			7'b1000100: grant_comb[127:0] = {shift_grant[59:0],shift_grant[127:60]};
			7'b1000101: grant_comb[127:0] = {shift_grant[58:0],shift_grant[127:59]};
			7'b1000110: grant_comb[127:0] = {shift_grant[57:0],shift_grant[127:58]};
			7'b1000111: grant_comb[127:0] = {shift_grant[56:0],shift_grant[127:57]};
			7'b1001000: grant_comb[127:0] = {shift_grant[55:0],shift_grant[127:56]};
			7'b1001001: grant_comb[127:0] = {shift_grant[54:0],shift_grant[127:55]};
			7'b1001010: grant_comb[127:0] = {shift_grant[53:0],shift_grant[127:54]};
			7'b1001011: grant_comb[127:0] = {shift_grant[52:0],shift_grant[127:53]};
			7'b1001100: grant_comb[127:0] = {shift_grant[51:0],shift_grant[127:52]};
			7'b1001101: grant_comb[127:0] = {shift_grant[50:0],shift_grant[127:51]};
			7'b1001110: grant_comb[127:0] = {shift_grant[49:0],shift_grant[127:50]};
			7'b1001111: grant_comb[127:0] = {shift_grant[48:0],shift_grant[127:49]};
			7'b1010000: grant_comb[127:0] = {shift_grant[47:0],shift_grant[127:48]};
			7'b1010001: grant_comb[127:0] = {shift_grant[46:0],shift_grant[127:47]};
			7'b1010010: grant_comb[127:0] = {shift_grant[45:0],shift_grant[127:46]};
			7'b1010011: grant_comb[127:0] = {shift_grant[44:0],shift_grant[127:45]};
			7'b1010100: grant_comb[127:0] = {shift_grant[43:0],shift_grant[127:44]};
			7'b1010101: grant_comb[127:0] = {shift_grant[42:0],shift_grant[127:43]};
			7'b1010110: grant_comb[127:0] = {shift_grant[41:0],shift_grant[127:42]};
			7'b1010111: grant_comb[127:0] = {shift_grant[40:0],shift_grant[127:41]};
			7'b1011000: grant_comb[127:0] = {shift_grant[39:0],shift_grant[127:40]};
			7'b1011001: grant_comb[127:0] = {shift_grant[38:0],shift_grant[127:39]};
			7'b1011010: grant_comb[127:0] = {shift_grant[37:0],shift_grant[127:38]};
			7'b1011011: grant_comb[127:0] = {shift_grant[36:0],shift_grant[127:37]};
			7'b1011100: grant_comb[127:0] = {shift_grant[35:0],shift_grant[127:36]};
			7'b1011101: grant_comb[127:0] = {shift_grant[34:0],shift_grant[127:35]};
			7'b1011110: grant_comb[127:0] = {shift_grant[33:0],shift_grant[127:34]};
			7'b1011111: grant_comb[127:0] = {shift_grant[32:0],shift_grant[127:33]};
			7'b1100000: grant_comb[127:0] = {shift_grant[31:0],shift_grant[127:32]};
			7'b1100001: grant_comb[127:0] = {shift_grant[30:0],shift_grant[127:31]};
			7'b1100010: grant_comb[127:0] = {shift_grant[29:0],shift_grant[127:30]};
			7'b1100011: grant_comb[127:0] = {shift_grant[28:0],shift_grant[127:29]};
			7'b1100100: grant_comb[127:0] = {shift_grant[27:0],shift_grant[127:28]};
			7'b1100101: grant_comb[127:0] = {shift_grant[26:0],shift_grant[127:27]};
			7'b1100110: grant_comb[127:0] = {shift_grant[25:0],shift_grant[127:26]};
			7'b1100111: grant_comb[127:0] = {shift_grant[24:0],shift_grant[127:25]};
			7'b1101000: grant_comb[127:0] = {shift_grant[23:0],shift_grant[127:24]};
			7'b1101001: grant_comb[127:0] = {shift_grant[22:0],shift_grant[127:23]};
			7'b1101010: grant_comb[127:0] = {shift_grant[21:0],shift_grant[127:22]};
			7'b1101011: grant_comb[127:0] = {shift_grant[20:0],shift_grant[127:21]};
			7'b1101100: grant_comb[127:0] = {shift_grant[19:0],shift_grant[127:20]};
			7'b1101101: grant_comb[127:0] = {shift_grant[18:0],shift_grant[127:19]};
			7'b1101110: grant_comb[127:0] = {shift_grant[17:0],shift_grant[127:18]};
			7'b1101111: grant_comb[127:0] = {shift_grant[16:0],shift_grant[127:17]};
			7'b1110000: grant_comb[127:0] = {shift_grant[15:0],shift_grant[127:16]};
			7'b1110001: grant_comb[127:0] = {shift_grant[14:0],shift_grant[127:15]};
			7'b1110010: grant_comb[127:0] = {shift_grant[13:0],shift_grant[127:14]};
			7'b1110011: grant_comb[127:0] = {shift_grant[12:0],shift_grant[127:13]};
			7'b1110100: grant_comb[127:0] = {shift_grant[11:0],shift_grant[127:12]};
			7'b1110101: grant_comb[127:0] = {shift_grant[10:0],shift_grant[127:11]};
			7'b1110110: grant_comb[127:0] = {shift_grant[9:0],shift_grant[127:10]};
			7'b1110111: grant_comb[127:0] = {shift_grant[8:0],shift_grant[127:9]};
			7'b1111000: grant_comb[127:0] = {shift_grant[7:0],shift_grant[127:8]};
			7'b1111001: grant_comb[127:0] = {shift_grant[6:0],shift_grant[127:7]};
			7'b1111010: grant_comb[127:0] = {shift_grant[5:0],shift_grant[127:6]};
			7'b1111011: grant_comb[127:0] = {shift_grant[4:0],shift_grant[127:5]};
			7'b1111100: grant_comb[127:0] = {shift_grant[3:0],shift_grant[127:4]};
			7'b1111101: grant_comb[127:0] = {shift_grant[2:0],shift_grant[127:3]};
			7'b1111110: grant_comb[127:0] = {shift_grant[1:0],shift_grant[127:2]};
			7'b1111111: grant_comb[127:0] = {shift_grant[0],shift_grant[127:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[127:0] <= 128'b0;
	else		grant[127:0] <= grant_comb[127:0] & ~grant[127:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[6:0] <= 7'b0;
	else
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[6:0] <= | nweight0 ?  : rotate_ptr :7'd1;
			grant[1]: rotate_ptr[6:0] <= | nweight1 ?  : rotate_ptr :7'd2;
			grant[2]: rotate_ptr[6:0] <= | nweight2 ?  : rotate_ptr :7'd3;
			grant[3]: rotate_ptr[6:0] <= | nweight3 ?  : rotate_ptr :7'd4;
			grant[4]: rotate_ptr[6:0] <= | nweight4 ?  : rotate_ptr :7'd5;
			grant[5]: rotate_ptr[6:0] <= | nweight5 ?  : rotate_ptr :7'd6;
			grant[6]: rotate_ptr[6:0] <= | nweight6 ?  : rotate_ptr :7'd7;
			grant[7]: rotate_ptr[6:0] <= | nweight7 ?  : rotate_ptr :7'd8;
			grant[8]: rotate_ptr[6:0] <= | nweight8 ?  : rotate_ptr :7'd9;
			grant[9]: rotate_ptr[6:0] <= | nweight9 ?  : rotate_ptr :7'd10;
			grant[10]: rotate_ptr[6:0] <= | nweight10 ?  : rotate_ptr :7'd11;
			grant[11]: rotate_ptr[6:0] <= | nweight11 ?  : rotate_ptr :7'd12;
			grant[12]: rotate_ptr[6:0] <= | nweight12 ?  : rotate_ptr :7'd13;
			grant[13]: rotate_ptr[6:0] <= | nweight13 ?  : rotate_ptr :7'd14;
			grant[14]: rotate_ptr[6:0] <= | nweight14 ?  : rotate_ptr :7'd15;
			grant[15]: rotate_ptr[6:0] <= | nweight15 ?  : rotate_ptr :7'd16;
			grant[16]: rotate_ptr[6:0] <= | nweight16 ?  : rotate_ptr :7'd17;
			grant[17]: rotate_ptr[6:0] <= | nweight17 ?  : rotate_ptr :7'd18;
			grant[18]: rotate_ptr[6:0] <= | nweight18 ?  : rotate_ptr :7'd19;
			grant[19]: rotate_ptr[6:0] <= | nweight19 ?  : rotate_ptr :7'd20;
			grant[20]: rotate_ptr[6:0] <= | nweight20 ?  : rotate_ptr :7'd21;
			grant[21]: rotate_ptr[6:0] <= | nweight21 ?  : rotate_ptr :7'd22;
			grant[22]: rotate_ptr[6:0] <= | nweight22 ?  : rotate_ptr :7'd23;
			grant[23]: rotate_ptr[6:0] <= | nweight23 ?  : rotate_ptr :7'd24;
			grant[24]: rotate_ptr[6:0] <= | nweight24 ?  : rotate_ptr :7'd25;
			grant[25]: rotate_ptr[6:0] <= | nweight25 ?  : rotate_ptr :7'd26;
			grant[26]: rotate_ptr[6:0] <= | nweight26 ?  : rotate_ptr :7'd27;
			grant[27]: rotate_ptr[6:0] <= | nweight27 ?  : rotate_ptr :7'd28;
			grant[28]: rotate_ptr[6:0] <= | nweight28 ?  : rotate_ptr :7'd29;
			grant[29]: rotate_ptr[6:0] <= | nweight29 ?  : rotate_ptr :7'd30;
			grant[30]: rotate_ptr[6:0] <= | nweight30 ?  : rotate_ptr :7'd31;
			grant[31]: rotate_ptr[6:0] <= | nweight31 ?  : rotate_ptr :7'd32;
			grant[32]: rotate_ptr[6:0] <= | nweight32 ?  : rotate_ptr :7'd33;
			grant[33]: rotate_ptr[6:0] <= | nweight33 ?  : rotate_ptr :7'd34;
			grant[34]: rotate_ptr[6:0] <= | nweight34 ?  : rotate_ptr :7'd35;
			grant[35]: rotate_ptr[6:0] <= | nweight35 ?  : rotate_ptr :7'd36;
			grant[36]: rotate_ptr[6:0] <= | nweight36 ?  : rotate_ptr :7'd37;
			grant[37]: rotate_ptr[6:0] <= | nweight37 ?  : rotate_ptr :7'd38;
			grant[38]: rotate_ptr[6:0] <= | nweight38 ?  : rotate_ptr :7'd39;
			grant[39]: rotate_ptr[6:0] <= | nweight39 ?  : rotate_ptr :7'd40;
			grant[40]: rotate_ptr[6:0] <= | nweight40 ?  : rotate_ptr :7'd41;
			grant[41]: rotate_ptr[6:0] <= | nweight41 ?  : rotate_ptr :7'd42;
			grant[42]: rotate_ptr[6:0] <= | nweight42 ?  : rotate_ptr :7'd43;
			grant[43]: rotate_ptr[6:0] <= | nweight43 ?  : rotate_ptr :7'd44;
			grant[44]: rotate_ptr[6:0] <= | nweight44 ?  : rotate_ptr :7'd45;
			grant[45]: rotate_ptr[6:0] <= | nweight45 ?  : rotate_ptr :7'd46;
			grant[46]: rotate_ptr[6:0] <= | nweight46 ?  : rotate_ptr :7'd47;
			grant[47]: rotate_ptr[6:0] <= | nweight47 ?  : rotate_ptr :7'd48;
			grant[48]: rotate_ptr[6:0] <= | nweight48 ?  : rotate_ptr :7'd49;
			grant[49]: rotate_ptr[6:0] <= | nweight49 ?  : rotate_ptr :7'd50;
			grant[50]: rotate_ptr[6:0] <= | nweight50 ?  : rotate_ptr :7'd51;
			grant[51]: rotate_ptr[6:0] <= | nweight51 ?  : rotate_ptr :7'd52;
			grant[52]: rotate_ptr[6:0] <= | nweight52 ?  : rotate_ptr :7'd53;
			grant[53]: rotate_ptr[6:0] <= | nweight53 ?  : rotate_ptr :7'd54;
			grant[54]: rotate_ptr[6:0] <= | nweight54 ?  : rotate_ptr :7'd55;
			grant[55]: rotate_ptr[6:0] <= | nweight55 ?  : rotate_ptr :7'd56;
			grant[56]: rotate_ptr[6:0] <= | nweight56 ?  : rotate_ptr :7'd57;
			grant[57]: rotate_ptr[6:0] <= | nweight57 ?  : rotate_ptr :7'd58;
			grant[58]: rotate_ptr[6:0] <= | nweight58 ?  : rotate_ptr :7'd59;
			grant[59]: rotate_ptr[6:0] <= | nweight59 ?  : rotate_ptr :7'd60;
			grant[60]: rotate_ptr[6:0] <= | nweight60 ?  : rotate_ptr :7'd61;
			grant[61]: rotate_ptr[6:0] <= | nweight61 ?  : rotate_ptr :7'd62;
			grant[62]: rotate_ptr[6:0] <= | nweight62 ?  : rotate_ptr :7'd63;
			grant[63]: rotate_ptr[6:0] <= | nweight63 ?  : rotate_ptr :7'd64;
			grant[64]: rotate_ptr[6:0] <= | nweight64 ?  : rotate_ptr :7'd65;
			grant[65]: rotate_ptr[6:0] <= | nweight65 ?  : rotate_ptr :7'd66;
			grant[66]: rotate_ptr[6:0] <= | nweight66 ?  : rotate_ptr :7'd67;
			grant[67]: rotate_ptr[6:0] <= | nweight67 ?  : rotate_ptr :7'd68;
			grant[68]: rotate_ptr[6:0] <= | nweight68 ?  : rotate_ptr :7'd69;
			grant[69]: rotate_ptr[6:0] <= | nweight69 ?  : rotate_ptr :7'd70;
			grant[70]: rotate_ptr[6:0] <= | nweight70 ?  : rotate_ptr :7'd71;
			grant[71]: rotate_ptr[6:0] <= | nweight71 ?  : rotate_ptr :7'd72;
			grant[72]: rotate_ptr[6:0] <= | nweight72 ?  : rotate_ptr :7'd73;
			grant[73]: rotate_ptr[6:0] <= | nweight73 ?  : rotate_ptr :7'd74;
			grant[74]: rotate_ptr[6:0] <= | nweight74 ?  : rotate_ptr :7'd75;
			grant[75]: rotate_ptr[6:0] <= | nweight75 ?  : rotate_ptr :7'd76;
			grant[76]: rotate_ptr[6:0] <= | nweight76 ?  : rotate_ptr :7'd77;
			grant[77]: rotate_ptr[6:0] <= | nweight77 ?  : rotate_ptr :7'd78;
			grant[78]: rotate_ptr[6:0] <= | nweight78 ?  : rotate_ptr :7'd79;
			grant[79]: rotate_ptr[6:0] <= | nweight79 ?  : rotate_ptr :7'd80;
			grant[80]: rotate_ptr[6:0] <= | nweight80 ?  : rotate_ptr :7'd81;
			grant[81]: rotate_ptr[6:0] <= | nweight81 ?  : rotate_ptr :7'd82;
			grant[82]: rotate_ptr[6:0] <= | nweight82 ?  : rotate_ptr :7'd83;
			grant[83]: rotate_ptr[6:0] <= | nweight83 ?  : rotate_ptr :7'd84;
			grant[84]: rotate_ptr[6:0] <= | nweight84 ?  : rotate_ptr :7'd85;
			grant[85]: rotate_ptr[6:0] <= | nweight85 ?  : rotate_ptr :7'd86;
			grant[86]: rotate_ptr[6:0] <= | nweight86 ?  : rotate_ptr :7'd87;
			grant[87]: rotate_ptr[6:0] <= | nweight87 ?  : rotate_ptr :7'd88;
			grant[88]: rotate_ptr[6:0] <= | nweight88 ?  : rotate_ptr :7'd89;
			grant[89]: rotate_ptr[6:0] <= | nweight89 ?  : rotate_ptr :7'd90;
			grant[90]: rotate_ptr[6:0] <= | nweight90 ?  : rotate_ptr :7'd91;
			grant[91]: rotate_ptr[6:0] <= | nweight91 ?  : rotate_ptr :7'd92;
			grant[92]: rotate_ptr[6:0] <= | nweight92 ?  : rotate_ptr :7'd93;
			grant[93]: rotate_ptr[6:0] <= | nweight93 ?  : rotate_ptr :7'd94;
			grant[94]: rotate_ptr[6:0] <= | nweight94 ?  : rotate_ptr :7'd95;
			grant[95]: rotate_ptr[6:0] <= | nweight95 ?  : rotate_ptr :7'd96;
			grant[96]: rotate_ptr[6:0] <= | nweight96 ?  : rotate_ptr :7'd97;
			grant[97]: rotate_ptr[6:0] <= | nweight97 ?  : rotate_ptr :7'd98;
			grant[98]: rotate_ptr[6:0] <= | nweight98 ?  : rotate_ptr :7'd99;
			grant[99]: rotate_ptr[6:0] <= | nweight99 ?  : rotate_ptr :7'd100;
			grant[100]: rotate_ptr[6:0] <= | nweight100 ?  : rotate_ptr :7'd101;
			grant[101]: rotate_ptr[6:0] <= | nweight101 ?  : rotate_ptr :7'd102;
			grant[102]: rotate_ptr[6:0] <= | nweight102 ?  : rotate_ptr :7'd103;
			grant[103]: rotate_ptr[6:0] <= | nweight103 ?  : rotate_ptr :7'd104;
			grant[104]: rotate_ptr[6:0] <= | nweight104 ?  : rotate_ptr :7'd105;
			grant[105]: rotate_ptr[6:0] <= | nweight105 ?  : rotate_ptr :7'd106;
			grant[106]: rotate_ptr[6:0] <= | nweight106 ?  : rotate_ptr :7'd107;
			grant[107]: rotate_ptr[6:0] <= | nweight107 ?  : rotate_ptr :7'd108;
			grant[108]: rotate_ptr[6:0] <= | nweight108 ?  : rotate_ptr :7'd109;
			grant[109]: rotate_ptr[6:0] <= | nweight109 ?  : rotate_ptr :7'd110;
			grant[110]: rotate_ptr[6:0] <= | nweight110 ?  : rotate_ptr :7'd111;
			grant[111]: rotate_ptr[6:0] <= | nweight111 ?  : rotate_ptr :7'd112;
			grant[112]: rotate_ptr[6:0] <= | nweight112 ?  : rotate_ptr :7'd113;
			grant[113]: rotate_ptr[6:0] <= | nweight113 ?  : rotate_ptr :7'd114;
			grant[114]: rotate_ptr[6:0] <= | nweight114 ?  : rotate_ptr :7'd115;
			grant[115]: rotate_ptr[6:0] <= | nweight115 ?  : rotate_ptr :7'd116;
			grant[116]: rotate_ptr[6:0] <= | nweight116 ?  : rotate_ptr :7'd117;
			grant[117]: rotate_ptr[6:0] <= | nweight117 ?  : rotate_ptr :7'd118;
			grant[118]: rotate_ptr[6:0] <= | nweight118 ?  : rotate_ptr :7'd119;
			grant[119]: rotate_ptr[6:0] <= | nweight119 ?  : rotate_ptr :7'd120;
			grant[120]: rotate_ptr[6:0] <= | nweight120 ?  : rotate_ptr :7'd121;
			grant[121]: rotate_ptr[6:0] <= | nweight121 ?  : rotate_ptr :7'd122;
			grant[122]: rotate_ptr[6:0] <= | nweight122 ?  : rotate_ptr :7'd123;
			grant[123]: rotate_ptr[6:0] <= | nweight123 ?  : rotate_ptr :7'd124;
			grant[124]: rotate_ptr[6:0] <= | nweight124 ?  : rotate_ptr :7'd125;
			grant[125]: rotate_ptr[6:0] <= | nweight125 ?  : rotate_ptr :7'd126;
			grant[126]: rotate_ptr[6:0] <= | nweight126 ?  : rotate_ptr :7'd127;
			grant[127]: rotate_ptr[6:0] <= | nweight127 ?  : rotate_ptr :7'd0;
			

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
weight16 <= 6'd0;
weight17 <= 6'd0;
weight18 <= 6'd0;
weight19 <= 6'd0;
weight20 <= 6'd0;
weight21 <= 6'd0;
weight22 <= 6'd0;
weight23 <= 6'd0;
weight24 <= 6'd0;
weight25 <= 6'd0;
weight26 <= 6'd0;
weight27 <= 6'd0;
weight28 <= 6'd0;
weight29 <= 6'd0;
weight30 <= 6'd0;
weight31 <= 6'd0;
weight32 <= 6'd0;
weight33 <= 6'd0;
weight34 <= 6'd0;
weight35 <= 6'd0;
weight36 <= 6'd0;
weight37 <= 6'd0;
weight38 <= 6'd0;
weight39 <= 6'd0;
weight40 <= 6'd0;
weight41 <= 6'd0;
weight42 <= 6'd0;
weight43 <= 6'd0;
weight44 <= 6'd0;
weight45 <= 6'd0;
weight46 <= 6'd0;
weight47 <= 6'd0;
weight48 <= 6'd0;
weight49 <= 6'd0;
weight50 <= 6'd0;
weight51 <= 6'd0;
weight52 <= 6'd0;
weight53 <= 6'd0;
weight54 <= 6'd0;
weight55 <= 6'd0;
weight56 <= 6'd0;
weight57 <= 6'd0;
weight58 <= 6'd0;
weight59 <= 6'd0;
weight60 <= 6'd0;
weight61 <= 6'd0;
weight62 <= 6'd0;
weight63 <= 6'd0;
weight64 <= 6'd0;
weight65 <= 6'd0;
weight66 <= 6'd0;
weight67 <= 6'd0;
weight68 <= 6'd0;
weight69 <= 6'd0;
weight70 <= 6'd0;
weight71 <= 6'd0;
weight72 <= 6'd0;
weight73 <= 6'd0;
weight74 <= 6'd0;
weight75 <= 6'd0;
weight76 <= 6'd0;
weight77 <= 6'd0;
weight78 <= 6'd0;
weight79 <= 6'd0;
weight80 <= 6'd0;
weight81 <= 6'd0;
weight82 <= 6'd0;
weight83 <= 6'd0;
weight84 <= 6'd0;
weight85 <= 6'd0;
weight86 <= 6'd0;
weight87 <= 6'd0;
weight88 <= 6'd0;
weight89 <= 6'd0;
weight90 <= 6'd0;
weight91 <= 6'd0;
weight92 <= 6'd0;
weight93 <= 6'd0;
weight94 <= 6'd0;
weight95 <= 6'd0;
weight96 <= 6'd0;
weight97 <= 6'd0;
weight98 <= 6'd0;
weight99 <= 6'd0;
weight100 <= 6'd0;
weight101 <= 6'd0;
weight102 <= 6'd0;
weight103 <= 6'd0;
weight104 <= 6'd0;
weight105 <= 6'd0;
weight106 <= 6'd0;
weight107 <= 6'd0;
weight108 <= 6'd0;
weight109 <= 6'd0;
weight110 <= 6'd0;
weight111 <= 6'd0;
weight112 <= 6'd0;
weight113 <= 6'd0;
weight114 <= 6'd0;
weight115 <= 6'd0;
weight116 <= 6'd0;
weight117 <= 6'd0;
weight118 <= 6'd0;
weight119 <= 6'd0;
weight120 <= 6'd0;
weight121 <= 6'd0;
weight122 <= 6'd0;
weight123 <= 6'd0;
weight124 <= 6'd0;
weight125 <= 6'd0;
weight126 <= 6'd0;
weight127 <= 6'd0;
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
weight64 <= nweight64;
weight65 <= nweight65;
weight66 <= nweight66;
weight67 <= nweight67;
weight68 <= nweight68;
weight69 <= nweight69;
weight70 <= nweight70;
weight71 <= nweight71;
weight72 <= nweight72;
weight73 <= nweight73;
weight74 <= nweight74;
weight75 <= nweight75;
weight76 <= nweight76;
weight77 <= nweight77;
weight78 <= nweight78;
weight79 <= nweight79;
weight80 <= nweight80;
weight81 <= nweight81;
weight82 <= nweight82;
weight83 <= nweight83;
weight84 <= nweight84;
weight85 <= nweight85;
weight86 <= nweight86;
weight87 <= nweight87;
weight88 <= nweight88;
weight89 <= nweight89;
weight90 <= nweight90;
weight91 <= nweight91;
weight92 <= nweight92;
weight93 <= nweight93;
weight94 <= nweight94;
weight95 <= nweight95;
weight96 <= nweight96;
weight97 <= nweight97;
weight98 <= nweight98;
weight99 <= nweight99;
weight100 <= nweight100;
weight101 <= nweight101;
weight102 <= nweight102;
weight103 <= nweight103;
weight104 <= nweight104;
weight105 <= nweight105;
weight106 <= nweight106;
weight107 <= nweight107;
weight108 <= nweight108;
weight109 <= nweight109;
weight110 <= nweight110;
weight111 <= nweight111;
weight112 <= nweight112;
weight113 <= nweight113;
weight114 <= nweight114;
weight115 <= nweight115;
weight116 <= nweight116;
weight117 <= nweight117;
weight118 <= nweight118;
weight119 <= nweight119;
weight120 <= nweight120;
weight121 <= nweight121;
weight122 <= nweight122;
weight123 <= nweight123;
weight124 <= nweight124;
weight125 <= nweight125;
weight126 <= nweight126;
weight127 <= nweight127;
		end
	end
assign refresh_weights = (~|weight0) & (~|weight1) & (~|weight2) & (~|weight3) & (~|weight4) & (~|weight5) & (~|weight6) & (~|weight7) & (~|weight8) & (~|weight9) & (~|weight10) & (~|weight11) & (~|weight12) & (~|weight13) & (~|weight14) & (~|weight15) & (~|weight16) & (~|weight17) & (~|weight18) & (~|weight19) & (~|weight20) & (~|weight21) & (~|weight22) & (~|weight23) & (~|weight24) & (~|weight25) & (~|weight26) & (~|weight27) & (~|weight28) & (~|weight29) & (~|weight30) & (~|weight31) & (~|weight32) & (~|weight33) & (~|weight34) & (~|weight35) & (~|weight36) & (~|weight37) & (~|weight38) & (~|weight39) & (~|weight40) & (~|weight41) & (~|weight42) & (~|weight43) & (~|weight44) & (~|weight45) & (~|weight46) & (~|weight47) & (~|weight48) & (~|weight49) & (~|weight50) & (~|weight51) & (~|weight52) & (~|weight53) & (~|weight54) & (~|weight55) & (~|weight56) & (~|weight57) & (~|weight58) & (~|weight59) & (~|weight60) & (~|weight61) & (~|weight62) & (~|weight63) & (~|weight64) & (~|weight65) & (~|weight66) & (~|weight67) & (~|weight68) & (~|weight69) & (~|weight70) & (~|weight71) & (~|weight72) & (~|weight73) & (~|weight74) & (~|weight75) & (~|weight76) & (~|weight77) & (~|weight78) & (~|weight79) & (~|weight80) & (~|weight81) & (~|weight82) & (~|weight83) & (~|weight84) & (~|weight85) & (~|weight86) & (~|weight87) & (~|weight88) & (~|weight89) & (~|weight90) & (~|weight91) & (~|weight92) & (~|weight93) & (~|weight94) & (~|weight95) & (~|weight96) & (~|weight97) & (~|weight98) & (~|weight99) & (~|weight100) & (~|weight101) & (~|weight102) & (~|weight103) & (~|weight104) & (~|weight105) & (~|weight106) & (~|weight107) & (~|weight108) & (~|weight109) & (~|weight110) & (~|weight111) & (~|weight112) & (~|weight113) & (~|weight114) & (~|weight115) & (~|weight116) & (~|weight117) & (~|weight118) & (~|weight119) & (~|weight120) & (~|weight121) & (~|weight122) & (~|weight123) & (~|weight124) & (~|weight125) & (~|weight126) & (~|weight127);


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
assign nweight64 = refresh_weights ? cfg_weight64 :  (req[64] & gnt[64]) ? weight64 - 1'b1 :   weight64;
assign nweight65 = refresh_weights ? cfg_weight65 :  (req[65] & gnt[65]) ? weight65 - 1'b1 :   weight65;
assign nweight66 = refresh_weights ? cfg_weight66 :  (req[66] & gnt[66]) ? weight66 - 1'b1 :   weight66;
assign nweight67 = refresh_weights ? cfg_weight67 :  (req[67] & gnt[67]) ? weight67 - 1'b1 :   weight67;
assign nweight68 = refresh_weights ? cfg_weight68 :  (req[68] & gnt[68]) ? weight68 - 1'b1 :   weight68;
assign nweight69 = refresh_weights ? cfg_weight69 :  (req[69] & gnt[69]) ? weight69 - 1'b1 :   weight69;
assign nweight70 = refresh_weights ? cfg_weight70 :  (req[70] & gnt[70]) ? weight70 - 1'b1 :   weight70;
assign nweight71 = refresh_weights ? cfg_weight71 :  (req[71] & gnt[71]) ? weight71 - 1'b1 :   weight71;
assign nweight72 = refresh_weights ? cfg_weight72 :  (req[72] & gnt[72]) ? weight72 - 1'b1 :   weight72;
assign nweight73 = refresh_weights ? cfg_weight73 :  (req[73] & gnt[73]) ? weight73 - 1'b1 :   weight73;
assign nweight74 = refresh_weights ? cfg_weight74 :  (req[74] & gnt[74]) ? weight74 - 1'b1 :   weight74;
assign nweight75 = refresh_weights ? cfg_weight75 :  (req[75] & gnt[75]) ? weight75 - 1'b1 :   weight75;
assign nweight76 = refresh_weights ? cfg_weight76 :  (req[76] & gnt[76]) ? weight76 - 1'b1 :   weight76;
assign nweight77 = refresh_weights ? cfg_weight77 :  (req[77] & gnt[77]) ? weight77 - 1'b1 :   weight77;
assign nweight78 = refresh_weights ? cfg_weight78 :  (req[78] & gnt[78]) ? weight78 - 1'b1 :   weight78;
assign nweight79 = refresh_weights ? cfg_weight79 :  (req[79] & gnt[79]) ? weight79 - 1'b1 :   weight79;
assign nweight80 = refresh_weights ? cfg_weight80 :  (req[80] & gnt[80]) ? weight80 - 1'b1 :   weight80;
assign nweight81 = refresh_weights ? cfg_weight81 :  (req[81] & gnt[81]) ? weight81 - 1'b1 :   weight81;
assign nweight82 = refresh_weights ? cfg_weight82 :  (req[82] & gnt[82]) ? weight82 - 1'b1 :   weight82;
assign nweight83 = refresh_weights ? cfg_weight83 :  (req[83] & gnt[83]) ? weight83 - 1'b1 :   weight83;
assign nweight84 = refresh_weights ? cfg_weight84 :  (req[84] & gnt[84]) ? weight84 - 1'b1 :   weight84;
assign nweight85 = refresh_weights ? cfg_weight85 :  (req[85] & gnt[85]) ? weight85 - 1'b1 :   weight85;
assign nweight86 = refresh_weights ? cfg_weight86 :  (req[86] & gnt[86]) ? weight86 - 1'b1 :   weight86;
assign nweight87 = refresh_weights ? cfg_weight87 :  (req[87] & gnt[87]) ? weight87 - 1'b1 :   weight87;
assign nweight88 = refresh_weights ? cfg_weight88 :  (req[88] & gnt[88]) ? weight88 - 1'b1 :   weight88;
assign nweight89 = refresh_weights ? cfg_weight89 :  (req[89] & gnt[89]) ? weight89 - 1'b1 :   weight89;
assign nweight90 = refresh_weights ? cfg_weight90 :  (req[90] & gnt[90]) ? weight90 - 1'b1 :   weight90;
assign nweight91 = refresh_weights ? cfg_weight91 :  (req[91] & gnt[91]) ? weight91 - 1'b1 :   weight91;
assign nweight92 = refresh_weights ? cfg_weight92 :  (req[92] & gnt[92]) ? weight92 - 1'b1 :   weight92;
assign nweight93 = refresh_weights ? cfg_weight93 :  (req[93] & gnt[93]) ? weight93 - 1'b1 :   weight93;
assign nweight94 = refresh_weights ? cfg_weight94 :  (req[94] & gnt[94]) ? weight94 - 1'b1 :   weight94;
assign nweight95 = refresh_weights ? cfg_weight95 :  (req[95] & gnt[95]) ? weight95 - 1'b1 :   weight95;
assign nweight96 = refresh_weights ? cfg_weight96 :  (req[96] & gnt[96]) ? weight96 - 1'b1 :   weight96;
assign nweight97 = refresh_weights ? cfg_weight97 :  (req[97] & gnt[97]) ? weight97 - 1'b1 :   weight97;
assign nweight98 = refresh_weights ? cfg_weight98 :  (req[98] & gnt[98]) ? weight98 - 1'b1 :   weight98;
assign nweight99 = refresh_weights ? cfg_weight99 :  (req[99] & gnt[99]) ? weight99 - 1'b1 :   weight99;
assign nweight100 = refresh_weights ? cfg_weight100 :  (req[100] & gnt[100]) ? weight100 - 1'b1 :   weight100;
assign nweight101 = refresh_weights ? cfg_weight101 :  (req[101] & gnt[101]) ? weight101 - 1'b1 :   weight101;
assign nweight102 = refresh_weights ? cfg_weight102 :  (req[102] & gnt[102]) ? weight102 - 1'b1 :   weight102;
assign nweight103 = refresh_weights ? cfg_weight103 :  (req[103] & gnt[103]) ? weight103 - 1'b1 :   weight103;
assign nweight104 = refresh_weights ? cfg_weight104 :  (req[104] & gnt[104]) ? weight104 - 1'b1 :   weight104;
assign nweight105 = refresh_weights ? cfg_weight105 :  (req[105] & gnt[105]) ? weight105 - 1'b1 :   weight105;
assign nweight106 = refresh_weights ? cfg_weight106 :  (req[106] & gnt[106]) ? weight106 - 1'b1 :   weight106;
assign nweight107 = refresh_weights ? cfg_weight107 :  (req[107] & gnt[107]) ? weight107 - 1'b1 :   weight107;
assign nweight108 = refresh_weights ? cfg_weight108 :  (req[108] & gnt[108]) ? weight108 - 1'b1 :   weight108;
assign nweight109 = refresh_weights ? cfg_weight109 :  (req[109] & gnt[109]) ? weight109 - 1'b1 :   weight109;
assign nweight110 = refresh_weights ? cfg_weight110 :  (req[110] & gnt[110]) ? weight110 - 1'b1 :   weight110;
assign nweight111 = refresh_weights ? cfg_weight111 :  (req[111] & gnt[111]) ? weight111 - 1'b1 :   weight111;
assign nweight112 = refresh_weights ? cfg_weight112 :  (req[112] & gnt[112]) ? weight112 - 1'b1 :   weight112;
assign nweight113 = refresh_weights ? cfg_weight113 :  (req[113] & gnt[113]) ? weight113 - 1'b1 :   weight113;
assign nweight114 = refresh_weights ? cfg_weight114 :  (req[114] & gnt[114]) ? weight114 - 1'b1 :   weight114;
assign nweight115 = refresh_weights ? cfg_weight115 :  (req[115] & gnt[115]) ? weight115 - 1'b1 :   weight115;
assign nweight116 = refresh_weights ? cfg_weight116 :  (req[116] & gnt[116]) ? weight116 - 1'b1 :   weight116;
assign nweight117 = refresh_weights ? cfg_weight117 :  (req[117] & gnt[117]) ? weight117 - 1'b1 :   weight117;
assign nweight118 = refresh_weights ? cfg_weight118 :  (req[118] & gnt[118]) ? weight118 - 1'b1 :   weight118;
assign nweight119 = refresh_weights ? cfg_weight119 :  (req[119] & gnt[119]) ? weight119 - 1'b1 :   weight119;
assign nweight120 = refresh_weights ? cfg_weight120 :  (req[120] & gnt[120]) ? weight120 - 1'b1 :   weight120;
assign nweight121 = refresh_weights ? cfg_weight121 :  (req[121] & gnt[121]) ? weight121 - 1'b1 :   weight121;
assign nweight122 = refresh_weights ? cfg_weight122 :  (req[122] & gnt[122]) ? weight122 - 1'b1 :   weight122;
assign nweight123 = refresh_weights ? cfg_weight123 :  (req[123] & gnt[123]) ? weight123 - 1'b1 :   weight123;
assign nweight124 = refresh_weights ? cfg_weight124 :  (req[124] & gnt[124]) ? weight124 - 1'b1 :   weight124;
assign nweight125 = refresh_weights ? cfg_weight125 :  (req[125] & gnt[125]) ? weight125 - 1'b1 :   weight125;
assign nweight126 = refresh_weights ? cfg_weight126 :  (req[126] & gnt[126]) ? weight126 - 1'b1 :   weight126;
assign nweight127 = refresh_weights ? cfg_weight127 :  (req[127] & gnt[127]) ? weight127 - 1'b1 :   weight127;



endmodule
