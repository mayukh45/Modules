['/home/mayukhs/Documents/smartasic2/Modules/golden', '/sharedtools/anaconda3/lib/python37.zip', '/sharedtools/anaconda3/lib/python3.7', '/sharedtools/anaconda3/lib/python3.7/lib-dynload', '/sharedtools/anaconda3/lib/python3.7/site-packages']

 I am checking whether this BasicModule add_ports_from_bus gets executed anywhere..



 I am checking whether this BasicModule add_ports_from_bus gets executed anywhere..


Just checking what is the file name..
AH_demux_35_8_1

 I am checking whether this BasicModule add_ports_from_bus gets executed anywhere..


I am going to operate on this dict now
I am going to operate on this dict again
I am going to operate on this dict again(2)
I am done with this dict which is final.
Just checking what is the file name..
AH_demux_35_8_0

 I am checking whether this BasicModule add_ports_from_bus gets executed anywhere..


I am going to operate on this dict now
I am going to operate on this dict again
I am going to operate on this dict again(2)
I am done with this dict which is final.
Just checking what is the file name..

 I am checking whether this BasicModule add_ports_from_bus gets executed anywhere..


I am going to operate on this dict now
I am done with this dict

module AH_OrderedSwitch_8_35_48_12_15 (egress0_dspkt_wdata
,egress0_dspkt_wvalid
,egress0_dspkt_wready
,egress0_dspkt_rdata
,egress0_dspkt_rvalid
,egress0_dspkt_rready
,egress0_dspkt_sdata
,egress0_dspkt_smatch
,egress0_uspkt_data
,egress0_uspkt_valid
,egress0_uspkt_ready
,{ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]}
,{ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]}
,egress1_dspkt_wdata
,egress1_dspkt_wvalid
,egress1_dspkt_wready
,egress1_dspkt_rdata
,egress1_dspkt_rvalid
,egress1_dspkt_rready
,egress1_dspkt_sdata
,egress1_dspkt_smatch
,egress1_uspkt_data
,egress1_uspkt_valid
,egress1_uspkt_ready
,egress2_dspkt_wdata
,egress2_dspkt_wvalid
,egress2_dspkt_wready
,egress2_dspkt_rdata
,egress2_dspkt_rvalid
,egress2_dspkt_rready
,egress2_dspkt_sdata
,egress2_dspkt_smatch
,egress2_uspkt_data
,egress2_uspkt_valid
,egress2_uspkt_ready
,egress3_dspkt_wdata
,egress3_dspkt_wvalid
,egress3_dspkt_wready
,egress3_dspkt_rdata
,egress3_dspkt_rvalid
,egress3_dspkt_rready
,egress3_dspkt_sdata
,egress3_dspkt_smatch
,egress3_uspkt_data
,egress3_uspkt_valid
,egress3_uspkt_ready
,egress4_dspkt_wdata
,egress4_dspkt_wvalid
,egress4_dspkt_wready
,egress4_dspkt_rdata
,egress4_dspkt_rvalid
,egress4_dspkt_rready
,egress4_dspkt_sdata
,egress4_dspkt_smatch
,egress4_uspkt_data
,egress4_uspkt_valid
,egress4_uspkt_ready
,egress5_dspkt_wdata
,egress5_dspkt_wvalid
,egress5_dspkt_wready
,egress5_dspkt_rdata
,egress5_dspkt_rvalid
,egress5_dspkt_rready
,egress5_dspkt_sdata
,egress5_dspkt_smatch
,egress5_uspkt_data
,egress5_uspkt_valid
,egress5_uspkt_ready
,egress6_dspkt_wdata
,egress6_dspkt_wvalid
,egress6_dspkt_wready
,egress6_dspkt_rdata
,egress6_dspkt_rvalid
,egress6_dspkt_rready
,egress6_dspkt_sdata
,egress6_dspkt_smatch
,egress6_uspkt_data
,egress6_uspkt_valid
,egress6_uspkt_ready
,egress7_dspkt_wdata
,egress7_dspkt_wvalid
,egress7_dspkt_wready
,egress7_dspkt_rdata
,egress7_dspkt_rvalid
,egress7_dspkt_rready
,egress7_dspkt_sdata
,egress7_dspkt_smatch
,egress7_uspkt_data
,egress7_uspkt_valid
,egress7_uspkt_ready
,select
,ingress_ing_data
,ingress_ing_valid
,ingress_ing_ready
,ingress_pkt_field
,decoded_binary
,dec_err);

