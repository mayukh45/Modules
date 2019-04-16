from math import ceil, log2
from templates import cam_body_template
import sys
from smartasic import BasicModule


class CAM(BasicModule):

    def __init__(self, camdepth, camwidth, snoopwidth, bus_name, path_of_yaml):
        self.CamDepth = camdepth
        self.EncodedDepth = ceil(log2(int(camdepth)))
        self.SnoopWidth = snoopwidth
        self.CamWidth = camwidth
        self.name = "AH_" + self.__class__.__name__ + "_" + str(camdepth) + "_" + str(camwidth) + "_" + str(snoopwidth)
        super().__init__(self.name)
        self.body = None
        self.add_ports_from_bus(path_of_yaml, bus_name)

    def get_body(self):
        self.body = cam_body_template
        self.body = self.body.replace("ENCODEDDEPTH - 1", str(self.EncodedDepth-1))
        self.body = self.body.replace("ENCODEDDEPTH", str(self.EncodedDepth))
        self.body = self.body.replace("CAMWIDTH - 1", str(self.CamWidth - 1))
        self.body = self.body.replace("CAMWIDTH", str(self.CamWidth))
        self.body = self.body.replace("SNOOPWIDTH - 1", str(self.SnoopWidth - 1))
        self.body = self.body.replace("SNOOPWIDTH", str(self.SnoopWidth))
        self.body = self.body.replace("//REQUEST_DECLARATION" , self.get_reg_str("req","\n",self.CamWidth,"cam_loc",self.CamDepth))
        self.body = self.body.replace("//CAM_LOCATIONS" , self.write_loc_rstn("\n\t", "cam_loc", self.CamWidth, self.CamWidth))
        self.body = self.body.replace("//ASSIGN_SNOOP", self.snoop_inv("\n", self.SnoopWidth,"snoop_in", "cam_loc",self.CamDepth,self.CamWidth))
        self.body = self.body.replace("//CAM_WRITE",self.cam_write("\n\t","cam_loc",self.CamDepth,self.EncodedDepth))
        self.body = self.body.replace("//ASSIGN_FREEUP", self.snoop_get_wr_ptr("|\n","cam_loc","snoop_in",self.SnoopWidth,self.EncodedDepth,self.CamDepth))
        self.body = self.body.replace("//SNOOP_MATCH",self.snoop_match_noinv("cam_loc","snoop_in",self.SnoopWidth,self.CamDepth,"|\n"))

    def get_verilog(self):
        modulecode = self.get_header()
        self.get_body()
        modulecode = modulecode.replace("BODY", self.body)
        return modulecode

    def __str__(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()


print(CAM(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]),sys.argv[4],sys.argv[5]))
