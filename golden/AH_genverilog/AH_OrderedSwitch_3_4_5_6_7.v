
module AH_OrderedSwitch_3_4_5_6_7 ();





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


AH_decoder_4_10 u_decoder_4_10_ap_00001 (
  .ingress_pkt_field      (ingress_ds_pkt[24:24-9]),
  .decoded_binary         (ingress_decoded[3:0])
  .dec_err                ()

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

AH_demux_4_3_1 u_demux_3_4(
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
)
// 25 --> width of fifo
// 32 --> depth of FIFO - TODO: Again another parameter. It's not possible
// to reflect all of them in module name. It's better to probably keep a param
// list inside and create a .h fle for the same also.

//===================================================================================
AH_SnoopableFIFO_4_8_7 u_egress0_snoopablefifo_4_8_7(
.wdata				(egress0_dspkt_wdata)
.wvalid				(egress0_dspkt_wvalid)
.wready				(egress0_dspkt_wready)
.rdata				(egress0_dspkt_rdata)
.rvalid				(egress0_dspkt_rvalid)
.rready				(egress0_dspkt_rready)
.sdata				(egress0_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress0_dspkt_smatch)
)AH_SnoopableFIFO_4_8_7 u_egress1_snoopablefifo_4_8_7(
.wdata				(egress1_dspkt_wdata)
.wvalid				(egress1_dspkt_wvalid)
.wready				(egress1_dspkt_wready)
.rdata				(egress1_dspkt_rdata)
.rvalid				(egress1_dspkt_rvalid)
.rready				(egress1_dspkt_rready)
.sdata				(egress1_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress1_dspkt_smatch)
)AH_SnoopableFIFO_4_8_7 u_egress2_snoopablefifo_4_8_7(
.wdata				(egress2_dspkt_wdata)
.wvalid				(egress2_dspkt_wvalid)
.wready				(egress2_dspkt_wready)
.rdata				(egress2_dspkt_rdata)
.rvalid				(egress2_dspkt_rvalid)
.rready				(egress2_dspkt_rready)
.sdata				(egress2_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress2_dspkt_smatch)
)
wire assign egress3_ds_pkt_valid = ingress_decode[0] & !block_egress3_ds_pkt & egress3_ds_pkt_valid_pre;
wire assign egress2_ds_pkt_valid = ingress_decode[0] & !block_egress2_ds_pkt & egress2_ds_pkt_valid_pre;
wire assign egress1_ds_pkt_valid = ingress_decode[0] & !block_egress1_ds_pkt & egress1_ds_pkt_valid_pre;
wire assign egress0_ds_pkt_valid = ingress_decode[0] & !block_egress0_ds_pkt & egress0_ds_pkt_valid_pre;




// TODO: Downstream path is complete more or less.
// Upstream path needs to be done.


//===================================================================================

AH_RoundRobinArbiter_3 u_arbiter_4(
.req				({egress0_us_pkt_valid,
egress1_us_pkt_valid,
egress2_us_pkt_valid,})
.gnt				(egress_arbed[2:0])
)
===================================================================================
// 4 --> number of egress.
// 25 -> ds packet size
// 20 -> upstream packet size.
// 10 -> address or downstream decodable field width.
// 12 -> id or ordering and upstream-response decodable field width.

AH_demux_4_3_1 u_demux_3_4(
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