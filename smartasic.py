import os
from enum import Enum
from math import log2
from templates import module_template
from templates import fifo_body_template
from BusParser import BusParser
from pathlib import Path


class Port:

    class Direction(Enum):
        INPUT  = "input"
        OUTPUT = "output"
        INOUT  = "inout"

    def __init__(self, name, direction, width):
        """
        if not isinstance(direction, Port.Direction):
            raise TypeError('direction must be an instance of Port.Direction')
            """
        if width < 1:
            raise TypeError('width should be > 0')
        self.name = name
        self.direction = direction
        self.width = width

    def get_declaration(self):
        if self.width == 1:
            return "{0} {1};".format(self.direction, self.name)
        else:
            return "{0} [{1}:0] {2};".format(self.direction, self.width - 1, self.name)

    def __str__(self):
        return self.get_declaration()


class BasicModule:

    def __init__(self, name):
        self.name = name
        self.Ports = []
        self.results = []
        self.port_list = []

    def add_port(self, name, direction, width):
        self.Ports.append(Port(name, direction, width))

    def get_port_str(self):
        """port_objs = [self.__dict__[name] for name in self.__dict__ if isinstance(self.__dict__[name], Port)]
        port_decl_str = ""
        port_name_str = ""
        for port in port_objs:                                                                                                      port_decl_str += str(
            port_decl_str += str(port)
            port_decl_str += "\n"
            port_name_str += port.name
            port_name_str += ", "
            port_name_str = port_name_str.strip().strip(",")
        return port_name_str, port_decl_str
        """

        port_decl_str = "\n".join([str(port) for port in self.Ports])
        port_name_str = "\n,".join([port.name for port in self.Ports])
        return port_name_str, port_decl_str

   #====================================================================================================================================================
   # IMPORTANT - This base class method instantiates a busparser class aj object and will contain the port as dictionary object within busparser object.
   #
   # This method should be overwirren in subclasses whenever necessary. Use case of overwritting is as follows -
   #
   # While writing a new class for a new Verilog Module, we should always look inside refbuses folder and see if there's an existing yaml
   # that matches the dictionary closely or somewhat closely.
   # Then we should use available busparser method to operate on the dictionary and reach the desired dictionary for the target vlass.
   # Ultimately a list is extracted from the dictionary object and used to create ports for each leaf. In get header method it reflects the output
   # in Verilog world.
   #
   # Finally, the rationale behind keeping this as dictionary is that it's a systematic data-structure and can be used through multiple hierarchies
   # systematically.
   #====================================================================================================================================================

    def get_all_key_value_pairs(self, data):
         def inner(data):
             if isinstance(data, dict):
                 # print("I found a dictionary")
                 for k, v in data.items():
                     if (isinstance(v, dict) or
                             isinstance(v, list) or
                             isinstance(v, tuple)
                         ):
                         # print("I am going to dive one level recursion here.")

                         if 'direction' in v.keys():
                             # TODO: I need to find the values of 'width', 'direction' and of course
                             # 'signal' here. If I can print them, I can just call self.add_port method
                             # here with them.
                             self.add_port(k, v['direction'], v['width'])

                             #  print("I have found direction, must be at a signal.")
                             self.port_list.append(k)

                         inner(v)
                     else:
                         self.results.append((k, v))
             elif isinstance(data, list) or isinstance(data, tuple):
                 for item in data:
                     inner(item)

         inner(data)
         return self.results

    def add_ports_from_bus(self):
        self.Ports.clear()
        self.add_port("clk", "input", 1)
        self.add_port("rstn", "input", 1)

    def get_object_declaration_str(self, bus_dict):
        pass


    def get_header(self):
        mytemplate = module_template
        mytemplate = mytemplate.replace("MODULENAME", self.name)
        portlist, portdecl = self.get_port_str()
        mytemplate = mytemplate.replace("PORTLIST", portlist)
        mytemplate = mytemplate.replace("PORTDECLARATION", portdecl)
        return mytemplate

   #====================================================================================================================================================
   # IMPORTANT :- These base class methods downstream are useful building blocks for many verilog code - they offer stuffs including.
   # looping for wr, rd, snoop, snoop-invalidate, register declaration, wire declaration etc many things.
   # The idea is to use these methods as much as possible and if required create a new method on similar lines and push to base class.
   #
   # Method name should be kept generic and arguments used judiciously so that it can be maintained cleanly as the framework grows.
   #====================================================================================================================================================


    def get_reg_str(self, type, delimiter, width, module_name, iterations):
        return "\n"+delimiter.join(["{2} [{0}:0] {1}".format(width, module_name, type)+str(i)+";" for i in range(iterations)])

    def snoop_match_noinv(self, module_name, snoop, SnoopWidth, iterations, delimiter):
        return "\n"+delimiter.join(["(({0}{3}[{2}:0] == {1}) ? 1'b1 : 1'b0)".format(module_name,snoop,SnoopWidth-1,i) for i in range(iterations)])

    def snoop_inv(self, delimiter, snoopwidth, snoop, module_name, camdepth, camwidth):
        return "\n" + delimiter.join(["( ({0} == {1}".format(snoop,module_name)+str(i)+"["+str(snoopwidth-1)+":0]) ? {0}".format(module_name)+str(i)+" : "+str(camwidth)+"'d0 )" for i in range(camdepth)])

    def snoop_get_wr_ptr(self,delimiter,module_name,snoop,snoopwidth,encodeddepth,camdepth):
        return delimiter.join(["( ({0} == {1}".format(snoop,module_name) + str(i) + "[" + str(snoopwidth - 1) + ":0]) ?"+module_name + str(i) + " : " + str(encodeddepth) + "'d" + str(i) + " )" for i in range(camdepth)])

    def read_loc(self, encodeddepth, module_name, fifowidth, fifodepth, delimiter):
        return "\n"+delimiter.join(["( (rd_pointer["+str(encodeddepth)+":0] == "+str(encodeddepth+1)+"'d"
                ""+str(i)+") ? "+module_name+str(i)+" : "+str(fifowidth)+"'d0)" for i in range(fifodepth)])

    def write_loc(self, delimiter, module_name, encodeddepth, fifodepth):
        return "\n\t"+delimiter.join([module_name+str(i)+" <= (wr_pointer["+str(encodeddepth-2)+":0] == "+str(encodeddepth)+"'d"+str(i)+") ? wr_data : "+module_name+str(i)+";" for i in range(fifodepth)])

    def write_loc_rstn(self, delimiter, module_name, fifowidth, fifodepth):
        return "\n\t"+delimiter.join([module_name+str(i)+" <= "+str(fifowidth)+"'d0;" for i in range (fifodepth)])

    def cam_write(self,delimiter,module_name,camdepth,encodeddepth):
        return "\n\t" + delimiter.join([module_name + str(i) + " <= (internal_wr_en & (internal_wr_ptr == " + str(encodeddepth) + ""
            "'d" + str(i) + ") ) ? wr_data : "+module_name + str(i) + ";" for i in range(camdepth)])

    def write_to_file(self, verilog):
        with open(str(Path.home())+"/Documents/smartasic2/dumpverilog/"+self.name+".v","w") as f:
            f.write(verilog)

    def remove_port(self, port_name):
        for port in self.Ports:
            if port.name == port_name:
                self.Ports.remove(port)
                return


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
        self.__init__(self.name, self.width, height, self.clk_type, self.flow_ctrl)

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


