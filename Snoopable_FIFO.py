from templates import snoopable_fifo_template
from math import log2, ceil
import sys


class SnoopableFIFO:
    def __init__(self, fifowidth, fifodepth, snoopwidth):
        self.FifoWidth = fifowidth
        self.FifoDepth = fifodepth
        self.SnoopWidth = snoopwidth
        self.body = None
        self.EncodedDepth = int(ceil(log2(fifodepth)))

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
        self.declare_register()
        self.write_loc()
        self.assign_read()
        self.assign_loc()
        self.assign_snoop_match()

    def declare_register(self):
        code = "\n"+"\n".join(["reg ["+str(self.FifoWidth-1)+":0] fifo_loc"+str(i)+";" for i in range(self.FifoDepth)])
        self.body = self.body.replace("//REG_DECLARATIONS", code)

    def assign_loc(self):
        code = "\n\t"+"\n\t".join(["fifo_loc"+str(i)+" <= "+str(self.FifoWidth)+"'d0;" for i in range (self.FifoDepth)])
        self.body = self.body.replace("//ASSIGN_LOC", code)

    def write_loc(self):
        code = "\n\t"+"\n\t".join(["fifo_loc"+str(i)+" <= (wr_pointer["+str(self.EncodedDepth-2)+":0] == "+str(self.EncodedDepth)+"'d"+str(i)+") ? wr_data : fifo_loc"+str(i)+";" for i in range(self.FifoDepth)])
        self.body = self.body.replace("//LOC_WRITE", code)

    def assign_read(self):
        code = "\n"+" |\n ".join(["( (rd_pointer["+str(self.EncodedDepth)+":0] == "+str(self.EncodedDepth+1)+"'d"
                ""+str(i)+") ? fifo_loc"+str(i)+" : "+str(self.FifoWidth)+"'d0)" for i in range(self.FifoDepth)])

        self.body = self.body.replace("//ASSIGN_READ", code)

    def assign_snoop_match(self):
        code = "\n"+"|\n ".join(["((fifo_loc["+str(self.SnoopWidth-1)+":0] == snoop_data) ? 1'b1 : 1'b0)" for i in range(self.FifoDepth)])
        self.body = self.body.replace("//ASSIGN_SNOOP_MATCH", code)

    def __str__(self):
        self.get_body()
        return self.body

print(SnoopableFIFO(int(sys.argv[1]),int(sys.argv[2]),int(sys.argv[3])))