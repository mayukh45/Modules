FifoWidth=10
FifoDepth=20
SnoopWidth=32
EncodedDepth=5


code = "\n"+"|\n ".join(["((fifo_loc["+str(SnoopWidth-1)+":0] == snoop_data) ? 1'b1 : 1'b0)" for i in range(FifoDepth)])

print(code)