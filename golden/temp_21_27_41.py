FifoWidth=10
FifoDepth=20
SnoopWidth=32
EncodedDepth=5


code = "\n"+" |\n ".join(["( (rd_pointer["+str(EncodedDepth)+":0] == "+str(EncodedDepth+1)+"'d))"])

print(code)