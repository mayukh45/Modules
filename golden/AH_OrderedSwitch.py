import copy
import yaml
from AH_SnoopableFIFO import SnoopableFIFO
from smartasic import BasicModule
from BusParser import BusParser
import sys
print(sys.path)


class OrderedSwitch(BasicModule):

    def get_body(self):
        object_dict = {}
        spf1 = SnoopableFIFO(self.dsPktSize, self.SnoopDepth, self.upResponseDecodableFieldWidth , "../astob_for_order_switch.yaml", "astob")
        object_dict.update({"u_egress0_snoopablefifo_"+str(self.dsPktSize)+"_"+str(self.SnoopDepth)+"_"+str(self.upResponseDecodableFieldWidth) : spf1})
        spf1.smart_connectionop("astob", "wr_","egress0_dspkt_")
        spf1.smart_connectionop("astob",  "rd_", "egress0_dspkt_")
        spf1.smart_connectionop("astob",  "snoop_", "egress0_dspkt_")
        spf1.add_connection_flat("svalid","{ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]}")
        #print(spf1.dict)
        
        print(spf1.get_object_declaration_str("hello"))
        object_dict.update({"u_egress0_snoopablefifo_"+str(self.dsPktSize)+"_"+str(self.SnoopDepth)+"_"+str(self.upResponseDecodableFieldWidth) : spf1})
        for i in range(1, self.NumberOfEgress):
            curr_obj = copy.deepcopy(spf1)
            curr_obj.smart_connectionop("astob", "egress0" , "egress"+str(i))
            #print(yaml.dump(curr_obj.dict))
            object_dict.update({"u_egress"+str(i)+"_snoopablefifo_" + str(self.dsPktSize) + "_" + str(
                self.SnoopDepth) + "_" + str(self.upResponseDecodableFieldWidth): curr_obj})

        self.dict , self.wire_dict = self.populate_wire_and_ports(object_dict.values())


    def add_ports_from_bus(self):
        BasicModule.add_ports_from_bus(self)
        self.get_all_key_value_pairs(self.dict)

    def main(self):
        self.get_body()

    def __init__(self, number_of_egress,ds_packet_size, ups_packet_size, ds_decodable_field_width, ups_response_decodable_field_width, snoopdepth):
        self.name = "AH_"+self.__class__.__name__+"_"+str(number_of_egress)+"_"+str(ds_packet_size)+"_"+str(ups_packet_size)+"_"+str(ds_decodable_field_width)+"_"+str(ups_response_decodable_field_width)
        BasicModule.__init__(self, self.name)
        self.NumberOfEgress = number_of_egress
        self.dsPktSize = ds_packet_size
        self.SnoopDepth = snoopdepth
        self.upPktSize = ups_packet_size
        self.dsDecodableFieldWidth = ds_decodable_field_width
        self.upResponseDecodableFieldWidth = ups_response_decodable_field_width
        self.dict = {}
        self.wire_dict = {}
        self.order_body = """
// 4 --> number of egress.
// 25 -> ds packet size
// 20 -> upstream packet size.
// 10 -> address or downstream decodable field width.
// 12 -> id or ordering and upstream-response decodable field width.
module AH_ordered_switch_4_25_20_10_12 (
clk,
rstn,

// ================================================
ingress_ds_pkt,
ingress_ds_pkt_valid,
ingress_ds_pkt_ready,

ingress_us_pkt,
ingress_us_pkt_valid,
ingress_us_pkt_ready,

// ================================================
egress0_ds_pkt,
egress0_ds_pkt_valid,
egress0_ds_pkt_ready,

egress0_us_pkt,
egress0_us_pkt_valid,
egress0_us_pkt_ready,

// ================================================
egress1_us_pkt,
egress1_us_pkt_valid,
egress1_us_pkt_ready,

egress1_ds_pkt,
egress1_ds_pkt_valid,
egress1_ds_pkt_ready,

// ===============================================
egress2_ds_pkt,
egress2_ds_pkt_valid,
egress2_ds_pkt_ready,

egress2_us_pkt,
egress2_us_pkt_valid,
egress2_us_pkt_ready,

// ===============================================
egress3_ds_pkt,
egress3_ds_pkt_valid,
egress3_ds_pkt_ready,

egress3_us_pkt,
egress3_us_pkt_valid,
egress3_us_pkt_ready,

);

//
===========================================================================================
//
===========================================================================================

input clk;
input rstn;

// ================================================
input [24:0]    ingress_ds_pkt_data;
input           ingress_ds_pkt_valid;
output          ingress_ds_pkt_ready;

output [19:0]   ingress_us_pkt_data;
output          ingress_us_pkt_valid;
input           ingress_us_pkt_ready;

// ================================================
output [24:0]   egress0_ds_pkt;
output          egress0_ds_pkt_valid;
input           egress0_ds_pkt_ready;

input [19:0]    egress0_us_pkt;
input           egress0_us_pkt_valid;
output          egress0_us_pkt_ready;

// ================================================
output [24:0]   egress1_ds_pkt;
output          egress1_ds_pkt_valid;
input           egress1_ds_pkt_ready;

input [19:0]    egress1_us_pkt;
input           egress1_us_pkt_valid;
output          egress1_us_pkt_ready;

// ================================================
output [24:0]   egress2_ds_pkt;
output          egress2_ds_pkt_valid;
input           egress2_ds_pkt_ready;

input [19:0]    egress2_us_pkt;
input           egress2_us_pkt_valid;
output          egress2_us_pkt_ready;

// ================================================
output [24:0]   egress3_ds_pkt;
output          egress3_ds_pkt_valid;
input           egress3_ds_pkt_ready;

output [19:0]   egress3_us_pkt;
output          egress3_us_pkt_valid;
input           egress3_us_pkt_ready;
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

AH_decoder_4_10 u_decoder_4_10_ap_00001 (
    .decode_field       (ingress_ds_pkt[24:24-9]),
    .decode_output      (ingress_decoded[3:0])
);

u_demux_4_25 = AH_demux(4, 25)
u_demux.port_connect()


 1. Instance the class of Python and create an object - pass the parms required
 2. Access the port dict - add stuffs to it may be so that it reprensts the connectivity picture
 3. call class_instance.port_connect method - it prints the ports in veirlog syntax and updates on calling
 class the wire dictionary, and it's own port dictionary may be.


AH_demux_4_25 u_demux_4_25 (
    .select             (ingress_decoded[3:0])
    .ingress_pkt        (ingress_ds_pkt),
    .ingress_pkt_valid  (ingress_ds_pkt_valid),
    .ingress_pkt_ready  (ingress_ds_pkt_ready),

    .egress0_pkt        (egress0_ds_pkt),
    .egress0_pkt_valid  (egress0_ds_pkt_valid_pre),
    .egress0_pkt_ready  (egress0_ds_pkt_ready),

    .egress1_pkt        (egress1_ds_pkt),
    .egress1_pkt_valid  (egress1_ds_pkt_valid_pre),
    .egress1_pkt_ready  (egress1_ds_pkt_ready),


    .egress2_pkt        (egress2_ds_pkt),
    .egress2_pkt_valid  (egress2_ds_pkt_valid_pre),
    .egress2_pkt_ready  (egress2_ds_pkt_ready),

    .egress3_pkt        (egress3_ds_pkt),
    .egress3_pkt_valid  (egress3_ds_pkt_valid_pre),
    .egress3_pkt_ready  (egress3_ds_pkt_ready),
);

// 25 --> width of fifo
// 32 --> depth of FIFO - TODO: Again another parameter. It's not possible
// to reflect all of them in module name. It's better to probably keep a param
// list inside and create a .h fle for the same also.

//===================================================================================
AH_snoopfifo_10_32_10 u_egress0_snoopfifo_25_32_12 (
    .clk                (clk),
    .rstn               (rstn),

    .wr_data            (egress0_ds_pkt),
    .wr_valid           (egress0_ds_pkt_valid),
    .wr_ready           (egress0_ds_pkt_ready),

    .rd_data            (egress0_snoopfifo_rd),
    .rd_valid           (egress0_snoopfifo_rd_valid),
    .rd_ready           (egress0_snoopfifo_rd_ready),

    .snoop_data         (egress0_ds_pkt),
    .snoop_valid        ({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]}),
    .snoop_match        (block_egress0_ds_pkt),

);
wire assign egress0_ds_pkt_valid = ingress_decode[0] & !block_egress0_ds_pkt & egress0_ds_pkt_valid_pre;


//===================================================================================
AH_snoopfifo_10_32_10 u_egress1_snoopablefifo_25_32_12 (
    .clk                (clk),
    .rstn               (rstn),

    .wr_data            (egress1_ds_pkt),
    .wr_valid           (egress1_ds_pkt_valid),
    .wr_ready           (egress1_ds_pkt_ready),

    .rd_data            (egress1_snoopfifo_rd),
    .rd_valid           (egress1_snoopfifo_rd_valid),
    .rd_ready           (egress1_snoopfifo_rd_ready),

    .snoop_data         (egress1_ds_pkt),
    .snoop_valid        ({ingress_decoded[2], ingress_decoded[3], ingress_decoded[0]}),
    .snoop_match        (block_egress1_ds_pkt),

);
wire assign egress1_ds_pkt_valid = ingress_decode[0] & !block_egress1_ds_pkt & egress1_ds_pkt_valid_pre;


//===================================================================================
AH_snoopfifo_10_32_10 u_egress2_snoopablefifo_25_32_12 (
    .clk                (clk),
    .rstn               (rstn),

    .wr_data            (egress2_ds_pkt),
    .wr_valid           (egress2_ds_pkt_valid),
    .wr_ready           (egress2_ds_pkt_ready),

    .rd_data            (egress2_snoopfifo_rd),
    .rd_valid           (egress2_snoopfifo_rd_valid),
    .rd_ready           (egress2_snoopfifo_rd_ready),

    .snoop_data         (egress2_ds_pkt),
    .snoop_valid        ({ingress_decoded[3], ingress_decoded[0], ingress_decoded[1]}),
    .snoop_match        (block_egress2_ds_pkt),

);
wire assign egress2_ds_pkt_valid = ingress_decode[0] & !block_egress2_ds_pkt & egress2_ds_pkt_valid_pre;


//===================================================================================
AH_snoopfifo_10_32_10 u_egress3_snoopablefifo_25_32_12 (
    .clk                (clk),
    .rstn               (rstn),

    .wr_data            (egress3_ds_pkt),
    .wr_valid           (egress3_ds_pkt_valid),
    .wr_ready           (egress3_ds_pkt_ready),

    .rd_data            (egress3_snoopfifo_rd),
    .rd_valid           (egress3_snoopfifo_rd_valid),
    .rd_ready           (egress3_snoopfifo_rd_ready),

    .snoop_data         (egress3_ds_pkt),
    .snoop_valid        ({ingress_decoded[0], ingress_decoded[1], ingress_decoded[2]}),
    .snoop_match        (block_egress3_ds_pkt),

);
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

    //.req0             (egress0_us_pkt_valid),
    //.req1             (egress1_us_pkt_valid),
    //.req2             (egress2_us_pkt_valid),
    //.req3             (egress3_us_pkt_valid),

    //.grant0           (egress0_us_pkt_valid_pre),
    //.grant1           (egress0_us_pkt_valid_pre),
    //.grant2           (egress0_us_pkt_valid_pre),
    //.grant3           (egress0_us_pkt_valid_pre),

);

//===================================================================================
AH_decoder_4_20 u_decoder_4_20 (
    .select             (egress_arbed[3:0]),

    .egress_pkt         (ingress_us_pkt),
    .eegress_pkt_valid  (arbed_out_valid),
    .degress_pkt_ready  (arbed_out_ready),

    .ingress0_pkt       (egress0_us_pkt),
    .ingress0_pkt_valid (egress0_us_pkt_valid),
    .ingress0_pkt_ready (egress0_us_pkt_ready),

    .ingress1_pkt       (egress1_us_pkt),
    .ingress1_pkt_valid (egress1_us_pkt_valid),
    .ingress1_pkt_ready (egress1_us_pkt_ready),

    .ingress2_pkt       (egress2_us_pkt),
    .ingress2_pkt_valid (egress2_us_pkt_valid),
    .ingress2_pkt_ready (egress2_us_pkt_ready),

    .ingress3_pkt       (egress3_us_pkt),
    .ingress3_pkt_valid (egress3_us_pkt_valid),
    .ingress3_pkt_ready (egress3_us_pkt_ready),
);
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


t = OrderedSwitch(4, 20, 30,50, 40, 50)
t.main()
with open('../order_port.yaml','w') as f:
    f.write(yaml.dump(t.dict))
print(yaml.dump(t.dict))
print("1"*50)
t.add_ports_from_bus()
#print(yaml.dump(t.wire_dict))
p , q = t.get_port_str()
#print(p)
#print(q)
