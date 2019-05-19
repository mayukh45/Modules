
module AH_decoder_34_100 (ingress_pkt_field
,decoded_binary
,dec_err);

input [33:0] ingress_pkt_field;
output [6:0] decoded_binary;
output dec_err;


// Ingress and Egress are short circuited based on condition

wire [6:0] decoded_binary;
wire dec_err;


	wire assign decode_range_client0_tom =0000_0FFF
	wire assign decode_range_client0_bom =0000_1FFF
	wire assign decode_range_client1_tom =1024
	wire assign decode_range_client1_bom =0000_3FFF
	wire assign decode_range_client2_tom =2048
	wire assign decode_range_client2_bom =0000_5FFF
	wire assign decode_range_client3_tom =0000_5FFF
	wire assign decode_range_client3_bom =0000_6FFF
	wire assign decode_range_client4_tom =0000_0FFF
	wire assign decode_range_client4_bom =0000_1FFF
	wire assign decode_range_client5_tom =0000_0FFF
	wire assign decode_range_client5_bom =0000_1FFF
	wire assign decode_range_client6_tom =0000_0FFF
	wire assign decode_range_client6_bom =0000_1FFF
	wire assign decode_range_client7_tom =0000_0FFF
	wire assign decode_range_client7_bom =0000_1FFF



	assign decoded_binary[0] = ( (ingress_pkt_field) >= decode_range_client0_bom) && (ingress_pkt_field) <= decode_range_client0_tom
	assign decoded_binary[1] = ( (ingress_pkt_field) >= decode_range_client1_bom) && (ingress_pkt_field) <= decode_range_client1_tom
	assign decoded_binary[2] = ( (ingress_pkt_field) >= decode_range_client2_bom) && (ingress_pkt_field) <= decode_range_client2_tom
	assign decoded_binary[3] = ( (ingress_pkt_field) >= decode_range_client3_bom) && (ingress_pkt_field) <= decode_range_client3_tom
	assign decoded_binary[4] = ( (ingress_pkt_field) >= decode_range_client4_bom) && (ingress_pkt_field) <= decode_range_client4_tom
	assign decoded_binary[5] = ( (ingress_pkt_field) >= decode_range_client5_bom) && (ingress_pkt_field) <= decode_range_client5_tom
	assign decoded_binary[6] = ( (ingress_pkt_field) >= decode_range_client6_bom) && (ingress_pkt_field) <= decode_range_client6_tom
	assign decoded_binary[7] = ( (ingress_pkt_field) >= decode_range_client7_bom) && (ingress_pkt_field) <= decode_range_client7_tom
	assign decoded_binary[8] = ( (ingress_pkt_field) >= decode_range_client8_bom) && (ingress_pkt_field) <= decode_range_client8_tom
	assign decoded_binary[9] = ( (ingress_pkt_field) >= decode_range_client9_bom) && (ingress_pkt_field) <= decode_range_client9_tom
	assign decoded_binary[10] = ( (ingress_pkt_field) >= decode_range_client10_bom) && (ingress_pkt_field) <= decode_range_client10_tom
	assign decoded_binary[11] = ( (ingress_pkt_field) >= decode_range_client11_bom) && (ingress_pkt_field) <= decode_range_client11_tom
	assign decoded_binary[12] = ( (ingress_pkt_field) >= decode_range_client12_bom) && (ingress_pkt_field) <= decode_range_client12_tom
	assign decoded_binary[13] = ( (ingress_pkt_field) >= decode_range_client13_bom) && (ingress_pkt_field) <= decode_range_client13_tom
	assign decoded_binary[14] = ( (ingress_pkt_field) >= decode_range_client14_bom) && (ingress_pkt_field) <= decode_range_client14_tom
	assign decoded_binary[15] = ( (ingress_pkt_field) >= decode_range_client15_bom) && (ingress_pkt_field) <= decode_range_client15_tom
	assign decoded_binary[16] = ( (ingress_pkt_field) >= decode_range_client16_bom) && (ingress_pkt_field) <= decode_range_client16_tom
	assign decoded_binary[17] = ( (ingress_pkt_field) >= decode_range_client17_bom) && (ingress_pkt_field) <= decode_range_client17_tom
	assign decoded_binary[18] = ( (ingress_pkt_field) >= decode_range_client18_bom) && (ingress_pkt_field) <= decode_range_client18_tom
	assign decoded_binary[19] = ( (ingress_pkt_field) >= decode_range_client19_bom) && (ingress_pkt_field) <= decode_range_client19_tom
	assign decoded_binary[20] = ( (ingress_pkt_field) >= decode_range_client20_bom) && (ingress_pkt_field) <= decode_range_client20_tom
	assign decoded_binary[21] = ( (ingress_pkt_field) >= decode_range_client21_bom) && (ingress_pkt_field) <= decode_range_client21_tom
	assign decoded_binary[22] = ( (ingress_pkt_field) >= decode_range_client22_bom) && (ingress_pkt_field) <= decode_range_client22_tom
	assign decoded_binary[23] = ( (ingress_pkt_field) >= decode_range_client23_bom) && (ingress_pkt_field) <= decode_range_client23_tom
	assign decoded_binary[24] = ( (ingress_pkt_field) >= decode_range_client24_bom) && (ingress_pkt_field) <= decode_range_client24_tom
	assign decoded_binary[25] = ( (ingress_pkt_field) >= decode_range_client25_bom) && (ingress_pkt_field) <= decode_range_client25_tom
	assign decoded_binary[26] = ( (ingress_pkt_field) >= decode_range_client26_bom) && (ingress_pkt_field) <= decode_range_client26_tom
	assign decoded_binary[27] = ( (ingress_pkt_field) >= decode_range_client27_bom) && (ingress_pkt_field) <= decode_range_client27_tom
	assign decoded_binary[28] = ( (ingress_pkt_field) >= decode_range_client28_bom) && (ingress_pkt_field) <= decode_range_client28_tom
	assign decoded_binary[29] = ( (ingress_pkt_field) >= decode_range_client29_bom) && (ingress_pkt_field) <= decode_range_client29_tom
	assign decoded_binary[30] = ( (ingress_pkt_field) >= decode_range_client30_bom) && (ingress_pkt_field) <= decode_range_client30_tom
	assign decoded_binary[31] = ( (ingress_pkt_field) >= decode_range_client31_bom) && (ingress_pkt_field) <= decode_range_client31_tom
	assign decoded_binary[32] = ( (ingress_pkt_field) >= decode_range_client32_bom) && (ingress_pkt_field) <= decode_range_client32_tom
	assign decoded_binary[33] = ( (ingress_pkt_field) >= decode_range_client33_bom) && (ingress_pkt_field) <= decode_range_client33_tom
	assign decoded_binary[34] = ( (ingress_pkt_field) >= decode_range_client34_bom) && (ingress_pkt_field) <= decode_range_client34_tom
	assign decoded_binary[35] = ( (ingress_pkt_field) >= decode_range_client35_bom) && (ingress_pkt_field) <= decode_range_client35_tom
	assign decoded_binary[36] = ( (ingress_pkt_field) >= decode_range_client36_bom) && (ingress_pkt_field) <= decode_range_client36_tom
	assign decoded_binary[37] = ( (ingress_pkt_field) >= decode_range_client37_bom) && (ingress_pkt_field) <= decode_range_client37_tom
	assign decoded_binary[38] = ( (ingress_pkt_field) >= decode_range_client38_bom) && (ingress_pkt_field) <= decode_range_client38_tom
	assign decoded_binary[39] = ( (ingress_pkt_field) >= decode_range_client39_bom) && (ingress_pkt_field) <= decode_range_client39_tom
	assign decoded_binary[40] = ( (ingress_pkt_field) >= decode_range_client40_bom) && (ingress_pkt_field) <= decode_range_client40_tom
	assign decoded_binary[41] = ( (ingress_pkt_field) >= decode_range_client41_bom) && (ingress_pkt_field) <= decode_range_client41_tom
	assign decoded_binary[42] = ( (ingress_pkt_field) >= decode_range_client42_bom) && (ingress_pkt_field) <= decode_range_client42_tom
	assign decoded_binary[43] = ( (ingress_pkt_field) >= decode_range_client43_bom) && (ingress_pkt_field) <= decode_range_client43_tom
	assign decoded_binary[44] = ( (ingress_pkt_field) >= decode_range_client44_bom) && (ingress_pkt_field) <= decode_range_client44_tom
	assign decoded_binary[45] = ( (ingress_pkt_field) >= decode_range_client45_bom) && (ingress_pkt_field) <= decode_range_client45_tom
	assign decoded_binary[46] = ( (ingress_pkt_field) >= decode_range_client46_bom) && (ingress_pkt_field) <= decode_range_client46_tom
	assign decoded_binary[47] = ( (ingress_pkt_field) >= decode_range_client47_bom) && (ingress_pkt_field) <= decode_range_client47_tom
	assign decoded_binary[48] = ( (ingress_pkt_field) >= decode_range_client48_bom) && (ingress_pkt_field) <= decode_range_client48_tom
	assign decoded_binary[49] = ( (ingress_pkt_field) >= decode_range_client49_bom) && (ingress_pkt_field) <= decode_range_client49_tom
	assign decoded_binary[50] = ( (ingress_pkt_field) >= decode_range_client50_bom) && (ingress_pkt_field) <= decode_range_client50_tom
	assign decoded_binary[51] = ( (ingress_pkt_field) >= decode_range_client51_bom) && (ingress_pkt_field) <= decode_range_client51_tom
	assign decoded_binary[52] = ( (ingress_pkt_field) >= decode_range_client52_bom) && (ingress_pkt_field) <= decode_range_client52_tom
	assign decoded_binary[53] = ( (ingress_pkt_field) >= decode_range_client53_bom) && (ingress_pkt_field) <= decode_range_client53_tom
	assign decoded_binary[54] = ( (ingress_pkt_field) >= decode_range_client54_bom) && (ingress_pkt_field) <= decode_range_client54_tom
	assign decoded_binary[55] = ( (ingress_pkt_field) >= decode_range_client55_bom) && (ingress_pkt_field) <= decode_range_client55_tom
	assign decoded_binary[56] = ( (ingress_pkt_field) >= decode_range_client56_bom) && (ingress_pkt_field) <= decode_range_client56_tom
	assign decoded_binary[57] = ( (ingress_pkt_field) >= decode_range_client57_bom) && (ingress_pkt_field) <= decode_range_client57_tom
	assign decoded_binary[58] = ( (ingress_pkt_field) >= decode_range_client58_bom) && (ingress_pkt_field) <= decode_range_client58_tom
	assign decoded_binary[59] = ( (ingress_pkt_field) >= decode_range_client59_bom) && (ingress_pkt_field) <= decode_range_client59_tom
	assign decoded_binary[60] = ( (ingress_pkt_field) >= decode_range_client60_bom) && (ingress_pkt_field) <= decode_range_client60_tom
	assign decoded_binary[61] = ( (ingress_pkt_field) >= decode_range_client61_bom) && (ingress_pkt_field) <= decode_range_client61_tom
	assign decoded_binary[62] = ( (ingress_pkt_field) >= decode_range_client62_bom) && (ingress_pkt_field) <= decode_range_client62_tom
	assign decoded_binary[63] = ( (ingress_pkt_field) >= decode_range_client63_bom) && (ingress_pkt_field) <= decode_range_client63_tom
	assign decoded_binary[64] = ( (ingress_pkt_field) >= decode_range_client64_bom) && (ingress_pkt_field) <= decode_range_client64_tom
	assign decoded_binary[65] = ( (ingress_pkt_field) >= decode_range_client65_bom) && (ingress_pkt_field) <= decode_range_client65_tom
	assign decoded_binary[66] = ( (ingress_pkt_field) >= decode_range_client66_bom) && (ingress_pkt_field) <= decode_range_client66_tom
	assign decoded_binary[67] = ( (ingress_pkt_field) >= decode_range_client67_bom) && (ingress_pkt_field) <= decode_range_client67_tom
	assign decoded_binary[68] = ( (ingress_pkt_field) >= decode_range_client68_bom) && (ingress_pkt_field) <= decode_range_client68_tom
	assign decoded_binary[69] = ( (ingress_pkt_field) >= decode_range_client69_bom) && (ingress_pkt_field) <= decode_range_client69_tom
	assign decoded_binary[70] = ( (ingress_pkt_field) >= decode_range_client70_bom) && (ingress_pkt_field) <= decode_range_client70_tom
	assign decoded_binary[71] = ( (ingress_pkt_field) >= decode_range_client71_bom) && (ingress_pkt_field) <= decode_range_client71_tom
	assign decoded_binary[72] = ( (ingress_pkt_field) >= decode_range_client72_bom) && (ingress_pkt_field) <= decode_range_client72_tom
	assign decoded_binary[73] = ( (ingress_pkt_field) >= decode_range_client73_bom) && (ingress_pkt_field) <= decode_range_client73_tom
	assign decoded_binary[74] = ( (ingress_pkt_field) >= decode_range_client74_bom) && (ingress_pkt_field) <= decode_range_client74_tom
	assign decoded_binary[75] = ( (ingress_pkt_field) >= decode_range_client75_bom) && (ingress_pkt_field) <= decode_range_client75_tom
	assign decoded_binary[76] = ( (ingress_pkt_field) >= decode_range_client76_bom) && (ingress_pkt_field) <= decode_range_client76_tom
	assign decoded_binary[77] = ( (ingress_pkt_field) >= decode_range_client77_bom) && (ingress_pkt_field) <= decode_range_client77_tom
	assign decoded_binary[78] = ( (ingress_pkt_field) >= decode_range_client78_bom) && (ingress_pkt_field) <= decode_range_client78_tom
	assign decoded_binary[79] = ( (ingress_pkt_field) >= decode_range_client79_bom) && (ingress_pkt_field) <= decode_range_client79_tom
	assign decoded_binary[80] = ( (ingress_pkt_field) >= decode_range_client80_bom) && (ingress_pkt_field) <= decode_range_client80_tom
	assign decoded_binary[81] = ( (ingress_pkt_field) >= decode_range_client81_bom) && (ingress_pkt_field) <= decode_range_client81_tom
	assign decoded_binary[82] = ( (ingress_pkt_field) >= decode_range_client82_bom) && (ingress_pkt_field) <= decode_range_client82_tom
	assign decoded_binary[83] = ( (ingress_pkt_field) >= decode_range_client83_bom) && (ingress_pkt_field) <= decode_range_client83_tom
	assign decoded_binary[84] = ( (ingress_pkt_field) >= decode_range_client84_bom) && (ingress_pkt_field) <= decode_range_client84_tom
	assign decoded_binary[85] = ( (ingress_pkt_field) >= decode_range_client85_bom) && (ingress_pkt_field) <= decode_range_client85_tom
	assign decoded_binary[86] = ( (ingress_pkt_field) >= decode_range_client86_bom) && (ingress_pkt_field) <= decode_range_client86_tom
	assign decoded_binary[87] = ( (ingress_pkt_field) >= decode_range_client87_bom) && (ingress_pkt_field) <= decode_range_client87_tom
	assign decoded_binary[88] = ( (ingress_pkt_field) >= decode_range_client88_bom) && (ingress_pkt_field) <= decode_range_client88_tom
	assign decoded_binary[89] = ( (ingress_pkt_field) >= decode_range_client89_bom) && (ingress_pkt_field) <= decode_range_client89_tom
	assign decoded_binary[90] = ( (ingress_pkt_field) >= decode_range_client90_bom) && (ingress_pkt_field) <= decode_range_client90_tom
	assign decoded_binary[91] = ( (ingress_pkt_field) >= decode_range_client91_bom) && (ingress_pkt_field) <= decode_range_client91_tom
	assign decoded_binary[92] = ( (ingress_pkt_field) >= decode_range_client92_bom) && (ingress_pkt_field) <= decode_range_client92_tom
	assign decoded_binary[93] = ( (ingress_pkt_field) >= decode_range_client93_bom) && (ingress_pkt_field) <= decode_range_client93_tom
	assign decoded_binary[94] = ( (ingress_pkt_field) >= decode_range_client94_bom) && (ingress_pkt_field) <= decode_range_client94_tom
	assign decoded_binary[95] = ( (ingress_pkt_field) >= decode_range_client95_bom) && (ingress_pkt_field) <= decode_range_client95_tom
	assign decoded_binary[96] = ( (ingress_pkt_field) >= decode_range_client96_bom) && (ingress_pkt_field) <= decode_range_client96_tom
	assign decoded_binary[97] = ( (ingress_pkt_field) >= decode_range_client97_bom) && (ingress_pkt_field) <= decode_range_client97_tom
	assign decoded_binary[98] = ( (ingress_pkt_field) >= decode_range_client98_bom) && (ingress_pkt_field) <= decode_range_client98_tom
	assign decoded_binary[99] = ( (ingress_pkt_field) >= decode_range_client99_bom) && (ingress_pkt_field) <= decode_range_client99_tom


assign dec_err           = ~ (|decoded_binary);


endmodule