input [34:0] egress0_dspkt_wdata;
input egress0_dspkt_wvalid;
output egress0_dspkt_wready;
output [34:0] egress0_dspkt_rdata;
output egress0_dspkt_rvalid;
input egress0_dspkt_rready;
input [34:0] egress0_dspkt_sdata;
input egress0_dspkt_smatch;
output [34:0] egress0_uspkt_data;
output egress0_uspkt_valid;
input egress0_uspkt_ready;
input {ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]};
input {ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]};
input [34:0] egress1_dspkt_wdata;
input egress1_dspkt_wvalid;
output egress1_dspkt_wready;
output [34:0] egress1_dspkt_rdata;
output egress1_dspkt_rvalid;
input egress1_dspkt_rready;
input [34:0] egress1_dspkt_sdata;
input egress1_dspkt_smatch;
output [34:0] egress1_uspkt_data;
output egress1_uspkt_valid;
input egress1_uspkt_ready;
input [34:0] egress2_dspkt_wdata;
input egress2_dspkt_wvalid;
output egress2_dspkt_wready;
output [34:0] egress2_dspkt_rdata;
output egress2_dspkt_rvalid;
input egress2_dspkt_rready;
input [34:0] egress2_dspkt_sdata;
input egress2_dspkt_smatch;
output [34:0] egress2_uspkt_data;
output egress2_uspkt_valid;
input egress2_uspkt_ready;
input [34:0] egress3_dspkt_wdata;
input egress3_dspkt_wvalid;
output egress3_dspkt_wready;
output [34:0] egress3_dspkt_rdata;
output egress3_dspkt_rvalid;
input egress3_dspkt_rready;
input [34:0] egress3_dspkt_sdata;
input egress3_dspkt_smatch;
output [34:0] egress3_uspkt_data;
output egress3_uspkt_valid;
input egress3_uspkt_ready;
input [34:0] egress4_dspkt_wdata;
input egress4_dspkt_wvalid;
output egress4_dspkt_wready;
output [34:0] egress4_dspkt_rdata;
output egress4_dspkt_rvalid;
input egress4_dspkt_rready;
input [34:0] egress4_dspkt_sdata;
input egress4_dspkt_smatch;
output [34:0] egress4_uspkt_data;
output egress4_uspkt_valid;
input egress4_uspkt_ready;
input [34:0] egress5_dspkt_wdata;
input egress5_dspkt_wvalid;
output egress5_dspkt_wready;
output [34:0] egress5_dspkt_rdata;
output egress5_dspkt_rvalid;
input egress5_dspkt_rready;
input [34:0] egress5_dspkt_sdata;
input egress5_dspkt_smatch;
output [34:0] egress5_uspkt_data;
output egress5_uspkt_valid;
input egress5_uspkt_ready;
input [34:0] egress6_dspkt_wdata;
input egress6_dspkt_wvalid;
output egress6_dspkt_wready;
output [34:0] egress6_dspkt_rdata;
output egress6_dspkt_rvalid;
input egress6_dspkt_rready;
input [34:0] egress6_dspkt_sdata;
input egress6_dspkt_smatch;
output [34:0] egress6_uspkt_data;
output egress6_uspkt_valid;
input egress6_uspkt_ready;
input [34:0] egress7_dspkt_wdata;
input egress7_dspkt_wvalid;
output egress7_dspkt_wready;
output [34:0] egress7_dspkt_rdata;
output egress7_dspkt_rvalid;
input egress7_dspkt_rready;
input [34:0] egress7_dspkt_sdata;
input egress7_dspkt_smatch;
output [34:0] egress7_uspkt_data;
output egress7_uspkt_valid;
input egress7_uspkt_ready;
input select;
input [34:0] ingress_ing_data;
input ingress_ing_valid;
output ingress_ing_ready;
input [7:0] ingress_pkt_field;
output [5:0] decoded_binary;
output dec_err;

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

