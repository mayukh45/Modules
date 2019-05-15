import sys
import os
from smartasic import BasicModule,Port
from math import log2,ceil
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path


class PacketConverter(BasicModule,BusParser):


    def Create_dic_of_variable(self):
        self.variable_dict['WideWidth']=self.WideWidth
        self.variable_dict['NarrowWidth']=self.NarrowWidth
        self.variable_dict['isW2N']=self.isW2N
        self.variable_dict['ratio']=self.ratio
        self.variable_dict['VecWidth']=self.VecWidth


    def add_ports_from_bus(self, filepath, bus_name):
       # parser = BusParser(filepath, bus_name)
        self.remove_sub_dict_flat("snoop")
        self.rename_flat("wcredit","wready")
        self.rename_flat("rcredit","rready")
        self.widop_flat('rdata',self.WideWidth)
        self.widop_flat("wdata",self.NarrowWidth)
        self.flipop_flat("wr")
        self.flipop_flat("rd")
        self.get_all_key_value_pairs(self.dict)

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.packetconverter)
        self.body+=dynamicgenerator.parse_body()
        self.body = self.body.replace("WIDEWIDTH - 1", str(self.WideWidth - 1))
        self.body = self.body.replace("VECWIDTH - 1", str(self.VecWidth - 1))
        self.body = self.body.replace("NARROWWIDTH - 1", str(self.NarrowWidth - 1))
        self.body = self.body.replace("WIDEWIDTH", str(self.WideWidth))
        self.body = self.body.replace("VECWIDTH", str(self.VecWidth))
        dynamicgenerator.silentremove()

    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()



    def __init__(self, width1, width2, isW2N,path_of_yaml=None,bus_name=None):
        self.WideWidth = max(width1, width2)
        self.NarrowWidth = min(width1, width2)
        self.isW2N = isW2N
        self.ratio = (self.WideWidth // self.NarrowWidth)
        self.VecWidth = int(log2(self.WideWidth/self.NarrowWidth))
        if self.isW2N == "True":
            self.name = "AH_"+self.__class__.__name__+"_w2n_"+str(self.NarrowWidth)+"_"+str(self.WideWidth)
        else:
            self.name = "AH_"+self.__class__.__name__+"_n2w_"+str(self.NarrowWidth)+"_"+str(self.WideWidth)
        BasicModule.__init__(self, self.name)
        self.body=""
        BusParser.__init__(self,self.load_dict(path_of_yaml),bus_name)
        self.variable_dict={}
        self.Create_dic_of_variable()
        self.add_ports_from_bus(path_of_yaml,bus_name)
        self.packetconverter="""
/f_f/
code=""
if isW2N == "True":
    code +="reg ["+str(WideWidth)+":0] collated_packet;"
/f_f/
reg [VECWIDTH - 1:0] packet_lane;
wire [VECWIDTH - 1:0] npacket_lane;
always(@posedge clk or negedge rstn) begin
if (!rstn) begin
    packet_lane <= VECWIDTH'd0;

/f_f/
code="\tcollated_packet <="+str(WideWidth)+"'d0;"
/f_f/

end else begin
    packet_lane <= npacket_lane;

/f_f/
code="\tcollated_packet <= ncollated_packet;"
/f_f/

    end
end

/f_f/
if isW2N == "True":
    code = "assign npacket_lane = (rd_valid & wr_ready) ? packet_lane +1'b1 :\\npacket_lane;"
    code += "assign wr_valid = rd_valid;\\n" \
                    "assign wr_data = rd_data >> ("+str(NarrowWidth)+"* packet_lane); \\n" \
                    "assign rd_ready = wr_ready & (packet_lane == "+str(VecWidth)+"'d"+str(ratio-1)+")"

else:
    code = "assign npacket_lane = !rd_valid ? packet_lane:\\n\t" \
                   "(packet_lane != "+str(VecWidth)+"'d"+str(ratio-1)+") ? packet_lane + 1'b1:\\n\t" \
                    "wr_ready ? packet_lane + 1'b1 :packet_lane;"
    code += "\\nwire assign ncollated_packet = ( (packet_lane == "+str(VecWidth)+"'d"+str(ratio)+") " \
                    "&& rd_valid && wr_ready ) ? "+str(WideWidth)+"'d0 : " \
                    "? {collated_packet, rd_data} : " \
                    "collated_packet;"

    code += "\\nassign wr_valid = rd_valid && (packet_lane == "+str(VecWidth)+"'d"+str(ratio)+");\\n" \
                    "assign rd_ready = (packet_lane == "+str(VecWidth)+"'d"+str(ratio)+") ? wr_ready ? 1'b1;\\n" \
                    "assign wr_data = ncollated_packet;"
/f_f/
"""

packetconverter=PacketConverter(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3],sys.argv[4], sys.argv[5])
packetconverter.main()
