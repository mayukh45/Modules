import os
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path
from math import log2, ceil
import sys


class SnoopableFIFO(BasicModule,BusParser):
    ## creating dictonary of variable
#    def Create_dic_of_variable(self):
#        self.variable_dict['FifoWidth']=self.FifoWidth
#        self.variable_dict['FifoDepth']=self.FifoDepth
#       self.variable_dict['SnoopWidth']=self.SnoopWidth
#        self.variable_dict['EncodedDepth']=self.EncodedDepth

    def add_ports_from_bus(self):
        BasicModule.add_ports_from_bus(self)
        self.widop_flat("wdata", self.FifoWidth)
        self.widop_flat("rdata", self.FifoWidth)
        self.widop_flat("sdata", self.FifoWidth)
        self.get_all_key_value_pairs(self.dict)

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.snoopbody) # passing dictonary and snoopbody to split the body
        self.body+=dynamicgenerator.parse_body()
        self.body = self.body.replace("SNOOPWIDTH - 1", str(self.SnoopWidth -1))
        self.body = self.body.replace("ENCODEDDEPTH - 1", str(self.EncodedDepth - 1))
        self.body = self.body.replace("FIFOWIDTH - 1", str(self.FifoWidth - 1))
        self.body = self.body.replace("ENCODEDDEPTH + 1", str(self.EncodedDepth + 1))
        self.body = self.body.replace("ENCODEDDEPTH", str(self.EncodedDepth))
        self.body = self.body.replace("FIFOWIDTH", str(self.FifoWidth))
        self.body = self.body.replace("FIFODEPTH", str(self.FifoDepth))
        self.body = self.body.replace("SNOOPWIDTH", str(self.SnoopWidth))
        dynamicgenerator.silentremove()

    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()

    def __init__(self, fifowidth, fifodepth, snoopwidth, path_of_yaml, bus_name):
        self.FifoWidth = fifowidth
        self.FifoDepth = fifodepth
        self.SnoopWidth = snoopwidth
        self.name = "AH_"+self.__class__.__name__+"_"+str(fifowidth)+"_"+str(fifodepth)+"_"+str(snoopwidth)
        BasicModule.__init__(self, self.name)
        self.body = ""
        self.EncodedDepth = int(ceil(log2(fifodepth)))
        self.variable_dict={}
#        self.Create_dic_of_variable()
        BusParser.__init__(self, path_of_yaml, bus_name)
        self.add_ports_from_bus()
        self.snoopbody="""
reg [ENCODEDDEPTH:0] wr_pointer; // ENCODEDDEPTH + 1 = log2(32) + 1

reg [ENCODEDDEPTH:0] rd_pointer; // ENCODEDDEPTH + 1 


/f_f/
code = "\\n"+"\\n".join(["reg ["+str(FifoWidth-1)+":0] fifo_loc"+str(i)+";" for i in range(FifoDepth)])
/f_f/

always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             wr_pointer <= ENCODEDDEPTH + 1'd0;

       end else begin

     wr_pointer <= ( (wr_pointer[ENCODEDDEPTH] ^ rd_pointer[ENCODEDDEPTH]) && (wr_pointer[ENCODEDDEPTH - 1:0] == rd_pointer[ENCODEDDEPTH - 1:0]) ) ? wr_pointer :

wr_valid ? ( wr_pointer + 1'b1) : wr_pointer;

       end

end



always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             rd_pointer <= ENCODEDDEPTH + 1'd0;

       end else begin

     rd_pointer <= (rd_pointer[ENCODEDDEPTH:0] == rd_pointer[ENCODEDDEPTH:0]) ? rd_pointer : rd_ready ? (rd_pointer + 1'b1) : rd_pointer;

       end

end





always @ (posedge clk or negedge rstn)

begin

       if(!rstn) begin

/f_f/
code = "\\n\t"+"\\n\t".join(["fifo_loc"+str(i)+" <= "+str(FifoWidth)+"'d0;" for i in range (FifoDepth)])
/f_f/

       end else begin

/f_f/
code = "\\n\t"+"\\n\t".join(["fifo_loc"+str(i)+" <= (wr_pointer["+str(EncodedDepth-2)+":0] == "+str(EncodedDepth)+"'d"+str(i)+") ? wr_data : fifo_loc"+str(i)+";" for i in range(FifoDepth)])
/f_f/

       end

end

wr_ready = ! ( (wr_pointer[ENCODEDDEPTH] ^ rd_pointer[ENCODEDDEPTH]) && (wr_pointer[ENCODEDDEPTH - 1:0] == rd_pointer[ENCODEDDEPTH - 1:0]) );

rd_valid = !(rd_pointer[ENCODEDDEPTH:0] == rd_pointer[ENCODEDDEPTH:0]);

assign rd_data = FIFOWIDTH'd0 |
/f_f/
code = "\\n"+" |\\n ".join(["( (rd_pointer["+str(EncodedDepth)+":0] == "+str(EncodedDepth+1)+"'d))"])
/f_f/
assing snoop_match = 1'b0 |
/f_f/
code = "\\n"+"|\\n ".join(["((fifo_loc["+str(SnoopWidth-1)+":0] == snoop_data) ? 1'b1 : 1'b0)" for i in range(FifoDepth)])
/f_f/
"""


snoopablefifo=SnoopableFIFO(int(sys.argv[1]),int(sys.argv[2]),int(sys.argv[3]),sys.argv[4],sys.argv[5])
snoopablefifo.main()
