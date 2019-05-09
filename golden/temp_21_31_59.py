FifoWidth=132
FifoDepth=20
SnoopWidth=16
EncodedDepth=5


code = "\n"+"\n".join(["reg ["+str(FifoWidth-1)+":0] fifo_loc"+str(i)+";" for i in range(FifoDepth)])

print(code)