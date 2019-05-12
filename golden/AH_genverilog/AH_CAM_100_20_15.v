
module AH_CAM_100_20_15 (wdata
,wvalid
,wcredit
,sdata
,svalid
,smatch
,sin);

input [19:0] wdata;
input wvalid;
output wcredit;
input [19:0] sdata;
input svalid;
input smatch;
input [14:0] sin;

wire [6:0] internal_wr_ptr;
req  [7:0] wr_loc_counter;
        req  [19:0] cam_loc0;
req  [19:0] cam_loc1;
req  [19:0] cam_loc2;
req  [19:0] cam_loc3;
req  [19:0] cam_loc4;
req  [19:0] cam_loc5;
req  [19:0] cam_loc6;
req  [19:0] cam_loc7;
req  [19:0] cam_loc8;
req  [19:0] cam_loc9;
req  [19:0] cam_loc10;
req  [19:0] cam_loc11;
req  [19:0] cam_loc12;
req  [19:0] cam_loc13;
req  [19:0] cam_loc14;
req  [19:0] cam_loc15;
req  [19:0] cam_loc16;
req  [19:0] cam_loc17;
req  [19:0] cam_loc18;
req  [19:0] cam_loc19;
req  [19:0] cam_loc20;
req  [19:0] cam_loc21;
req  [19:0] cam_loc22;
req  [19:0] cam_loc23;
req  [19:0] cam_loc24;
req  [19:0] cam_loc25;
req  [19:0] cam_loc26;
req  [19:0] cam_loc27;
req  [19:0] cam_loc28;
req  [19:0] cam_loc29;
req  [19:0] cam_loc30;
req  [19:0] cam_loc31;
req  [19:0] cam_loc32;
req  [19:0] cam_loc33;
req  [19:0] cam_loc34;
req  [19:0] cam_loc35;
req  [19:0] cam_loc36;
req  [19:0] cam_loc37;
req  [19:0] cam_loc38;
req  [19:0] cam_loc39;
req  [19:0] cam_loc40;
req  [19:0] cam_loc41;
req  [19:0] cam_loc42;
req  [19:0] cam_loc43;
req  [19:0] cam_loc44;
req  [19:0] cam_loc45;
req  [19:0] cam_loc46;
req  [19:0] cam_loc47;
req  [19:0] cam_loc48;
req  [19:0] cam_loc49;
req  [19:0] cam_loc50;
req  [19:0] cam_loc51;
req  [19:0] cam_loc52;
req  [19:0] cam_loc53;
req  [19:0] cam_loc54;
req  [19:0] cam_loc55;
req  [19:0] cam_loc56;
req  [19:0] cam_loc57;
req  [19:0] cam_loc58;
req  [19:0] cam_loc59;
req  [19:0] cam_loc60;
req  [19:0] cam_loc61;
req  [19:0] cam_loc62;
req  [19:0] cam_loc63;
req  [19:0] cam_loc64;
req  [19:0] cam_loc65;
req  [19:0] cam_loc66;
req  [19:0] cam_loc67;
req  [19:0] cam_loc68;
req  [19:0] cam_loc69;
req  [19:0] cam_loc70;
req  [19:0] cam_loc71;
req  [19:0] cam_loc72;
req  [19:0] cam_loc73;
req  [19:0] cam_loc74;
req  [19:0] cam_loc75;
req  [19:0] cam_loc76;
req  [19:0] cam_loc77;
req  [19:0] cam_loc78;
req  [19:0] cam_loc79;
req  [19:0] cam_loc80;
req  [19:0] cam_loc81;
req  [19:0] cam_loc82;
req  [19:0] cam_loc83;
req  [19:0] cam_loc84;
req  [19:0] cam_loc85;
req  [19:0] cam_loc86;
req  [19:0] cam_loc87;
req  [19:0] cam_loc88;
req  [19:0] cam_loc89;
req  [19:0] cam_loc90;
req  [19:0] cam_loc91;
req  [19:0] cam_loc92;
req  [19:0] cam_loc93;
req  [19:0] cam_loc94;
req  [19:0] cam_loc95;
req  [19:0] cam_loc96;
req  [19:0] cam_loc97;
req  [19:0] cam_loc98;
req  [19:0] cam_loc99;

        always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= 7+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[7] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end
AH_srvfifo_7_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);

assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[7]);
assign internal_wr_ptr = ~wr_location_counter[7 + 1] ? ~wr_location_counter[6:0] : recir_loc;

assign wr_ready	= ~wr_location_counter[7 + 1] ? 1'b1 : recir_loc_valid;

