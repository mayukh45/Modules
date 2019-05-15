
module AH_LruArbiter_40 (req
,gnt_busy
,gnt);

input [39:0] req;
input [39:0] gnt_busy;
output [39:0] gnt;


req [39:0] req0_used_status;
req [39:0] req1_used_status;
req [39:0] req2_used_status;
req [39:0] req3_used_status;
req [39:0] req4_used_status;
req [39:0] req5_used_status;
req [39:0] req6_used_status;
req [39:0] req7_used_status;
req [39:0] req8_used_status;
req [39:0] req9_used_status;
req [39:0] req10_used_status;
req [39:0] req11_used_status;
req [39:0] req12_used_status;
req [39:0] req13_used_status;
req [39:0] req14_used_status;
req [39:0] req15_used_status;
req [39:0] req16_used_status;
req [39:0] req17_used_status;
req [39:0] req18_used_status;
req [39:0] req19_used_status;
req [39:0] req20_used_status;
req [39:0] req21_used_status;
req [39:0] req22_used_status;
req [39:0] req23_used_status;
req [39:0] req24_used_status;
req [39:0] req25_used_status;
req [39:0] req26_used_status;
req [39:0] req27_used_status;
req [39:0] req28_used_status;
req [39:0] req29_used_status;
req [39:0] req30_used_status;
req [39:0] req31_used_status;
req [39:0] req32_used_status;
req [39:0] req33_used_status;
req [39:0] req34_used_status;
req [39:0] req35_used_status;
req [39:0] req36_used_status;
req [39:0] req37_used_status;
req [39:0] req38_used_status;
req [39:0] req39_used_status;

