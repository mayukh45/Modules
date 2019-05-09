import sys
import os
from smartasic import BasicModule,Port
from math import log2,ceil
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path

class RoundRobinArbiter(BasicModule):
    
    def Create_dic_of_variable(self):
        self.variable_dict['Num_Clients']=self.Num_Clients 
        self.variable_dict['EncodedNum_Clients']=self.EncodedNum_Clients
        self.variable_dict['weight']=self.weight

    def add_ports_from_bus(self, filepath, bus_name):
        parser = BusParser(filepath, bus_name)
        parser.wid_op_flat("req",self.Num_Clients)
        parser.rename_flat('gnt',"grant")
        parser.wid_op_flat("grant",self.Num_Clients)
        parser.remove_sub_dict_flat("gnt_busy")
        self.get_all_key_value_pairs(parser.dict)

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.arbiter_body)
        self.body+=dynamicgenerator.parse_body()
        self.body= self.body.replace("ENCODEDNUMCLIENTS - 1", str(self.EncodedNum_Clients - 1))
        self.body= self.body.replace("ENCODEDNUMCLIENTS", str(self.EncodedNum_Clients))
        self.body = self.body.replace("NUMCLIENTS - 1", str(self.Num_Clients - 1))
        self.body = self.body.replace("NUMCLIENTS", str(self.Num_Clients))
        dynamicgenerator.silentremove()

    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()


    def __init__(self,num_clients,path_of_yaml,bus_name,weight=None):
        self.bus_name=bus_name
        self.Num_Clients=num_clients
        self.weight = weight
        if weight==None:
            self.name="AH_"+self.__class__.__name__+"_"+str(num_clients)
        else:
            self.name="AH_"+self.__class__.__name__+"_"+str(num_clients)+"_"+str(weight)
        super().__init__(self.name)
        self.EncodedNum_Clients = int(ceil(log2(self.Num_Clients)))
        
        self.variable_dict={}
        self.Create_dic_of_variable()
        self.body=""
        self.add_ports_from_bus(path_of_yaml,bus_name)
        self.arbiter_body="""
/f_f/
if(weight != None):
    code="\\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/
reg	[ENCODEDNUMCLIENTS - 1:0]	rotate_ptr;  
reg	[NUMCLIENTS - 1:0]	shift_req;
reg	[NUMCLIENTS - 1:0]	shift_grant;
reg	[NUMCLIENTS - 1:0]	grant_comb;
reg	[NUMCLIENTS - 1:0]	grant;

/f_f/
if(weight != None):
    code="\\n".join(["input ["+str(weight)+":0] cfg_weight"+str(i)+";"  for i in range(Num_Clients)])
else:
    code=""
/f_f/

always @ (*)
begin
/f_f/
code="case (rotate_ptr["+str(EncodedNum_Clients - 1)+":0])\\n\t\t\t" \
                        + str(EncodedNum_Clients)+"'b"+"0"*EncodedNum_Clients + ": shift_req["+str(Num_Clients-1)+":0] = " \
                        "req["+str(Num_Clients-1)+":0];\\n\t\t\t" + \
                        str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-1)+"1: shift_req[" + str(Num_Clients-1)+":0] = " \
                        "{req[0],req["+str(Num_Clients-1)+":1]};\\n\t\t\t"
for i in range(2, Num_Clients-1):
    code+=str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-len(bin(i)[2:]))+bin(i)[2:]+":" \
                            " shift_req["+str(Num_Clients-1)+":0] = {req["+str(i-1)+":0],req["+str(Num_Clients-1)+":" \
                            + str(i)+"]};\\n\t\t\t"
    
code+=str(EncodedNum_Clients)+"'b"+bin(Num_Clients-1)[2:]+": shift_req["+str(Num_Clients-1)+":0] = " \
                         "{req["+str(Num_Clients-2)+":0],req["+str(Num_Clients-1)+"]};"
/f_f/
	endcase
end

always @ (*)
begin
/f_f/
code="shift_grant["+str(Num_Clients-1)+":0] = " +str(Num_Clients)+"" \
                            "'b0;\\n\t\t\tif (shift_req[0])	shift_grant[0] = 1'b1;\\n\t\t\t"
for i in range(1,Num_Clients):
    code += "else if (shift_req["+str(i)+"])	shift_grant["+str(i)+"] = 1'b1;\\n\t\t\t"    
/f_f/
	endcase
end

always @ (*)
begin
/f_f/
code="case (rotate_ptr["+str(EncodedNum_Clients - 1)+":0])\\n\t\t\t" \
                        + str(EncodedNum_Clients)+"'b"+"0"*EncodedNum_Clients + ": grant_comb["+str(Num_Clients-1)+":0] = " \
                        "shift_grant["+str(Num_Clients-1)+":0];\\n\t\t\t" + \
                        str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-1)+"1: grant_comb[" + str(Num_Clients-1)+":0] = " \
                        "{shift_grant["+str(Num_Clients-2)+":0]," \
                        "shift_grant["+str(Num_Clients-1)+"]};\\n\t\t\t"

for i in range(Num_Clients-3, 0, -1):
    code += str(EncodedNum_Clients)+"'b"+"0"*(EncodedNum_Clients-len(bin(Num_Clients-i-1)[2:]))+bin(Num_Clients-i-1)[2:]+":" \
                            " grant_comb["+str(Num_Clients-1)+":0] = {shift_grant["+str(i)+":0],shift_grant["+str(Num_Clients-1)+":" \
                            + str(i+1)+"]};\\n\t\t\t"
code += str(EncodedNum_Clients)+"'b"+bin(Num_Clients-1)[2:]+":" \
                            " grant_comb["+str(Num_Clients-1)+":0] = {shift_grant[0],shift_grant["+str(Num_Clients-1)+":1]};\\n"
/f_f/
    endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[NUMCLIENTS - 1:0] <= NUMCLIENTS'b0;
	else		grant[NUMCLIENTS - 1:0] <= grant_comb[NUMCLIENTS - 1:0] & ~grant[NUMCLIENTS - 1:0];
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[ENCODEDNUMCLIENTS - 1:0] <= ENCODEDNUMCLIENTS'b0;
	else 
		case (1'b1) // synthesis parallel_case
/f_f/
code=""
for i in range(Num_Clients):
    code += "grant["+str(i)+"]: rotate_ptr["+str(EncodedNum_Clients-1)+":0] <= " \
             + ("| nweight"+str(i)+" ?  : rotate_ptr :" if weight is not None else "")+str(EncodedNum_Clients)+"'d"+str((i+1) % Num_Clients)+";"+"\\n\t\t\t"

/f_f/
		endcase
end
/f_f/
code=""
if(weight!=None):
    code+="\\nalways @ (posedge clk or negedge rst_an) \\n\tbegin \\n if (!rst_an) begin "
    code+="\\n".join(["weight" + str(i) + " <= "+str(weight+1)+"'d0;" for i in range(Num_Clients)])
    code+="\\nend else begin"
    code+="\\n".join(["weight" + str(i) + " <= " + "nweight" + str(i) + ";" for i in range(Num_Clients)])
    code+="\\n\t\tend\\n\tend\\nassign refresh_weights = "
    code+= " & ".join(["(~|weight" + str(i)+")" for i in range(Num_Clients)]) + ";"
/f_f/

/f_f/
code=""
if(weight!=None):
    for i in range(Num_Clients):
        code += "assign nweight"+str(i)+" = refresh_weights ? cfg_weight"+str(i)+" :  (req["+str(i)+"] & gnt["+str(i)+"]) ? weight"+str(i)+" - 1'b1 :   weight"+str(i)+";\\n"
/f_f/
"""

if len(sys.argv) > 4:

    #print(RoundRobinArbiter(int(sys.argv[1]),sys.argv[2], sys.argv[3],int(sys.argv[4])))
    roundrobinarbiter=RoundRobinArbiter(int(sys.argv[1]),sys.argv[2], sys.argv[3],int(sys.argv[4]))
else:
    #print(RoundRobinArbiter(int(sys.argv[1]), sys.argv[2], sys.argv[3]))
    roundrobinarbiter=RoundRobinArbiter(int(sys.argv[1]), sys.argv[2], sys.argv[3])
roundrobinarbiter.main()

    
