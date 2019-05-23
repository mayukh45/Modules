
module AH_demux_16_85_0 (select
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
,egr33_ready
,egr34_data
,egr34_valid
,egr34_ready
,egr35_data
,egr35_valid
,egr35_ready
,egr36_data
,egr36_valid
,egr36_ready
,egr37_data
,egr37_valid
,egr37_ready
,egr38_data
,egr38_valid
,egr38_ready
,egr39_data
,egr39_valid
,egr39_ready
,egr40_data
,egr40_valid
,egr40_ready
,egr41_data
,egr41_valid
,egr41_ready
,egr42_data
,egr42_valid
,egr42_ready
,egr43_data
,egr43_valid
,egr43_ready
,egr44_data
,egr44_valid
,egr44_ready
,egr45_data
,egr45_valid
,egr45_ready
,egr46_data
,egr46_valid
,egr46_ready
,egr47_data
,egr47_valid
,egr47_ready
,egr48_data
,egr48_valid
,egr48_ready
,egr49_data
,egr49_valid
,egr49_ready
,egr50_data
,egr50_valid
,egr50_ready
,egr51_data
,egr51_valid
,egr51_ready
,egr52_data
,egr52_valid
,egr52_ready
,egr53_data
,egr53_valid
,egr53_ready
,egr54_data
,egr54_valid
,egr54_ready
,egr55_data
,egr55_valid
,egr55_ready
,egr56_data
,egr56_valid
,egr56_ready
,egr57_data
,egr57_valid
,egr57_ready
,egr58_data
,egr58_valid
,egr58_ready
,egr59_data
,egr59_valid
,egr59_ready
,egr60_data
,egr60_valid
,egr60_ready
,egr61_data
,egr61_valid
,egr61_ready
,egr62_data
,egr62_valid
,egr62_ready
,egr63_data
,egr63_valid
,egr63_ready
,egr64_data
,egr64_valid
,egr64_ready
,egr65_data
,egr65_valid
,egr65_ready
,egr66_data
,egr66_valid
,egr66_ready
,egr67_data
,egr67_valid
,egr67_ready
,egr68_data
,egr68_valid
,egr68_ready
,egr69_data
,egr69_valid
,egr69_ready
,egr70_data
,egr70_valid
,egr70_ready
,egr71_data
,egr71_valid
,egr71_ready
,egr72_data
,egr72_valid
,egr72_ready
,egr73_data
,egr73_valid
,egr73_ready
,egr74_data
,egr74_valid
,egr74_ready
,egr75_data
,egr75_valid
,egr75_ready
,egr76_data
,egr76_valid
,egr76_ready
,egr77_data
,egr77_valid
,egr77_ready
,egr78_data
,egr78_valid
,egr78_ready
,egr79_data
,egr79_valid
,egr79_ready
,egr80_data
,egr80_valid
,egr80_ready
,egr81_data
,egr81_valid
,egr81_ready
,egr82_data
,egr82_valid
,egr82_ready
,egr83_data
,egr83_valid
,egr83_ready
,egr84_data
,egr84_valid
,egr84_ready);

