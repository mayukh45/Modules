PortWidth=2424
NumClients=32
IsDemux=True
IsBinary=True
EncodedDepth=5


code = ""

if IsDemux:
    for i in range(NumClients):
        code += "\nwire assign egress"+str(i)+"_ds_pkt       = (demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress_ds_pkt       : "+str(EncodedDepth)+"'d0;" 
    
    for i in range(NumClients) :
        code += "\nwire assign egress"+str(i)+"_ds_pkt_valid = (demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress_ds_pkt_valid : "+str(EncodedDepth)+"'d0;" 
    
    code += "\n"
    code += "\nwire assign ingress_ds_pkt_ready          ="
    
    for i in range(NumClients):
        code += "\n                                           ((demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? egress1_ds_pkt_ready ? 1'b0) | " 
    
    code += "\n                                            1'b0;"

else:

    code += "\nwire assign egress_ds_pkt            ="
    #code += "\n                                      ((mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(EncodedDepth)+"'d0 ) |" for i in range(NumClients)
    #code += "\n                                      "+str(EncodedDepth)+"'d0;"
    #code += "\n"
    #code += "\nwire assign egress_ds_pkt_valid      ="
    #code += "                                      ((mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(EncodedDepth)+"'d0 ) |" for i in range(NumClients)
    #code += "\n                                      "+str(EncodedDepth)+"'d0;"
    #code += "\n"
    #code += "\nwire assign ingress"+str(EncodedDepth)+"_ds_pkt_ready = (mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? egress_ds_pkt_ready : 1'b0;" for i in range(NumClients)
    #code += "\n"


print(code)