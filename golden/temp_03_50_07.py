PortWidth=24
NumClients=8
IsDemux=1
IsBinary=0
EncodedDepth=3


cide = ""

if self.IsDemux:
    for i in range(self.NumClients):
        code += "wire assign egress"+str(i)+"_ds_pkt       = (demux_select== "+str(self.EncodedDepth)"'d"+str(i)+") ? ingress_ds_pkt       : "+str(self.EncodedDepth)+"'d0;" 
    
    for i in range(self.NumClients) :
        code += "wire assign egress"+str(i)+"_ds_pkt_valid = (demux_select== "+str(self.EncodedDepth)"'d"+str(i)+") ? ingress_ds_pkt_valid : "+str(self.EncodedDepth)+"'d0;" 
    
    code += ""
    code += "wire assign ingress_ds_pkt_ready          ="
    
    for i in range(self.NumClients):
        code += "                                           ((demux_select== "+str(self.EncodedDepth)"'d"+str(i)+") ? egress1_ds_pkt_ready ? 1'b0) | " 
    
    code += "                                            1'b0;"

else:

    code += "wire assign egress_ds_pkt            ="
    code += "                                      ((mux_select== "+str(self.EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(self.EncodedDepth)+"'d0 ) |" for i in range(self.NumClients)
    code += "                                      "+str(self.EncodedDepth)+"'d0;"
    code += ""
    code += "wire assign egress_ds_pkt_valid      ="
    code += "                                      ((mux_select== "+str(self.EncodedDepth)+"'d"+str(i)+") ? ingress"+str(i)+"_ds_pkt : "+str(self.EncodedDepth)+"'d0 ) |" for i in range(self.NumClients)
    code += "                                      "+str(self.EncodedDepth)+"'d0;"
    code += ""
    code += "wire assign ingress"+str(self.EncodedDepth)+"_ds_pkt_ready = (mux_select== "+str(self.EncodedDepth)+"'d"+str(i)+") ? egress_ds_pkt_ready : 1'b0;" for i in range(self.NumClients)
    code += ""


print(code)