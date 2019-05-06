import copy

from SnoopableFIFO import SnoopableFIFO
from smartasic import BasicModule
from BusParser import BusParser


class OrderedSwitch(BasicModule):
    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width):
        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)
        BasicModule.__init__(self, self.name)
        self.dict = {}

    def get_body(self):
        spf1 = SnoopableFIFO(10, 32, 10 , "astob" , "/home/mayukhs/Documents/smarasic2/refbuses/astob.yaml")
        spf1.smart_connectionop("astob", None,"wr_w","egress0_ds_pkt")
        spf1.smart_connectionop("astob", None, "rd_r", "egress0_ds_pkt")
        spf1.smart_connectionop("astob", None, "snoop_s", "egress0_ds_pkt")
        spf2 = copy.deepcopy(spf1)
        spf2.smart_connectionop("astob", None, "egress0" , "egress1")
        spf3 = copy.deepcopy(spf1)
        spf3.smart_connectionop("astob", None, "egress0", "egress2")
        spf4 = copy.deepcopy(spf1)
        spf4.smart_connectionop("astob", None, "egress0", "egress3")
        self.populate_wire_and_ports(spf1, spf2, spf3, spf4)
