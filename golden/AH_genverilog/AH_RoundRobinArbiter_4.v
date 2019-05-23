
module AH_RoundRobinArbiter_4 (req
,gnt);

input [3:0] req;
output [3:0] gnt;


/f_f/
if(weight != None):
    code="\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/
reg	[1:0]	rotate_ptr;
reg	[3:0]	shift_req;
reg	[3:0]	shift_grant;
reg	[3:0]	grant_comb;
reg	[3:0]	grant;

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
	if (!rst_n)	grant[3:0] <= 4'b0;
	else		grant[3:0] <= grant_comb[3:0] & ~grant[3:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[1:0] <= 2'b0;
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




reg	[1:0]	rotate_ptr;
reg	[3:0]	shift_req;
reg	[3:0]	shift_grant;
reg	[3:0]	grant_comb;
reg	[3:0]	grant;




always @ (*)
begin
case (rotate_ptr[1:0])
			2'b00: shift_req[3:0] = req[3:0];
			2'b01: shift_req[3:0] = {req[0],req[3:1]};
			2'b10: shift_req[3:0] = {req[1:0],req[3:2]};
			2'b11: shift_req[3:0] = {req[2:0],req[3]};

	endcase
end

always @ (*)
begin
shift_grant[3:0] = 4'b0;
			if (shift_req[0])	shift_grant[0] = 1'b1;
			else if (shift_req[1])	shift_grant[1] = 1'b1;
			else if (shift_req[2])	shift_grant[2] = 1'b1;
			else if (shift_req[3])	shift_grant[3] = 1'b1;
			

	endcase
end

always @ (*)
begin
case (rotate_ptr[1:0])
			2'b00: grant_comb[3:0] = shift_grant[3:0];
			2'b01: grant_comb[3:0] = {shift_grant[2:0],shift_grant[3]};
			2'b10: grant_comb[3:0] = {shift_grant[1:0],shift_grant[3:2]};
			2'b11: grant_comb[3:0] = {shift_grant[0],shift_grant[3:1]};


    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[3:0] <= 4'b0;
	else		grant[3:0] <= grant_comb[3:0] & ~grant[3:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[1:0] <= 2'b0;
	else
		case (1'b1) // synthesis parallel_case
grant[0]: rotate_ptr[1:0] <= 2'd1;
			grant[1]: rotate_ptr[1:0] <= 2'd2;
			grant[2]: rotate_ptr[1:0] <= 2'd3;
			grant[3]: rotate_ptr[1:0] <= 2'd0;
			

		endcase
end






endmodule
