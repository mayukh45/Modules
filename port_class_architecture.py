# =====================================================================================================================================
# Port class SW architecture
# =====================================================================================================================================
class BusParser:


     # =====================================================================================================================================
     # Initialize the Bus class
     # bus_name loaded from yaml. # prefix is added to define the bus,
     #
     # cpu2usb_controller_uart_uartn_txd (this is a port or signal name on the verilog module)
     # cpu2usb_controller_uart_uartn_rxd (this is a port or signal name on the verilog module)
     # cpu2usb_controller_uart_uartn_cts (this is a port or signal name on the verilog module)
     # cpu2usb_controller_uart_uartn_rts (this is a port or signal name on the verilog module)
     # prefix --> cpu2usb_controller
     #
     # bus --> uart
     # any hierarchy after that is missing here but it might come        for AXI kind      of other buses
     #
     #
     # normally the master2slave_* format is used.
     # During object init,              world_view string is                                 loaded to both prefix and prefloat keys (btw, these keys are not there  in original yaml, so required to created.)
     # =====================================================================================================================================
     def __init__ (self, bus_name, world_view):
          pass
     # =====================================================================================================================================
     # prints the loaded bus object hash at any point of time. This method can be used during debug.
    
     def print (self, bus_name):

    
     # =====================================================================================================================================
     # dumps the bus back in yaml format. This method should be part of all the module classes that uses buses (all most all of them.)
     # The dumped buses can be used by senior architects and designers to figure out the state of affairs.
     
     def dyaml(self, bus_name):
      
    
     # =====================================================================================================================================
     # This just flips the entire bus
     # expression is signal name written in bus_name.hier_1_ch.hier_2_ch....signal_1_name mode.
    
     def flip(self, expression):
    
    
     # =====================================================================================================================================
     # change width of particular signal.
     # TODO: We need to put some formulae here so that associated signals can change width together
     # For e.g., data and strobe are related and they should be able to change together.
     # similarly, read and write port width is similar and they should be able to be changed together. 
     #
     # Here expression is the signal in hierarchical way. And we should be able to search the signal directly. 
     #
    
     def widop(self, expression, width_new):


     # =====================================================================================================================================
     # Bus connectivity architecture 
     # connects the bus to a prefloat value - the prefloat value is the name with which the wire is floated.
     # Ultimately when a bunch of objects are modules are instantiated in a class, the prefloat value wires will be used to dump all the wires

     def prefixop(self, expression, prefix):
         pass
     def prefloatop(self, expression, prefloat):
         pass

     



 # =====================================================================================================================================
 # port-map opertor -- 



