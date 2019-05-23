
module AH_OrderedSwitch_22_75_68_22_35 ();



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

AH_demux_75_22_1 u_demux_22_75(
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
.egr8_data				(egress8_uspkt_data)
.egr8_valid				(egress8_uspkt_valid)
.egr8_ready				(egress8_uspkt_ready)
.egr9_data				(egress9_uspkt_data)
.egr9_valid				(egress9_uspkt_valid)
.egr9_ready				(egress9_uspkt_ready)
.egr10_data				(egress10_uspkt_data)
.egr10_valid				(egress10_uspkt_valid)
.egr10_ready				(egress10_uspkt_ready)
.egr11_data				(egress11_uspkt_data)
.egr11_valid				(egress11_uspkt_valid)
.egr11_ready				(egress11_uspkt_ready)
.egr12_data				(egress12_uspkt_data)
.egr12_valid				(egress12_uspkt_valid)
.egr12_ready				(egress12_uspkt_ready)
.egr13_data				(egress13_uspkt_data)
.egr13_valid				(egress13_uspkt_valid)
.egr13_ready				(egress13_uspkt_ready)
.egr14_data				(egress14_uspkt_data)
.egr14_valid				(egress14_uspkt_valid)
.egr14_ready				(egress14_uspkt_ready)
.egr15_data				(egress15_uspkt_data)
.egr15_valid				(egress15_uspkt_valid)
.egr15_ready				(egress15_uspkt_ready)
.egr16_data				(egress16_uspkt_data)
.egr16_valid				(egress16_uspkt_valid)
.egr16_ready				(egress16_uspkt_ready)
.egr17_data				(egress17_uspkt_data)
.egr17_valid				(egress17_uspkt_valid)
.egr17_ready				(egress17_uspkt_ready)
.egr18_data				(egress18_uspkt_data)
.egr18_valid				(egress18_uspkt_valid)
.egr18_ready				(egress18_uspkt_ready)
.egr19_data				(egress19_uspkt_data)
.egr19_valid				(egress19_uspkt_valid)
.egr19_ready				(egress19_uspkt_ready)
.egr20_data				(egress20_uspkt_data)
.egr20_valid				(egress20_uspkt_valid)
.egr20_ready				(egress20_uspkt_ready)
.egr21_data				(egress21_uspkt_data)
.egr21_valid				(egress21_uspkt_valid)
.egr21_ready				(egress21_uspkt_ready)
)
// 25 --> width of fifo
// 32 --> depth of FIFO - TODO: Again another parameter. It's not possible
// to reflect all of them in module name. It's better to probably keep a param
// list inside and create a .h fle for the same also.

