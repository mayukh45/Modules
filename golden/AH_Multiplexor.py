import os
#from templates import mux_body_template
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path
from math import log2, ceil
import sys


class Multiplexor(BasicModule,BusParser):
    ## creating dictonary of variable
    def Create_dic_of_variable(self):
        self.variable_dict['portwidth']=self.PortWidth
        self.variable_dict['numclients']=self.NumClients
        self.variable_dict['isdemux']=self.IsDemux
        self.variable_dict['isbinary']=self.IsBinary

    #It's assumed that the original mux-demux yaml file will have 2 egress ports at least. The rest has to be added. 
    # Then the yaml is demux - so ingress and egress keys swap name if we need to provide a mux
    def add_ports_from_bus(self):
        self.copy_flat("egress1", "egress"+str(i)) if(numclients > 2) for i in range(2, self.NumClients-1)
        self.rename_flat("egress"+str(i), "ingress"+str(i)) if (self.IsDemux is None) for i in range self.NumClients
        self.rename_flat("ingress", "egress") if self.IsDemux is none
        self.init_connections(self.dict)
        self.get_all_key_value_pairs(self.dict)
        



    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.muxdemuxbody) # passing dictonary and snoopbody to split the body
        self.body+=dynamicgenerator.parse_body()
        self.body = self.body.replace("NAME", "mux" if self.IsDemux is None else "demux")
        self.body = self.body.replace("MUXPORTWIDTH", str(self.PortWidth))
        self.body = self.body.replace("MUXNUMCLIENTS", str(self.NumClients))
        dynamicgenerator.silentremove()

    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()


    def __init__(self, portwidth, numclients, isdemux, isbinary):
        self.PortWidth = portwidth
        self.NumClients = numclients
        self.IsDemux = isdemux
        self.body = None
        self.IsBinary = isbinary

        self.curName = "mux" if self.IsDemux is None else "demux"
        #if(isDemux)
        #  self.curName = "demux" 
        #else
        #  self.curName = "mux"

        self.name = "AH_"+self.curName+"_"+str(portwidth)+"_"+str(numclients)+"_"+str(isBinary)
        BasicModule.__init__(self, self.name)
        self.body = ""
        self.EncodedDepth = int(ceil(log2(numclients)))
        self.variable_dict={}
        self.Create_dic_of_variable()
        BusParser.__init__(self, path_of_yaml, bus_name)
        self.add_ports_from_bus()

        self.muxdemuxbody = """

// Ingress and Egress are short circuited based on condition

/f_f/

if self.IsDemux:
    code += "wire assign egress"+str(i)+"_ds_pkt       = (demux_select== "+str(self.EncodedDepth)"'d"+str(i)+") ? ingress_ds_pkt       : "+str(self.EncodedDepth)+"'d0;" for i in range(self.NumClients) 
    code += "wire assign egress"+str(i)+"_ds_pkt_valid = (demux_select== "+str(self.EncodedDepth)"'d"+str(i)+") ? ingress_ds_pkt_valid : "+str(self.EncodedDepth)+"'d0;" for i in range(self.NumClients) 
    code += ""
    code += "wire assign ingress_ds_pkt_ready          ="
    code += "                                           ((demux_select== "+str(self.EncodedDepth)"'d"+str(i)+") ? egress1_ds_pkt_ready ? 1'b0) | " for i in range(self.NumClients) 
    code += "                                            1'b0;"

else:

    code += "wire assign egress_ds_pkt            ="
    code += "                                      ((mux_select== "+str(self.EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(self.EncodedDepth)+"'d0 ) |" for i in range(self.NumClients)
    code += "                                      "+str(self.EncodedDepth)+"'d0;"
    code += ""
    code += "wire assign egress_ds_pkt_valid      ="
    code += "                                      ((mux_select== "+str(self.EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(self.EncodedDepth)+"'d0 ) |" for i in range(self.NumClients)
    code += "                                      "+str(self.EncodedDepth)+"'d0;"
    code += ""
    code += "wire assign ingress"+str(self.EncodedDepth)+"_ds_pkt_ready = (mux_select== "+str(self.EncodedDepth)+"'d"+str(i)+") ? egress_ds_pkt_ready : 1'b0;" for i in range(self.NumClients)
    code += ""

/f_f/

"""

muxdemux=Multiplexor(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]),sys.argv[4],sys.argv[5])
muxdemux.main()



    ####def get_body(self):
    ####    self.body = mux_body_template
    ####    self.declare_ports()
    ####    self.declare_vectors()
    ####    self.assign_data()

    ####def declare_ports(self):

    ####    if not self.IsDemux:
    ####        code = "\n".join(["in_data"+str(i)+"," for i in range(self.NumClients)])
    ####        code += "\nout_data,\nmux_select"
    ####    else:
    ####        code = "\n".join(["out_data" + str(i) + "," for i in range(self.NumClients)])
    ####        code += "\nin_data,\ndemux_select"

    ####    self.body = self.body.replace("//PORT_DECLARATION", code)

    ####def declare_vectors(self):
    ####    if not self.IsDemux:
    ####        code = "\n".join(["input ["+str(self.PortWidth-1)+":0] in_data"+str(i)+";" for i in range(self.NumClients)])
    ####        code += "\noutput ["+str(self.PortWidth-1)+":0] out_data;\ninput ["+(str(self.NumClients-1) if not self.IsBinary else str(int(ceil(log2(self.NumClients-1)))))+":0] mux_select;"
    ####    else:
    ####        code = "\n".join(["output [" + str(self.PortWidth - 1) + ":0] out_data" + str(i) + ";" for i in range(self.NumClients)])
    ####        code += "\ninput ["+str(self.PortWidth-1)+":0] in_data;\ninput ["+(str(self.NumClients-1) if not self.IsBinary else str(int(ceil(log2(self.NumClients-1)))))+":0] demux_select;"

    ####    self.body = self.body.replace("//VECTOR_DECLARATION", code)

    ####def assign_data(self):
    ####    if not self.IsDemux:
    ####        code = "wire assign out_data = "+str(self.PortWidth)+"'d0 |" + " |\n ".join(["(mux_select"+("["+str(i)+"]" if not self.IsBinary else "= "+str(int(ceil(log2(self.NumClients))))+"'d"+str(i)+"") +"? in_data"+str(i)+" : "+str(self.PortWidth)+"'d0)" for i in range(self.NumClients)])
    ####    else:
    ####        code = "\n".join(["wire assign out_data"+str(i)+" = demux_select"+("["+str(i)+"]" if not self.IsBinary else "=="+str(int(ceil(log2(self.NumClients))))+"'d"+str(i))+"? in_data : 25'd0;" for i in range(self.NumClients)])

    ####    self.body = self.body.replace("//ASSIGN_DATA", code)

    ####def __str__(self):
    ####    self.get_body()
    ####    return self.body


    ####def __init__(self, fifowidth, fifodepth, snoopwidth, path_of_yaml, bus_name):
    ####    self.FifoWidth = fifowidth
    ####    self.FifoDepth = fifodepth
    ####    self.SnoopWidth = snoopwidth
    ####    self.name = "AH_"+self.__class__.__name__+"_"+str(fifowidth)+"_"+str(fifodepth)+"_"+str(snoopwidth)
    ####    BasicModule.__init__(self, self.name)
    ####    self.body = ""
    ####    self.EncodedDepth = int(ceil(log2(fifodepth)))
    ####    self.variable_dict={}
    ####    self.Create_dic_of_variable()
    ####    BusParser.__init__(self, path_of_yaml, bus_name)
    ####    self.add_ports_from_bus()

