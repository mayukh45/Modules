from templates import mux_body_template
from math import ceil, log2
import sys

class Multiplexor:
    def __init__(self, portwidth, numclients, isdemux, isbinary):
        self.PortWidth = portwidth
        self.NumClients = numclients
        self.isDemux = isdemux
        self.body = None
        self.isBinary = isbinary

    def get_body(self):
        self.body = mux_body_template
        self.body = self.body.replace("NAME", "mux" if self.isDemux is None else "demux")
        self.body = self.body.replace("MUXPORTWIDTH", str(self.PortWidth))
        self.body = self.body.replace("MUXNUMCLIENTS", str(self.NumClients))
        self.declare_ports()
        self.declare_vectors()
        self.assign_data()

    def declare_ports(self):

        if not self.isDemux:
            code = "\n".join(["in_data"+str(i)+"," for i in range(self.NumClients)])
            code += "\nout_data,\nmux_select"
        else:
            code = "\n".join(["out_data" + str(i) + "," for i in range(self.NumClients)])
            code += "\nin_data,\ndemux_select"

        self.body = self.body.replace("//PORT_DECLARATION", code)

    def declare_vectors(self):
        if not self.isDemux:
            code = "\n".join(["input ["+str(self.PortWidth-1)+":0] in_data"+str(i)+";" for i in range(self.NumClients)])
            code += "\noutput ["+str(self.PortWidth-1)+":0] out_data;\ninput ["+(str(self.NumClients-1) if not self.isBinary else str(int(ceil(log2(self.NumClients-1)))))+":0] mux_select;"
        else:
            code = "\n".join(["output [" + str(self.PortWidth - 1) + ":0] out_data" + str(i) + ";" for i in range(self.NumClients)])
            code += "\ninput ["+str(self.PortWidth-1)+":0] in_data;\ninput ["+(str(self.NumClients-1) if not self.isBinary else str(int(ceil(log2(self.NumClients-1)))))+":0] demux_select;"

        self.body = self.body.replace("//VECTOR_DECLARATION", code)

    def assign_data(self):
        if not self.isDemux:
            code = "wire assign out_data = "+str(self.PortWidth)+"'d0 |" + " |\n ".join(["(mux_select"+("["+str(i)+"]" if not self.isBinary else "= "+str(int(ceil(log2(self.NumClients))))+"'d"+str(i)+"") +"? in_data"+str(i)+" : "+str(self.PortWidth)+"'d0)" for i in range(self.NumClients)])
        else:
            code = "\n".join(["wire assign out_data"+str(i)+" = demux_select"+("["+str(i)+"]" if not self.isBinary else "=="+str(int(ceil(log2(self.NumClients))))+"'d"+str(i))+"? in_data : 25'd0;" for i in range(self.NumClients)])

        self.body = self.body.replace("//ASSIGN_DATA", code)

    def __str__(self):
        self.get_body()
        return self.body


print(Multiplexor(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4]))