//===================================================================================
AH_SnoopableFIFO_75_35_35 u_egress0_snoopablefifo_75_35_35(
.wdata				(egress0_dspkt_wdata)
.wvalid				(egress0_dspkt_wvalid)
.wready				(egress0_dspkt_wready)
.rdata				(egress0_dspkt_rdata)
.rvalid				(egress0_dspkt_rvalid)
.rready				(egress0_dspkt_rready)
.sdata				(egress0_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress0_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress1_snoopablefifo_75_35_35(
.wdata				(egress1_dspkt_wdata)
.wvalid				(egress1_dspkt_wvalid)
.wready				(egress1_dspkt_wready)
.rdata				(egress1_dspkt_rdata)
.rvalid				(egress1_dspkt_rvalid)
.rready				(egress1_dspkt_rready)
.sdata				(egress1_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress1_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress2_snoopablefifo_75_35_35(
.wdata				(egress2_dspkt_wdata)
.wvalid				(egress2_dspkt_wvalid)
.wready				(egress2_dspkt_wready)
.rdata				(egress2_dspkt_rdata)
.rvalid				(egress2_dspkt_rvalid)
.rready				(egress2_dspkt_rready)
.sdata				(egress2_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress2_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress3_snoopablefifo_75_35_35(
.wdata				(egress3_dspkt_wdata)
.wvalid				(egress3_dspkt_wvalid)
.wready				(egress3_dspkt_wready)
.rdata				(egress3_dspkt_rdata)
.rvalid				(egress3_dspkt_rvalid)
.rready				(egress3_dspkt_rready)
.sdata				(egress3_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress3_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress4_snoopablefifo_75_35_35(
.wdata				(egress4_dspkt_wdata)
.wvalid				(egress4_dspkt_wvalid)
.wready				(egress4_dspkt_wready)
.rdata				(egress4_dspkt_rdata)
.rvalid				(egress4_dspkt_rvalid)
.rready				(egress4_dspkt_rready)
.sdata				(egress4_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress4_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress5_snoopablefifo_75_35_35(
.wdata				(egress5_dspkt_wdata)
.wvalid				(egress5_dspkt_wvalid)
.wready				(egress5_dspkt_wready)
.rdata				(egress5_dspkt_rdata)
.rvalid				(egress5_dspkt_rvalid)
.rready				(egress5_dspkt_rready)
.sdata				(egress5_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress5_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress6_snoopablefifo_75_35_35(
.wdata				(egress6_dspkt_wdata)
.wvalid				(egress6_dspkt_wvalid)
.wready				(egress6_dspkt_wready)
.rdata				(egress6_dspkt_rdata)
.rvalid				(egress6_dspkt_rvalid)
.rready				(egress6_dspkt_rready)
.sdata				(egress6_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress6_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress7_snoopablefifo_75_35_35(
.wdata				(egress7_dspkt_wdata)
.wvalid				(egress7_dspkt_wvalid)
.wready				(egress7_dspkt_wready)
.rdata				(egress7_dspkt_rdata)
.rvalid				(egress7_dspkt_rvalid)
.rready				(egress7_dspkt_rready)
.sdata				(egress7_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress7_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress8_snoopablefifo_75_35_35(
.wdata				(egress8_dspkt_wdata)
.wvalid				(egress8_dspkt_wvalid)
.wready				(egress8_dspkt_wready)
.rdata				(egress8_dspkt_rdata)
.rvalid				(egress8_dspkt_rvalid)
.rready				(egress8_dspkt_rready)
.sdata				(egress8_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress8_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress9_snoopablefifo_75_35_35(
.wdata				(egress9_dspkt_wdata)
.wvalid				(egress9_dspkt_wvalid)
.wready				(egress9_dspkt_wready)
.rdata				(egress9_dspkt_rdata)
.rvalid				(egress9_dspkt_rvalid)
.rready				(egress9_dspkt_rready)
.sdata				(egress9_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress9_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress10_snoopablefifo_75_35_35(
.wdata				(egress10_dspkt_wdata)
.wvalid				(egress10_dspkt_wvalid)
.wready				(egress10_dspkt_wready)
.rdata				(egress10_dspkt_rdata)
.rvalid				(egress10_dspkt_rvalid)
.rready				(egress10_dspkt_rready)
.sdata				(egress10_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress10_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress11_snoopablefifo_75_35_35(
.wdata				(egress11_dspkt_wdata)
.wvalid				(egress11_dspkt_wvalid)
.wready				(egress11_dspkt_wready)
.rdata				(egress11_dspkt_rdata)
.rvalid				(egress11_dspkt_rvalid)
.rready				(egress11_dspkt_rready)
.sdata				(egress11_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress11_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress12_snoopablefifo_75_35_35(
.wdata				(egress12_dspkt_wdata)
.wvalid				(egress12_dspkt_wvalid)
.wready				(egress12_dspkt_wready)
.rdata				(egress12_dspkt_rdata)
.rvalid				(egress12_dspkt_rvalid)
.rready				(egress12_dspkt_rready)
.sdata				(egress12_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress12_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress13_snoopablefifo_75_35_35(
.wdata				(egress13_dspkt_wdata)
.wvalid				(egress13_dspkt_wvalid)
.wready				(egress13_dspkt_wready)
.rdata				(egress13_dspkt_rdata)
.rvalid				(egress13_dspkt_rvalid)
.rready				(egress13_dspkt_rready)
.sdata				(egress13_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress13_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress14_snoopablefifo_75_35_35(
.wdata				(egress14_dspkt_wdata)
.wvalid				(egress14_dspkt_wvalid)
.wready				(egress14_dspkt_wready)
.rdata				(egress14_dspkt_rdata)
.rvalid				(egress14_dspkt_rvalid)
.rready				(egress14_dspkt_rready)
.sdata				(egress14_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress14_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress15_snoopablefifo_75_35_35(
.wdata				(egress15_dspkt_wdata)
.wvalid				(egress15_dspkt_wvalid)
.wready				(egress15_dspkt_wready)
.rdata				(egress15_dspkt_rdata)
.rvalid				(egress15_dspkt_rvalid)
.rready				(egress15_dspkt_rready)
.sdata				(egress15_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress15_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress16_snoopablefifo_75_35_35(
.wdata				(egress16_dspkt_wdata)
.wvalid				(egress16_dspkt_wvalid)
.wready				(egress16_dspkt_wready)
.rdata				(egress16_dspkt_rdata)
.rvalid				(egress16_dspkt_rvalid)
.rready				(egress16_dspkt_rready)
.sdata				(egress16_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress16_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress17_snoopablefifo_75_35_35(
.wdata				(egress17_dspkt_wdata)
.wvalid				(egress17_dspkt_wvalid)
.wready				(egress17_dspkt_wready)
.rdata				(egress17_dspkt_rdata)
.rvalid				(egress17_dspkt_rvalid)
.rready				(egress17_dspkt_rready)
.sdata				(egress17_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress17_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress18_snoopablefifo_75_35_35(
.wdata				(egress18_dspkt_wdata)
.wvalid				(egress18_dspkt_wvalid)
.wready				(egress18_dspkt_wready)
.rdata				(egress18_dspkt_rdata)
.rvalid				(egress18_dspkt_rvalid)
.rready				(egress18_dspkt_rready)
.sdata				(egress18_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress18_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress19_snoopablefifo_75_35_35(
.wdata				(egress19_dspkt_wdata)
.wvalid				(egress19_dspkt_wvalid)
.wready				(egress19_dspkt_wready)
.rdata				(egress19_dspkt_rdata)
.rvalid				(egress19_dspkt_rvalid)
.rready				(egress19_dspkt_rready)
.sdata				(egress19_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress19_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress20_snoopablefifo_75_35_35(
.wdata				(egress20_dspkt_wdata)
.wvalid				(egress20_dspkt_wvalid)
.wready				(egress20_dspkt_wready)
.rdata				(egress20_dspkt_rdata)
.rvalid				(egress20_dspkt_rvalid)
.rready				(egress20_dspkt_rready)
.sdata				(egress20_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress20_dspkt_smatch)
)AH_SnoopableFIFO_75_35_35 u_egress21_snoopablefifo_75_35_35(
.wdata				(egress21_dspkt_wdata)
.wvalid				(egress21_dspkt_wvalid)
.wready				(egress21_dspkt_wready)
.rdata				(egress21_dspkt_rdata)
.rvalid				(egress21_dspkt_rvalid)
.rready				(egress21_dspkt_rready)
.sdata				(egress21_dspkt_sdata)
.svalid				({ingress_decoded[1], ingress_decoded[2], ingress_decoded[3]})
.smatch				(egress21_dspkt_smatch)
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

AH_demux_75_22_1 u_demux_22_75(
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
.egr8_data				(egress8_uspkt_data)
.egr8_valid				(egress8_uspkt_valid)
.egr8_ready				(egress8_uspkt_ready)
.egr9_data				(egress9_uspkt_data)
.egr9_valid				(egress9_uspkt_valid)
.egr9_ready				(egress9_uspkt_ready)
.egr10_data				(egress10_uspkt_data)
.egr10_valid				(egress10_uspkt_valid)
.egr10_ready				(egress10_uspkt_ready)
.egr11_data				(egress11_uspkt_data)
.egr11_valid				(egress11_uspkt_valid)
.egr11_ready				(egress11_uspkt_ready)
.egr12_data				(egress12_uspkt_data)
.egr12_valid				(egress12_uspkt_valid)
.egr12_ready				(egress12_uspkt_ready)
.egr13_data				(egress13_uspkt_data)
.egr13_valid				(egress13_uspkt_valid)
.egr13_ready				(egress13_uspkt_ready)
.egr14_data				(egress14_uspkt_data)
.egr14_valid				(egress14_uspkt_valid)
.egr14_ready				(egress14_uspkt_ready)
.egr15_data				(egress15_uspkt_data)
.egr15_valid				(egress15_uspkt_valid)
.egr15_ready				(egress15_uspkt_ready)
.egr16_data				(egress16_uspkt_data)
.egr16_valid				(egress16_uspkt_valid)
.egr16_ready				(egress16_uspkt_ready)
.egr17_data				(egress17_uspkt_data)
.egr17_valid				(egress17_uspkt_valid)
.egr17_ready				(egress17_uspkt_ready)
.egr18_data				(egress18_uspkt_data)
.egr18_valid				(egress18_uspkt_valid)
.egr18_ready				(egress18_uspkt_ready)
.egr19_data				(egress19_uspkt_data)
.egr19_valid				(egress19_uspkt_valid)
.egr19_ready				(egress19_uspkt_ready)
.egr20_data				(egress20_uspkt_data)
.egr20_valid				(egress20_uspkt_valid)
.egr20_ready				(egress20_uspkt_ready)
.egr21_data				(egress21_uspkt_data)
.egr21_valid				(egress21_uspkt_valid)
.egr21_ready				(egress21_uspkt_ready)
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