assign recir_loc_ready	= ~wr_location_counter[7 + 1] ? 1'b0 : wr_valid;

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin


	cam_loc0 <= 20'd0;
	cam_loc1 <= 20'd0;
	cam_loc2 <= 20'd0;
	cam_loc3 <= 20'd0;
	cam_loc4 <= 20'd0;
	cam_loc5 <= 20'd0;
	cam_loc6 <= 20'd0;
	cam_loc7 <= 20'd0;
	cam_loc8 <= 20'd0;
	cam_loc9 <= 20'd0;
	cam_loc10 <= 20'd0;
	cam_loc11 <= 20'd0;
	cam_loc12 <= 20'd0;
	cam_loc13 <= 20'd0;
	cam_loc14 <= 20'd0;
	cam_loc15 <= 20'd0;
	cam_loc16 <= 20'd0;
	cam_loc17 <= 20'd0;
	cam_loc18 <= 20'd0;
	cam_loc19 <= 20'd0;
	cam_loc20 <= 20'd0;
	cam_loc21 <= 20'd0;
	cam_loc22 <= 20'd0;
	cam_loc23 <= 20'd0;
	cam_loc24 <= 20'd0;
	cam_loc25 <= 20'd0;
	cam_loc26 <= 20'd0;
	cam_loc27 <= 20'd0;
	cam_loc28 <= 20'd0;
	cam_loc29 <= 20'd0;
	cam_loc30 <= 20'd0;
	cam_loc31 <= 20'd0;
	cam_loc32 <= 20'd0;
	cam_loc33 <= 20'd0;
	cam_loc34 <= 20'd0;
	cam_loc35 <= 20'd0;
	cam_loc36 <= 20'd0;
	cam_loc37 <= 20'd0;
	cam_loc38 <= 20'd0;
	cam_loc39 <= 20'd0;
	cam_loc40 <= 20'd0;
	cam_loc41 <= 20'd0;
	cam_loc42 <= 20'd0;
	cam_loc43 <= 20'd0;
	cam_loc44 <= 20'd0;
	cam_loc45 <= 20'd0;
	cam_loc46 <= 20'd0;
	cam_loc47 <= 20'd0;
	cam_loc48 <= 20'd0;
	cam_loc49 <= 20'd0;
	cam_loc50 <= 20'd0;
	cam_loc51 <= 20'd0;
	cam_loc52 <= 20'd0;
	cam_loc53 <= 20'd0;
	cam_loc54 <= 20'd0;
	cam_loc55 <= 20'd0;
	cam_loc56 <= 20'd0;
	cam_loc57 <= 20'd0;
	cam_loc58 <= 20'd0;
	cam_loc59 <= 20'd0;
	cam_loc60 <= 20'd0;
	cam_loc61 <= 20'd0;
	cam_loc62 <= 20'd0;
	cam_loc63 <= 20'd0;
	cam_loc64 <= 20'd0;
	cam_loc65 <= 20'd0;
	cam_loc66 <= 20'd0;
	cam_loc67 <= 20'd0;
	cam_loc68 <= 20'd0;
	cam_loc69 <= 20'd0;
	cam_loc70 <= 20'd0;
	cam_loc71 <= 20'd0;
	cam_loc72 <= 20'd0;
	cam_loc73 <= 20'd0;
	cam_loc74 <= 20'd0;
	cam_loc75 <= 20'd0;
	cam_loc76 <= 20'd0;
	cam_loc77 <= 20'd0;
	cam_loc78 <= 20'd0;
	cam_loc79 <= 20'd0;
	cam_loc80 <= 20'd0;
	cam_loc81 <= 20'd0;
	cam_loc82 <= 20'd0;
	cam_loc83 <= 20'd0;
	cam_loc84 <= 20'd0;
	cam_loc85 <= 20'd0;
	cam_loc86 <= 20'd0;
	cam_loc87 <= 20'd0;
	cam_loc88 <= 20'd0;
	cam_loc89 <= 20'd0;
	cam_loc90 <= 20'd0;
	cam_loc91 <= 20'd0;
	cam_loc92 <= 20'd0;
	cam_loc93 <= 20'd0;
	cam_loc94 <= 20'd0;
	cam_loc95 <= 20'd0;
	cam_loc96 <= 20'd0;
	cam_loc97 <= 20'd0;
	cam_loc98 <= 20'd0;
	cam_loc99 <= 20'd0;


