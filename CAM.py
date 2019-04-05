from math import ceil, log2
from templates import cam_body_template


class CAM:

    def __init__(self, camdepth, camwidth, snoopwidth):
        self.CamDepth = camdepth
        self.CamWidth = camwidth
        self.EncodedDepth = ceil(log2(int(camdepth)))
        self.SnoopWidth = snoopwidth
        self.body = None

    def get_body(self):
        self.body = cam_body_template
        self.body = self.body.replace("ENCODEDDEPTH -1", str(self.EncodedDepth-1))
        self.body = self.body.replace("ENCODEDDEPTH", str(self.EncodedDepth))
        self.body = self.body.replace("CAMWIDTH -1", str(self.CamWidth - 1))
        self.body = self.body.replace("CAMWIDTH", str(self.CamWidth))
        self.body = self.body.replace("SNOOPWIDTH -1", str(self.SnoopWidth - 1))
        self.body = self.body.replace("SNOOPWIDTH", str(self.SnoopWidth))
        self.request_declaration()
        self.cam_locations()
        self.cam_write()
        self.assign_snoop()
        self.assign_freeup()
        self.snoop_cam()

    def request_declaration(self):
        code = "\n".join(["req  ["+str(self.CamWidth-1)+":0] cam_loc"+str(i)+";" for i in range(self.CamDepth)])
        self.body = self.body.replace("REQUEST_DECLARATION", code)

    def cam_locations(self):
        code = "\n".join(["cam_loc"+str(i)+" <= "+str(self.CamWidth)+"'d0;" for i in range(self.CamDepth)])
        self.body = self.body.replace("CAM_LOCATIONS", code)

    def cam_write(self):
        code = "\n".join(["cam_loc"+str(i)+" <= (internal_wr_en & (internal_wr_ptr == "+str(self.EncodedDepth)+""
                "'d"+str(i)+") ) ? wr_data : cam_loc"+str(i)+";" for i in range(self.CamDepth)])
        self.body = self.body.replace("CAM_WRITE", code)

    def assign_snoop(self):
        code = " | ".join(["( (snoop_in == cam_loc"+str(i)+"["+str(self.SnoopWidth-1)+":0]) ? cam_loc"+str(i)+" : "+str(self.CamWidth)+"'d0 )" for i in range(self.CamDepth)])
        self.body = self.body.replace("ASSIGN_SNOOP", code)

    def snoop_cam(self):
        code = " | ".join(["(snoop_in == cam_loc"+str(i)+"["+str(self.SnoopWidth-1)+":0])" for i in range(self.CamDepth)])
        self.body = self.body.replace("SNOOP_CAM", code)

    def assign_freeup(self):
        code = " | ".join(["( (snoop_in == cam_loc"+str(i)+"["+str(self.SnoopWidth-1)+":0]) ? cam_loc"+str(i)+" : "+str(self.EncodedDepth)+"'d"+str(i)+" )" for i in range(self.CamDepth)])
        self.body = self.body.replace("ASSIGN_FREEUP", code)

    def __str__(self):
        self.get_body()
        return self.body


print(CAM(64,25,11))
