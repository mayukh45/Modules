CamWidth=20
SnoopWidth=30
CamDepth=10
EncodedDepth=4


code = " |\n ".join(["( (snoop_in == cam_loc"+str(i)+"["+str(SnoopWidth-1)+":0]) ? cam_loc"+str(i)+" : "+str(EncodedDepth)+"'d"+str(i)+" )" for i in range(CamDepth)])

print(code)