always @(posedge clk, negedge rstn) begin
        if(~rstn) begin

	req0_used_status <= 40'd40;
	req1_used_status <= 40'd39;
	req2_used_status <= 40'd38;
	req3_used_status <= 40'd37;
	req4_used_status <= 40'd36;
	req5_used_status <= 40'd35;
	req6_used_status <= 40'd34;
	req7_used_status <= 40'd33;
	req8_used_status <= 40'd32;
	req9_used_status <= 40'd31;
	req10_used_status <= 40'd30;
	req11_used_status <= 40'd29;
	req12_used_status <= 40'd28;
	req13_used_status <= 40'd27;
	req14_used_status <= 40'd26;
	req15_used_status <= 40'd25;
	req16_used_status <= 40'd24;
	req17_used_status <= 40'd23;
	req18_used_status <= 40'd22;
	req19_used_status <= 40'd21;
	req20_used_status <= 40'd20;
	req21_used_status <= 40'd19;
	req22_used_status <= 40'd18;
	req23_used_status <= 40'd17;
	req24_used_status <= 40'd16;
	req25_used_status <= 40'd15;
	req26_used_status <= 40'd14;
	req27_used_status <= 40'd13;
	req28_used_status <= 40'd12;
	req29_used_status <= 40'd11;
	req30_used_status <= 40'd10;
	req31_used_status <= 40'd9;
	req32_used_status <= 40'd8;
	req33_used_status <= 40'd7;
	req34_used_status <= 40'd6;
	req35_used_status <= 40'd5;
	req36_used_status <= 40'd4;
	req37_used_status <= 40'd3;
	req38_used_status <= 40'd2;
	req39_used_status <= 40'd1;

        end
        else begin

	gnt_pre[39:0] = 40'd0
	req_int[39:0]= req[40:0] & {40{gnt_busy}};
	if(req[0]) begin
		gnt_pre[0] = (req0_used_status==40) ? 1'b1 |

	((req1 & (req1_used_status > req0_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req0_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req0_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req0_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req0_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req0_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req0_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req0_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req0_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req0_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req0_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req0_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req0_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req0_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req0_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req0_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req0_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req0_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req0_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req0_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req0_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req0_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req0_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req0_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req0_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req0_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req0_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req0_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req0_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req0_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req0_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req0_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req0_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req0_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req0_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req0_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req0_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req0_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req0_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[1]) begin
		gnt_pre[1] = (req1_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req1_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req1_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req1_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req1_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req1_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req1_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req1_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req1_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req1_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req1_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req1_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req1_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req1_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req1_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req1_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req1_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req1_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req1_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req1_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req1_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req1_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req1_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req1_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req1_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req1_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req1_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req1_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req1_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req1_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req1_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req1_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req1_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req1_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req1_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req1_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req1_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req1_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req1_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req1_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[2]) begin
		gnt_pre[2] = (req2_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req2_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req2_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req2_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req2_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req2_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req2_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req2_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req2_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req2_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req2_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req2_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req2_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req2_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req2_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req2_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req2_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req2_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req2_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req2_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req2_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req2_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req2_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req2_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req2_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req2_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req2_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req2_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req2_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req2_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req2_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req2_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req2_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req2_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req2_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req2_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req2_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req2_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req2_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req2_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[3]) begin
		gnt_pre[3] = (req3_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req3_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req3_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req3_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req3_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req3_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req3_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req3_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req3_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req3_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req3_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req3_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req3_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req3_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req3_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req3_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req3_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req3_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req3_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req3_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req3_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req3_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req3_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req3_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req3_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req3_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req3_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req3_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req3_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req3_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req3_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req3_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req3_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req3_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req3_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req3_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req3_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req3_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req3_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req3_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[4]) begin
		gnt_pre[4] = (req4_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req4_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req4_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req4_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req4_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req4_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req4_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req4_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req4_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req4_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req4_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req4_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req4_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req4_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req4_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req4_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req4_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req4_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req4_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req4_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req4_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req4_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req4_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req4_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req4_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req4_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req4_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req4_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req4_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req4_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req4_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req4_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req4_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req4_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req4_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req4_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req4_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req4_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req4_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req4_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[5]) begin
		gnt_pre[5] = (req5_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req5_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req5_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req5_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req5_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req5_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req5_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req5_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req5_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req5_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req5_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req5_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req5_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req5_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req5_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req5_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req5_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req5_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req5_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req5_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req5_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req5_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req5_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req5_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req5_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req5_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req5_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req5_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req5_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req5_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req5_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req5_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req5_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req5_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req5_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req5_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req5_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req5_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req5_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req5_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[6]) begin
		gnt_pre[6] = (req6_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req6_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req6_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req6_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req6_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req6_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req6_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req6_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req6_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req6_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req6_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req6_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req6_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req6_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req6_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req6_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req6_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req6_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req6_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req6_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req6_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req6_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req6_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req6_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req6_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req6_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req6_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req6_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req6_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req6_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req6_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req6_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req6_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req6_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req6_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req6_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req6_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req6_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req6_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req6_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[7]) begin
		gnt_pre[7] = (req7_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req7_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req7_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req7_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req7_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req7_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req7_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req7_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req7_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req7_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req7_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req7_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req7_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req7_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req7_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req7_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req7_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req7_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req7_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req7_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req7_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req7_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req7_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req7_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req7_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req7_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req7_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req7_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req7_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req7_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req7_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req7_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req7_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req7_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req7_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req7_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req7_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req7_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req7_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req7_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[8]) begin
		gnt_pre[8] = (req8_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req8_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req8_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req8_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req8_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req8_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req8_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req8_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req8_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req8_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req8_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req8_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req8_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req8_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req8_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req8_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req8_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req8_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req8_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req8_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req8_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req8_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req8_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req8_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req8_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req8_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req8_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req8_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req8_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req8_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req8_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req8_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req8_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req8_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req8_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req8_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req8_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req8_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req8_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req8_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[9]) begin
		gnt_pre[9] = (req9_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req9_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req9_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req9_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req9_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req9_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req9_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req9_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req9_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req9_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req9_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req9_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req9_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req9_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req9_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req9_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req9_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req9_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req9_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req9_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req9_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req9_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req9_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req9_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req9_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req9_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req9_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req9_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req9_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req9_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req9_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req9_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req9_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req9_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req9_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req9_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req9_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req9_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req9_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req9_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[10]) begin
		gnt_pre[10] = (req10_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req10_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req10_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req10_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req10_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req10_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req10_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req10_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req10_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req10_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req10_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req10_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req10_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req10_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req10_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req10_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req10_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req10_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req10_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req10_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req10_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req10_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req10_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req10_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req10_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req10_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req10_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req10_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req10_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req10_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req10_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req10_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req10_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req10_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req10_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req10_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req10_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req10_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req10_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req10_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[11]) begin
		gnt_pre[11] = (req11_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req11_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req11_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req11_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req11_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req11_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req11_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req11_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req11_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req11_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req11_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req11_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req11_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req11_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req11_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req11_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req11_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req11_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req11_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req11_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req11_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req11_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req11_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req11_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req11_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req11_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req11_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req11_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req11_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req11_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req11_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req11_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req11_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req11_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req11_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req11_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req11_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req11_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req11_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req11_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[12]) begin
		gnt_pre[12] = (req12_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req12_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req12_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req12_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req12_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req12_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req12_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req12_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req12_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req12_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req12_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req12_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req12_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req12_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req12_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req12_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req12_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req12_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req12_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req12_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req12_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req12_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req12_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req12_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req12_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req12_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req12_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req12_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req12_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req12_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req12_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req12_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req12_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req12_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req12_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req12_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req12_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req12_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req12_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req12_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[13]) begin
		gnt_pre[13] = (req13_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req13_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req13_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req13_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req13_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req13_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req13_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req13_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req13_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req13_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req13_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req13_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req13_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req13_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req13_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req13_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req13_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req13_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req13_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req13_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req13_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req13_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req13_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req13_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req13_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req13_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req13_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req13_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req13_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req13_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req13_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req13_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req13_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req13_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req13_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req13_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req13_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req13_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req13_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req13_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[14]) begin
		gnt_pre[14] = (req14_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req14_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req14_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req14_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req14_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req14_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req14_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req14_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req14_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req14_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req14_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req14_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req14_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req14_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req14_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req14_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req14_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req14_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req14_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req14_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req14_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req14_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req14_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req14_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req14_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req14_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req14_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req14_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req14_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req14_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req14_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req14_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req14_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req14_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req14_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req14_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req14_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req14_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req14_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req14_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[15]) begin
		gnt_pre[15] = (req15_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req15_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req15_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req15_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req15_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req15_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req15_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req15_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req15_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req15_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req15_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req15_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req15_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req15_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req15_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req15_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req15_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req15_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req15_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req15_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req15_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req15_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req15_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req15_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req15_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req15_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req15_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req15_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req15_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req15_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req15_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req15_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req15_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req15_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req15_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req15_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req15_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req15_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req15_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req15_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[16]) begin
		gnt_pre[16] = (req16_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req16_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req16_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req16_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req16_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req16_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req16_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req16_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req16_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req16_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req16_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req16_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req16_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req16_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req16_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req16_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req16_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req16_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req16_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req16_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req16_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req16_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req16_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req16_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req16_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req16_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req16_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req16_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req16_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req16_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req16_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req16_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req16_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req16_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req16_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req16_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req16_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req16_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req16_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req16_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[17]) begin
		gnt_pre[17] = (req17_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req17_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req17_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req17_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req17_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req17_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req17_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req17_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req17_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req17_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req17_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req17_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req17_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req17_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req17_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req17_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req17_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req17_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req17_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req17_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req17_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req17_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req17_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req17_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req17_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req17_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req17_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req17_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req17_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req17_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req17_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req17_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req17_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req17_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req17_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req17_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req17_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req17_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req17_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req17_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[18]) begin
		gnt_pre[18] = (req18_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req18_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req18_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req18_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req18_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req18_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req18_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req18_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req18_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req18_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req18_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req18_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req18_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req18_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req18_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req18_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req18_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req18_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req18_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req18_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req18_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req18_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req18_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req18_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req18_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req18_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req18_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req18_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req18_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req18_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req18_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req18_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req18_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req18_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req18_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req18_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req18_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req18_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req18_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req18_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[19]) begin
		gnt_pre[19] = (req19_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req19_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req19_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req19_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req19_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req19_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req19_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req19_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req19_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req19_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req19_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req19_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req19_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req19_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req19_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req19_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req19_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req19_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req19_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req19_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req19_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req19_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req19_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req19_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req19_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req19_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req19_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req19_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req19_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req19_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req19_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req19_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req19_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req19_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req19_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req19_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req19_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req19_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req19_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req19_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[20]) begin
		gnt_pre[20] = (req20_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req20_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req20_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req20_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req20_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req20_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req20_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req20_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req20_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req20_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req20_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req20_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req20_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req20_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req20_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req20_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req20_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req20_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req20_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req20_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req20_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req20_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req20_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req20_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req20_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req20_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req20_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req20_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req20_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req20_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req20_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req20_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req20_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req20_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req20_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req20_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req20_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req20_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req20_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req20_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[21]) begin
		gnt_pre[21] = (req21_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req21_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req21_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req21_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req21_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req21_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req21_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req21_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req21_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req21_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req21_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req21_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req21_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req21_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req21_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req21_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req21_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req21_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req21_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req21_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req21_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req21_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req21_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req21_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req21_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req21_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req21_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req21_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req21_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req21_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req21_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req21_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req21_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req21_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req21_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req21_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req21_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req21_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req21_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req21_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[22]) begin
		gnt_pre[22] = (req22_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req22_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req22_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req22_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req22_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req22_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req22_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req22_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req22_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req22_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req22_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req22_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req22_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req22_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req22_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req22_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req22_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req22_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req22_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req22_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req22_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req22_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req22_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req22_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req22_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req22_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req22_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req22_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req22_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req22_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req22_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req22_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req22_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req22_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req22_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req22_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req22_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req22_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req22_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req22_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[23]) begin
		gnt_pre[23] = (req23_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req23_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req23_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req23_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req23_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req23_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req23_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req23_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req23_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req23_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req23_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req23_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req23_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req23_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req23_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req23_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req23_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req23_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req23_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req23_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req23_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req23_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req23_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req23_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req23_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req23_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req23_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req23_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req23_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req23_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req23_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req23_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req23_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req23_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req23_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req23_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req23_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req23_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req23_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req23_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[24]) begin
		gnt_pre[24] = (req24_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req24_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req24_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req24_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req24_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req24_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req24_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req24_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req24_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req24_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req24_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req24_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req24_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req24_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req24_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req24_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req24_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req24_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req24_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req24_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req24_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req24_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req24_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req24_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req24_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req24_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req24_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req24_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req24_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req24_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req24_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req24_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req24_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req24_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req24_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req24_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req24_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req24_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req24_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req24_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[25]) begin
		gnt_pre[25] = (req25_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req25_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req25_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req25_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req25_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req25_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req25_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req25_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req25_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req25_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req25_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req25_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req25_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req25_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req25_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req25_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req25_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req25_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req25_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req25_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req25_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req25_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req25_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req25_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req25_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req25_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req25_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req25_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req25_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req25_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req25_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req25_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req25_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req25_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req25_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req25_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req25_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req25_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req25_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req25_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[26]) begin
		gnt_pre[26] = (req26_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req26_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req26_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req26_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req26_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req26_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req26_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req26_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req26_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req26_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req26_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req26_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req26_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req26_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req26_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req26_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req26_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req26_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req26_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req26_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req26_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req26_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req26_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req26_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req26_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req26_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req26_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req26_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req26_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req26_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req26_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req26_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req26_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req26_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req26_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req26_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req26_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req26_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req26_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req26_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[27]) begin
		gnt_pre[27] = (req27_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req27_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req27_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req27_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req27_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req27_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req27_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req27_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req27_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req27_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req27_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req27_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req27_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req27_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req27_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req27_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req27_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req27_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req27_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req27_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req27_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req27_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req27_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req27_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req27_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req27_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req27_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req27_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req27_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req27_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req27_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req27_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req27_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req27_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req27_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req27_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req27_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req27_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req27_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req27_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[28]) begin
		gnt_pre[28] = (req28_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req28_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req28_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req28_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req28_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req28_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req28_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req28_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req28_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req28_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req28_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req28_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req28_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req28_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req28_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req28_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req28_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req28_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req28_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req28_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req28_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req28_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req28_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req28_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req28_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req28_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req28_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req28_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req28_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req28_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req28_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req28_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req28_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req28_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req28_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req28_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req28_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req28_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req28_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req28_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[29]) begin
		gnt_pre[29] = (req29_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req29_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req29_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req29_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req29_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req29_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req29_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req29_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req29_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req29_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req29_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req29_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req29_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req29_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req29_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req29_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req29_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req29_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req29_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req29_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req29_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req29_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req29_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req29_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req29_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req29_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req29_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req29_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req29_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req29_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req29_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req29_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req29_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req29_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req29_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req29_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req29_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req29_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req29_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req29_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[30]) begin
		gnt_pre[30] = (req30_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req30_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req30_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req30_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req30_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req30_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req30_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req30_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req30_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req30_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req30_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req30_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req30_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req30_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req30_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req30_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req30_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req30_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req30_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req30_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req30_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req30_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req30_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req30_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req30_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req30_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req30_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req30_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req30_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req30_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req30_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req30_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req30_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req30_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req30_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req30_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req30_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req30_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req30_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req30_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[31]) begin
		gnt_pre[31] = (req31_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req31_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req31_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req31_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req31_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req31_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req31_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req31_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req31_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req31_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req31_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req31_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req31_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req31_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req31_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req31_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req31_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req31_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req31_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req31_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req31_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req31_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req31_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req31_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req31_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req31_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req31_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req31_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req31_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req31_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req31_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req31_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req31_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req31_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req31_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req31_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req31_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req31_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req31_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req31_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[32]) begin
		gnt_pre[32] = (req32_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req32_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req32_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req32_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req32_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req32_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req32_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req32_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req32_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req32_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req32_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req32_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req32_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req32_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req32_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req32_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req32_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req32_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req32_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req32_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req32_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req32_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req32_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req32_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req32_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req32_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req32_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req32_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req32_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req32_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req32_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req32_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req32_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req32_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req32_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req32_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req32_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req32_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req32_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req32_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[33]) begin
		gnt_pre[33] = (req33_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req33_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req33_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req33_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req33_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req33_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req33_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req33_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req33_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req33_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req33_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req33_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req33_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req33_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req33_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req33_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req33_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req33_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req33_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req33_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req33_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req33_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req33_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req33_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req33_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req33_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req33_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req33_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req33_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req33_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req33_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req33_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req33_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req33_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req33_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req33_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req33_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req33_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req33_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req33_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[34]) begin
		gnt_pre[34] = (req34_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req34_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req34_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req34_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req34_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req34_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req34_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req34_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req34_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req34_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req34_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req34_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req34_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req34_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req34_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req34_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req34_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req34_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req34_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req34_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req34_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req34_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req34_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req34_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req34_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req34_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req34_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req34_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req34_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req34_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req34_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req34_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req34_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req34_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req34_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req34_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req34_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req34_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req34_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req34_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[35]) begin
		gnt_pre[35] = (req35_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req35_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req35_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req35_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req35_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req35_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req35_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req35_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req35_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req35_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req35_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req35_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req35_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req35_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req35_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req35_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req35_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req35_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req35_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req35_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req35_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req35_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req35_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req35_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req35_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req35_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req35_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req35_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req35_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req35_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req35_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req35_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req35_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req35_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req35_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req35_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req35_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req35_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req35_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req35_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[36]) begin
		gnt_pre[36] = (req36_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req36_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req36_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req36_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req36_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req36_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req36_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req36_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req36_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req36_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req36_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req36_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req36_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req36_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req36_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req36_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req36_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req36_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req36_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req36_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req36_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req36_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req36_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req36_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req36_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req36_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req36_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req36_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req36_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req36_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req36_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req36_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req36_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req36_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req36_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req36_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req36_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req36_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req36_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req36_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[37]) begin
		gnt_pre[37] = (req37_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req37_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req37_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req37_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req37_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req37_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req37_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req37_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req37_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req37_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req37_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req37_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req37_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req37_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req37_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req37_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req37_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req37_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req37_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req37_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req37_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req37_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req37_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req37_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req37_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req37_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req37_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req37_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req37_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req37_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req37_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req37_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req37_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req37_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req37_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req37_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req37_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req37_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req37_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req37_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[38]) begin
		gnt_pre[38] = (req38_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req38_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req38_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req38_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req38_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req38_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req38_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req38_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req38_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req38_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req38_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req38_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req38_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req38_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req38_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req38_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req38_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req38_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req38_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req38_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req38_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req38_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req38_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req38_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req38_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req38_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req38_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req38_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req38_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req38_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req38_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req38_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req38_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req38_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req38_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req38_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req38_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req38_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req38_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req38_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[39]) begin
		gnt_pre[39] = (req39_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req39_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req39_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req39_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req39_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req39_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req39_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req39_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req39_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req39_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req39_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req39_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req39_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req39_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req39_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req39_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req39_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req39_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req39_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req39_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req39_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req39_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req39_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req39_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req39_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req39_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req39_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req39_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req39_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req39_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req39_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req39_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req39_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req39_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req39_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req39_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req39_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req39_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req39_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req39_used_status)) ?1'b0 |
		1'b1;
	end

always @(req, gnt_busy) begin

	gnt_pre[39:0] = 40'd0
	req_int[39:0]= req[40:0] & {40{gnt_busy}};
	if(req[0]) begin
		gnt_pre[0] = (req0_used_status==40) ? 1'b1 |

	((req1 & (req1_used_status > req0_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req0_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req0_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req0_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req0_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req0_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req0_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req0_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req0_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req0_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req0_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req0_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req0_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req0_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req0_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req0_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req0_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req0_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req0_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req0_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req0_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req0_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req0_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req0_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req0_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req0_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req0_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req0_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req0_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req0_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req0_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req0_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req0_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req0_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req0_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req0_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req0_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req0_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req0_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[1]) begin
		gnt_pre[1] = (req1_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req1_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req1_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req1_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req1_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req1_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req1_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req1_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req1_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req1_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req1_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req1_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req1_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req1_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req1_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req1_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req1_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req1_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req1_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req1_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req1_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req1_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req1_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req1_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req1_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req1_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req1_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req1_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req1_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req1_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req1_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req1_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req1_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req1_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req1_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req1_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req1_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req1_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req1_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req1_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[2]) begin
		gnt_pre[2] = (req2_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req2_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req2_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req2_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req2_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req2_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req2_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req2_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req2_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req2_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req2_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req2_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req2_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req2_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req2_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req2_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req2_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req2_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req2_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req2_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req2_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req2_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req2_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req2_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req2_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req2_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req2_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req2_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req2_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req2_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req2_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req2_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req2_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req2_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req2_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req2_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req2_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req2_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req2_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req2_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[3]) begin
		gnt_pre[3] = (req3_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req3_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req3_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req3_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req3_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req3_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req3_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req3_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req3_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req3_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req3_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req3_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req3_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req3_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req3_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req3_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req3_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req3_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req3_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req3_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req3_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req3_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req3_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req3_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req3_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req3_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req3_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req3_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req3_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req3_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req3_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req3_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req3_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req3_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req3_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req3_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req3_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req3_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req3_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req3_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[4]) begin
		gnt_pre[4] = (req4_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req4_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req4_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req4_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req4_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req4_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req4_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req4_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req4_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req4_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req4_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req4_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req4_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req4_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req4_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req4_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req4_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req4_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req4_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req4_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req4_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req4_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req4_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req4_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req4_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req4_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req4_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req4_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req4_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req4_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req4_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req4_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req4_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req4_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req4_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req4_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req4_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req4_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req4_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req4_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[5]) begin
		gnt_pre[5] = (req5_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req5_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req5_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req5_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req5_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req5_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req5_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req5_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req5_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req5_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req5_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req5_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req5_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req5_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req5_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req5_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req5_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req5_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req5_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req5_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req5_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req5_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req5_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req5_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req5_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req5_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req5_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req5_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req5_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req5_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req5_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req5_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req5_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req5_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req5_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req5_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req5_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req5_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req5_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req5_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[6]) begin
		gnt_pre[6] = (req6_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req6_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req6_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req6_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req6_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req6_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req6_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req6_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req6_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req6_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req6_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req6_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req6_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req6_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req6_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req6_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req6_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req6_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req6_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req6_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req6_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req6_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req6_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req6_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req6_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req6_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req6_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req6_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req6_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req6_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req6_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req6_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req6_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req6_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req6_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req6_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req6_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req6_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req6_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req6_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[7]) begin
		gnt_pre[7] = (req7_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req7_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req7_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req7_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req7_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req7_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req7_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req7_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req7_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req7_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req7_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req7_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req7_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req7_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req7_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req7_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req7_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req7_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req7_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req7_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req7_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req7_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req7_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req7_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req7_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req7_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req7_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req7_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req7_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req7_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req7_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req7_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req7_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req7_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req7_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req7_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req7_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req7_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req7_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req7_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[8]) begin
		gnt_pre[8] = (req8_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req8_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req8_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req8_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req8_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req8_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req8_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req8_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req8_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req8_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req8_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req8_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req8_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req8_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req8_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req8_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req8_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req8_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req8_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req8_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req8_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req8_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req8_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req8_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req8_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req8_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req8_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req8_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req8_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req8_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req8_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req8_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req8_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req8_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req8_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req8_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req8_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req8_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req8_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req8_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[9]) begin
		gnt_pre[9] = (req9_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req9_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req9_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req9_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req9_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req9_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req9_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req9_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req9_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req9_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req9_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req9_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req9_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req9_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req9_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req9_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req9_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req9_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req9_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req9_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req9_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req9_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req9_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req9_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req9_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req9_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req9_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req9_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req9_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req9_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req9_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req9_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req9_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req9_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req9_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req9_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req9_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req9_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req9_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req9_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[10]) begin
		gnt_pre[10] = (req10_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req10_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req10_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req10_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req10_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req10_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req10_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req10_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req10_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req10_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req10_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req10_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req10_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req10_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req10_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req10_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req10_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req10_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req10_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req10_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req10_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req10_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req10_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req10_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req10_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req10_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req10_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req10_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req10_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req10_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req10_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req10_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req10_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req10_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req10_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req10_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req10_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req10_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req10_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req10_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[11]) begin
		gnt_pre[11] = (req11_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req11_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req11_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req11_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req11_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req11_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req11_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req11_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req11_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req11_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req11_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req11_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req11_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req11_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req11_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req11_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req11_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req11_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req11_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req11_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req11_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req11_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req11_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req11_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req11_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req11_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req11_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req11_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req11_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req11_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req11_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req11_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req11_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req11_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req11_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req11_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req11_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req11_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req11_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req11_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[12]) begin
		gnt_pre[12] = (req12_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req12_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req12_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req12_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req12_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req12_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req12_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req12_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req12_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req12_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req12_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req12_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req12_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req12_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req12_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req12_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req12_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req12_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req12_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req12_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req12_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req12_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req12_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req12_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req12_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req12_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req12_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req12_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req12_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req12_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req12_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req12_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req12_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req12_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req12_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req12_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req12_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req12_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req12_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req12_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[13]) begin
		gnt_pre[13] = (req13_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req13_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req13_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req13_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req13_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req13_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req13_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req13_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req13_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req13_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req13_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req13_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req13_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req13_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req13_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req13_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req13_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req13_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req13_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req13_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req13_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req13_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req13_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req13_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req13_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req13_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req13_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req13_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req13_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req13_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req13_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req13_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req13_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req13_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req13_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req13_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req13_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req13_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req13_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req13_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[14]) begin
		gnt_pre[14] = (req14_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req14_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req14_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req14_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req14_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req14_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req14_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req14_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req14_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req14_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req14_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req14_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req14_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req14_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req14_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req14_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req14_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req14_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req14_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req14_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req14_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req14_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req14_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req14_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req14_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req14_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req14_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req14_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req14_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req14_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req14_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req14_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req14_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req14_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req14_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req14_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req14_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req14_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req14_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req14_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[15]) begin
		gnt_pre[15] = (req15_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req15_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req15_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req15_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req15_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req15_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req15_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req15_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req15_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req15_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req15_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req15_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req15_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req15_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req15_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req15_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req15_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req15_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req15_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req15_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req15_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req15_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req15_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req15_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req15_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req15_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req15_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req15_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req15_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req15_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req15_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req15_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req15_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req15_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req15_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req15_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req15_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req15_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req15_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req15_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[16]) begin
		gnt_pre[16] = (req16_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req16_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req16_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req16_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req16_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req16_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req16_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req16_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req16_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req16_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req16_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req16_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req16_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req16_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req16_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req16_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req16_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req16_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req16_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req16_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req16_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req16_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req16_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req16_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req16_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req16_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req16_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req16_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req16_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req16_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req16_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req16_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req16_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req16_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req16_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req16_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req16_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req16_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req16_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req16_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[17]) begin
		gnt_pre[17] = (req17_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req17_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req17_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req17_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req17_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req17_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req17_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req17_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req17_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req17_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req17_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req17_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req17_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req17_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req17_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req17_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req17_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req17_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req17_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req17_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req17_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req17_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req17_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req17_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req17_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req17_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req17_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req17_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req17_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req17_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req17_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req17_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req17_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req17_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req17_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req17_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req17_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req17_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req17_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req17_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[18]) begin
		gnt_pre[18] = (req18_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req18_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req18_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req18_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req18_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req18_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req18_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req18_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req18_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req18_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req18_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req18_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req18_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req18_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req18_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req18_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req18_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req18_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req18_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req18_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req18_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req18_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req18_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req18_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req18_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req18_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req18_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req18_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req18_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req18_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req18_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req18_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req18_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req18_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req18_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req18_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req18_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req18_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req18_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req18_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[19]) begin
		gnt_pre[19] = (req19_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req19_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req19_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req19_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req19_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req19_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req19_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req19_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req19_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req19_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req19_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req19_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req19_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req19_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req19_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req19_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req19_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req19_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req19_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req19_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req19_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req19_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req19_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req19_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req19_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req19_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req19_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req19_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req19_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req19_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req19_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req19_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req19_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req19_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req19_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req19_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req19_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req19_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req19_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req19_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[20]) begin
		gnt_pre[20] = (req20_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req20_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req20_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req20_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req20_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req20_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req20_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req20_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req20_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req20_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req20_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req20_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req20_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req20_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req20_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req20_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req20_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req20_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req20_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req20_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req20_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req20_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req20_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req20_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req20_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req20_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req20_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req20_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req20_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req20_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req20_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req20_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req20_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req20_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req20_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req20_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req20_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req20_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req20_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req20_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[21]) begin
		gnt_pre[21] = (req21_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req21_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req21_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req21_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req21_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req21_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req21_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req21_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req21_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req21_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req21_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req21_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req21_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req21_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req21_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req21_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req21_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req21_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req21_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req21_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req21_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req21_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req21_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req21_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req21_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req21_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req21_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req21_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req21_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req21_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req21_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req21_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req21_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req21_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req21_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req21_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req21_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req21_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req21_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req21_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[22]) begin
		gnt_pre[22] = (req22_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req22_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req22_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req22_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req22_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req22_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req22_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req22_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req22_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req22_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req22_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req22_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req22_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req22_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req22_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req22_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req22_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req22_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req22_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req22_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req22_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req22_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req22_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req22_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req22_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req22_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req22_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req22_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req22_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req22_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req22_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req22_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req22_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req22_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req22_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req22_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req22_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req22_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req22_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req22_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[23]) begin
		gnt_pre[23] = (req23_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req23_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req23_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req23_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req23_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req23_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req23_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req23_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req23_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req23_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req23_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req23_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req23_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req23_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req23_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req23_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req23_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req23_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req23_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req23_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req23_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req23_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req23_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req23_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req23_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req23_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req23_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req23_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req23_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req23_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req23_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req23_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req23_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req23_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req23_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req23_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req23_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req23_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req23_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req23_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[24]) begin
		gnt_pre[24] = (req24_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req24_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req24_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req24_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req24_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req24_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req24_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req24_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req24_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req24_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req24_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req24_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req24_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req24_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req24_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req24_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req24_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req24_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req24_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req24_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req24_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req24_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req24_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req24_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req24_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req24_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req24_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req24_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req24_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req24_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req24_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req24_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req24_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req24_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req24_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req24_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req24_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req24_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req24_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req24_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[25]) begin
		gnt_pre[25] = (req25_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req25_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req25_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req25_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req25_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req25_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req25_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req25_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req25_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req25_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req25_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req25_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req25_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req25_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req25_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req25_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req25_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req25_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req25_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req25_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req25_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req25_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req25_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req25_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req25_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req25_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req25_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req25_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req25_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req25_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req25_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req25_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req25_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req25_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req25_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req25_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req25_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req25_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req25_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req25_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[26]) begin
		gnt_pre[26] = (req26_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req26_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req26_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req26_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req26_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req26_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req26_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req26_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req26_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req26_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req26_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req26_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req26_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req26_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req26_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req26_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req26_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req26_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req26_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req26_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req26_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req26_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req26_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req26_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req26_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req26_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req26_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req26_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req26_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req26_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req26_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req26_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req26_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req26_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req26_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req26_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req26_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req26_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req26_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req26_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[27]) begin
		gnt_pre[27] = (req27_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req27_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req27_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req27_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req27_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req27_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req27_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req27_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req27_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req27_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req27_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req27_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req27_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req27_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req27_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req27_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req27_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req27_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req27_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req27_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req27_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req27_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req27_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req27_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req27_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req27_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req27_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req27_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req27_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req27_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req27_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req27_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req27_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req27_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req27_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req27_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req27_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req27_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req27_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req27_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[28]) begin
		gnt_pre[28] = (req28_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req28_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req28_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req28_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req28_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req28_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req28_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req28_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req28_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req28_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req28_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req28_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req28_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req28_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req28_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req28_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req28_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req28_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req28_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req28_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req28_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req28_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req28_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req28_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req28_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req28_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req28_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req28_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req28_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req28_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req28_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req28_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req28_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req28_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req28_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req28_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req28_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req28_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req28_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req28_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[29]) begin
		gnt_pre[29] = (req29_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req29_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req29_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req29_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req29_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req29_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req29_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req29_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req29_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req29_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req29_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req29_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req29_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req29_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req29_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req29_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req29_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req29_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req29_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req29_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req29_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req29_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req29_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req29_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req29_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req29_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req29_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req29_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req29_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req29_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req29_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req29_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req29_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req29_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req29_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req29_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req29_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req29_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req29_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req29_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[30]) begin
		gnt_pre[30] = (req30_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req30_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req30_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req30_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req30_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req30_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req30_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req30_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req30_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req30_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req30_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req30_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req30_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req30_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req30_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req30_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req30_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req30_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req30_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req30_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req30_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req30_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req30_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req30_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req30_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req30_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req30_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req30_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req30_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req30_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req30_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req30_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req30_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req30_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req30_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req30_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req30_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req30_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req30_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req30_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[31]) begin
		gnt_pre[31] = (req31_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req31_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req31_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req31_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req31_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req31_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req31_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req31_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req31_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req31_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req31_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req31_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req31_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req31_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req31_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req31_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req31_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req31_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req31_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req31_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req31_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req31_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req31_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req31_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req31_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req31_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req31_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req31_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req31_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req31_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req31_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req31_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req31_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req31_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req31_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req31_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req31_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req31_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req31_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req31_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[32]) begin
		gnt_pre[32] = (req32_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req32_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req32_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req32_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req32_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req32_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req32_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req32_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req32_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req32_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req32_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req32_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req32_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req32_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req32_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req32_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req32_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req32_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req32_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req32_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req32_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req32_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req32_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req32_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req32_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req32_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req32_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req32_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req32_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req32_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req32_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req32_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req32_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req32_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req32_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req32_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req32_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req32_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req32_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req32_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[33]) begin
		gnt_pre[33] = (req33_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req33_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req33_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req33_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req33_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req33_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req33_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req33_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req33_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req33_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req33_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req33_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req33_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req33_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req33_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req33_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req33_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req33_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req33_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req33_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req33_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req33_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req33_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req33_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req33_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req33_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req33_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req33_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req33_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req33_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req33_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req33_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req33_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req33_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req33_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req33_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req33_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req33_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req33_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req33_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[34]) begin
		gnt_pre[34] = (req34_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req34_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req34_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req34_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req34_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req34_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req34_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req34_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req34_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req34_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req34_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req34_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req34_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req34_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req34_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req34_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req34_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req34_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req34_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req34_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req34_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req34_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req34_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req34_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req34_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req34_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req34_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req34_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req34_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req34_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req34_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req34_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req34_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req34_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req34_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req34_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req34_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req34_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req34_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req34_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[35]) begin
		gnt_pre[35] = (req35_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req35_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req35_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req35_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req35_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req35_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req35_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req35_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req35_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req35_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req35_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req35_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req35_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req35_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req35_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req35_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req35_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req35_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req35_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req35_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req35_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req35_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req35_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req35_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req35_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req35_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req35_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req35_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req35_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req35_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req35_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req35_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req35_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req35_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req35_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req35_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req35_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req35_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req35_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req35_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[36]) begin
		gnt_pre[36] = (req36_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req36_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req36_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req36_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req36_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req36_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req36_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req36_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req36_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req36_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req36_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req36_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req36_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req36_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req36_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req36_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req36_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req36_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req36_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req36_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req36_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req36_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req36_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req36_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req36_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req36_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req36_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req36_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req36_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req36_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req36_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req36_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req36_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req36_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req36_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req36_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req36_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req36_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req36_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req36_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[37]) begin
		gnt_pre[37] = (req37_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req37_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req37_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req37_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req37_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req37_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req37_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req37_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req37_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req37_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req37_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req37_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req37_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req37_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req37_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req37_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req37_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req37_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req37_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req37_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req37_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req37_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req37_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req37_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req37_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req37_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req37_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req37_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req37_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req37_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req37_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req37_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req37_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req37_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req37_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req37_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req37_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req37_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req37_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req37_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[38]) begin
		gnt_pre[38] = (req38_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req38_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req38_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req38_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req38_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req38_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req38_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req38_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req38_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req38_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req38_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req38_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req38_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req38_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req38_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req38_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req38_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req38_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req38_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req38_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req38_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req38_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req38_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req38_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req38_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req38_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req38_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req38_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req38_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req38_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req38_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req38_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req38_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req38_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req38_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req38_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req38_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req38_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req38_used_status)) ?1'b0 |
	((req39 & (req39_used_status > req38_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[39]) begin
		gnt_pre[39] = (req39_used_status==40) ? 1'b1 |

	((req0 & (req0_used_status > req39_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req39_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req39_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req39_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req39_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req39_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req39_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req39_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req39_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req39_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req39_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req39_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req39_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req39_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req39_used_status)) ?1'b0 |
	((req15 & (req15_used_status > req39_used_status)) ?1'b0 |
	((req16 & (req16_used_status > req39_used_status)) ?1'b0 |
	((req17 & (req17_used_status > req39_used_status)) ?1'b0 |
	((req18 & (req18_used_status > req39_used_status)) ?1'b0 |
	((req19 & (req19_used_status > req39_used_status)) ?1'b0 |
	((req20 & (req20_used_status > req39_used_status)) ?1'b0 |
	((req21 & (req21_used_status > req39_used_status)) ?1'b0 |
	((req22 & (req22_used_status > req39_used_status)) ?1'b0 |
	((req23 & (req23_used_status > req39_used_status)) ?1'b0 |
	((req24 & (req24_used_status > req39_used_status)) ?1'b0 |
	((req25 & (req25_used_status > req39_used_status)) ?1'b0 |
	((req26 & (req26_used_status > req39_used_status)) ?1'b0 |
	((req27 & (req27_used_status > req39_used_status)) ?1'b0 |
	((req28 & (req28_used_status > req39_used_status)) ?1'b0 |
	((req29 & (req29_used_status > req39_used_status)) ?1'b0 |
	((req30 & (req30_used_status > req39_used_status)) ?1'b0 |
	((req31 & (req31_used_status > req39_used_status)) ?1'b0 |
	((req32 & (req32_used_status > req39_used_status)) ?1'b0 |
	((req33 & (req33_used_status > req39_used_status)) ?1'b0 |
	((req34 & (req34_used_status > req39_used_status)) ?1'b0 |
	((req35 & (req35_used_status > req39_used_status)) ?1'b0 |
	((req36 & (req36_used_status > req39_used_status)) ?1'b0 |
	((req37 & (req37_used_status > req39_used_status)) ?1'b0 |
	((req38 & (req38_used_status > req39_used_status)) ?1'b0 |
		1'b1;
	end

assign gnt[39:0] = gnt_pre[39:0];

endmodule
