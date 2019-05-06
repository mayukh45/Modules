from AH_SnoopableFIFO import SnoopableFIFO
from smartasic import BasicModule
from BusParser import BusParser


class OrderedSwitch(BasicModule):
    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width):
        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)
        BasicModule.__init__(self, self.name)
        self.dict = {}

