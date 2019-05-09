import copy
import yaml
from AH_SnoopableFIFO import SnoopableFIFO
from smartasic import BasicModule
from BusParser import BusParser
import sys
print(sys.path)

class OrderedSwitch(BasicModule):
    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width):
        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)
        BasicModule.__init__(self, self.name)
        self.port_dict = {}
        self.wire_dict = {}

    def get_body(self):
        spf1 = SnoopableFIFO(10, 32, 10 ,  "/home/mayukhs/Documents/smartasic2/refbuses/astob_for_order_switch.yaml", "astob")
        spf1.smart_connectionop("astob", None,"wr_","egress0_dspkt_")
        spf1.smart_connectionop("astob", None, "rd_", "egress0_dspkt_")
        spf1.smart_connectionop("astob", None, "snoop_", "egress0_dspkt_")
        spf1.add_connection_flat("svalid","{ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]}")
       # print(spf1.dict)
        spf2 = copy.deepcopy(spf1)
        spf2.smart_connectionop("astob", None, "egress0" , "egress1")
       # print(spf2.dict)
        spf3 = copy.deepcopy(spf1)
        spf3.smart_connectionop("astob", None, "egress0", "egress2")
        spf4 = copy.deepcopy(spf1)
        spf4.smart_connectionop("astob", None, "egress0", "egress3")
    #    print("BEFORE :" + str(spf1.dict))
        self.port_dict , self.wire_dict = self.populate_wire_and_ports(spf1,spf2)#, spf3, spf4)

    def main(self):
        self.get_body()



t = OrderedSwitch(10, 20, 30, 40, 50)
t.main()
print(yaml.dump(t.port_dict))
print("1"*50)
#print(yaml.dump(t.wire_dict))

