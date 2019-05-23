
module AH_demux_8_34_0 (select
,ing_data
,ing_valid
,ing_ready
,egr0_data
,egr0_valid
,egr0_ready
,egr1_data
,egr1_valid
,egr1_ready
,egr2_data
,egr2_valid
,egr2_ready
,egr3_data
,egr3_valid
,egr3_ready
,egr4_data
,egr4_valid
,egr4_ready
,egr5_data
,egr5_valid
,egr5_ready
,egr6_data
,egr6_valid
,egr6_ready
,egr7_data
,egr7_valid
,egr7_ready
,egr8_data
,egr8_valid
,egr8_ready
,egr9_data
,egr9_valid
,egr9_ready
,egr10_data
,egr10_valid
,egr10_ready
,egr11_data
,egr11_valid
,egr11_ready
,egr12_data
,egr12_valid
,egr12_ready
,egr13_data
,egr13_valid
,egr13_ready
,egr14_data
,egr14_valid
,egr14_ready
,egr15_data
,egr15_valid
,egr15_ready
,egr16_data
,egr16_valid
,egr16_ready
,egr17_data
,egr17_valid
,egr17_ready
,egr18_data
,egr18_valid
,egr18_ready
,egr19_data
,egr19_valid
,egr19_ready
,egr20_data
,egr20_valid
,egr20_ready
,egr21_data
,egr21_valid
,egr21_ready
,egr22_data
,egr22_valid
,egr22_ready
,egr23_data
,egr23_valid
,egr23_ready
,egr24_data
,egr24_valid
,egr24_ready
,egr25_data
,egr25_valid
,egr25_ready
,egr26_data
,egr26_valid
,egr26_ready
,egr27_data
,egr27_valid
,egr27_ready
,egr28_data
,egr28_valid
,egr28_ready
,egr29_data
,egr29_valid
,egr29_ready
,egr30_data
,egr30_valid
,egr30_ready
,egr31_data
,egr31_valid
,egr31_ready
,egr32_data
,egr32_valid
,egr32_ready
,egr33_data
,egr33_valid
,egr33_ready);

input select;
input [7:0] ing_data;
input ing_valid;
output ing_ready;
output [7:0] egr0_data;
output egr0_valid;
input egr0_ready;
output [7:0] egr1_data;
output egr1_valid;
input egr1_ready;
output [7:0] egr2_data;
output egr2_valid;
input egr2_ready;
output [7:0] egr3_data;
output egr3_valid;
input egr3_ready;
output [7:0] egr4_data;
output egr4_valid;
input egr4_ready;
output [7:0] egr5_data;
output egr5_valid;
input egr5_ready;
output [7:0] egr6_data;
output egr6_valid;
input egr6_ready;
output [7:0] egr7_data;
output egr7_valid;
input egr7_ready;
output [7:0] egr8_data;
output egr8_valid;
input egr8_ready;
output [7:0] egr9_data;
output egr9_valid;
input egr9_ready;
output [7:0] egr10_data;
output egr10_valid;
input egr10_ready;
output [7:0] egr11_data;
output egr11_valid;
input egr11_ready;
output [7:0] egr12_data;
output egr12_valid;
input egr12_ready;
output [7:0] egr13_data;
output egr13_valid;
input egr13_ready;
output [7:0] egr14_data;
output egr14_valid;
input egr14_ready;
output [7:0] egr15_data;
output egr15_valid;
input egr15_ready;
output [7:0] egr16_data;
output egr16_valid;
input egr16_ready;
output [7:0] egr17_data;
output egr17_valid;
input egr17_ready;
output [7:0] egr18_data;
output egr18_valid;
input egr18_ready;
output [7:0] egr19_data;
output egr19_valid;
input egr19_ready;
output [7:0] egr20_data;
output egr20_valid;
input egr20_ready;
output [7:0] egr21_data;
output egr21_valid;
input egr21_ready;
output [7:0] egr22_data;
output egr22_valid;
input egr22_ready;
output [7:0] egr23_data;
output egr23_valid;
input egr23_ready;
output [7:0] egr24_data;
output egr24_valid;
input egr24_ready;
output [7:0] egr25_data;
output egr25_valid;
input egr25_ready;
output [7:0] egr26_data;
output egr26_valid;
input egr26_ready;
output [7:0] egr27_data;
output egr27_valid;
input egr27_ready;
output [7:0] egr28_data;
output egr28_valid;
input egr28_ready;
output [7:0] egr29_data;
output egr29_valid;
input egr29_ready;
output [7:0] egr30_data;
output egr30_valid;
input egr30_ready;
output [7:0] egr31_data;
output egr31_valid;
input egr31_ready;
output [7:0] egr32_data;
output egr32_valid;
input egr32_ready;
output [7:0] egr33_data;
output egr33_valid;
input egr33_ready;


