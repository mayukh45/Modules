from templates import snoopable_fifo_template
from math import log2, ceil
import sys
from smartasic import BasicModule
from BusParser import BusParser


class SnoopableFIFO(BasicModule, BusParser):
    def __init__(self, fifowidth, fifodepth, snoopwidth, bus_name, path_of_yaml):
        self.FifoWidth = fifowidth
        self.FifoDepth = fifodepth
        self.SnoopWidth = snoopwidth
        self.name = "AH_"+self.__class__.__name__+"_"+str(fifowidth)+"_"+str(fifodepth)+"_"+str(snoopwidth)
        BasicModule.__init__(self,self.name)
        self.body = None
        self.EncodedDepth = int(ceil(log2(fifodepth)))
        BusParser.__init__(self, path_of_yaml, bus_name)
        self.add_ports_from_bus()

    #=======================================================
    # overwrite the add_ports_from_bus method here.
    # Create the instance of busparser class.
    # Then use the wid_op method to change the port width req, gnt, gnt_busy signals.
    #=======================================================

    def add_ports_from_bus(self):

        #1. assuming that we are loading arbiter.yaml
        #2. parser.wid_op (num_clientm , a.b.c.d format pass the signal name)
        #3. Do this for all the signals that are required.
        #print(parser.dict)
        self.Ports.clear()
        self.add_port("clk", "input", 1)
        self.add_port("rstn", "input", 1)
        self.widop_flat("wdata",self.FifoWidth)
        self.widop_flat("rdata",self.FifoWidth)
        self.widop_flat("sdata",self.FifoWidth)
        self.get_all_key_value_pairs(self.dict)

    def get_body(self):
        self.body = snoopable_fifo_template
        self.body = self.body.replace("SNOOPWIDTH - 1", str(self.SnoopWidth -1))
        self.body = self.body.replace("ENCODEDDEPTH - 1", str(self.EncodedDepth - 1))
        self.body = self.body.replace("FIFOWIDTH - 1", str(self.FifoWidth - 1))
        self.body = self.body.replace("ENCODEDDEPTH + 1", str(self.EncodedDepth + 1))
        self.body = self.body.replace("ENCODEDDEPTH", str(self.EncodedDepth))
        self.body = self.body.replace("FIFOWIDTH", str(self.FifoWidth))
        self.body = self.body.replace("FIFODEPTH", str(self.FifoDepth))
        self.body = self.body.replace("SNOOPWIDTH", str(self.SnoopWidth))
        self.body = self.body.replace("//REG_DECLARATIONS", self.get_reg_str("reg", "\n", self.FifoWidth, "fifo_loc", self.FifoDepth))
        self.body = self.body.replace("//ASSIGN_LOC", self.write_loc_rstn("\n\t", "fifo_loc", self.FifoWidth, self.FifoDepth))
        self.body = self.body.replace("//LOC_WRITE", self.write_loc("\n\t", "fifo_loc",self.EncodedDepth,self.FifoDepth))
        self.body = self.body.replace("//ASSIGN_READ",self.read_loc(self.EncodedDepth,"fifo_loc",self.FifoWidth,self.FifoDepth,"|\n"))
        self.body = self.body.replace("//ASSIGN_SNOOP_MATCH", self.snoop_match_noinv("fifo_loc","snoop_data",self.SnoopWidth,self.FifoDepth,"|\n"))

    def get_verilog(self):
        modulecode = self.get_header()
        self.get_body()
        modulecode = modulecode.replace("BODY", self.body)
        return modulecode

    def __str__(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()


print(SnoopableFIFO(int(sys.argv[1]),int(sys.argv[2]),int(sys.argv[3]),sys.argv[4],sys.argv[5]))
