import sys
import os
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from pathlib import Path

"""
if isDemux = 1 then this module for Multiplexor
and isDemux= 0 then Demultiplexor
"""


class Multiplexor(BasicModule):

    def Create_dic_of_variable(self):
        self.variable_dict['NumClients']=self.NumClients
        self.variable_dict['PortWidth']=self.PortWidth
        self.variable_dict['isDemux']=self.isDemux
        self.variable_dict['isBinary']=self.isBinary

    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.multiplexor_body)
        self.body+=dynamicgenerator.parse_body()
        self.body=self.body.replace("name",self.name)
        dynamicgenerator.silentremove()
        return self.body

    def get_verilog(self):
        return self.get_body()

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()


    def __init__(self, portwidth, numclients, isdemux, isbinary):
        self.PortWidth = portwidth
        self.NumClients = numclients
        self.isDemux = isdemux
        self.isBinary = isbinary
        self.body=""
        self.variable_dict={}
        self.Create_dic_of_variable()
        if self.isDemux==1:
            self.name="AH_Multiplexor"+"_"+str(portwidth)+"_"+str(numclients)
        else:
            self.name="AH_Demultiplexor"+"_"+str(portwidth)+"_"+str(numclients)
        self.multiplexor_body="""
module name (
/f_f/
if isDemux == 1:
    code = "\\n".join(["in_data"+str(i)+"," for i in range(NumClients)])
    code += "\\nout_data,\\n mux_select );"
else:
    code = "\\n".join(["out_data" + str(i) + "," for i in range(NumClients)])
    code += "\\n in_data,\\n demux_select );"
/f_f/

/f_f/

if isDemux == 1:
    code = "\\n".join([" input ["+str(PortWidth-1)+":0] in_data"+str(i)+";" for i in range(NumClients)])
    code += "\\n output ["+str(PortWidth-1)+":0] out_data;\\n input ["+(str(NumClients-1) if isBinary ==1  else str(int(ceil(log2(NumClients-1)))))+":0] mux_select;"
else:
    code = "\\n".join([" output [" + str(PortWidth - 1) + ":0] out_data" + str(i) + ";" for i in range(NumClients)])
    code += "\\n input ["+str(PortWidth-1)+":0] in_data;\\n input ["+(str(NumClients-1) if isBinary == 1 else str(int(ceil(log2(NumClients-1)))))+":0] demux_select;"
/f_f/

/f_f/

if isDemux == 1:
    code = " wire assign out_data = "+str(PortWidth)+"'d0 |" + " |\\n ".join(["(mux_select"+("["+str(i)+"]" if isBinary == 1 else "= "+str(int(ceil(log2(self.NumClients))))+"'d"+str(i)+"") +"? in_data"+str(i)+" : "+str(PortWidth)+"'d0)" for i in range(NumClients)])
else:
    code = "\\n".join(["wire assign out_data"+str(i)+" = demux_select"+("["+str(i)+"]" if isBinary ==1 else "=="+str(int(ceil(log2(NumClients))))+"'d"+str(i))+"? in_data : 25'd0;" for i in range(NumClients)])
/f_f/

end module
"""

mux=Multiplexor(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]), int(sys.argv[4]))
mux.main()