AH_demux_35_8_1 u_demux_8_35(
.select				(select)
.ing_data				(ingress_ing_data)
.ing_valid				(ingress_ing_valid)
.ing_ready				(ingress_ing_ready)
.egr0_data				(egress0_uspkt_data)
.egr0_valid				(egress0_uspkt_valid)
.egr0_ready				(egress0_uspkt_ready)
.egr1_data				(egress1_uspkt_data)
.egr1_valid				(egress1_uspkt_valid)
.egr1_ready				(egress1_uspkt_ready)
.egr2_data				(egress2_uspkt_data)
.egr2_valid				(egress2_uspkt_valid)
.egr2_ready				(egress2_uspkt_ready)
.egr3_data				(egress3_uspkt_data)
.egr3_valid				(egress3_uspkt_valid)
.egr3_ready				(egress3_uspkt_ready)
.egr4_data				(egress4_uspkt_data)
.egr4_valid				(egress4_uspkt_valid)
.egr4_ready				(egress4_uspkt_ready)
.egr5_data				(egress5_uspkt_data)
.egr5_valid				(egress5_uspkt_valid)
.egr5_ready				(egress5_uspkt_ready)
.egr6_data				(egress6_uspkt_data)
.egr6_valid				(egress6_uspkt_valid)
.egr6_ready				(egress6_uspkt_ready)
.egr7_data				(egress7_uspkt_data)
.egr7_valid				(egress7_uspkt_valid)
.egr7_ready				(egress7_uspkt_ready)
)
// 25 --> width of fifo
// 32 --> depth of FIFO - TODO: Again another parameter. It's not possible
// to reflect all of them in module name. It's better to probably keep a param
// list inside and create a .h fle for the same also.

