
module AH_decoder_96_15 (ingress_pkt_field
,decoded_binary
,dec_err);

input [95:0] ingress_pkt_field;
output [3:0] decoded_binary;
output dec_err;


// Ingress and Egress are short circuited based on condition

wire [3:0] decoded_binary;
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


assign dec_err           = ~ (|decoded_binary);


endmodule
