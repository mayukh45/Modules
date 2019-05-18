
module AH_demux_34_8_0 (select
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
,egr6_ready);

input select;
input [33:0] ing_data;
input ing_valid;
output ing_ready;
output [33:0] egr0_data;
output egr0_valid;
input egr0_ready;
output [33:0] egr1_data;
output egr1_valid;
input egr1_ready;
output [33:0] egr2_data;
output egr2_valid;
input egr2_ready;
output [33:0] egr3_data;
output egr3_valid;
input egr3_ready;
output [33:0] egr4_data;
output egr4_valid;
input egr4_ready;
output [33:0] egr5_data;
output egr5_valid;
input egr5_ready;
output [33:0] egr6_data;
output egr6_valid;
input egr6_ready;


// Ingress and Egress are short circuited based on condition


wire assign egress0_ds_pkt       = (demux_select== 3'd0) ? ingress_ds_pkt       : 3'd0;
wire assign egress1_ds_pkt       = (demux_select== 3'd1) ? ingress_ds_pkt       : 3'd0;
wire assign egress2_ds_pkt       = (demux_select== 3'd2) ? ingress_ds_pkt       : 3'd0;
wire assign egress3_ds_pkt       = (demux_select== 3'd3) ? ingress_ds_pkt       : 3'd0;
wire assign egress4_ds_pkt       = (demux_select== 3'd4) ? ingress_ds_pkt       : 3'd0;
wire assign egress5_ds_pkt       = (demux_select== 3'd5) ? ingress_ds_pkt       : 3'd0;
wire assign egress6_ds_pkt       = (demux_select== 3'd6) ? ingress_ds_pkt       : 3'd0;
wire assign egress7_ds_pkt       = (demux_select== 3'd7) ? ingress_ds_pkt       : 3'd0;
wire assign egress0_ds_pkt_valid = (demux_select== 3'd0) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress1_ds_pkt_valid = (demux_select== 3'd1) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress2_ds_pkt_valid = (demux_select== 3'd2) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress3_ds_pkt_valid = (demux_select== 3'd3) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress4_ds_pkt_valid = (demux_select== 3'd4) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress5_ds_pkt_valid = (demux_select== 3'd5) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress6_ds_pkt_valid = (demux_select== 3'd6) ? ingress_ds_pkt_valid : 3'd0;
wire assign egress7_ds_pkt_valid = (demux_select== 3'd7) ? ingress_ds_pkt_valid : 3'd0;

wire assign ingress_ds_pkt_ready          =
                                           ((demux_select== 3'd0) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd1) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd2) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd3) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd4) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd5) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd6) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 3'd7) ? egress1_ds_pkt_ready ? 1'b0) | 
                                            1'b0;



endmodule
