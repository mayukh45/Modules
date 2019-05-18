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
        self.variable_dict['PortWidth']=self.PortWidth
        self.variable_dict['NumClients']=self.NumClients
        self.variable_dict['IsDemux']=self.IsDemux
        self.variable_dict['IsBinary']=self.IsBinary
        self.variable_dict['EncodedDepth']=self.EncodedDepth

    #It's assumed that the original mux-demux yaml file will have 2 egress ports at least. The rest has to be added.
    # Then the yaml is demux - so ingress and egress keys swap name if we need to provide a mux
    def add_ports_from_bus(self):
        #self.copy_flat("egress1", "egress"+str(i))
        print(self.dict)
        self.dyaml("1.yaml")
        print("I am going to operate on this dict now")

        ##if(self.NumClients > 2):
        ##    for i in range(2, self.NumClients-1):

        ##print(self.dict)
        ##self.dyaml("1_1.yaml")
        ##print("I am going to operate on this dict (2)")
        #self.rename("egress2.egr1_data" , "egress2.egr2_data" )


        if(self.NumClients > 2):
            for i in range(2, self.NumClients-1):
                self.copy_flat("egress1", "egress"+str(i))
                self.rename("demux.egress"+str(i)+".egr1_data" , "egr"+str(i)+"_data" )
                self.rename("demux.egress"+str(i)+".egr1_valid", "egr"+str(i)+"_valid")
                self.rename("demux.egress"+str(i)+".egr1_ready", "egr"+str(i)+"_ready")

        self.widop_flat("ing_data",self.PortWidth)
        for i in range(0, self.NumClients-1):
            self.widop_flat("egr"+str(i)+"_data",self.PortWidth)

        print(self.dict)
        print("I am going to operate on this dict again")
        self.dyaml("2.yaml")

        print("This is the self.IsDemux value --"+self.IsDemux)

        if self.IsDemux is False:
            for i in range (self.NumClients):
                self.rename_flat("egress"+str(i), "ingress"+str(i))
                self.rename("demux.ingress"+str(i)+".egr"+str(i)+"_data" , "ing"+str(i)+"_data" )
                self.rename("demux.ingress"+str(i)+".egr"+str(i)+"_valid", "ing"+str(i)+"_valid")
                self.rename("demux.ingress"+str(i)+".egr"+str(i)+"_ready", "ing"+str(i)+"_ready")

        print(self.dict)
        print("I am going to operate on this dict again(2)")
        self.dyaml("3.yaml")

        if not self.IsDemux:
            self.rename_flat("ingress", "egress")
            print(self.dict)
            print("I am going to operate on this dict again(3)")
            self.dyaml("3_3.yaml")
            self.rename("demux.egress.ing_data" , "egr_data" )
            self.rename("demux.egress.ing_valid", "egr_valid")
            self.rename("demux.egress.ing_ready", "egr_ready")

            self.rename_flat("demux", "mux")

        print(self.dict)
        self.dyaml("4.yaml")
        print("I am done with this dict")
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
        print("I am about to write a verilog file now")
        self.write_to_file(self.get_verilog())
        print (self.get_verilog())
        return self.get_verilog()

    def __init__(self, portwidth, numclients, isdemux, isbinary, path_of_yaml=None, bus_name=None):
        self.PortWidth = portwidth
        self.NumClients = numclients
        self.IsDemux = isdemux
        self.body = None
        self.IsBinary = isbinary

        if path_of_yaml is None:
              path_of_yaml = "../../../smartasic2/refbuses/mux_demux.yaml"
              bus_name = "mux_demux"

        self.curName = "mux" if self.IsDemux is None else "demux"

        self.name = "AH_"+self.curName+"_"+str(self.PortWidth)+"_"+str(self.NumClients)+"_"+str(self.IsBinary)
        print("Just checking what is the file name..")
        print (self.name)
        BasicModule.__init__(self, self.name)
        self.body = ""
        self.EncodedDepth = int(ceil(log2(numclients)))
        self.variable_dict={}
        self.Create_dic_of_variable()
        BusParser.__init__(self, self.load_dict(path_of_yaml), bus_name)
        self.add_ports_from_bus()

        self.muxdemuxbody = """

// Ingress and Egress are short circuited based on condition

/f_f/
code = ""

if IsDemux:
    for i in range(NumClients):
        code += "\\nwire assign egress"+str(i)+"_ds_pkt       = (demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress_ds_pkt       : "+str(EncodedDepth)+"'d0;"

    for i in range(NumClients) :
        code += "\\nwire assign egress"+str(i)+"_ds_pkt_valid = (demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress_ds_pkt_valid : "+str(EncodedDepth)+"'d0;"

    code += "\\n"
    code += "\\nwire assign ingress_ds_pkt_ready          ="

    for i in range(NumClients):
        code += "\\n                                           ((demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? egress1_ds_pkt_ready ? 1'b0) | "

    code += "\\n                                            1'b0;"

else:

    code += "\\nwire assign egress_ds_pkt            ="
    #code += "\\n                                      ((mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(EncodedDepth)+"'d0 ) |" for i in range(NumClients)
    #code += "\\n                                      "+str(EncodedDepth)+"'d0;"
    #code += "\\n"
    #code += "\\nwire assign egress_ds_pkt_valid      ="
    #code += "                                      ((mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(EncodedDepth)+"'d0 ) |" for i in range(NumClients)
    #code += "\\n                                      "+str(EncodedDepth)+"'d0;"
    #code += "\\n"
    #code += "\\nwire assign ingress"+str(EncodedDepth)+"_ds_pkt_ready = (mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? egress_ds_pkt_ready : 1'b0;" for i in range(NumClients)
    #code += "\\n"

/f_f/

"""

muxdemux=Multiplexor(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4], sys.argv[5], sys.argv[6])
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

