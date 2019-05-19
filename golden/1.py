AH_2OrderedSwitch.py:    def main(self):
AH_2OrderedSwitch.py-        self.get_body()
AH_2OrderedSwitch.py-
AH_2OrderedSwitch.py-    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width, snoopdepth):
AH_2OrderedSwitch.py-        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)
AH_2OrderedSwitch.py-        BasicModule.__init__(self, self.name)
AH_2OrderedSwitch.py-        self.NumberOfEgress = number_of_egress
AH_2OrderedSwitch.py-        self.DsPktSize = ds_packet_size
AH_2OrderedSwitch.py-        self.SnoopDepth = snoopdepth
AH_2OrderedSwitch.py-        self.upPktSize = ups_packet_size
AH_2OrderedSwitch.py-        self.dsDecodableFieldWidth = ds_decodable_field_width
AH_2OrderedSwitch.py-        self.upResponseDecodableFieldWidth = ups_response_decodable_field_width
AH_2OrderedSwitch.py-        self.port_dict = {}
--
AH_CAM.py:    def main(self):
AH_CAM.py-        self.write_to_file(self.get_verilog())
AH_CAM.py-        return self.get_verilog()
AH_CAM.py-
AH_CAM.py-
AH_CAM.py-    def __init__(self, camdepth, camwidth, snoopwidth, path_of_yaml=None,bus_name=None):
AH_CAM.py-        self.CamDepth = camdepth
AH_CAM.py-        self.EncodedDepth = ceil(log2(int(camdepth)))
AH_CAM.py-        self.SnoopWidth = snoopwidth
AH_CAM.py-        self.CamWidth = camwidth
AH_CAM.py-        if path_of_yaml is None:
AH_CAM.py-            path_of_yaml = "../../../smartasic2/refbuses/astob_for_order_switch.yaml"
AH_CAM.py-            bus_name = "astob"
--
AH_Decoder.py:    def main(self):
AH_Decoder.py-        print("I am about to write a verilog file now")
AH_Decoder.py-        self.write_to_file(self.get_verilog())
AH_Decoder.py-        print (self.get_verilog())
AH_Decoder.py-        return self.get_verilog()
AH_Decoder.py-
AH_Decoder.py-    def __init__(self, portwidth, numclients, path_of_yaml=None, bus_name=None, apertures_yaml=None):
AH_Decoder.py-        if path_of_yaml is None:
AH_Decoder.py-             path_of_yaml = "../../../smartasic2/refbuses/decoder.yaml"
AH_Decoder.py-             bus_name = "decoder"
AH_Decoder.py-             apertures_yaml = "decode_apertures.yaml"
AH_Decoder.py-
AH_Decoder.py-        self.AperturesYaml = apertures_yaml
--
AH_DivPipelined.py:    def main(self):
AH_DivPipelined.py-        self.write_to_file(self.get_verilog())
AH_DivPipelined.py-        return self.get_verilog()
AH_DivPipelined.py-
AH_DivPipelined.py-    def __init__(self,bits,stages,path_of_yaml=None,bus_name=None):
AH_DivPipelined.py-        self.bits=bits
AH_DivPipelined.py-        self.stages=stages
AH_DivPipelined.py-        self.body=""
AH_DivPipelined.py-        self.name="AH_"+self.__class__.__name__+"_"+str(bits)+"_"+str(stages)
AH_DivPipelined.py-        BasicModule.__init__(self , self.name)
AH_DivPipelined.py-        self.variable_dict={}
AH_DivPipelined.py-        BusParser.__init__(self,self.load_dict(path_of_yaml),bus_name)
AH_DivPipelined.py-        self.Create_dic_of_variable()
--
AH_LruArbiter.py:    def main(self):
AH_LruArbiter.py-        self.write_to_file(self.get_verilog())
AH_LruArbiter.py-        return self.get_verilog()
AH_LruArbiter.py-
AH_LruArbiter.py-    def __init__(self,num_clients,path_of_yaml=None,bus_name=None):
AH_LruArbiter.py-        self.bus_name=bus_name
AH_LruArbiter.py-        self.Num_Clients=num_clients
AH_LruArbiter.py-        self.variable_dict={}
AH_LruArbiter.py-        self.name="AH_"+self.__class__.__name__+"_"+str(num_clients)
AH_LruArbiter.py-        BasicModule.__init__(self, self.name)
AH_LruArbiter.py-        BusParser.__init__(self,self.load_dict(path_of_yaml),bus_name)
AH_LruArbiter.py-        self.body=""
AH_LruArbiter.py-        self.Create_dic_of_variable()
--
AH_Multiplexor.py:    def main(self):
AH_Multiplexor.py-        print("I am about to write a verilog file now")
AH_Multiplexor.py-        self.write_to_file(self.get_verilog())
AH_Multiplexor.py-        print (self.get_verilog())
AH_Multiplexor.py-        return self.get_verilog()
AH_Multiplexor.py-
AH_Multiplexor.py-    def __init__(self, portwidth, numclients, isdemux, isbinary, path_of_yaml=None, bus_name=None):
AH_Multiplexor.py-        self.PortWidth = portwidth
AH_Multiplexor.py-        self.NumClients = numclients
AH_Multiplexor.py-        self.IsDemux = isdemux
AH_Multiplexor.py-        self.body = None
AH_Multiplexor.py-        self.IsBinary = isbinary
AH_Multiplexor.py-
--
AH_Mutiplexor.py:    def main(self):
AH_Mutiplexor.py-        self.write_to_file(self.get_verilog())
AH_Mutiplexor.py-        return self.get_verilog()
AH_Mutiplexor.py-
AH_Mutiplexor.py-
AH_Mutiplexor.py-    def __init__(self, portwidth, numclients, isdemux, isbinary):
AH_Mutiplexor.py-        self.PortWidth = portwidth
AH_Mutiplexor.py-        self.NumClients = numclients
AH_Mutiplexor.py-        self.isDemux = isdemux
AH_Mutiplexor.py-        self.isBinary = isbinary
AH_Mutiplexor.py-        self.body=""
AH_Mutiplexor.py-        self.variable_dict={}
AH_Mutiplexor.py-        self.Create_dic_of_variable()
--
AH_OrderedSwitch.py:    def main(self):
AH_OrderedSwitch.py-        self.get_body()
AH_OrderedSwitch.py-
AH_OrderedSwitch.py-    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width, snoopdepth):
AH_OrderedSwitch.py-        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)
AH_OrderedSwitch.py-        BasicModule.__init__(self, self.name)
AH_OrderedSwitch.py-        self.NumberOfEgress = number_of_egress
AH_OrderedSwitch.py-        self.dsPktSize = ds_packet_size
AH_OrderedSwitch.py-        self.SnoopDepth = snoopdepth
AH_OrderedSwitch.py-        self.upPktSize = ups_packet_size
AH_OrderedSwitch.py-        self.dsDecodableFieldWidth = ds_decodable_field_width
AH_OrderedSwitch.py-        self.upResponseDecodableFieldWidth = ups_response_decodable_field_width
AH_OrderedSwitch.py-        self.dict = {}
--
AH_PacketConverter.py:    def main(self):
AH_PacketConverter.py-        self.write_to_file(self.get_verilog())
AH_PacketConverter.py-        return self.get_verilog()
AH_PacketConverter.py-
AH_PacketConverter.py-
AH_PacketConverter.py-
AH_PacketConverter.py-    def __init__(self, width1, width2, isW2N,path_of_yaml=None,bus_name=None):
AH_PacketConverter.py-        self.WideWidth = max(width1, width2)
AH_PacketConverter.py-        self.NarrowWidth = min(width1, width2)
AH_PacketConverter.py-        self.isW2N = isW2N
AH_PacketConverter.py-        self.ratio = (self.WideWidth // self.NarrowWidth)
AH_PacketConverter.py-        self.VecWidth = int(log2(self.WideWidth/self.NarrowWidth))
AH_PacketConverter.py-        if self.isW2N == "True":
--
AH_RoundRobinArbiter.py:    def main(self):
AH_RoundRobinArbiter.py-        self.write_to_file(self.get_verilog())
AH_RoundRobinArbiter.py-        return self.get_verilog()
AH_RoundRobinArbiter.py-
AH_RoundRobinArbiter.py-
AH_RoundRobinArbiter.py-    def __init__(self,num_clients,path_of_yaml=None,bus_name=None,weight=None):
AH_RoundRobinArbiter.py-        self.bus_name=bus_name
AH_RoundRobinArbiter.py-        self.Num_Clients=num_clients
AH_RoundRobinArbiter.py-        self.weight = weight
AH_RoundRobinArbiter.py-        if weight==None:
AH_RoundRobinArbiter.py-            self.name="AH_"+self.__class__.__name__+"_"+str(num_clients)
AH_RoundRobinArbiter.py-        else:
AH_RoundRobinArbiter.py-            self.name="AH_"+self.__class__.__name__+"_"+str(num_clients)+"_"+str(weight)
--
AH_SnoopableFIFO.py:    def main(self):
AH_SnoopableFIFO.py-        self.write_to_file(self.get_verilog())
AH_SnoopableFIFO.py-        return self.get_verilog()
AH_SnoopableFIFO.py-
AH_SnoopableFIFO.py-    def __init__(self, fifowidth, fifodepth, snoopwidth, path_of_yaml = None, bus_name = None):
AH_SnoopableFIFO.py-
AH_SnoopableFIFO.py-        self.FifoWidth = fifowidth
AH_SnoopableFIFO.py-        self.FifoDepth = fifodepth
AH_SnoopableFIFO.py-        self.SnoopWidth = snoopwidth
AH_SnoopableFIFO.py-        if path_of_yaml is None:
AH_SnoopableFIFO.py-            path_of_yaml = "../../../smartasic2/refbuses/astob.yaml"
AH_SnoopableFIFO.py-            bus_name = "astob"
AH_SnoopableFIFO.py-
--
smartasic.py:    def main(self):
smartasic.py-        self.write_to_file(self.get_verilog())
smartasic.py-        return self.get_verilog()
smartasic.py-
smartasic.py-
smartasic.py-
