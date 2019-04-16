from templates import snoopable_fifo_template
from math import log2, ceil
import sys
from smartasic import BasicModule,Port


class SnoopableFIFO(BasicModule):
    def __init__(self, fifowidth, fifodepth, snoopwidth, bus_name, path_of_yaml):
        self.FifoWidth = fifowidth
        self.FifoDepth = fifodepth
        self.SnoopWidth = snoopwidth
        self.name = "AH_"+self.__class__.__name__+"_"+str(fifowidth)+"_"+str(fifowidth)+"_"+str(snoopwidth)
        super().__init__(self.name)
        self.body = None
        self.EncodedDepth = int(ceil(log2(fifodepth)))
        self.add_ports_from_bus(path_of_yaml, bus_name)

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
        self.body = self.body.replace("//LOC_WRITE", self.write_loc("\n\t","fifo_loc",self.EncodedDepth,self.FifoDepth))
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