input select;
input [15:0] ing_data;
input ing_valid;
output ing_ready;
output [15:0] egr0_data;
output egr0_valid;
input egr0_ready;
output [15:0] egr1_data;
output egr1_valid;
input egr1_ready;
output [15:0] egr2_data;
output egr2_valid;
input egr2_ready;
output [15:0] egr3_data;
output egr3_valid;
input egr3_ready;
output [15:0] egr4_data;
output egr4_valid;
input egr4_ready;
output [15:0] egr5_data;
output egr5_valid;
input egr5_ready;
output [15:0] egr6_data;
output egr6_valid;
input egr6_ready;
output [15:0] egr7_data;
output egr7_valid;
input egr7_ready;
output [15:0] egr8_data;
output egr8_valid;
input egr8_ready;
output [15:0] egr9_data;
output egr9_valid;
input egr9_ready;
output [15:0] egr10_data;
output egr10_valid;
input egr10_ready;
output [15:0] egr11_data;
output egr11_valid;
input egr11_ready;
output [15:0] egr12_data;
output egr12_valid;
input egr12_ready;
output [15:0] egr13_data;
output egr13_valid;
input egr13_ready;
output [15:0] egr14_data;
output egr14_valid;
input egr14_ready;
output [15:0] egr15_data;
output egr15_valid;
input egr15_ready;
output [15:0] egr16_data;
output egr16_valid;
input egr16_ready;
output [15:0] egr17_data;
output egr17_valid;
input egr17_ready;
output [15:0] egr18_data;
output egr18_valid;
input egr18_ready;
output [15:0] egr19_data;
output egr19_valid;
input egr19_ready;
output [15:0] egr20_data;
output egr20_valid;
input egr20_ready;
output [15:0] egr21_data;
output egr21_valid;
input egr21_ready;
output [15:0] egr22_data;
output egr22_valid;
input egr22_ready;
output [15:0] egr23_data;
output egr23_valid;
input egr23_ready;
output [15:0] egr24_data;
output egr24_valid;
input egr24_ready;
output [15:0] egr25_data;
output egr25_valid;
input egr25_ready;
output [15:0] egr26_data;
output egr26_valid;
input egr26_ready;
output [15:0] egr27_data;
output egr27_valid;
input egr27_ready;
output [15:0] egr28_data;
output egr28_valid;
input egr28_ready;
output [15:0] egr29_data;
output egr29_valid;
input egr29_ready;
output [15:0] egr30_data;
output egr30_valid;
input egr30_ready;
output [15:0] egr31_data;
output egr31_valid;
input egr31_ready;
output [15:0] egr32_data;
output egr32_valid;
input egr32_ready;
output [15:0] egr33_data;
output egr33_valid;
input egr33_ready;
output [15:0] egr34_data;
output egr34_valid;
input egr34_ready;
output [15:0] egr35_data;
output egr35_valid;
input egr35_ready;
output [15:0] egr36_data;
output egr36_valid;
input egr36_ready;
output [15:0] egr37_data;
output egr37_valid;
input egr37_ready;
output [15:0] egr38_data;
output egr38_valid;
input egr38_ready;
output [15:0] egr39_data;
output egr39_valid;
input egr39_ready;
output [15:0] egr40_data;
output egr40_valid;
input egr40_ready;
output [15:0] egr41_data;
output egr41_valid;
input egr41_ready;
output [15:0] egr42_data;
output egr42_valid;
input egr42_ready;
output [15:0] egr43_data;
output egr43_valid;
input egr43_ready;
output [15:0] egr44_data;
output egr44_valid;
input egr44_ready;
output [15:0] egr45_data;
output egr45_valid;
input egr45_ready;
output [15:0] egr46_data;
output egr46_valid;
input egr46_ready;
output [15:0] egr47_data;
output egr47_valid;
input egr47_ready;
output [15:0] egr48_data;
output egr48_valid;
input egr48_ready;
output [15:0] egr49_data;
output egr49_valid;
input egr49_ready;
output [15:0] egr50_data;
output egr50_valid;
input egr50_ready;
output [15:0] egr51_data;
output egr51_valid;
input egr51_ready;
output [15:0] egr52_data;
output egr52_valid;
input egr52_ready;
output [15:0] egr53_data;
output egr53_valid;
input egr53_ready;
output [15:0] egr54_data;
output egr54_valid;
input egr54_ready;
output [15:0] egr55_data;
output egr55_valid;
input egr55_ready;
output [15:0] egr56_data;
output egr56_valid;
input egr56_ready;
output [15:0] egr57_data;
output egr57_valid;
input egr57_ready;
output [15:0] egr58_data;
output egr58_valid;
input egr58_ready;
output [15:0] egr59_data;
output egr59_valid;
input egr59_ready;
output [15:0] egr60_data;
output egr60_valid;
input egr60_ready;
output [15:0] egr61_data;
output egr61_valid;
input egr61_ready;
output [15:0] egr62_data;
output egr62_valid;
input egr62_ready;
output [15:0] egr63_data;
output egr63_valid;
input egr63_ready;
output [15:0] egr64_data;
output egr64_valid;
input egr64_ready;
output [15:0] egr65_data;
output egr65_valid;
input egr65_ready;
output [15:0] egr66_data;
output egr66_valid;
input egr66_ready;
output [15:0] egr67_data;
output egr67_valid;
input egr67_ready;
output [15:0] egr68_data;
output egr68_valid;
input egr68_ready;
output [15:0] egr69_data;
output egr69_valid;
input egr69_ready;
output [15:0] egr70_data;
output egr70_valid;
input egr70_ready;
output [15:0] egr71_data;
output egr71_valid;
input egr71_ready;
output [15:0] egr72_data;
output egr72_valid;
input egr72_ready;
output [15:0] egr73_data;
output egr73_valid;
input egr73_ready;
output [15:0] egr74_data;
output egr74_valid;
input egr74_ready;
output [15:0] egr75_data;
output egr75_valid;
input egr75_ready;
output [15:0] egr76_data;
output egr76_valid;
input egr76_ready;
output [15:0] egr77_data;
output egr77_valid;
input egr77_ready;
output [15:0] egr78_data;
output egr78_valid;
input egr78_ready;
output [15:0] egr79_data;
output egr79_valid;
input egr79_ready;
output [15:0] egr80_data;
output egr80_valid;
input egr80_ready;
output [15:0] egr81_data;
output egr81_valid;
input egr81_ready;
output [15:0] egr82_data;
output egr82_valid;
input egr82_ready;
output [15:0] egr83_data;
output egr83_valid;
input egr83_ready;
output [15:0] egr84_data;
output egr84_valid;
input egr84_ready;


