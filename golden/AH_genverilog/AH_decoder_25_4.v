
module AH_decoder_25_4 (ingress_pkt_field
,decoded_binary
,dec_err);

input [24:0] ingress_pkt_field;
output [1:0] decoded_binary;
output dec_err;


// Ingress and Egress are short circuited based on condition

wire [1:0] decoded_binary;
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


assign dec_err           = ~ (|decoded_binary);


endmodule