//===================================================================================
AH_SnoopableFIFO_35_15_15 u_egress0_snoopablefifo_35_15_15(
.wdata				(egress0_dspkt_wdata)
.wvalid				(egress0_dspkt_wvalid)
.wready				(egress0_dspkt_wready)
.rdata				(egress0_dspkt_rdata)
.rvalid				(egress0_dspkt_rvalid)
.rready				(egress0_dspkt_rready)
.sdata				(egress0_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress0_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress1_snoopablefifo_35_15_15(
.wdata				(egress1_dspkt_wdata)
.wvalid				(egress1_dspkt_wvalid)
.wready				(egress1_dspkt_wready)
.rdata				(egress1_dspkt_rdata)
.rvalid				(egress1_dspkt_rvalid)
.rready				(egress1_dspkt_rready)
.sdata				(egress1_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress1_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress2_snoopablefifo_35_15_15(
.wdata				(egress2_dspkt_wdata)
.wvalid				(egress2_dspkt_wvalid)
.wready				(egress2_dspkt_wready)
.rdata				(egress2_dspkt_rdata)
.rvalid				(egress2_dspkt_rvalid)
.rready				(egress2_dspkt_rready)
.sdata				(egress2_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress2_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress3_snoopablefifo_35_15_15(
.wdata				(egress3_dspkt_wdata)
.wvalid				(egress3_dspkt_wvalid)
.wready				(egress3_dspkt_wready)
.rdata				(egress3_dspkt_rdata)
.rvalid				(egress3_dspkt_rvalid)
.rready				(egress3_dspkt_rready)
.sdata				(egress3_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress3_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress4_snoopablefifo_35_15_15(
.wdata				(egress4_dspkt_wdata)
.wvalid				(egress4_dspkt_wvalid)
.wready				(egress4_dspkt_wready)
.rdata				(egress4_dspkt_rdata)
.rvalid				(egress4_dspkt_rvalid)
.rready				(egress4_dspkt_rready)
.sdata				(egress4_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress4_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress5_snoopablefifo_35_15_15(
.wdata				(egress5_dspkt_wdata)
.wvalid				(egress5_dspkt_wvalid)
.wready				(egress5_dspkt_wready)
.rdata				(egress5_dspkt_rdata)
.rvalid				(egress5_dspkt_rvalid)
.rready				(egress5_dspkt_rready)
.sdata				(egress5_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress5_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress6_snoopablefifo_35_15_15(
.wdata				(egress6_dspkt_wdata)
.wvalid				(egress6_dspkt_wvalid)
.wready				(egress6_dspkt_wready)
.rdata				(egress6_dspkt_rdata)
.rvalid				(egress6_dspkt_rvalid)
.rready				(egress6_dspkt_rready)
.sdata				(egress6_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress6_dspkt_smatch)
)AH_SnoopableFIFO_35_15_15 u_egress7_snoopablefifo_35_15_15(
.wdata				(egress7_dspkt_wdata)
.wvalid				(egress7_dspkt_wvalid)
.wready				(egress7_dspkt_wready)
.rdata				(egress7_dspkt_rdata)
.rvalid				(egress7_dspkt_rvalid)
.rready				(egress7_dspkt_rready)
.sdata				(egress7_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress7_dspkt_smatch)
)
wire assign egress3_ds_pkt_valid = ingress_decode[0] & !block_egress3_ds_pkt & egress3_ds_pkt_valid_pre;
wire assign egress2_ds_pkt_valid = ingress_decode[0] & !block_egress2_ds_pkt & egress2_ds_pkt_valid_pre;
wire assign egress1_ds_pkt_valid = ingress_decode[0] & !block_egress1_ds_pkt & egress1_ds_pkt_valid_pre;
wire assign egress0_ds_pkt_valid = ingress_decode[0] & !block_egress0_ds_pkt & egress0_ds_pkt_valid_pre;




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

AH_demux_35_8_1 u_demux_8_35(
.select				(select)
.ing_data				(ingress_ing_data)
.ing_valid				(ingress_ing_valid)
.ing_ready				(ingress_ing_ready)
.egr0_data				(egress0_uspkt_data)
.egr0_valid				(egress0_uspkt_valid)
.egr0_ready				(egress0_uspkt_ready)
.egr1_data				(egress1_uspkt_data)
.egr1_valid				(egress1_uspkt_valid)
.egr1_ready				(egress1_uspkt_ready)
.egr2_data				(egress2_uspkt_data)
.egr2_valid				(egress2_uspkt_valid)
.egr2_ready				(egress2_uspkt_ready)
.egr3_data				(egress3_uspkt_data)
.egr3_valid				(egress3_uspkt_valid)
.egr3_ready				(egress3_uspkt_ready)
.egr4_data				(egress4_uspkt_data)
.egr4_valid				(egress4_uspkt_valid)
.egr4_ready				(egress4_uspkt_ready)
.egr5_data				(egress5_uspkt_data)
.egr5_valid				(egress5_uspkt_valid)
.egr5_ready				(egress5_uspkt_ready)
.egr6_data				(egress6_uspkt_data)
.egr6_valid				(egress6_uspkt_valid)
.egr6_ready				(egress6_uspkt_ready)
.egr7_data				(egress7_uspkt_data)
.egr7_valid				(egress7_uspkt_valid)
.egr7_ready				(egress7_uspkt_ready)
)
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
code = "\n"+"\n".join(["(egress_arbed[0] & egress0_snoopfifo_rd_valid & (egress0_snoopfifo_rd[upResponseDecodableFieldWidth - 1:0] = ingress_us_pkt[:0]) )" for i in range(NumberOfEgress)])
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

endmodule


 I am checking whether this BasicModule add_ports_from_bus gets executed anywhere..


