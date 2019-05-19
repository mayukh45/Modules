import copy
import yaml
from AH_SnoopableFIFO import SnoopableFIFO
from AH_Multiplexor import Multiplexor
from AH_Decoder import Decoder
from smartasic import BasicModule
from BusParser import BusParser
import sys
print(sys.path)


class OrderedSwitch(BasicModule):

    def Create_dic_of_variable(self):
       # self.variable_dict[]
       # self.variable_dict[]
       # self.variable_dict[]
       # self.variable_dict[]
        #self.variable_dict[]
       # self.variable_dict[]

        self.variable_dict = self.__dict__


    def get_body(self):
        object_dict = {}

        #=============================================================================
        # First we create the snoopable FIFO basic object with connection rules
        # and we update the dict
        spf1 = SnoopableFIFO(self.dsPktSize, self.SnoopDepth, self.upResponseDecodableFieldWidth)
        spf1.smart_connectionop("astob", "wr_","egress0_dspkt_")
        spf1.smart_connectionop("astob",  "rd_", "egress0_dspkt_")
        spf1.smart_connectionop("astob",  "snoop_", "egress0_dspkt_")
        spf1.add_connection_flat("svalid","{ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]}")
        print(spf1.dict)

        object_dict.update({"u_egress0_snoopablefifo_"+str(self.dsPktSize)+"_"+str(self.SnoopDepth)+"_"+str(self.upResponseDecodableFieldWidth) : spf1})
        #=============================================================================


        #=============================================================================
        #A deep copy of each new snoopableFIFO object is created from first massaged
        # object. The object_dict.update is called each time.

        for i in range(1, self.NumberOfEgress):
            curr_obj = copy.deepcopy(spf1)
            curr_obj.smart_connectionop("astob", "egress0" , "egress"+str(i))
            print(curr_obj.get_object_declaration_str("hello"))
            object_dict.update({"u_egress"+str(i)+"_snoopablefifo_" + str(self.dsPktSize) + "_" + str(self.SnoopDepth) + "_" + str(self.upResponseDecodableFieldWidth): curr_obj})

        #=============================================================================
        #Finally replace in body strings...
        c = 1
        for k,v in object_dict.items():
            self.order_body.replace("snoop_dec" + str(c), v.get_object_declaration_str(k))
            c +=1

        obj_list = list(object_dict.values())

        #=============================================================================
        mux1 = Multiplexor(self.NumberOfEgress, self.dsPktSize,1, 0)
        #mux2 = Multiplexor(self.NumberOfEgress, self.dsPktSize,1,0)
        self.order_body.replace("demux_dec1", mux1.get_object_declaration_str("u_demux_4_25"))
        self.order_body.replace("demux_dec2", mux1.get_object_declaration_str("u_demux_4_25"))

        #=============================================================================
        decoder = Decoder(self.NumberOfEgress, self.upPktSize)
        self.order_body.replace("decoder_dec", decoder.get_object_declaration_str("u_decoder_4_20"))


        #=============================================================================
        obj_list.append(mux1)
        #obj_list.append(mux2)
        obj_list.append(decoder)

        self.order_body.replace("snoop_dec" + str(c), v.get_object_declaration_str(k))

        self.dict , self.wire_dict = self.populate_wire_and_ports(obj_list)


    def add_ports_from_bus(self):
        BasicModule.add_ports_from_bus(self)
        self.get_all_key_value_pairs(self.dict)

    def main(self):
        self.get_body()

    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width, snoopdepth):
        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)

        self.NumberOfEgress = number_of_egress
        self.dsPktSize = ds_packet_size
        self.SnoopDepth = snoopdepth
        self.upPktSize = ups_packet_size
        self.dsDecodableFieldWidth = ds_decodable_field_width
        self.upResponseDecodableFieldWidth = ups_response_decodable_field_width
        self.dict = {}
        self.wire_dict = {}
        BasicModule.__init__(self, self.name)
        self.order_body = """
// 4 --> number of egress.
// 25 -> ds packet size
// 20 -> upstream packet size.
// 10 -> address or downstream decodable field width.
// 12 -> id or ordering and upstream-response decodable field width.

// These numbers are unique - if you look into decoder instnce and demux instance - you will find them onlye



//
===========================================================================================
//
===========================================================================================


// ================================================

// ============================================================================================================================
// Identify the ADDR field or similar downstream field which can help decide
// the direction of transaction

// 4 --> decode arm, 13 --> decode-field (typically address) ID.

//TODO:Here we are assuming that upper most field contains address.
//It might not be so in most cases. So the ordered-switch does need to have
//that passed as a parameter. We need to decide whether ordered switch
//reflects the name there.

//TODO: Again each address aperture will be different and there's no way we
//can pass this as argument. Even if we do, somewhere we need to provide it.
//In current approach, the apertures will be built inside decoder.
//Now ap_00001 can be a nomenclature on full Ahant's library.


// 4 --> number of egress.
// 25 -> ds packet size
// 20 -> upstream packet size.
// 10 -> address or downstream decodable field width.
// 12 -> id or ordering and upstream-response decodable field width.

// These numbers are unique - if you look into decoder instnce and demux instance - you will find them onlye


//AH_decoder_4_10 u_decoder_4_10_ap_00001 (
  //  .ingress_pkt_field      (ingress_ds_pkt[24:24-9]),
 //   .decoded_binary         (ingress_decoded[3:0])
 //   .dec_err                ()
//);

//decoder_obj

//u_demux_4_25 = AH_demux(4, 25)
//u_demux.port_connect()


 1. Instance the class of Python and create an object - pass the parms required
 2. Access the port dict - add stuffs to it may be so that it reprensts the connectivity picture
 3. call class_instance.port_connect method - it prints the ports in veirlog syntax and updates on calling
 class the wire dictionary, and it's own port dictionary may be.

// 4 --> number of egress.
// 25 -> ds packet size
// 20 -> upstream packet size.
// 10 -> address or downstream decodable field width.
// 12 -> id or ordering and upstream-response decodable field width.

//demux_dec1
// 25 --> width of fifo
// 32 --> depth of FIFO - TODO: Again another parameter. It's not possible
// to reflect all of them in module name. It's better to probably keep a param
// list inside and create a .h fle for the same also.

//===================================================================================
//snoop_dec1
wire assign egress0_ds_pkt_valid = ingress_decode[0] & !block_egress0_ds_pkt & egress0_ds_pkt_valid_pre;


//===================================================================================
//snoop_dec2
wire assign egress1_ds_pkt_valid = ingress_decode[0] & !block_egress1_ds_pkt & egress1_ds_pkt_valid_pre;


//===================================================================================
//snoop_dec3
wire assign egress2_ds_pkt_valid = ingress_decode[0] & !block_egress2_ds_pkt & egress2_ds_pkt_valid_pre;


//===================================================================================
//snoop_dec4
wire assign egress3_ds_pkt_valid = ingress_decode[0] & !block_egress3_ds_pkt & egress3_ds_pkt_valid_pre;

// TODO: Downstream path is complete more or less.
// Upstream path needs to be done.


//===================================================================================
AH_arbrr_4 u_arbrr_4 (
    .clk(clk),
    .rstn(rstn),

//TODO: Choose one of the implementation

    .req                ({
                        egress0_us_pkt_valid ,
                        egress1_us_pkt_valid ,
                        egress2_us_pkt_valid ,
                        egress3_us_pkt_valid
                        }),

    //TODO: we need width-learning or something similar here.
    .grant              (egress_arbed[3:0]
                        ),
);

//===================================================================================
// 4 --> number of egress.
// 25 -> ds packet size
// 20 -> upstream packet size.
// 10 -> address or downstream decodable field width.
// 12 -> id or ordering and upstream-response decodable field width.

//demux_dec2
//===================================================================================
// While sending upstream response valid -
// For each egress channel-
//       if we find the guy has won grant and carries an entry with same trackable field(ID)
//       as the one stored in FIFO, we let it go.


wire assign snoopfifo_rd_legal   = 1'b0 |
                                    (egress_arbed[0] & egress0_snoopfifo_rd_valid & (egress0_snoopfifo_rd[11:0] = ingress_us_pkt[11:0]) ) |
                                    (egress_arbed[1] & egress1_snoopfifo_rd_valid & (egress1_snoopfifo_rd[11:0] = ingress_us_pkt[11:0]) ) |
                                    (egress_arbed[2] & egress2_snoopfifo_rd_valid & (egress2_snoopfifo_rd[11:0] = ingress_us_pkt[11:0]) ) |
                                    (egress_arbed[3] & egress3_snoopfifo_rd_valid & (egress3_snoopfifo_rd[11:0] = ingress_us_pkt[11:0]) ) |
                                    );
/f_f/
code = "\\n"+"\\n".join(["(egress_arbed[0] & egress0_snoopfifo_rd_valid & (egress0_snoopfifo_rd[upResponseDecodableFieldWidth - 1:0] = ingress_us_pkt[:0]) )" for i in range(NumberOfEgress)])
/f_f/

wire assign ingress_us_pkt_valid = arbed_out_valid & snoop_fifo_rd_legal;
wire assign arbed_out_ready      = ingress_us_pkt_ready & snoop_fifo_rd_legal;

//TODO: watch out for timing in this area and think about simplifying the logic.

wire assign egress0_snoopfifo_rd_ready = snoopfifo_rd_legal;
wire assign egress1_snoopfifo_rd_ready = snoopfifo_rd_legal;
wire assign egress2_snoopfifo_rd_ready = snoopfifo_rd_legal;
wire assign egress3_snoopfifo_rd_ready = snoopfifo_rd_legal;


endmodule



// 25 --> width of fifo
// 32 --> depth of FIFO - TODO: Again another parameter. It's not possible
// to reflect all of them in module name. It's better to probably keep a param
// list inside and create a .h fle for the same also.


//Identify the ID or trackable field from downstream packet.Create snoop valid
//and match signals from downstream request valid.


// Instantiate the snoop FIFO - which can create a snoop match logic. Connect
// the snoop match to decoder/demux output there. The decoder will have only
// legal requests to egress arms forwarded downstream.


// Instantiaate upstream decoder (based on trackable field as ID)
//

// Instantiate the upstream arbiter.
"""


t = OrderedSwitch(int(sys.argv[1]), int(sys.argv[2]),int(sys.argv[3]) ,int(sys.argv[4]), int(sys.argv[5]), int(sys.argv[6]))
t.main()
#with open('../order_port.yaml','w') as f:

 #   f.write(yaml.dump(t.dict))
#print(yaml.dump(t.dict))
print("1"*500)
t.add_ports_from_bus()
#print(yaml.dump(t.wire_dict))
p , q = t.get_port_str()
#print(p)
##print(q)i
print(t.order_body)