end else begin

	cam_loc0 <= (internal_wr_en & (internal_wr_ptr == 7'd0) ) ? wr_data : cam_loc0;
	cam_loc1 <= (internal_wr_en & (internal_wr_ptr == 7'd1) ) ? wr_data : cam_loc1;
	cam_loc2 <= (internal_wr_en & (internal_wr_ptr == 7'd2) ) ? wr_data : cam_loc2;
	cam_loc3 <= (internal_wr_en & (internal_wr_ptr == 7'd3) ) ? wr_data : cam_loc3;
	cam_loc4 <= (internal_wr_en & (internal_wr_ptr == 7'd4) ) ? wr_data : cam_loc4;
	cam_loc5 <= (internal_wr_en & (internal_wr_ptr == 7'd5) ) ? wr_data : cam_loc5;
	cam_loc6 <= (internal_wr_en & (internal_wr_ptr == 7'd6) ) ? wr_data : cam_loc6;
	cam_loc7 <= (internal_wr_en & (internal_wr_ptr == 7'd7) ) ? wr_data : cam_loc7;
	cam_loc8 <= (internal_wr_en & (internal_wr_ptr == 7'd8) ) ? wr_data : cam_loc8;
	cam_loc9 <= (internal_wr_en & (internal_wr_ptr == 7'd9) ) ? wr_data : cam_loc9;
	cam_loc10 <= (internal_wr_en & (internal_wr_ptr == 7'd10) ) ? wr_data : cam_loc10;
	cam_loc11 <= (internal_wr_en & (internal_wr_ptr == 7'd11) ) ? wr_data : cam_loc11;
	cam_loc12 <= (internal_wr_en & (internal_wr_ptr == 7'd12) ) ? wr_data : cam_loc12;
	cam_loc13 <= (internal_wr_en & (internal_wr_ptr == 7'd13) ) ? wr_data : cam_loc13;
	cam_loc14 <= (internal_wr_en & (internal_wr_ptr == 7'd14) ) ? wr_data : cam_loc14;
	cam_loc15 <= (internal_wr_en & (internal_wr_ptr == 7'd15) ) ? wr_data : cam_loc15;
	cam_loc16 <= (internal_wr_en & (internal_wr_ptr == 7'd16) ) ? wr_data : cam_loc16;
	cam_loc17 <= (internal_wr_en & (internal_wr_ptr == 7'd17) ) ? wr_data : cam_loc17;
	cam_loc18 <= (internal_wr_en & (internal_wr_ptr == 7'd18) ) ? wr_data : cam_loc18;
	cam_loc19 <= (internal_wr_en & (internal_wr_ptr == 7'd19) ) ? wr_data : cam_loc19;
	cam_loc20 <= (internal_wr_en & (internal_wr_ptr == 7'd20) ) ? wr_data : cam_loc20;
	cam_loc21 <= (internal_wr_en & (internal_wr_ptr == 7'd21) ) ? wr_data : cam_loc21;
	cam_loc22 <= (internal_wr_en & (internal_wr_ptr == 7'd22) ) ? wr_data : cam_loc22;
	cam_loc23 <= (internal_wr_en & (internal_wr_ptr == 7'd23) ) ? wr_data : cam_loc23;
	cam_loc24 <= (internal_wr_en & (internal_wr_ptr == 7'd24) ) ? wr_data : cam_loc24;
	cam_loc25 <= (internal_wr_en & (internal_wr_ptr == 7'd25) ) ? wr_data : cam_loc25;
	cam_loc26 <= (internal_wr_en & (internal_wr_ptr == 7'd26) ) ? wr_data : cam_loc26;
	cam_loc27 <= (internal_wr_en & (internal_wr_ptr == 7'd27) ) ? wr_data : cam_loc27;
	cam_loc28 <= (internal_wr_en & (internal_wr_ptr == 7'd28) ) ? wr_data : cam_loc28;
	cam_loc29 <= (internal_wr_en & (internal_wr_ptr == 7'd29) ) ? wr_data : cam_loc29;
	cam_loc30 <= (internal_wr_en & (internal_wr_ptr == 7'd30) ) ? wr_data : cam_loc30;
	cam_loc31 <= (internal_wr_en & (internal_wr_ptr == 7'd31) ) ? wr_data : cam_loc31;
	cam_loc32 <= (internal_wr_en & (internal_wr_ptr == 7'd32) ) ? wr_data : cam_loc32;
	cam_loc33 <= (internal_wr_en & (internal_wr_ptr == 7'd33) ) ? wr_data : cam_loc33;
	cam_loc34 <= (internal_wr_en & (internal_wr_ptr == 7'd34) ) ? wr_data : cam_loc34;
	cam_loc35 <= (internal_wr_en & (internal_wr_ptr == 7'd35) ) ? wr_data : cam_loc35;
	cam_loc36 <= (internal_wr_en & (internal_wr_ptr == 7'd36) ) ? wr_data : cam_loc36;
	cam_loc37 <= (internal_wr_en & (internal_wr_ptr == 7'd37) ) ? wr_data : cam_loc37;
	cam_loc38 <= (internal_wr_en & (internal_wr_ptr == 7'd38) ) ? wr_data : cam_loc38;
	cam_loc39 <= (internal_wr_en & (internal_wr_ptr == 7'd39) ) ? wr_data : cam_loc39;
	cam_loc40 <= (internal_wr_en & (internal_wr_ptr == 7'd40) ) ? wr_data : cam_loc40;
	cam_loc41 <= (internal_wr_en & (internal_wr_ptr == 7'd41) ) ? wr_data : cam_loc41;
	cam_loc42 <= (internal_wr_en & (internal_wr_ptr == 7'd42) ) ? wr_data : cam_loc42;
	cam_loc43 <= (internal_wr_en & (internal_wr_ptr == 7'd43) ) ? wr_data : cam_loc43;
	cam_loc44 <= (internal_wr_en & (internal_wr_ptr == 7'd44) ) ? wr_data : cam_loc44;
	cam_loc45 <= (internal_wr_en & (internal_wr_ptr == 7'd45) ) ? wr_data : cam_loc45;
	cam_loc46 <= (internal_wr_en & (internal_wr_ptr == 7'd46) ) ? wr_data : cam_loc46;
	cam_loc47 <= (internal_wr_en & (internal_wr_ptr == 7'd47) ) ? wr_data : cam_loc47;
	cam_loc48 <= (internal_wr_en & (internal_wr_ptr == 7'd48) ) ? wr_data : cam_loc48;
	cam_loc49 <= (internal_wr_en & (internal_wr_ptr == 7'd49) ) ? wr_data : cam_loc49;
	cam_loc50 <= (internal_wr_en & (internal_wr_ptr == 7'd50) ) ? wr_data : cam_loc50;
	cam_loc51 <= (internal_wr_en & (internal_wr_ptr == 7'd51) ) ? wr_data : cam_loc51;
	cam_loc52 <= (internal_wr_en & (internal_wr_ptr == 7'd52) ) ? wr_data : cam_loc52;
	cam_loc53 <= (internal_wr_en & (internal_wr_ptr == 7'd53) ) ? wr_data : cam_loc53;
	cam_loc54 <= (internal_wr_en & (internal_wr_ptr == 7'd54) ) ? wr_data : cam_loc54;
	cam_loc55 <= (internal_wr_en & (internal_wr_ptr == 7'd55) ) ? wr_data : cam_loc55;
	cam_loc56 <= (internal_wr_en & (internal_wr_ptr == 7'd56) ) ? wr_data : cam_loc56;
	cam_loc57 <= (internal_wr_en & (internal_wr_ptr == 7'd57) ) ? wr_data : cam_loc57;
	cam_loc58 <= (internal_wr_en & (internal_wr_ptr == 7'd58) ) ? wr_data : cam_loc58;
	cam_loc59 <= (internal_wr_en & (internal_wr_ptr == 7'd59) ) ? wr_data : cam_loc59;
	cam_loc60 <= (internal_wr_en & (internal_wr_ptr == 7'd60) ) ? wr_data : cam_loc60;
	cam_loc61 <= (internal_wr_en & (internal_wr_ptr == 7'd61) ) ? wr_data : cam_loc61;
	cam_loc62 <= (internal_wr_en & (internal_wr_ptr == 7'd62) ) ? wr_data : cam_loc62;
	cam_loc63 <= (internal_wr_en & (internal_wr_ptr == 7'd63) ) ? wr_data : cam_loc63;
	cam_loc64 <= (internal_wr_en & (internal_wr_ptr == 7'd64) ) ? wr_data : cam_loc64;
	cam_loc65 <= (internal_wr_en & (internal_wr_ptr == 7'd65) ) ? wr_data : cam_loc65;
	cam_loc66 <= (internal_wr_en & (internal_wr_ptr == 7'd66) ) ? wr_data : cam_loc66;
	cam_loc67 <= (internal_wr_en & (internal_wr_ptr == 7'd67) ) ? wr_data : cam_loc67;
	cam_loc68 <= (internal_wr_en & (internal_wr_ptr == 7'd68) ) ? wr_data : cam_loc68;
	cam_loc69 <= (internal_wr_en & (internal_wr_ptr == 7'd69) ) ? wr_data : cam_loc69;
	cam_loc70 <= (internal_wr_en & (internal_wr_ptr == 7'd70) ) ? wr_data : cam_loc70;
	cam_loc71 <= (internal_wr_en & (internal_wr_ptr == 7'd71) ) ? wr_data : cam_loc71;
	cam_loc72 <= (internal_wr_en & (internal_wr_ptr == 7'd72) ) ? wr_data : cam_loc72;
	cam_loc73 <= (internal_wr_en & (internal_wr_ptr == 7'd73) ) ? wr_data : cam_loc73;
	cam_loc74 <= (internal_wr_en & (internal_wr_ptr == 7'd74) ) ? wr_data : cam_loc74;
	cam_loc75 <= (internal_wr_en & (internal_wr_ptr == 7'd75) ) ? wr_data : cam_loc75;
	cam_loc76 <= (internal_wr_en & (internal_wr_ptr == 7'd76) ) ? wr_data : cam_loc76;
	cam_loc77 <= (internal_wr_en & (internal_wr_ptr == 7'd77) ) ? wr_data : cam_loc77;
	cam_loc78 <= (internal_wr_en & (internal_wr_ptr == 7'd78) ) ? wr_data : cam_loc78;
	cam_loc79 <= (internal_wr_en & (internal_wr_ptr == 7'd79) ) ? wr_data : cam_loc79;
	cam_loc80 <= (internal_wr_en & (internal_wr_ptr == 7'd80) ) ? wr_data : cam_loc80;
	cam_loc81 <= (internal_wr_en & (internal_wr_ptr == 7'd81) ) ? wr_data : cam_loc81;
	cam_loc82 <= (internal_wr_en & (internal_wr_ptr == 7'd82) ) ? wr_data : cam_loc82;
	cam_loc83 <= (internal_wr_en & (internal_wr_ptr == 7'd83) ) ? wr_data : cam_loc83;
	cam_loc84 <= (internal_wr_en & (internal_wr_ptr == 7'd84) ) ? wr_data : cam_loc84;
	cam_loc85 <= (internal_wr_en & (internal_wr_ptr == 7'd85) ) ? wr_data : cam_loc85;
	cam_loc86 <= (internal_wr_en & (internal_wr_ptr == 7'd86) ) ? wr_data : cam_loc86;
	cam_loc87 <= (internal_wr_en & (internal_wr_ptr == 7'd87) ) ? wr_data : cam_loc87;
	cam_loc88 <= (internal_wr_en & (internal_wr_ptr == 7'd88) ) ? wr_data : cam_loc88;
	cam_loc89 <= (internal_wr_en & (internal_wr_ptr == 7'd89) ) ? wr_data : cam_loc89;
	cam_loc90 <= (internal_wr_en & (internal_wr_ptr == 7'd90) ) ? wr_data : cam_loc90;
	cam_loc91 <= (internal_wr_en & (internal_wr_ptr == 7'd91) ) ? wr_data : cam_loc91;
	cam_loc92 <= (internal_wr_en & (internal_wr_ptr == 7'd92) ) ? wr_data : cam_loc92;
	cam_loc93 <= (internal_wr_en & (internal_wr_ptr == 7'd93) ) ? wr_data : cam_loc93;
	cam_loc94 <= (internal_wr_en & (internal_wr_ptr == 7'd94) ) ? wr_data : cam_loc94;
	cam_loc95 <= (internal_wr_en & (internal_wr_ptr == 7'd95) ) ? wr_data : cam_loc95;
	cam_loc96 <= (internal_wr_en & (internal_wr_ptr == 7'd96) ) ? wr_data : cam_loc96;
	cam_loc97 <= (internal_wr_en & (internal_wr_ptr == 7'd97) ) ? wr_data : cam_loc97;
	cam_loc98 <= (internal_wr_en & (internal_wr_ptr == 7'd98) ) ? wr_data : cam_loc98;
	cam_loc99 <= (internal_wr_en & (internal_wr_ptr == 7'd99) ) ? wr_data : cam_loc99;


end

wire assign snoop_match = freedup_loc_ready) & (

(snoop_in == cam_loc0[14:0]) |
 (snoop_in == cam_loc1[14:0]) |
 (snoop_in == cam_loc2[14:0]) |
 (snoop_in == cam_loc3[14:0]) |
 (snoop_in == cam_loc4[14:0]) |
 (snoop_in == cam_loc5[14:0]) |
 (snoop_in == cam_loc6[14:0]) |
 (snoop_in == cam_loc7[14:0]) |
 (snoop_in == cam_loc8[14:0]) |
 (snoop_in == cam_loc9[14:0]) |
 (snoop_in == cam_loc10[14:0]) |
 (snoop_in == cam_loc11[14:0]) |
 (snoop_in == cam_loc12[14:0]) |
 (snoop_in == cam_loc13[14:0]) |
 (snoop_in == cam_loc14[14:0]) |
 (snoop_in == cam_loc15[14:0]) |
 (snoop_in == cam_loc16[14:0]) |
 (snoop_in == cam_loc17[14:0]) |
 (snoop_in == cam_loc18[14:0]) |
 (snoop_in == cam_loc19[14:0]) |
 (snoop_in == cam_loc20[14:0]) |
 (snoop_in == cam_loc21[14:0]) |
 (snoop_in == cam_loc22[14:0]) |
 (snoop_in == cam_loc23[14:0]) |
 (snoop_in == cam_loc24[14:0]) |
 (snoop_in == cam_loc25[14:0]) |
 (snoop_in == cam_loc26[14:0]) |
 (snoop_in == cam_loc27[14:0]) |
 (snoop_in == cam_loc28[14:0]) |
 (snoop_in == cam_loc29[14:0]) |
 (snoop_in == cam_loc30[14:0]) |
 (snoop_in == cam_loc31[14:0]) |
 (snoop_in == cam_loc32[14:0]) |
 (snoop_in == cam_loc33[14:0]) |
 (snoop_in == cam_loc34[14:0]) |
 (snoop_in == cam_loc35[14:0]) |
 (snoop_in == cam_loc36[14:0]) |
 (snoop_in == cam_loc37[14:0]) |
 (snoop_in == cam_loc38[14:0]) |
 (snoop_in == cam_loc39[14:0]) |
 (snoop_in == cam_loc40[14:0]) |
 (snoop_in == cam_loc41[14:0]) |
 (snoop_in == cam_loc42[14:0]) |
 (snoop_in == cam_loc43[14:0]) |
 (snoop_in == cam_loc44[14:0]) |
 (snoop_in == cam_loc45[14:0]) |
 (snoop_in == cam_loc46[14:0]) |
 (snoop_in == cam_loc47[14:0]) |
 (snoop_in == cam_loc48[14:0]) |
 (snoop_in == cam_loc49[14:0]) |
 (snoop_in == cam_loc50[14:0]) |
 (snoop_in == cam_loc51[14:0]) |
 (snoop_in == cam_loc52[14:0]) |
 (snoop_in == cam_loc53[14:0]) |
 (snoop_in == cam_loc54[14:0]) |
 (snoop_in == cam_loc55[14:0]) |
 (snoop_in == cam_loc56[14:0]) |
 (snoop_in == cam_loc57[14:0]) |
 (snoop_in == cam_loc58[14:0]) |
 (snoop_in == cam_loc59[14:0]) |
 (snoop_in == cam_loc60[14:0]) |
 (snoop_in == cam_loc61[14:0]) |
 (snoop_in == cam_loc62[14:0]) |
 (snoop_in == cam_loc63[14:0]) |
 (snoop_in == cam_loc64[14:0]) |
 (snoop_in == cam_loc65[14:0]) |
 (snoop_in == cam_loc66[14:0]) |
 (snoop_in == cam_loc67[14:0]) |
 (snoop_in == cam_loc68[14:0]) |
 (snoop_in == cam_loc69[14:0]) |
 (snoop_in == cam_loc70[14:0]) |
 (snoop_in == cam_loc71[14:0]) |
 (snoop_in == cam_loc72[14:0]) |
 (snoop_in == cam_loc73[14:0]) |
 (snoop_in == cam_loc74[14:0]) |
 (snoop_in == cam_loc75[14:0]) |
 (snoop_in == cam_loc76[14:0]) |
 (snoop_in == cam_loc77[14:0]) |
 (snoop_in == cam_loc78[14:0]) |
 (snoop_in == cam_loc79[14:0]) |
 (snoop_in == cam_loc80[14:0]) |
 (snoop_in == cam_loc81[14:0]) |
 (snoop_in == cam_loc82[14:0]) |
 (snoop_in == cam_loc83[14:0]) |
 (snoop_in == cam_loc84[14:0]) |
 (snoop_in == cam_loc85[14:0]) |
 (snoop_in == cam_loc86[14:0]) |
 (snoop_in == cam_loc87[14:0]) |
 (snoop_in == cam_loc88[14:0]) |
 (snoop_in == cam_loc89[14:0]) |
 (snoop_in == cam_loc90[14:0]) |
 (snoop_in == cam_loc91[14:0]) |
 (snoop_in == cam_loc92[14:0]) |
 (snoop_in == cam_loc93[14:0]) |
 (snoop_in == cam_loc94[14:0]) |
 (snoop_in == cam_loc95[14:0]) |
 (snoop_in == cam_loc96[14:0]) |
 (snoop_in == cam_loc97[14:0]) |
 (snoop_in == cam_loc98[14:0]) |
 (snoop_in == cam_loc99[14:0])

);

wire assign snoop_data = 20'd0 |
( (snoop_in == cam_loc0[14:0]) ? cam_loc0 : 20'd0 ) |
 ( (snoop_in == cam_loc1[14:0]) ? cam_loc1 : 20'd0 ) |
 ( (snoop_in == cam_loc2[14:0]) ? cam_loc2 : 20'd0 ) |
 ( (snoop_in == cam_loc3[14:0]) ? cam_loc3 : 20'd0 ) |
 ( (snoop_in == cam_loc4[14:0]) ? cam_loc4 : 20'd0 ) |
 ( (snoop_in == cam_loc5[14:0]) ? cam_loc5 : 20'd0 ) |
 ( (snoop_in == cam_loc6[14:0]) ? cam_loc6 : 20'd0 ) |
 ( (snoop_in == cam_loc7[14:0]) ? cam_loc7 : 20'd0 ) |
 ( (snoop_in == cam_loc8[14:0]) ? cam_loc8 : 20'd0 ) |
 ( (snoop_in == cam_loc9[14:0]) ? cam_loc9 : 20'd0 ) |
 ( (snoop_in == cam_loc10[14:0]) ? cam_loc10 : 20'd0 ) |
 ( (snoop_in == cam_loc11[14:0]) ? cam_loc11 : 20'd0 ) |
 ( (snoop_in == cam_loc12[14:0]) ? cam_loc12 : 20'd0 ) |
 ( (snoop_in == cam_loc13[14:0]) ? cam_loc13 : 20'd0 ) |
 ( (snoop_in == cam_loc14[14:0]) ? cam_loc14 : 20'd0 ) |
 ( (snoop_in == cam_loc15[14:0]) ? cam_loc15 : 20'd0 ) |
 ( (snoop_in == cam_loc16[14:0]) ? cam_loc16 : 20'd0 ) |
 ( (snoop_in == cam_loc17[14:0]) ? cam_loc17 : 20'd0 ) |
 ( (snoop_in == cam_loc18[14:0]) ? cam_loc18 : 20'd0 ) |
 ( (snoop_in == cam_loc19[14:0]) ? cam_loc19 : 20'd0 ) |
 ( (snoop_in == cam_loc20[14:0]) ? cam_loc20 : 20'd0 ) |
 ( (snoop_in == cam_loc21[14:0]) ? cam_loc21 : 20'd0 ) |
 ( (snoop_in == cam_loc22[14:0]) ? cam_loc22 : 20'd0 ) |
 ( (snoop_in == cam_loc23[14:0]) ? cam_loc23 : 20'd0 ) |
 ( (snoop_in == cam_loc24[14:0]) ? cam_loc24 : 20'd0 ) |
 ( (snoop_in == cam_loc25[14:0]) ? cam_loc25 : 20'd0 ) |
 ( (snoop_in == cam_loc26[14:0]) ? cam_loc26 : 20'd0 ) |
 ( (snoop_in == cam_loc27[14:0]) ? cam_loc27 : 20'd0 ) |
 ( (snoop_in == cam_loc28[14:0]) ? cam_loc28 : 20'd0 ) |
 ( (snoop_in == cam_loc29[14:0]) ? cam_loc29 : 20'd0 ) |
 ( (snoop_in == cam_loc30[14:0]) ? cam_loc30 : 20'd0 ) |
 ( (snoop_in == cam_loc31[14:0]) ? cam_loc31 : 20'd0 ) |
 ( (snoop_in == cam_loc32[14:0]) ? cam_loc32 : 20'd0 ) |
 ( (snoop_in == cam_loc33[14:0]) ? cam_loc33 : 20'd0 ) |
 ( (snoop_in == cam_loc34[14:0]) ? cam_loc34 : 20'd0 ) |
 ( (snoop_in == cam_loc35[14:0]) ? cam_loc35 : 20'd0 ) |
 ( (snoop_in == cam_loc36[14:0]) ? cam_loc36 : 20'd0 ) |
 ( (snoop_in == cam_loc37[14:0]) ? cam_loc37 : 20'd0 ) |
 ( (snoop_in == cam_loc38[14:0]) ? cam_loc38 : 20'd0 ) |
 ( (snoop_in == cam_loc39[14:0]) ? cam_loc39 : 20'd0 ) |
 ( (snoop_in == cam_loc40[14:0]) ? cam_loc40 : 20'd0 ) |
 ( (snoop_in == cam_loc41[14:0]) ? cam_loc41 : 20'd0 ) |
 ( (snoop_in == cam_loc42[14:0]) ? cam_loc42 : 20'd0 ) |
 ( (snoop_in == cam_loc43[14:0]) ? cam_loc43 : 20'd0 ) |
 ( (snoop_in == cam_loc44[14:0]) ? cam_loc44 : 20'd0 ) |
 ( (snoop_in == cam_loc45[14:0]) ? cam_loc45 : 20'd0 ) |
 ( (snoop_in == cam_loc46[14:0]) ? cam_loc46 : 20'd0 ) |
 ( (snoop_in == cam_loc47[14:0]) ? cam_loc47 : 20'd0 ) |
 ( (snoop_in == cam_loc48[14:0]) ? cam_loc48 : 20'd0 ) |
 ( (snoop_in == cam_loc49[14:0]) ? cam_loc49 : 20'd0 ) |
 ( (snoop_in == cam_loc50[14:0]) ? cam_loc50 : 20'd0 ) |
 ( (snoop_in == cam_loc51[14:0]) ? cam_loc51 : 20'd0 ) |
 ( (snoop_in == cam_loc52[14:0]) ? cam_loc52 : 20'd0 ) |
 ( (snoop_in == cam_loc53[14:0]) ? cam_loc53 : 20'd0 ) |
 ( (snoop_in == cam_loc54[14:0]) ? cam_loc54 : 20'd0 ) |
 ( (snoop_in == cam_loc55[14:0]) ? cam_loc55 : 20'd0 ) |
 ( (snoop_in == cam_loc56[14:0]) ? cam_loc56 : 20'd0 ) |
 ( (snoop_in == cam_loc57[14:0]) ? cam_loc57 : 20'd0 ) |
 ( (snoop_in == cam_loc58[14:0]) ? cam_loc58 : 20'd0 ) |
 ( (snoop_in == cam_loc59[14:0]) ? cam_loc59 : 20'd0 ) |
 ( (snoop_in == cam_loc60[14:0]) ? cam_loc60 : 20'd0 ) |
 ( (snoop_in == cam_loc61[14:0]) ? cam_loc61 : 20'd0 ) |
 ( (snoop_in == cam_loc62[14:0]) ? cam_loc62 : 20'd0 ) |
 ( (snoop_in == cam_loc63[14:0]) ? cam_loc63 : 20'd0 ) |
 ( (snoop_in == cam_loc64[14:0]) ? cam_loc64 : 20'd0 ) |
 ( (snoop_in == cam_loc65[14:0]) ? cam_loc65 : 20'd0 ) |
 ( (snoop_in == cam_loc66[14:0]) ? cam_loc66 : 20'd0 ) |
 ( (snoop_in == cam_loc67[14:0]) ? cam_loc67 : 20'd0 ) |
 ( (snoop_in == cam_loc68[14:0]) ? cam_loc68 : 20'd0 ) |
 ( (snoop_in == cam_loc69[14:0]) ? cam_loc69 : 20'd0 ) |
 ( (snoop_in == cam_loc70[14:0]) ? cam_loc70 : 20'd0 ) |
 ( (snoop_in == cam_loc71[14:0]) ? cam_loc71 : 20'd0 ) |
 ( (snoop_in == cam_loc72[14:0]) ? cam_loc72 : 20'd0 ) |
 ( (snoop_in == cam_loc73[14:0]) ? cam_loc73 : 20'd0 ) |
 ( (snoop_in == cam_loc74[14:0]) ? cam_loc74 : 20'd0 ) |
 ( (snoop_in == cam_loc75[14:0]) ? cam_loc75 : 20'd0 ) |
 ( (snoop_in == cam_loc76[14:0]) ? cam_loc76 : 20'd0 ) |
 ( (snoop_in == cam_loc77[14:0]) ? cam_loc77 : 20'd0 ) |
 ( (snoop_in == cam_loc78[14:0]) ? cam_loc78 : 20'd0 ) |
 ( (snoop_in == cam_loc79[14:0]) ? cam_loc79 : 20'd0 ) |
 ( (snoop_in == cam_loc80[14:0]) ? cam_loc80 : 20'd0 ) |
 ( (snoop_in == cam_loc81[14:0]) ? cam_loc81 : 20'd0 ) |
 ( (snoop_in == cam_loc82[14:0]) ? cam_loc82 : 20'd0 ) |
 ( (snoop_in == cam_loc83[14:0]) ? cam_loc83 : 20'd0 ) |
 ( (snoop_in == cam_loc84[14:0]) ? cam_loc84 : 20'd0 ) |
 ( (snoop_in == cam_loc85[14:0]) ? cam_loc85 : 20'd0 ) |
 ( (snoop_in == cam_loc86[14:0]) ? cam_loc86 : 20'd0 ) |
 ( (snoop_in == cam_loc87[14:0]) ? cam_loc87 : 20'd0 ) |
 ( (snoop_in == cam_loc88[14:0]) ? cam_loc88 : 20'd0 ) |
 ( (snoop_in == cam_loc89[14:0]) ? cam_loc89 : 20'd0 ) |
 ( (snoop_in == cam_loc90[14:0]) ? cam_loc90 : 20'd0 ) |
 ( (snoop_in == cam_loc91[14:0]) ? cam_loc91 : 20'd0 ) |
 ( (snoop_in == cam_loc92[14:0]) ? cam_loc92 : 20'd0 ) |
 ( (snoop_in == cam_loc93[14:0]) ? cam_loc93 : 20'd0 ) |
 ( (snoop_in == cam_loc94[14:0]) ? cam_loc94 : 20'd0 ) |
 ( (snoop_in == cam_loc95[14:0]) ? cam_loc95 : 20'd0 ) |
 ( (snoop_in == cam_loc96[14:0]) ? cam_loc96 : 20'd0 ) |
 ( (snoop_in == cam_loc97[14:0]) ? cam_loc97 : 20'd0 ) |
 ( (snoop_in == cam_loc98[14:0]) ? cam_loc98 : 20'd0 ) |
 ( (snoop_in == cam_loc99[14:0]) ? cam_loc99 : 20'd0 )

;

wire assign freeup_loc = 7'd0 |
( (snoop_in == cam_loc0[14:0]) ? cam_loc0 : 7'd0 ) |
 ( (snoop_in == cam_loc1[14:0]) ? cam_loc1 : 7'd1 ) |
 ( (snoop_in == cam_loc2[14:0]) ? cam_loc2 : 7'd2 ) |
 ( (snoop_in == cam_loc3[14:0]) ? cam_loc3 : 7'd3 ) |
 ( (snoop_in == cam_loc4[14:0]) ? cam_loc4 : 7'd4 ) |
 ( (snoop_in == cam_loc5[14:0]) ? cam_loc5 : 7'd5 ) |
 ( (snoop_in == cam_loc6[14:0]) ? cam_loc6 : 7'd6 ) |
 ( (snoop_in == cam_loc7[14:0]) ? cam_loc7 : 7'd7 ) |
 ( (snoop_in == cam_loc8[14:0]) ? cam_loc8 : 7'd8 ) |
 ( (snoop_in == cam_loc9[14:0]) ? cam_loc9 : 7'd9 ) |
 ( (snoop_in == cam_loc10[14:0]) ? cam_loc10 : 7'd10 ) |
 ( (snoop_in == cam_loc11[14:0]) ? cam_loc11 : 7'd11 ) |
 ( (snoop_in == cam_loc12[14:0]) ? cam_loc12 : 7'd12 ) |
 ( (snoop_in == cam_loc13[14:0]) ? cam_loc13 : 7'd13 ) |
 ( (snoop_in == cam_loc14[14:0]) ? cam_loc14 : 7'd14 ) |
 ( (snoop_in == cam_loc15[14:0]) ? cam_loc15 : 7'd15 ) |
 ( (snoop_in == cam_loc16[14:0]) ? cam_loc16 : 7'd16 ) |
 ( (snoop_in == cam_loc17[14:0]) ? cam_loc17 : 7'd17 ) |
 ( (snoop_in == cam_loc18[14:0]) ? cam_loc18 : 7'd18 ) |
 ( (snoop_in == cam_loc19[14:0]) ? cam_loc19 : 7'd19 ) |
 ( (snoop_in == cam_loc20[14:0]) ? cam_loc20 : 7'd20 ) |
 ( (snoop_in == cam_loc21[14:0]) ? cam_loc21 : 7'd21 ) |
 ( (snoop_in == cam_loc22[14:0]) ? cam_loc22 : 7'd22 ) |
 ( (snoop_in == cam_loc23[14:0]) ? cam_loc23 : 7'd23 ) |
 ( (snoop_in == cam_loc24[14:0]) ? cam_loc24 : 7'd24 ) |
 ( (snoop_in == cam_loc25[14:0]) ? cam_loc25 : 7'd25 ) |
 ( (snoop_in == cam_loc26[14:0]) ? cam_loc26 : 7'd26 ) |
 ( (snoop_in == cam_loc27[14:0]) ? cam_loc27 : 7'd27 ) |
 ( (snoop_in == cam_loc28[14:0]) ? cam_loc28 : 7'd28 ) |
 ( (snoop_in == cam_loc29[14:0]) ? cam_loc29 : 7'd29 ) |
 ( (snoop_in == cam_loc30[14:0]) ? cam_loc30 : 7'd30 ) |
 ( (snoop_in == cam_loc31[14:0]) ? cam_loc31 : 7'd31 ) |
 ( (snoop_in == cam_loc32[14:0]) ? cam_loc32 : 7'd32 ) |
 ( (snoop_in == cam_loc33[14:0]) ? cam_loc33 : 7'd33 ) |
 ( (snoop_in == cam_loc34[14:0]) ? cam_loc34 : 7'd34 ) |
 ( (snoop_in == cam_loc35[14:0]) ? cam_loc35 : 7'd35 ) |
 ( (snoop_in == cam_loc36[14:0]) ? cam_loc36 : 7'd36 ) |
 ( (snoop_in == cam_loc37[14:0]) ? cam_loc37 : 7'd37 ) |
 ( (snoop_in == cam_loc38[14:0]) ? cam_loc38 : 7'd38 ) |
 ( (snoop_in == cam_loc39[14:0]) ? cam_loc39 : 7'd39 ) |
 ( (snoop_in == cam_loc40[14:0]) ? cam_loc40 : 7'd40 ) |
 ( (snoop_in == cam_loc41[14:0]) ? cam_loc41 : 7'd41 ) |
 ( (snoop_in == cam_loc42[14:0]) ? cam_loc42 : 7'd42 ) |
 ( (snoop_in == cam_loc43[14:0]) ? cam_loc43 : 7'd43 ) |
 ( (snoop_in == cam_loc44[14:0]) ? cam_loc44 : 7'd44 ) |
 ( (snoop_in == cam_loc45[14:0]) ? cam_loc45 : 7'd45 ) |
 ( (snoop_in == cam_loc46[14:0]) ? cam_loc46 : 7'd46 ) |
 ( (snoop_in == cam_loc47[14:0]) ? cam_loc47 : 7'd47 ) |
 ( (snoop_in == cam_loc48[14:0]) ? cam_loc48 : 7'd48 ) |
 ( (snoop_in == cam_loc49[14:0]) ? cam_loc49 : 7'd49 ) |
 ( (snoop_in == cam_loc50[14:0]) ? cam_loc50 : 7'd50 ) |
 ( (snoop_in == cam_loc51[14:0]) ? cam_loc51 : 7'd51 ) |
 ( (snoop_in == cam_loc52[14:0]) ? cam_loc52 : 7'd52 ) |
 ( (snoop_in == cam_loc53[14:0]) ? cam_loc53 : 7'd53 ) |
 ( (snoop_in == cam_loc54[14:0]) ? cam_loc54 : 7'd54 ) |
 ( (snoop_in == cam_loc55[14:0]) ? cam_loc55 : 7'd55 ) |
 ( (snoop_in == cam_loc56[14:0]) ? cam_loc56 : 7'd56 ) |
 ( (snoop_in == cam_loc57[14:0]) ? cam_loc57 : 7'd57 ) |
 ( (snoop_in == cam_loc58[14:0]) ? cam_loc58 : 7'd58 ) |
 ( (snoop_in == cam_loc59[14:0]) ? cam_loc59 : 7'd59 ) |
 ( (snoop_in == cam_loc60[14:0]) ? cam_loc60 : 7'd60 ) |
 ( (snoop_in == cam_loc61[14:0]) ? cam_loc61 : 7'd61 ) |
 ( (snoop_in == cam_loc62[14:0]) ? cam_loc62 : 7'd62 ) |
 ( (snoop_in == cam_loc63[14:0]) ? cam_loc63 : 7'd63 ) |
 ( (snoop_in == cam_loc64[14:0]) ? cam_loc64 : 7'd64 ) |
 ( (snoop_in == cam_loc65[14:0]) ? cam_loc65 : 7'd65 ) |
 ( (snoop_in == cam_loc66[14:0]) ? cam_loc66 : 7'd66 ) |
 ( (snoop_in == cam_loc67[14:0]) ? cam_loc67 : 7'd67 ) |
 ( (snoop_in == cam_loc68[14:0]) ? cam_loc68 : 7'd68 ) |
 ( (snoop_in == cam_loc69[14:0]) ? cam_loc69 : 7'd69 ) |
 ( (snoop_in == cam_loc70[14:0]) ? cam_loc70 : 7'd70 ) |
 ( (snoop_in == cam_loc71[14:0]) ? cam_loc71 : 7'd71 ) |
 ( (snoop_in == cam_loc72[14:0]) ? cam_loc72 : 7'd72 ) |
 ( (snoop_in == cam_loc73[14:0]) ? cam_loc73 : 7'd73 ) |
 ( (snoop_in == cam_loc74[14:0]) ? cam_loc74 : 7'd74 ) |
 ( (snoop_in == cam_loc75[14:0]) ? cam_loc75 : 7'd75 ) |
 ( (snoop_in == cam_loc76[14:0]) ? cam_loc76 : 7'd76 ) |
 ( (snoop_in == cam_loc77[14:0]) ? cam_loc77 : 7'd77 ) |
 ( (snoop_in == cam_loc78[14:0]) ? cam_loc78 : 7'd78 ) |
 ( (snoop_in == cam_loc79[14:0]) ? cam_loc79 : 7'd79 ) |
 ( (snoop_in == cam_loc80[14:0]) ? cam_loc80 : 7'd80 ) |
 ( (snoop_in == cam_loc81[14:0]) ? cam_loc81 : 7'd81 ) |
 ( (snoop_in == cam_loc82[14:0]) ? cam_loc82 : 7'd82 ) |
 ( (snoop_in == cam_loc83[14:0]) ? cam_loc83 : 7'd83 ) |
 ( (snoop_in == cam_loc84[14:0]) ? cam_loc84 : 7'd84 ) |
 ( (snoop_in == cam_loc85[14:0]) ? cam_loc85 : 7'd85 ) |
 ( (snoop_in == cam_loc86[14:0]) ? cam_loc86 : 7'd86 ) |
 ( (snoop_in == cam_loc87[14:0]) ? cam_loc87 : 7'd87 ) |
 ( (snoop_in == cam_loc88[14:0]) ? cam_loc88 : 7'd88 ) |
 ( (snoop_in == cam_loc89[14:0]) ? cam_loc89 : 7'd89 ) |
 ( (snoop_in == cam_loc90[14:0]) ? cam_loc90 : 7'd90 ) |
 ( (snoop_in == cam_loc91[14:0]) ? cam_loc91 : 7'd91 ) |
 ( (snoop_in == cam_loc92[14:0]) ? cam_loc92 : 7'd92 ) |
 ( (snoop_in == cam_loc93[14:0]) ? cam_loc93 : 7'd93 ) |
 ( (snoop_in == cam_loc94[14:0]) ? cam_loc94 : 7'd94 ) |
 ( (snoop_in == cam_loc95[14:0]) ? cam_loc95 : 7'd95 ) |
 ( (snoop_in == cam_loc96[14:0]) ? cam_loc96 : 7'd96 ) |
 ( (snoop_in == cam_loc97[14:0]) ? cam_loc97 : 7'd97 ) |
 ( (snoop_in == cam_loc98[14:0]) ? cam_loc98 : 7'd98 ) |
 ( (snoop_in == cam_loc99[14:0]) ? cam_loc99 : 7'd99 )

;

wire assign freedup_loc_valid = snoop_match;

endmodule
