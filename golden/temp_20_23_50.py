PortWidth=2424
NumClients=8
IsDemux=1
IsBinary=0
EncodedDepth=3


code = ""

if IsDemux:
    for i in range(NumClients):
        code += "\nwire assign egress"+str(i)+"_ds_pkt       = (demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress_ds_pkt       : "+str(EncodedDepth)+"'d0;" 
    
    for i in range(NumClients) :
        code += "wire assign egress"+str(i)+"_ds_pkt_valid = (demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress_ds_pkt_valid : "+str(EncodedDepth)+"'d0;" 
    
    code += ""
    code += "wire assign ingress_ds_pkt_ready          ="
    
    for i in range(NumClients):
        code += "                                           ((demux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? egress1_ds_pkt_ready ? 1'b0) | " 
    
    code += "                                            1'b0;"

else:

    code += "wire assign egress_ds_pkt            ="
    #code += "                                      ((mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(EncodedDepth)+"'d0 ) |" for i in range(NumClients)
    #code += "                                      "+str(EncodedDepth)+"'d0;"
    #code += ""
    #code += "wire assign egress_ds_pkt_valid      ="
    #code += "                                      ((mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(EncodedDepth)+"'d0 ) |" for i in range(NumClients)
    #code += "                                      "+str(EncodedDepth)+"'d0;"
    #code += ""
    #code += "wire assign ingress"+str(EncodedDepth)+"_ds_pkt_ready = (mux_select== "+str(EncodedDepth)+"'d"+str(i)+") ? egress_ds_pkt_ready : 1'b0;" for i in range(NumClients)
    #code += ""


print(code)