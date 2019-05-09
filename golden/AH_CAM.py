import os
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path
from math import log2, ceil
import sys


class CAM(BasicModule,BusParser):

    #=======================================================================================================
    #
    #=======================================================================================================
    def add_ports_from_bus(self):
        self.add_sub_dict_flat("snoop" , {"sin" : {"direction" : "input" , "type" : "fluid" , "width" : self.SnoopWidth}})
        self.widop_flat("wdata",self.CamWidth)
        self.widop_flat("sin",self.SnoopWidth)
        self.widop_flat("sdata",self.CamWidth)
        self.remove_sub_dict_flat("rd")
        self.init_connections(self.dict)
        self.get_all_key_value_pairs(self.dict)

    def Create_dic_of_variable(self):
        self.variable_dict['CamWidth']=self.CamWidth
        self.variable_dict['SnoopWidth']=self.SnoopWidth
        self.variable_dict['CamDepth']= self.CamDepth
        self.variable_dict['EncodedDepth']=self.EncodedDepth

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.cambody)
        self.body+=dynamicgenerator.parse_body()
        self.body = self.body.replace("ENCODEDDEPTH - 1", str(self.EncodedDepth-1))
        self.body = self.body.replace("ENCODEDDEPTH", str(self.EncodedDepth))
        self.body = self.body.replace("CAMWIDTH - 1", str(self.CamWidth - 1))
        self.body = self.body.replace("CAMWIDTH", str(self.CamWidth))
        self.body = self.body.replace("SNOOPWIDTH - 1", str(self.SnoopWidth - 1))
        self.body = self.body.replace("SNOOPWIDTH", str(self.SnoopWidth))
        dynamicgenerator.silentremove()


    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()


    def __init__(self, camdepth, camwidth, snoopwidth, path_of_yaml,bus_name):
        self.CamDepth = camdepth
        self.EncodedDepth = ceil(log2(int(camdepth)))
        self.SnoopWidth = snoopwidth
        self.CamWidth = camwidth
        self.name = "AH_" + self.__class__.__name__ + "_" + str(camdepth) + "_" + str(camwidth) + "_" + str(snoopwidth)
        BasicModule.__init__(self,self.name)
        self.body = ""
        BusParser.__init__(self,path_of_yaml, bus_name)
        self.variable_dict={}
        self.Create_dic_of_variable()
        self.add_ports_from_bus()
        self.cambody="""
wire [ENCODEDDEPTH - 1:0] internal_wr_ptr;
req  [ENCODEDDEPTH:0] wr_loc_counter;
        /f_f/
code = "\\n".join(["req  ["+str(CamWidth-1)+":0] cam_loc"+str(i)+";" for i in range(CamDepth)])
        /f_f/
        always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= ENCODEDDEPTH+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[ENCODEDDEPTH] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end
AH_srvfifo_ENCODEDDEPTH_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);

assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[ENCODEDDEPTH]);
assign internal_wr_ptr = ~wr_location_counter[ENCODEDDEPTH + 1] ? ~wr_location_counter[ENCODEDDEPTH - 1:0] : recir_loc;

assign wr_ready	= ~wr_location_counter[ENCODEDDEPTH + 1] ? 1'b1 : recir_loc_valid;

assign recir_loc_ready	= ~wr_location_counter[ENCODEDDEPTH + 1] ? 1'b0 : wr_valid;

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin

/f_f/
code = "\\n\t"+"\\n\t".join(["cam_loc"+str(i)+" <= "+str(CamWidth)+"'d0;" for i in range(CamDepth)])
/f_f/

end else begin
/f_f/
code = "\\n\t"+"\\n\t".join(["cam_loc"+str(i)+" <= (internal_wr_en & (internal_wr_ptr == "+str(EncodedDepth)+""
"'d"+str(i)+") ) ? wr_data : cam_loc"+str(i)+";" for i in range(CamDepth)])
/f_f/

end

wire assign snoop_match = freedup_loc_ready) & (

/f_f/
code = " |\\n ".join(["(snoop_in == cam_loc"+str(i)+"["+str(SnoopWidth-1)+":0])" for i in range(CamDepth)])
/f_f/
);

wire assign snoop_data = CAMWIDTH'd0 |
/f_f/
code = " |\\n ".join(["( (snoop_in == cam_loc"+str(i)+"["+str(SnoopWidth-1)+":0]) ? cam_loc"+str(i)+" : "+str(CamWidth)+"'d0 )" for i in range(CamDepth)])
/f_f/
;

wire assign freeup_loc = ENCODEDDEPTH'd0 |
/f_f/
code = " |\\n ".join(["( (snoop_in == cam_loc"+str(i)+"["+str(SnoopWidth-1)+":0]) ? cam_loc"+str(i)+" : "+str(EncodedDepth)+"'d"+str(i)+" )" for i in range(CamDepth)])
/f_f/
;

wire assign freedup_loc_valid = snoop_match;
"""
cam=CAM(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]),sys.argv[4],sys.argv[5])
cam.main()
