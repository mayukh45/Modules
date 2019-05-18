import os
#from templates import mux_body_template
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path
from math import log2, ceil
import sys


class Decoder(BasicModule,BusParser):
    ## creating dictonary of variable
    def Create_dic_of_variable(self):
        self.variable_dict['PortWidth']=self.PortWidth
        self.variable_dict['NumClients']=self.NumClients
        self.variable_dict['EncodedNumClients']=self.EncodedNumClients
        #self.variable_dict['AperturesYaml']=self.AperturesYaml


    def add_ports_from_bus(self):
        print(self.dict)
        self.dyaml("1.yaml")
        print("I am going to operate on this dict now")

        self.widop_flat("ingress_pkt_field", self.PortWidth)
        self.widop_flat("decoded_binary", self.EncodedNumClients)

        print(self.dict)
        self.dyaml("4.yaml")
        print("I am done with this dict")
        self.init_connections(self.dict)
        self.get_all_key_value_pairs(self.dict)

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.decoderbody) # passing dictonary and snoopbody to split the body
        self.body+=dynamicgenerator.parse_body()
        self.body = self.body.replace("ENCODEDNUMCLIENTS - 1", str(self.EncodedNumClients -1))
        self.body = self.body.replace("ENCODEDNUMCLIENTS", str(self.EncodedNumClients))
        #self.body = self.body.replace("NAME", "mux" if self.IsDemux is None else "demux")
        #self.body = self.body.replace("MUXNUMCLIENTS", str(self.NumClients))
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

    def __init__(self, portwidth, numclients, path_of_yaml=None, bus_name=None, apertures_yaml=None):
        if path_of_yaml is None:
             path_of_yaml = "../../../smartasic2/refbuses/decoder.yaml"
             bus_name = "decoder"
             apertures_yaml = "decode_apertures.yaml"

        self.AperturesYaml = apertures_yaml
        self.PortWidth = portwidth
        self.NumClients = numclients
        self.EncodedNumClients = int(ceil(log2(numclients)))

        self.name = "AH_decoder_"+str(self.PortWidth)+"_"+str(self.NumClients)
        print("Just checking what is the file name..")
        print (self.name)

        BasicModule.__init__(self, self.name)

        self.body = ""
        self.variable_dict={}
        self.Create_dic_of_variable()

        BusParser.__init__(self, self.load_dict(path_of_yaml), bus_name)
        self.add_ports_from_bus()

        self.decode_apertures_dict = self.load_dict(apertures_yaml)

        self.decoderbody = """

// Ingress and Egress are short circuited based on condition

wire [ENCODEDNUMCLIENTS - 1:0] decoded_binary;
wire dec_err;

/f_f/
import yaml
ap_dict = yaml.load(open("decode_apertures.yaml").read())

code = ""

for (k,v) in ap_dict['decode_apertures'].items():
    #print ("I am inside dictionary with K and V as ")
    #print("K is "+str(k))
    #print("V is "+str(v))
    code += "\\n\t"+"wire assign decode_range_"+str(k)+"_tom ="+str(v['tom'])
    code += "\\n\t"+"wire assign decode_range_"+str(k)+"_bom ="+str(v['bom'])

/f_f/

/f_f/
code = ""
for i in range(NumClients):
    code += "\\n\t"+"assign decoded_binary["+str(i)+"] = ( (ingress_pkt_field) >= decode_range_client"+str(i)+"_bom) && (ingress_pkt_field) <= decode_range_client"+str(i)+"_tom"
/f_f/

assign dec_err           = ~ (|decoded_binary);

"""

if len(sys.argv) > 3:
    decoder=Decoder(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4], sys.argv[5])
else:
    decoder=Decoder(int(sys.argv[1]), int(sys.argv[2]))

decoder.main()
