import os
from enum import Enum
from math import log2
from templates import module_template
from templates import fifo_body_template


class Port:

    class Direction(Enum):
        INPUT  = "input"
        OUTPUT = "output"
        INOUT  = "inout" 
        print(Enum)
    def __init__(self, name, direction, width):
        if not isinstance(direction, Port.Direction):
            raise TypeError('direction must be an instance of Port.Direction')
        if width < 1:
            raise TypeError('width should be > 0')
        self.name = name
        self.direction = direction
        self.width = width

    def get_declaration(self):
        if self.width == 1:
            return "{0} {1};".format(self.direction.value, self.name)
        else:
            return "{0} [{1}:0] {2};".format(self.direction.value, self.width - 1, self.name)

    def __str__(self):
        return self.get_declaration()



class BasicModule:
    
    def __init__(self, name):
        self.name = name
        self.clk = Port("clk", Port.Direction.INPUT, 1)
        self.rst = Port("rstn", Port.Direction.INPUT, 1)

    def get_port_str(self):
        port_objs = [self.__dict__[name] for name in self.__dict__ if isinstance(self.__dict__[name], Port)]
        port_decl_str = "" 
        port_name_str = ""
        for port in port_objs:
            port_decl_str += str(port)
            port_decl_str += "\n"
            port_name_str += port.name
            port_name_str += ", "
        port_name_str = port_name_str.strip().strip(",")
        return port_name_str, port_decl_str

    def get_header(self):
        mytemplate = module_template
        mytemplate = mytemplate.replace("MODULENAME", self.name)
        portlist, portdecl = self.get_port_str()
        mytemplate = mytemplate.replace("PORTLIST", portlist)
        mytemplate = mytemplate.replace("PORTDECLARATION", portdecl)
        return mytemplate


class FIFO(BasicModule):

    class ClockType(Enum):
        SYNC  = "sync"
        ASYNC = "async"
        RSYNC = "rsync"

    class FlowControl(Enum):
        VALID_READY  = "valid_ready"
        VALID_BUSY   = "valid_busy"
        VALID_CREDIT = "valid_credit"

    def __init__(self, name, width, depth, clk_type, flow_ctrl):
        if not isinstance(clk_type, FIFO.ClockType):
            raise TypeError('clk_type must be an instance of FIFO.ClockType')
         if not isinstance(flow_ctrl, FIFO.FlowControl):
            raise TypeError('flow_ctrl  must be an instance of FIFO.FlowControl')
        super(FIFO, self).__init__(name)
        self.width = width
        self.depth = depth
        self.clk_type = clk_type
        self.flow_ctrl = flow_ctrl
        self.wr_valid = Port("wr_valid", Port.Direction.INPUT,  1)
        self.wr_ready = Port("wr_ready", Port.Direction.OUTPUT, 1)
        self.wr_data  = Port("wr_data",  Port.Direction.INPUT,  self.width)
        self.rd_valid = Port("rd_valid", Port.Direction.OUTPUT, 1)
        self.rd_ready = Port("rd_ready", Port.Direction.INPUT,  1) 
        self.rd_data  = Port("rd_data",  Port.Direction.OUTPUT, self.width)

    def update(self):
        self.__init__(self.name, self.width, self.depth, self.clk_type, self.flow_ctrl)
    
    def update_width(self, width):
        self.__init__(self.name, width, self.depth, self.clk_type, self.flow_ctrl)

    def update_height(self, height):
        self.__init__(self.name, self.width, depth, self.clk_type, self.flow_ctrl)

    def get_body(self):
        encoded_depth = int(log2(self.depth))
        mytemplate = fifo_body_template
        mytemplate = mytemplate.replace("ENCODEDDEPTH", str(encoded_depth))
        mytemplate = mytemplate.replace("FIFOWIDTH", str(self.width))
        mytemplate = mytemplate.replace("FIFODEPTH", str(self.depth))
        return mytemplate

    def get_fifo_v(self):
        modulecode = self.get_header()
        modulecode = modulecode.replace("BODY", self.get_body())
        return modulecode

    def __str__(self):
        return self.get_fifo_v()


