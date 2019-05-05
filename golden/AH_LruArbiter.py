import sys
import os
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path

class LruArbiter(BasicModule):
    #=========================================================================   
    # Overwrite the add_ports_from_bus method here.
    # Create the instance of busparser class.
    # Then use the wid_op method to change the port width req, gnt, gnt_busy signals.
    #=========================================================================
    
    ###### creating dictonary of variable
    def Create_dic_of_variable(self):
        self.variable_dict['Num_Clients']=self.Num_Clients

    def add_ports_from_bus(self, filepath, bus_name):
        parser = BusParser(filepath, bus_name)
        parser.wid_op_flat("req",self.Num_Clients)
        parser.wid_op_flat("gnt",self.Num_Clients)
        parser.wid_op_flat("gnt_busy",self.Num_Clients)
        self.get_all_key_value_pairs(parser.dict) 

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.LruArbiterBody)
        self.body+=dynamicgenerator.parse_body()
        self.body = self.body.replace("NUMCLIENTS - 1", str(self.Num_Clients -1))
        dynamicgenerator.silentremove()

    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()

    def __init__(self,num_clients,path_of_yaml,bus_name):
        self.bus_name=bus_name
        self.Num_Clients=num_clients
        self.variable_dict={}
        self.name="AH_"+self.__class__.__name__+"_"+str(num_clients)
        super().__init__(self.name)
        self.body=""
        self.Create_dic_of_variable()
        self.add_ports_from_bus(path_of_yaml,bus_name)
        self.LruArbiterBody = """
/f_f/
code = "\\n"+"\\n".join(["req ["+str(Num_Clients-1)+":0] req"+str(i)+"_used_status;" for i in range(Num_Clients)])
/f_f/
always @(posedge clk, negedge rstn) begin
        if(~rstn) begin	
/f_f/

code=""
for i in range(Num_Clients):
    code+="\\n\treq"+str(i)+"_used_status <= "+str(Num_Clients)+"'d"+str(Num_Clients-i)+";"

/f_f/
        end
        else begin
/f_f/
code="\\n\tgnt_pre["+str(Num_Clients-1)+":0] = "+str(Num_Clients)+"'d0\\n\treq_int["+str(Num_Clients-1)+":0]= req["+str(Num_Clients)+":0] & {"+str(Num_Clients)+"{gnt_busy}};"
for i in range(Num_Clients):
    code+="\\n\tif(req["+str(i)+"]) begin"
    code+="\\n\t\tgnt_pre["+str(i)+"] = (req"+str(i)+"_used_status=="+str(Num_Clients)+") ? 1'b1 |\\n"
    for j in range(Num_Clients):
        if i==j:
            continue
        else:
            code+="\\n\t((req"+str(j)+" & (req"+str(j)+"_used_status > req"+str(i)+"_used_status)) ?1'b0 |"
    code+="\\n\t\t1'b1;\\n\tend"
/f_f/          
always @(req, gnt_busy) begin
/f_f/
code="\\n\tgnt_pre["+str(Num_Clients-1)+":0] = "+str(Num_Clients)+"'d0\\n\treq_int["+str(Num_Clients-1)+":0]= req["+str(Num_Clients)+":0] & {"+str(Num_Clients)+"{gnt_busy}};"
for i in range(Num_Clients):
    code+="\\n\tif(req["+str(i)+"]) begin"
    code+="\\n\t\tgnt_pre["+str(i)+"] = (req"+str(i)+"_used_status=="+str(Num_Clients)+") ? 1'b1 |\\n"
    for j in range(Num_Clients):
        if i==j:
            continue
        else:
            code+="\\n\t((req"+str(j)+" & (req"+str(j)+"_used_status > req"+str(i)+"_used_status)) ?1'b0 |"
    code+="\\n\t\t1'b1;\\n\tend"
/f_f/
assign gnt[NUMCLIENTS - 1:0] = gnt_pre[NUMCLIENTS - 1:0];
"""

lb=LruArbiter(int(sys.argv[1]),sys.argv[2],sys.argv[3])
lb.main()