// Ingress and Egress are short circuited based on condition


wire assign egress0_ds_pkt       = (demux_select== 7'd0) ? ingress_ds_pkt       : 7'd0;
wire assign egress1_ds_pkt       = (demux_select== 7'd1) ? ingress_ds_pkt       : 7'd0;
wire assign egress2_ds_pkt       = (demux_select== 7'd2) ? ingress_ds_pkt       : 7'd0;
wire assign egress3_ds_pkt       = (demux_select== 7'd3) ? ingress_ds_pkt       : 7'd0;
wire assign egress4_ds_pkt       = (demux_select== 7'd4) ? ingress_ds_pkt       : 7'd0;
wire assign egress5_ds_pkt       = (demux_select== 7'd5) ? ingress_ds_pkt       : 7'd0;
wire assign egress6_ds_pkt       = (demux_select== 7'd6) ? ingress_ds_pkt       : 7'd0;
wire assign egress7_ds_pkt       = (demux_select== 7'd7) ? ingress_ds_pkt       : 7'd0;
wire assign egress8_ds_pkt       = (demux_select== 7'd8) ? ingress_ds_pkt       : 7'd0;
wire assign egress9_ds_pkt       = (demux_select== 7'd9) ? ingress_ds_pkt       : 7'd0;
wire assign egress10_ds_pkt       = (demux_select== 7'd10) ? ingress_ds_pkt       : 7'd0;
wire assign egress11_ds_pkt       = (demux_select== 7'd11) ? ingress_ds_pkt       : 7'd0;
wire assign egress12_ds_pkt       = (demux_select== 7'd12) ? ingress_ds_pkt       : 7'd0;
wire assign egress13_ds_pkt       = (demux_select== 7'd13) ? ingress_ds_pkt       : 7'd0;
wire assign egress14_ds_pkt       = (demux_select== 7'd14) ? ingress_ds_pkt       : 7'd0;
wire assign egress15_ds_pkt       = (demux_select== 7'd15) ? ingress_ds_pkt       : 7'd0;
wire assign egress16_ds_pkt       = (demux_select== 7'd16) ? ingress_ds_pkt       : 7'd0;
wire assign egress17_ds_pkt       = (demux_select== 7'd17) ? ingress_ds_pkt       : 7'd0;
wire assign egress18_ds_pkt       = (demux_select== 7'd18) ? ingress_ds_pkt       : 7'd0;
wire assign egress19_ds_pkt       = (demux_select== 7'd19) ? ingress_ds_pkt       : 7'd0;
wire assign egress20_ds_pkt       = (demux_select== 7'd20) ? ingress_ds_pkt       : 7'd0;
wire assign egress21_ds_pkt       = (demux_select== 7'd21) ? ingress_ds_pkt       : 7'd0;
wire assign egress22_ds_pkt       = (demux_select== 7'd22) ? ingress_ds_pkt       : 7'd0;
wire assign egress23_ds_pkt       = (demux_select== 7'd23) ? ingress_ds_pkt       : 7'd0;
wire assign egress24_ds_pkt       = (demux_select== 7'd24) ? ingress_ds_pkt       : 7'd0;
wire assign egress25_ds_pkt       = (demux_select== 7'd25) ? ingress_ds_pkt       : 7'd0;
wire assign egress26_ds_pkt       = (demux_select== 7'd26) ? ingress_ds_pkt       : 7'd0;
wire assign egress27_ds_pkt       = (demux_select== 7'd27) ? ingress_ds_pkt       : 7'd0;
wire assign egress28_ds_pkt       = (demux_select== 7'd28) ? ingress_ds_pkt       : 7'd0;
wire assign egress29_ds_pkt       = (demux_select== 7'd29) ? ingress_ds_pkt       : 7'd0;
wire assign egress30_ds_pkt       = (demux_select== 7'd30) ? ingress_ds_pkt       : 7'd0;
wire assign egress31_ds_pkt       = (demux_select== 7'd31) ? ingress_ds_pkt       : 7'd0;
wire assign egress32_ds_pkt       = (demux_select== 7'd32) ? ingress_ds_pkt       : 7'd0;
wire assign egress33_ds_pkt       = (demux_select== 7'd33) ? ingress_ds_pkt       : 7'd0;
wire assign egress34_ds_pkt       = (demux_select== 7'd34) ? ingress_ds_pkt       : 7'd0;
wire assign egress35_ds_pkt       = (demux_select== 7'd35) ? ingress_ds_pkt       : 7'd0;
wire assign egress36_ds_pkt       = (demux_select== 7'd36) ? ingress_ds_pkt       : 7'd0;
wire assign egress37_ds_pkt       = (demux_select== 7'd37) ? ingress_ds_pkt       : 7'd0;
wire assign egress38_ds_pkt       = (demux_select== 7'd38) ? ingress_ds_pkt       : 7'd0;
wire assign egress39_ds_pkt       = (demux_select== 7'd39) ? ingress_ds_pkt       : 7'd0;
wire assign egress40_ds_pkt       = (demux_select== 7'd40) ? ingress_ds_pkt       : 7'd0;
wire assign egress41_ds_pkt       = (demux_select== 7'd41) ? ingress_ds_pkt       : 7'd0;
wire assign egress42_ds_pkt       = (demux_select== 7'd42) ? ingress_ds_pkt       : 7'd0;
wire assign egress43_ds_pkt       = (demux_select== 7'd43) ? ingress_ds_pkt       : 7'd0;
wire assign egress44_ds_pkt       = (demux_select== 7'd44) ? ingress_ds_pkt       : 7'd0;
wire assign egress45_ds_pkt       = (demux_select== 7'd45) ? ingress_ds_pkt       : 7'd0;
wire assign egress46_ds_pkt       = (demux_select== 7'd46) ? ingress_ds_pkt       : 7'd0;
wire assign egress47_ds_pkt       = (demux_select== 7'd47) ? ingress_ds_pkt       : 7'd0;
wire assign egress48_ds_pkt       = (demux_select== 7'd48) ? ingress_ds_pkt       : 7'd0;
wire assign egress49_ds_pkt       = (demux_select== 7'd49) ? ingress_ds_pkt       : 7'd0;
wire assign egress50_ds_pkt       = (demux_select== 7'd50) ? ingress_ds_pkt       : 7'd0;
wire assign egress51_ds_pkt       = (demux_select== 7'd51) ? ingress_ds_pkt       : 7'd0;
wire assign egress52_ds_pkt       = (demux_select== 7'd52) ? ingress_ds_pkt       : 7'd0;
wire assign egress53_ds_pkt       = (demux_select== 7'd53) ? ingress_ds_pkt       : 7'd0;
wire assign egress54_ds_pkt       = (demux_select== 7'd54) ? ingress_ds_pkt       : 7'd0;
wire assign egress55_ds_pkt       = (demux_select== 7'd55) ? ingress_ds_pkt       : 7'd0;
wire assign egress56_ds_pkt       = (demux_select== 7'd56) ? ingress_ds_pkt       : 7'd0;
wire assign egress57_ds_pkt       = (demux_select== 7'd57) ? ingress_ds_pkt       : 7'd0;
wire assign egress58_ds_pkt       = (demux_select== 7'd58) ? ingress_ds_pkt       : 7'd0;
wire assign egress59_ds_pkt       = (demux_select== 7'd59) ? ingress_ds_pkt       : 7'd0;
wire assign egress60_ds_pkt       = (demux_select== 7'd60) ? ingress_ds_pkt       : 7'd0;
wire assign egress61_ds_pkt       = (demux_select== 7'd61) ? ingress_ds_pkt       : 7'd0;
wire assign egress62_ds_pkt       = (demux_select== 7'd62) ? ingress_ds_pkt       : 7'd0;
wire assign egress63_ds_pkt       = (demux_select== 7'd63) ? ingress_ds_pkt       : 7'd0;
wire assign egress64_ds_pkt       = (demux_select== 7'd64) ? ingress_ds_pkt       : 7'd0;
wire assign egress65_ds_pkt       = (demux_select== 7'd65) ? ingress_ds_pkt       : 7'd0;
wire assign egress66_ds_pkt       = (demux_select== 7'd66) ? ingress_ds_pkt       : 7'd0;
wire assign egress67_ds_pkt       = (demux_select== 7'd67) ? ingress_ds_pkt       : 7'd0;
wire assign egress68_ds_pkt       = (demux_select== 7'd68) ? ingress_ds_pkt       : 7'd0;
wire assign egress69_ds_pkt       = (demux_select== 7'd69) ? ingress_ds_pkt       : 7'd0;
wire assign egress70_ds_pkt       = (demux_select== 7'd70) ? ingress_ds_pkt       : 7'd0;
wire assign egress71_ds_pkt       = (demux_select== 7'd71) ? ingress_ds_pkt       : 7'd0;
wire assign egress72_ds_pkt       = (demux_select== 7'd72) ? ingress_ds_pkt       : 7'd0;
wire assign egress73_ds_pkt       = (demux_select== 7'd73) ? ingress_ds_pkt       : 7'd0;
wire assign egress74_ds_pkt       = (demux_select== 7'd74) ? ingress_ds_pkt       : 7'd0;
wire assign egress75_ds_pkt       = (demux_select== 7'd75) ? ingress_ds_pkt       : 7'd0;
wire assign egress76_ds_pkt       = (demux_select== 7'd76) ? ingress_ds_pkt       : 7'd0;
wire assign egress77_ds_pkt       = (demux_select== 7'd77) ? ingress_ds_pkt       : 7'd0;
wire assign egress78_ds_pkt       = (demux_select== 7'd78) ? ingress_ds_pkt       : 7'd0;
wire assign egress79_ds_pkt       = (demux_select== 7'd79) ? ingress_ds_pkt       : 7'd0;
wire assign egress80_ds_pkt       = (demux_select== 7'd80) ? ingress_ds_pkt       : 7'd0;
wire assign egress81_ds_pkt       = (demux_select== 7'd81) ? ingress_ds_pkt       : 7'd0;
wire assign egress82_ds_pkt       = (demux_select== 7'd82) ? ingress_ds_pkt       : 7'd0;
wire assign egress83_ds_pkt       = (demux_select== 7'd83) ? ingress_ds_pkt       : 7'd0;
wire assign egress84_ds_pkt       = (demux_select== 7'd84) ? ingress_ds_pkt       : 7'd0;
wire assign egress0_ds_pkt_valid = (demux_select== 7'd0) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress1_ds_pkt_valid = (demux_select== 7'd1) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress2_ds_pkt_valid = (demux_select== 7'd2) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress3_ds_pkt_valid = (demux_select== 7'd3) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress4_ds_pkt_valid = (demux_select== 7'd4) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress5_ds_pkt_valid = (demux_select== 7'd5) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress6_ds_pkt_valid = (demux_select== 7'd6) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress7_ds_pkt_valid = (demux_select== 7'd7) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress8_ds_pkt_valid = (demux_select== 7'd8) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress9_ds_pkt_valid = (demux_select== 7'd9) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress10_ds_pkt_valid = (demux_select== 7'd10) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress11_ds_pkt_valid = (demux_select== 7'd11) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress12_ds_pkt_valid = (demux_select== 7'd12) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress13_ds_pkt_valid = (demux_select== 7'd13) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress14_ds_pkt_valid = (demux_select== 7'd14) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress15_ds_pkt_valid = (demux_select== 7'd15) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress16_ds_pkt_valid = (demux_select== 7'd16) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress17_ds_pkt_valid = (demux_select== 7'd17) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress18_ds_pkt_valid = (demux_select== 7'd18) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress19_ds_pkt_valid = (demux_select== 7'd19) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress20_ds_pkt_valid = (demux_select== 7'd20) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress21_ds_pkt_valid = (demux_select== 7'd21) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress22_ds_pkt_valid = (demux_select== 7'd22) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress23_ds_pkt_valid = (demux_select== 7'd23) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress24_ds_pkt_valid = (demux_select== 7'd24) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress25_ds_pkt_valid = (demux_select== 7'd25) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress26_ds_pkt_valid = (demux_select== 7'd26) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress27_ds_pkt_valid = (demux_select== 7'd27) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress28_ds_pkt_valid = (demux_select== 7'd28) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress29_ds_pkt_valid = (demux_select== 7'd29) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress30_ds_pkt_valid = (demux_select== 7'd30) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress31_ds_pkt_valid = (demux_select== 7'd31) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress32_ds_pkt_valid = (demux_select== 7'd32) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress33_ds_pkt_valid = (demux_select== 7'd33) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress34_ds_pkt_valid = (demux_select== 7'd34) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress35_ds_pkt_valid = (demux_select== 7'd35) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress36_ds_pkt_valid = (demux_select== 7'd36) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress37_ds_pkt_valid = (demux_select== 7'd37) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress38_ds_pkt_valid = (demux_select== 7'd38) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress39_ds_pkt_valid = (demux_select== 7'd39) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress40_ds_pkt_valid = (demux_select== 7'd40) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress41_ds_pkt_valid = (demux_select== 7'd41) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress42_ds_pkt_valid = (demux_select== 7'd42) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress43_ds_pkt_valid = (demux_select== 7'd43) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress44_ds_pkt_valid = (demux_select== 7'd44) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress45_ds_pkt_valid = (demux_select== 7'd45) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress46_ds_pkt_valid = (demux_select== 7'd46) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress47_ds_pkt_valid = (demux_select== 7'd47) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress48_ds_pkt_valid = (demux_select== 7'd48) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress49_ds_pkt_valid = (demux_select== 7'd49) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress50_ds_pkt_valid = (demux_select== 7'd50) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress51_ds_pkt_valid = (demux_select== 7'd51) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress52_ds_pkt_valid = (demux_select== 7'd52) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress53_ds_pkt_valid = (demux_select== 7'd53) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress54_ds_pkt_valid = (demux_select== 7'd54) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress55_ds_pkt_valid = (demux_select== 7'd55) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress56_ds_pkt_valid = (demux_select== 7'd56) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress57_ds_pkt_valid = (demux_select== 7'd57) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress58_ds_pkt_valid = (demux_select== 7'd58) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress59_ds_pkt_valid = (demux_select== 7'd59) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress60_ds_pkt_valid = (demux_select== 7'd60) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress61_ds_pkt_valid = (demux_select== 7'd61) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress62_ds_pkt_valid = (demux_select== 7'd62) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress63_ds_pkt_valid = (demux_select== 7'd63) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress64_ds_pkt_valid = (demux_select== 7'd64) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress65_ds_pkt_valid = (demux_select== 7'd65) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress66_ds_pkt_valid = (demux_select== 7'd66) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress67_ds_pkt_valid = (demux_select== 7'd67) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress68_ds_pkt_valid = (demux_select== 7'd68) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress69_ds_pkt_valid = (demux_select== 7'd69) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress70_ds_pkt_valid = (demux_select== 7'd70) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress71_ds_pkt_valid = (demux_select== 7'd71) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress72_ds_pkt_valid = (demux_select== 7'd72) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress73_ds_pkt_valid = (demux_select== 7'd73) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress74_ds_pkt_valid = (demux_select== 7'd74) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress75_ds_pkt_valid = (demux_select== 7'd75) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress76_ds_pkt_valid = (demux_select== 7'd76) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress77_ds_pkt_valid = (demux_select== 7'd77) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress78_ds_pkt_valid = (demux_select== 7'd78) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress79_ds_pkt_valid = (demux_select== 7'd79) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress80_ds_pkt_valid = (demux_select== 7'd80) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress81_ds_pkt_valid = (demux_select== 7'd81) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress82_ds_pkt_valid = (demux_select== 7'd82) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress83_ds_pkt_valid = (demux_select== 7'd83) ? ingress_ds_pkt_valid : 7'd0;
wire assign egress84_ds_pkt_valid = (demux_select== 7'd84) ? ingress_ds_pkt_valid : 7'd0;

wire assign ingress_ds_pkt_ready          =
                                           ((demux_select== 7'd0) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd1) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd2) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd3) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd4) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd5) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd6) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd7) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd8) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd9) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd10) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd11) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd12) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd13) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd14) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd15) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd16) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd17) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd18) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd19) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd20) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd21) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd22) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd23) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd24) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd25) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd26) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd27) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd28) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd29) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd30) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd31) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd32) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd33) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd34) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd35) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd36) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd37) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd38) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd39) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd40) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd41) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd42) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd43) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd44) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd45) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd46) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd47) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd48) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd49) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd50) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd51) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd52) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd53) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd54) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd55) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd56) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd57) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd58) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd59) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd60) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd61) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd62) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd63) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd64) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd65) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd66) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd67) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd68) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd69) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd70) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd71) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd72) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd73) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd74) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd75) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd76) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd77) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd78) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd79) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd80) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd81) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd82) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd83) ? egress1_ds_pkt_ready ? 1'b0) | 
                                           ((demux_select== 7'd84) ? egress1_ds_pkt_ready ? 1'b0) | 
                                            1'b0;



endmodule
