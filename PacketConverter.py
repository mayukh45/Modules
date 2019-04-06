from templates import packet_converter_template
from math import ceil, log2
import sys


class PacketConverter:
    def __init__(self, width1, width2, isW2N):
        self.WideWidth = max(width1, width2)
        self.NarrowWidth = min(width1, width2)
        self.isW2N = isW2N
        self.ratio = (self.WideWidth // self.NarrowWidth)
        self.VecWidth = int(log2(self.WideWidth/self.NarrowWidth))
        self.body = None

    def get_body(self):
        name = None

        if self.isW2N == "True":
            name = "w2n_"+str(self.WideWidth)+"_"+str(self.NarrowWidth)
        else:
            name = "n2w_"+str(self.NarrowWidth)+"_"+str(self.WideWidth)

        self.body = packet_converter_template
        self.body = self.body.replace("NAME", name)
        self.body = self.body.replace("WIDEWIDTH - 1", str(self.WideWidth - 1))
        self.body = self.body.replace("VECWIDTH - 1", str(self.VecWidth - 1))
        self.body = self.body.replace("NARROWWIDTH - 1", str(self.NarrowWidth - 1))
        self.body = self.body.replace("WIDEWIDTH", str(self.WideWidth))
        self.body = self.body.replace("VECWIDTH", str(self.VecWidth))
        self.declaration()
        self.add_collated()
        self.assign_data()
        
    def declaration(self):
        if self.isW2N:
            code = "input ["+str(self.WideWidth-1)+":0]in_data;\noutput ["+str(self.NarrowWidth-1)+":0] out_data;"
        else:
            code = "input ["+str(self.WideWidth-1)+":0]in_data;\noutput ["+str(self.WideWidth-1)+":0] out_data;\n" \
                    "reg ["+str(self.WideWidth)+":0] collated_packet;"
        self.body = self.body.replace("//DECLARATIONS", code)

    def add_collated(self):
        self.body = self.body.replace("//COLLATED", "\tcollated_packet <="+str(self.WideWidth)+"'d0;")
        self.body = self.body.replace("//NCOLLATED", "\tcollated_packet <= ncollated_packet;")

    def assign_data(self):
        if self.isW2N:
            code = "assign npacket_lane = (in_valid & out_ready) ? packet_lane +1'b1 :\npacket_lane;"
            code += "assign out_valid = in_valid;\n" \
                    "assign out_data = in_data >> ("+str(self.NarrowWidth)+"* packet_lane); // LINT WARNING - take care.\n" \
                    "assign in_ready = out_ready & (packet_lane == "+str(self.VecWidth)+"'d"+str(self.ratio-1)+")"

        else:
            code = "assign npacket_lane = !in_valid ? packet_lane:\n\t" \
                   "(packet_lane != "+str(self.VecWidth)+"'d"+str(self.ratio-1)+") ? packet_lane + 1'b1:\n\t" \
                    "out_ready ? packet_lane + 1'b1 :packet_lane;"
            code += "wire assign ncollated_packet = ( (packet_lane == "+str(self.VecWidth)+"'d"+str(self.ratio)+") " \
                    "&& in_valid && out_ready ) ? "+str(self.WideWidth)+"'d0 : // delivery cyclein_valid\n " \
                    "? {collated_packet, in_data} : // Lint warning needs to be clean here\n" \
                    "collated_packet;"

            code += "assign out_valid = in_valid && (packet_lane == "+str(self.VecWidth)+"'d"+str(self.ratio)+");\n" \
                    "assign in_ready = (packet_lane == "+str(self.VecWidth)+"'d"+str(self.ratio)+") ? out_ready ? 1'b1;\n" \
                    "assign out_data = ncollated_packet;"

        self.body = self.body.replace("//ASSIGN_DATA", code)

    def __str__(self):
        self.get_body()
        return self.body

print(PacketConverter(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]))