// Ingress and Egress are short circuited based on condition


wire assign egress0_ds_pkt       = (demux_select== 6'd0) ? ingress_ds_pkt       : 6'd0;
wire assign egress1_ds_pkt       = (demux_select== 6'd1) ? ingress_ds_pkt       : 6'd0;
wire assign egress2_ds_pkt       = (demux_select== 6'd2) ? ingress_ds_pkt       : 6'd0;
wire assign egress3_ds_pkt       = (demux_select== 6'd3) ? ingress_ds_pkt       : 6'd0;
wire assign egress4_ds_pkt       = (demux_select== 6'd4) ? ingress_ds_pkt       : 6'd0;
wire assign egress5_ds_pkt       = (demux_select== 6'd5) ? ingress_ds_pkt       : 6'd0;
wire assign egress6_ds_pkt       = (demux_select== 6'd6) ? ingress_ds_pkt       : 6'd0;
wire assign egress7_ds_pkt       = (demux_select== 6'd7) ? ingress_ds_pkt       : 6'd0;
wire assign egress8_ds_pkt       = (demux_select== 6'd8) ? ingress_ds_pkt       : 6'd0;
wire assign egress9_ds_pkt       = (demux_select== 6'd9) ? ingress_ds_pkt       : 6'd0;
wire assign egress10_ds_pkt       = (demux_select== 6'd10) ? ingress_ds_pkt       : 6'd0;
wire assign egress11_ds_pkt       = (demux_select== 6'd11) ? ingress_ds_pkt       : 6'd0;
wire assign egress12_ds_pkt       = (demux_select== 6'd12) ? ingress_ds_pkt       : 6'd0;
wire assign egress13_ds_pkt       = (demux_select== 6'd13) ? ingress_ds_pkt       : 6'd0;
wire assign egress14_ds_pkt       = (demux_select== 6'd14) ? ingress_ds_pkt       : 6'd0;
wire assign egress15_ds_pkt       = (demux_select== 6'd15) ? ingress_ds_pkt       : 6'd0;
wire assign egress16_ds_pkt       = (demux_select== 6'd16) ? ingress_ds_pkt       : 6'd0;
wire assign egress17_ds_pkt       = (demux_select== 6'd17) ? ingress_ds_pkt       : 6'd0;
wire assign egress18_ds_pkt       = (demux_select== 6'd18) ? ingress_ds_pkt       : 6'd0;
wire assign egress19_ds_pkt       = (demux_select== 6'd19) ? ingress_ds_pkt       : 6'd0;
wire assign egress20_ds_pkt       = (demux_select== 6'd20) ? ingress_ds_pkt       : 6'd0;
wire assign egress21_ds_pkt       = (demux_select== 6'd21) ? ingress_ds_pkt       : 6'd0;
wire assign egress22_ds_pkt       = (demux_select== 6'd22) ? ingress_ds_pkt       : 6'd0;
wire assign egress23_ds_pkt       = (demux_select== 6'd23) ? ingress_ds_pkt       : 6'd0;
wire assign egress24_ds_pkt       = (demux_select== 6'd24) ? ingress_ds_pkt       : 6'd0;
wire assign egress25_ds_pkt       = (demux_select== 6'd25) ? ingress_ds_pkt       : 6'd0;
wire assign egress26_ds_pkt       = (demux_select== 6'd26) ? ingress_ds_pkt       : 6'd0;
wire assign egress27_ds_pkt       = (demux_select== 6'd27) ? ingress_ds_pkt       : 6'd0;
wire assign egress28_ds_pkt       = (demux_select== 6'd28) ? ingress_ds_pkt       : 6'd0;
wire assign egress29_ds_pkt       = (demux_select== 6'd29) ? ingress_ds_pkt       : 6'd0;
wire assign egress30_ds_pkt       = (demux_select== 6'd30) ? ingress_ds_pkt       : 6'd0;
wire assign egress31_ds_pkt       = (demux_select== 6'd31) ? ingress_ds_pkt       : 6'd0;
wire assign egress32_ds_pkt       = (demux_select== 6'd32) ? ingress_ds_pkt       : 6'd0;
wire assign egress33_ds_pkt       = (demux_select== 6'd33) ? ingress_ds_pkt       : 6'd0;
wire assign egress0_ds_pkt_valid = (demux_select== 6'd0) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress1_ds_pkt_valid = (demux_select== 6'd1) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress2_ds_pkt_valid = (demux_select== 6'd2) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress3_ds_pkt_valid = (demux_select== 6'd3) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress4_ds_pkt_valid = (demux_select== 6'd4) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress5_ds_pkt_valid = (demux_select== 6'd5) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress6_ds_pkt_valid = (demux_select== 6'd6) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress7_ds_pkt_valid = (demux_select== 6'd7) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress8_ds_pkt_valid = (demux_select== 6'd8) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress9_ds_pkt_valid = (demux_select== 6'd9) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress10_ds_pkt_valid = (demux_select== 6'd10) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress11_ds_pkt_valid = (demux_select== 6'd11) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress12_ds_pkt_valid = (demux_select== 6'd12) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress13_ds_pkt_valid = (demux_select== 6'd13) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress14_ds_pkt_valid = (demux_select== 6'd14) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress15_ds_pkt_valid = (demux_select== 6'd15) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress16_ds_pkt_valid = (demux_select== 6'd16) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress17_ds_pkt_valid = (demux_select== 6'd17) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress18_ds_pkt_valid = (demux_select== 6'd18) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress19_ds_pkt_valid = (demux_select== 6'd19) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress20_ds_pkt_valid = (demux_select== 6'd20) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress21_ds_pkt_valid = (demux_select== 6'd21) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress22_ds_pkt_valid = (demux_select== 6'd22) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress23_ds_pkt_valid = (demux_select== 6'd23) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress24_ds_pkt_valid = (demux_select== 6'd24) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress25_ds_pkt_valid = (demux_select== 6'd25) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress26_ds_pkt_valid = (demux_select== 6'd26) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress27_ds_pkt_valid = (demux_select== 6'd27) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress28_ds_pkt_valid = (demux_select== 6'd28) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress29_ds_pkt_valid = (demux_select== 6'd29) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress30_ds_pkt_valid = (demux_select== 6'd30) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress31_ds_pkt_valid = (demux_select== 6'd31) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress32_ds_pkt_valid = (demux_select== 6'd32) ? ingress_ds_pkt_valid : 6'd0;
wire assign egress33_ds_pkt_valid = (demux_select== 6'd33) ? ingress_ds_pkt_valid : 6'd0;

wire assign ingress_ds_pkt_ready          =
                                           ((demux_select== 6'd0) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd1) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd2) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd3) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd4) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd5) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd6) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd7) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd8) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd9) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd10) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd11) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd12) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd13) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd14) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd15) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd16) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd17) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd18) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd19) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd20) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd21) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd22) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd23) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd24) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd25) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd26) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd27) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd28) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd29) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd30) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd31) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd32) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 6'd33) ? egress1_ds_pkt_ready ? 1'b0) | 
                                            1'b0;



endmodule
