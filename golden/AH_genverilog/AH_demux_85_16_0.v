
module AH_demux_85_16_0 (select
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
,egr14_ready);

input select;
input [84:0] ing_data;
input ing_valid;
output ing_ready;
output [84:0] egr0_data;
output egr0_valid;
input egr0_ready;
output [84:0] egr1_data;
output egr1_valid;
input egr1_ready;
output [84:0] egr2_data;
output egr2_valid;
input egr2_ready;
output [84:0] egr3_data;
output egr3_valid;
input egr3_ready;
output [84:0] egr4_data;
output egr4_valid;
input egr4_ready;
output [84:0] egr5_data;
output egr5_valid;
input egr5_ready;
output [84:0] egr6_data;
output egr6_valid;
input egr6_ready;
output [84:0] egr7_data;
output egr7_valid;
input egr7_ready;
output [84:0] egr8_data;
output egr8_valid;
input egr8_ready;
output [84:0] egr9_data;
output egr9_valid;
input egr9_ready;
output [84:0] egr10_data;
output egr10_valid;
input egr10_ready;
output [84:0] egr11_data;
output egr11_valid;
input egr11_ready;
output [84:0] egr12_data;
output egr12_valid;
input egr12_ready;
output [84:0] egr13_data;
output egr13_valid;
input egr13_ready;
output [84:0] egr14_data;
output egr14_valid;
input egr14_ready;


// Ingress and Egress are short circuited based on condition


wire assign egress0_ds_pkt       = (demux_select== 4'd0) ? ingress_ds_pkt       : 4'd0;
wire assign egress1_ds_pkt       = (demux_select== 4'd1) ? ingress_ds_pkt       : 4'd0;
wire assign egress2_ds_pkt       = (demux_select== 4'd2) ? ingress_ds_pkt       : 4'd0;
wire assign egress3_ds_pkt       = (demux_select== 4'd3) ? ingress_ds_pkt       : 4'd0;
wire assign egress4_ds_pkt       = (demux_select== 4'd4) ? ingress_ds_pkt       : 4'd0;
wire assign egress5_ds_pkt       = (demux_select== 4'd5) ? ingress_ds_pkt       : 4'd0;
wire assign egress6_ds_pkt       = (demux_select== 4'd6) ? ingress_ds_pkt       : 4'd0;
wire assign egress7_ds_pkt       = (demux_select== 4'd7) ? ingress_ds_pkt       : 4'd0;
wire assign egress8_ds_pkt       = (demux_select== 4'd8) ? ingress_ds_pkt       : 4'd0;
wire assign egress9_ds_pkt       = (demux_select== 4'd9) ? ingress_ds_pkt       : 4'd0;
wire assign egress10_ds_pkt       = (demux_select== 4'd10) ? ingress_ds_pkt       : 4'd0;
wire assign egress11_ds_pkt       = (demux_select== 4'd11) ? ingress_ds_pkt       : 4'd0;
wire assign egress12_ds_pkt       = (demux_select== 4'd12) ? ingress_ds_pkt       : 4'd0;
wire assign egress13_ds_pkt       = (demux_select== 4'd13) ? ingress_ds_pkt       : 4'd0;
wire assign egress14_ds_pkt       = (demux_select== 4'd14) ? ingress_ds_pkt       : 4'd0;
wire assign egress15_ds_pkt       = (demux_select== 4'd15) ? ingress_ds_pkt       : 4'd0;
wire assign egress0_ds_pkt_valid = (demux_select== 4'd0) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress1_ds_pkt_valid = (demux_select== 4'd1) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress2_ds_pkt_valid = (demux_select== 4'd2) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress3_ds_pkt_valid = (demux_select== 4'd3) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress4_ds_pkt_valid = (demux_select== 4'd4) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress5_ds_pkt_valid = (demux_select== 4'd5) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress6_ds_pkt_valid = (demux_select== 4'd6) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress7_ds_pkt_valid = (demux_select== 4'd7) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress8_ds_pkt_valid = (demux_select== 4'd8) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress9_ds_pkt_valid = (demux_select== 4'd9) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress10_ds_pkt_valid = (demux_select== 4'd10) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress11_ds_pkt_valid = (demux_select== 4'd11) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress12_ds_pkt_valid = (demux_select== 4'd12) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress13_ds_pkt_valid = (demux_select== 4'd13) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress14_ds_pkt_valid = (demux_select== 4'd14) ? ingress_ds_pkt_valid : 4'd0;
wire assign egress15_ds_pkt_valid = (demux_select== 4'd15) ? ingress_ds_pkt_valid : 4'd0;

wire assign ingress_ds_pkt_ready          =
                                           ((demux_select== 4'd0) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd1) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd2) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd3) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd4) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd5) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd6) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd7) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd8) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd9) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd10) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd11) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd12) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd13) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd14) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 4'd15) ? egress1_ds_pkt_ready ? 1'b0) | 
                                            1'b0;



endmodule
