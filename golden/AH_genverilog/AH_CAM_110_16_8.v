
module AH_CAM_110_16_8 (clk
,rstn
,wdata
,wvalid
,wready
,sdata
,svalid
,smatch
,sin);

input clk;
input rstn;
input [15:0] wdata;
input wvalid;
output wready;
input [15:0] sdata;
input svalid;
input smatch;
input [7:0] sin;

wire [6:0] internal_wr_ptr;
req  [7:0] wr_loc_counter;
        req  [15:0] cam_loc0;
req  [15:0] cam_loc1;
req  [15:0] cam_loc2;
req  [15:0] cam_loc3;
req  [15:0] cam_loc4;
req  [15:0] cam_loc5;
req  [15:0] cam_loc6;
req  [15:0] cam_loc7;
req  [15:0] cam_loc8;
req  [15:0] cam_loc9;
req  [15:0] cam_loc10;
req  [15:0] cam_loc11;
req  [15:0] cam_loc12;
req  [15:0] cam_loc13;
req  [15:0] cam_loc14;
req  [15:0] cam_loc15;
req  [15:0] cam_loc16;
req  [15:0] cam_loc17;
req  [15:0] cam_loc18;
req  [15:0] cam_loc19;
req  [15:0] cam_loc20;
req  [15:0] cam_loc21;
req  [15:0] cam_loc22;
req  [15:0] cam_loc23;
req  [15:0] cam_loc24;
req  [15:0] cam_loc25;
req  [15:0] cam_loc26;
req  [15:0] cam_loc27;
req  [15:0] cam_loc28;
req  [15:0] cam_loc29;
req  [15:0] cam_loc30;
req  [15:0] cam_loc31;
req  [15:0] cam_loc32;
req  [15:0] cam_loc33;
req  [15:0] cam_loc34;
req  [15:0] cam_loc35;
req  [15:0] cam_loc36;
req  [15:0] cam_loc37;
req  [15:0] cam_loc38;
req  [15:0] cam_loc39;
req  [15:0] cam_loc40;
req  [15:0] cam_loc41;
req  [15:0] cam_loc42;
req  [15:0] cam_loc43;
req  [15:0] cam_loc44;
req  [15:0] cam_loc45;
req  [15:0] cam_loc46;
req  [15:0] cam_loc47;
req  [15:0] cam_loc48;
req  [15:0] cam_loc49;
req  [15:0] cam_loc50;
req  [15:0] cam_loc51;
req  [15:0] cam_loc52;
req  [15:0] cam_loc53;
req  [15:0] cam_loc54;
req  [15:0] cam_loc55;
req  [15:0] cam_loc56;
req  [15:0] cam_loc57;
req  [15:0] cam_loc58;
req  [15:0] cam_loc59;
req  [15:0] cam_loc60;
req  [15:0] cam_loc61;
req  [15:0] cam_loc62;
req  [15:0] cam_loc63;
req  [15:0] cam_loc64;
req  [15:0] cam_loc65;
req  [15:0] cam_loc66;
req  [15:0] cam_loc67;
req  [15:0] cam_loc68;
req  [15:0] cam_loc69;
req  [15:0] cam_loc70;
req  [15:0] cam_loc71;
req  [15:0] cam_loc72;
req  [15:0] cam_loc73;
req  [15:0] cam_loc74;
req  [15:0] cam_loc75;
req  [15:0] cam_loc76;
req  [15:0] cam_loc77;
req  [15:0] cam_loc78;
req  [15:0] cam_loc79;
req  [15:0] cam_loc80;
req  [15:0] cam_loc81;
req  [15:0] cam_loc82;
req  [15:0] cam_loc83;
req  [15:0] cam_loc84;
req  [15:0] cam_loc85;
req  [15:0] cam_loc86;
req  [15:0] cam_loc87;
req  [15:0] cam_loc88;
req  [15:0] cam_loc89;
req  [15:0] cam_loc90;
req  [15:0] cam_loc91;
req  [15:0] cam_loc92;
req  [15:0] cam_loc93;
req  [15:0] cam_loc94;
req  [15:0] cam_loc95;
req  [15:0] cam_loc96;
req  [15:0] cam_loc97;
req  [15:0] cam_loc98;
req  [15:0] cam_loc99;
req  [15:0] cam_loc100;
req  [15:0] cam_loc101;
req  [15:0] cam_loc102;
req  [15:0] cam_loc103;
req  [15:0] cam_loc104;
req  [15:0] cam_loc105;
req  [15:0] cam_loc106;
req  [15:0] cam_loc107;
req  [15:0] cam_loc108;
req  [15:0] cam_loc109;

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


	cam_loc0 <= 16'd0;
	cam_loc1 <= 16'd0;
	cam_loc2 <= 16'd0;
	cam_loc3 <= 16'd0;
	cam_loc4 <= 16'd0;
	cam_loc5 <= 16'd0;
	cam_loc6 <= 16'd0;
	cam_loc7 <= 16'd0;
	cam_loc8 <= 16'd0;
	cam_loc9 <= 16'd0;
	cam_loc10 <= 16'd0;
	cam_loc11 <= 16'd0;
	cam_loc12 <= 16'd0;
	cam_loc13 <= 16'd0;
	cam_loc14 <= 16'd0;
	cam_loc15 <= 16'd0;
	cam_loc16 <= 16'd0;
	cam_loc17 <= 16'd0;
	cam_loc18 <= 16'd0;
	cam_loc19 <= 16'd0;
	cam_loc20 <= 16'd0;
	cam_loc21 <= 16'd0;
	cam_loc22 <= 16'd0;
	cam_loc23 <= 16'd0;
	cam_loc24 <= 16'd0;
	cam_loc25 <= 16'd0;
	cam_loc26 <= 16'd0;
	cam_loc27 <= 16'd0;
	cam_loc28 <= 16'd0;
	cam_loc29 <= 16'd0;
	cam_loc30 <= 16'd0;
	cam_loc31 <= 16'd0;
	cam_loc32 <= 16'd0;
	cam_loc33 <= 16'd0;
	cam_loc34 <= 16'd0;
	cam_loc35 <= 16'd0;
	cam_loc36 <= 16'd0;
	cam_loc37 <= 16'd0;
	cam_loc38 <= 16'd0;
	cam_loc39 <= 16'd0;
	cam_loc40 <= 16'd0;
	cam_loc41 <= 16'd0;
	cam_loc42 <= 16'd0;
	cam_loc43 <= 16'd0;
	cam_loc44 <= 16'd0;
	cam_loc45 <= 16'd0;
	cam_loc46 <= 16'd0;
	cam_loc47 <= 16'd0;
	cam_loc48 <= 16'd0;
	cam_loc49 <= 16'd0;
	cam_loc50 <= 16'd0;
	cam_loc51 <= 16'd0;
	cam_loc52 <= 16'd0;
	cam_loc53 <= 16'd0;
	cam_loc54 <= 16'd0;
	cam_loc55 <= 16'd0;
	cam_loc56 <= 16'd0;
	cam_loc57 <= 16'd0;
	cam_loc58 <= 16'd0;
	cam_loc59 <= 16'd0;
	cam_loc60 <= 16'd0;
	cam_loc61 <= 16'd0;
	cam_loc62 <= 16'd0;
	cam_loc63 <= 16'd0;
	cam_loc64 <= 16'd0;
	cam_loc65 <= 16'd0;
	cam_loc66 <= 16'd0;
	cam_loc67 <= 16'd0;
	cam_loc68 <= 16'd0;
	cam_loc69 <= 16'd0;
	cam_loc70 <= 16'd0;
	cam_loc71 <= 16'd0;
	cam_loc72 <= 16'd0;
	cam_loc73 <= 16'd0;
	cam_loc74 <= 16'd0;
	cam_loc75 <= 16'd0;
	cam_loc76 <= 16'd0;
	cam_loc77 <= 16'd0;
	cam_loc78 <= 16'd0;
	cam_loc79 <= 16'd0;
	cam_loc80 <= 16'd0;
	cam_loc81 <= 16'd0;
	cam_loc82 <= 16'd0;
	cam_loc83 <= 16'd0;
	cam_loc84 <= 16'd0;
	cam_loc85 <= 16'd0;
	cam_loc86 <= 16'd0;
	cam_loc87 <= 16'd0;
	cam_loc88 <= 16'd0;
	cam_loc89 <= 16'd0;
	cam_loc90 <= 16'd0;
	cam_loc91 <= 16'd0;
	cam_loc92 <= 16'd0;
	cam_loc93 <= 16'd0;
	cam_loc94 <= 16'd0;
	cam_loc95 <= 16'd0;
	cam_loc96 <= 16'd0;
	cam_loc97 <= 16'd0;
	cam_loc98 <= 16'd0;
	cam_loc99 <= 16'd0;
	cam_loc100 <= 16'd0;
	cam_loc101 <= 16'd0;
	cam_loc102 <= 16'd0;
	cam_loc103 <= 16'd0;
	cam_loc104 <= 16'd0;
	cam_loc105 <= 16'd0;
	cam_loc106 <= 16'd0;
	cam_loc107 <= 16'd0;
	cam_loc108 <= 16'd0;
	cam_loc109 <= 16'd0;


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
	cam_loc100 <= (internal_wr_en & (internal_wr_ptr == 7'd100) ) ? wr_data : cam_loc100;
	cam_loc101 <= (internal_wr_en & (internal_wr_ptr == 7'd101) ) ? wr_data : cam_loc101;
	cam_loc102 <= (internal_wr_en & (internal_wr_ptr == 7'd102) ) ? wr_data : cam_loc102;
	cam_loc103 <= (internal_wr_en & (internal_wr_ptr == 7'd103) ) ? wr_data : cam_loc103;
	cam_loc104 <= (internal_wr_en & (internal_wr_ptr == 7'd104) ) ? wr_data : cam_loc104;
	cam_loc105 <= (internal_wr_en & (internal_wr_ptr == 7'd105) ) ? wr_data : cam_loc105;
	cam_loc106 <= (internal_wr_en & (internal_wr_ptr == 7'd106) ) ? wr_data : cam_loc106;
	cam_loc107 <= (internal_wr_en & (internal_wr_ptr == 7'd107) ) ? wr_data : cam_loc107;
	cam_loc108 <= (internal_wr_en & (internal_wr_ptr == 7'd108) ) ? wr_data : cam_loc108;
	cam_loc109 <= (internal_wr_en & (internal_wr_ptr == 7'd109) ) ? wr_data : cam_loc109;


end

wire assign snoop_match = freedup_loc_ready) & (

(snoop_in == cam_loc0[7:0]) |
 (snoop_in == cam_loc1[7:0]) |
 (snoop_in == cam_loc2[7:0]) |
 (snoop_in == cam_loc3[7:0]) |
 (snoop_in == cam_loc4[7:0]) |
 (snoop_in == cam_loc5[7:0]) |
 (snoop_in == cam_loc6[7:0]) |
 (snoop_in == cam_loc7[7:0]) |
 (snoop_in == cam_loc8[7:0]) |
 (snoop_in == cam_loc9[7:0]) |
 (snoop_in == cam_loc10[7:0]) |
 (snoop_in == cam_loc11[7:0]) |
 (snoop_in == cam_loc12[7:0]) |
 (snoop_in == cam_loc13[7:0]) |
 (snoop_in == cam_loc14[7:0]) |
 (snoop_in == cam_loc15[7:0]) |
 (snoop_in == cam_loc16[7:0]) |
 (snoop_in == cam_loc17[7:0]) |
 (snoop_in == cam_loc18[7:0]) |
 (snoop_in == cam_loc19[7:0]) |
 (snoop_in == cam_loc20[7:0]) |
 (snoop_in == cam_loc21[7:0]) |
 (snoop_in == cam_loc22[7:0]) |
 (snoop_in == cam_loc23[7:0]) |
 (snoop_in == cam_loc24[7:0]) |
 (snoop_in == cam_loc25[7:0]) |
 (snoop_in == cam_loc26[7:0]) |
 (snoop_in == cam_loc27[7:0]) |
 (snoop_in == cam_loc28[7:0]) |
 (snoop_in == cam_loc29[7:0]) |
 (snoop_in == cam_loc30[7:0]) |
 (snoop_in == cam_loc31[7:0]) |
 (snoop_in == cam_loc32[7:0]) |
 (snoop_in == cam_loc33[7:0]) |
 (snoop_in == cam_loc34[7:0]) |
 (snoop_in == cam_loc35[7:0]) |
 (snoop_in == cam_loc36[7:0]) |
 (snoop_in == cam_loc37[7:0]) |
 (snoop_in == cam_loc38[7:0]) |
 (snoop_in == cam_loc39[7:0]) |
 (snoop_in == cam_loc40[7:0]) |
 (snoop_in == cam_loc41[7:0]) |
 (snoop_in == cam_loc42[7:0]) |
 (snoop_in == cam_loc43[7:0]) |
 (snoop_in == cam_loc44[7:0]) |
 (snoop_in == cam_loc45[7:0]) |
 (snoop_in == cam_loc46[7:0]) |
 (snoop_in == cam_loc47[7:0]) |
 (snoop_in == cam_loc48[7:0]) |
 (snoop_in == cam_loc49[7:0]) |
 (snoop_in == cam_loc50[7:0]) |
 (snoop_in == cam_loc51[7:0]) |
 (snoop_in == cam_loc52[7:0]) |
 (snoop_in == cam_loc53[7:0]) |
 (snoop_in == cam_loc54[7:0]) |
 (snoop_in == cam_loc55[7:0]) |
 (snoop_in == cam_loc56[7:0]) |
 (snoop_in == cam_loc57[7:0]) |
 (snoop_in == cam_loc58[7:0]) |
 (snoop_in == cam_loc59[7:0]) |
 (snoop_in == cam_loc60[7:0]) |
 (snoop_in == cam_loc61[7:0]) |
 (snoop_in == cam_loc62[7:0]) |
 (snoop_in == cam_loc63[7:0]) |
 (snoop_in == cam_loc64[7:0]) |
 (snoop_in == cam_loc65[7:0]) |
 (snoop_in == cam_loc66[7:0]) |
 (snoop_in == cam_loc67[7:0]) |
 (snoop_in == cam_loc68[7:0]) |
 (snoop_in == cam_loc69[7:0]) |
 (snoop_in == cam_loc70[7:0]) |
 (snoop_in == cam_loc71[7:0]) |
 (snoop_in == cam_loc72[7:0]) |
 (snoop_in == cam_loc73[7:0]) |
 (snoop_in == cam_loc74[7:0]) |
 (snoop_in == cam_loc75[7:0]) |
 (snoop_in == cam_loc76[7:0]) |
 (snoop_in == cam_loc77[7:0]) |
 (snoop_in == cam_loc78[7:0]) |
 (snoop_in == cam_loc79[7:0]) |
 (snoop_in == cam_loc80[7:0]) |
 (snoop_in == cam_loc81[7:0]) |
 (snoop_in == cam_loc82[7:0]) |
 (snoop_in == cam_loc83[7:0]) |
 (snoop_in == cam_loc84[7:0]) |
 (snoop_in == cam_loc85[7:0]) |
 (snoop_in == cam_loc86[7:0]) |
 (snoop_in == cam_loc87[7:0]) |
 (snoop_in == cam_loc88[7:0]) |
 (snoop_in == cam_loc89[7:0]) |
 (snoop_in == cam_loc90[7:0]) |
 (snoop_in == cam_loc91[7:0]) |
 (snoop_in == cam_loc92[7:0]) |
 (snoop_in == cam_loc93[7:0]) |
 (snoop_in == cam_loc94[7:0]) |
 (snoop_in == cam_loc95[7:0]) |
 (snoop_in == cam_loc96[7:0]) |
 (snoop_in == cam_loc97[7:0]) |
 (snoop_in == cam_loc98[7:0]) |
 (snoop_in == cam_loc99[7:0]) |
 (snoop_in == cam_loc100[7:0]) |
 (snoop_in == cam_loc101[7:0]) |
 (snoop_in == cam_loc102[7:0]) |
 (snoop_in == cam_loc103[7:0]) |
 (snoop_in == cam_loc104[7:0]) |
 (snoop_in == cam_loc105[7:0]) |
 (snoop_in == cam_loc106[7:0]) |
 (snoop_in == cam_loc107[7:0]) |
 (snoop_in == cam_loc108[7:0]) |
 (snoop_in == cam_loc109[7:0])

);

wire assign snoop_data = 16'd0 |
( (snoop_in == cam_loc0[7:0]) ? cam_loc0 : 16'd0 ) |
 ( (snoop_in == cam_loc1[7:0]) ? cam_loc1 : 16'd0 ) |
 ( (snoop_in == cam_loc2[7:0]) ? cam_loc2 : 16'd0 ) |
 ( (snoop_in == cam_loc3[7:0]) ? cam_loc3 : 16'd0 ) |
 ( (snoop_in == cam_loc4[7:0]) ? cam_loc4 : 16'd0 ) |
 ( (snoop_in == cam_loc5[7:0]) ? cam_loc5 : 16'd0 ) |
 ( (snoop_in == cam_loc6[7:0]) ? cam_loc6 : 16'd0 ) |
 ( (snoop_in == cam_loc7[7:0]) ? cam_loc7 : 16'd0 ) |
 ( (snoop_in == cam_loc8[7:0]) ? cam_loc8 : 16'd0 ) |
 ( (snoop_in == cam_loc9[7:0]) ? cam_loc9 : 16'd0 ) |
 ( (snoop_in == cam_loc10[7:0]) ? cam_loc10 : 16'd0 ) |
 ( (snoop_in == cam_loc11[7:0]) ? cam_loc11 : 16'd0 ) |
 ( (snoop_in == cam_loc12[7:0]) ? cam_loc12 : 16'd0 ) |
 ( (snoop_in == cam_loc13[7:0]) ? cam_loc13 : 16'd0 ) |
 ( (snoop_in == cam_loc14[7:0]) ? cam_loc14 : 16'd0 ) |
 ( (snoop_in == cam_loc15[7:0]) ? cam_loc15 : 16'd0 ) |
 ( (snoop_in == cam_loc16[7:0]) ? cam_loc16 : 16'd0 ) |
 ( (snoop_in == cam_loc17[7:0]) ? cam_loc17 : 16'd0 ) |
 ( (snoop_in == cam_loc18[7:0]) ? cam_loc18 : 16'd0 ) |
 ( (snoop_in == cam_loc19[7:0]) ? cam_loc19 : 16'd0 ) |
 ( (snoop_in == cam_loc20[7:0]) ? cam_loc20 : 16'd0 ) |
 ( (snoop_in == cam_loc21[7:0]) ? cam_loc21 : 16'd0 ) |
 ( (snoop_in == cam_loc22[7:0]) ? cam_loc22 : 16'd0 ) |
 ( (snoop_in == cam_loc23[7:0]) ? cam_loc23 : 16'd0 ) |
 ( (snoop_in == cam_loc24[7:0]) ? cam_loc24 : 16'd0 ) |
 ( (snoop_in == cam_loc25[7:0]) ? cam_loc25 : 16'd0 ) |
 ( (snoop_in == cam_loc26[7:0]) ? cam_loc26 : 16'd0 ) |
 ( (snoop_in == cam_loc27[7:0]) ? cam_loc27 : 16'd0 ) |
 ( (snoop_in == cam_loc28[7:0]) ? cam_loc28 : 16'd0 ) |
 ( (snoop_in == cam_loc29[7:0]) ? cam_loc29 : 16'd0 ) |
 ( (snoop_in == cam_loc30[7:0]) ? cam_loc30 : 16'd0 ) |
 ( (snoop_in == cam_loc31[7:0]) ? cam_loc31 : 16'd0 ) |
 ( (snoop_in == cam_loc32[7:0]) ? cam_loc32 : 16'd0 ) |
 ( (snoop_in == cam_loc33[7:0]) ? cam_loc33 : 16'd0 ) |
 ( (snoop_in == cam_loc34[7:0]) ? cam_loc34 : 16'd0 ) |
 ( (snoop_in == cam_loc35[7:0]) ? cam_loc35 : 16'd0 ) |
 ( (snoop_in == cam_loc36[7:0]) ? cam_loc36 : 16'd0 ) |
 ( (snoop_in == cam_loc37[7:0]) ? cam_loc37 : 16'd0 ) |
 ( (snoop_in == cam_loc38[7:0]) ? cam_loc38 : 16'd0 ) |
 ( (snoop_in == cam_loc39[7:0]) ? cam_loc39 : 16'd0 ) |
 ( (snoop_in == cam_loc40[7:0]) ? cam_loc40 : 16'd0 ) |
 ( (snoop_in == cam_loc41[7:0]) ? cam_loc41 : 16'd0 ) |
 ( (snoop_in == cam_loc42[7:0]) ? cam_loc42 : 16'd0 ) |
 ( (snoop_in == cam_loc43[7:0]) ? cam_loc43 : 16'd0 ) |
 ( (snoop_in == cam_loc44[7:0]) ? cam_loc44 : 16'd0 ) |
 ( (snoop_in == cam_loc45[7:0]) ? cam_loc45 : 16'd0 ) |
 ( (snoop_in == cam_loc46[7:0]) ? cam_loc46 : 16'd0 ) |
 ( (snoop_in == cam_loc47[7:0]) ? cam_loc47 : 16'd0 ) |
 ( (snoop_in == cam_loc48[7:0]) ? cam_loc48 : 16'd0 ) |
 ( (snoop_in == cam_loc49[7:0]) ? cam_loc49 : 16'd0 ) |
 ( (snoop_in == cam_loc50[7:0]) ? cam_loc50 : 16'd0 ) |
 ( (snoop_in == cam_loc51[7:0]) ? cam_loc51 : 16'd0 ) |
 ( (snoop_in == cam_loc52[7:0]) ? cam_loc52 : 16'd0 ) |
 ( (snoop_in == cam_loc53[7:0]) ? cam_loc53 : 16'd0 ) |
 ( (snoop_in == cam_loc54[7:0]) ? cam_loc54 : 16'd0 ) |
 ( (snoop_in == cam_loc55[7:0]) ? cam_loc55 : 16'd0 ) |
 ( (snoop_in == cam_loc56[7:0]) ? cam_loc56 : 16'd0 ) |
 ( (snoop_in == cam_loc57[7:0]) ? cam_loc57 : 16'd0 ) |
 ( (snoop_in == cam_loc58[7:0]) ? cam_loc58 : 16'd0 ) |
 ( (snoop_in == cam_loc59[7:0]) ? cam_loc59 : 16'd0 ) |
 ( (snoop_in == cam_loc60[7:0]) ? cam_loc60 : 16'd0 ) |
 ( (snoop_in == cam_loc61[7:0]) ? cam_loc61 : 16'd0 ) |
 ( (snoop_in == cam_loc62[7:0]) ? cam_loc62 : 16'd0 ) |
 ( (snoop_in == cam_loc63[7:0]) ? cam_loc63 : 16'd0 ) |
 ( (snoop_in == cam_loc64[7:0]) ? cam_loc64 : 16'd0 ) |
 ( (snoop_in == cam_loc65[7:0]) ? cam_loc65 : 16'd0 ) |
 ( (snoop_in == cam_loc66[7:0]) ? cam_loc66 : 16'd0 ) |
 ( (snoop_in == cam_loc67[7:0]) ? cam_loc67 : 16'd0 ) |
 ( (snoop_in == cam_loc68[7:0]) ? cam_loc68 : 16'd0 ) |
 ( (snoop_in == cam_loc69[7:0]) ? cam_loc69 : 16'd0 ) |
 ( (snoop_in == cam_loc70[7:0]) ? cam_loc70 : 16'd0 ) |
 ( (snoop_in == cam_loc71[7:0]) ? cam_loc71 : 16'd0 ) |
 ( (snoop_in == cam_loc72[7:0]) ? cam_loc72 : 16'd0 ) |
 ( (snoop_in == cam_loc73[7:0]) ? cam_loc73 : 16'd0 ) |
 ( (snoop_in == cam_loc74[7:0]) ? cam_loc74 : 16'd0 ) |
 ( (snoop_in == cam_loc75[7:0]) ? cam_loc75 : 16'd0 ) |
 ( (snoop_in == cam_loc76[7:0]) ? cam_loc76 : 16'd0 ) |
 ( (snoop_in == cam_loc77[7:0]) ? cam_loc77 : 16'd0 ) |
 ( (snoop_in == cam_loc78[7:0]) ? cam_loc78 : 16'd0 ) |
 ( (snoop_in == cam_loc79[7:0]) ? cam_loc79 : 16'd0 ) |
 ( (snoop_in == cam_loc80[7:0]) ? cam_loc80 : 16'd0 ) |
 ( (snoop_in == cam_loc81[7:0]) ? cam_loc81 : 16'd0 ) |
 ( (snoop_in == cam_loc82[7:0]) ? cam_loc82 : 16'd0 ) |
 ( (snoop_in == cam_loc83[7:0]) ? cam_loc83 : 16'd0 ) |
 ( (snoop_in == cam_loc84[7:0]) ? cam_loc84 : 16'd0 ) |
 ( (snoop_in == cam_loc85[7:0]) ? cam_loc85 : 16'd0 ) |
 ( (snoop_in == cam_loc86[7:0]) ? cam_loc86 : 16'd0 ) |
 ( (snoop_in == cam_loc87[7:0]) ? cam_loc87 : 16'd0 ) |
 ( (snoop_in == cam_loc88[7:0]) ? cam_loc88 : 16'd0 ) |
 ( (snoop_in == cam_loc89[7:0]) ? cam_loc89 : 16'd0 ) |
 ( (snoop_in == cam_loc90[7:0]) ? cam_loc90 : 16'd0 ) |
 ( (snoop_in == cam_loc91[7:0]) ? cam_loc91 : 16'd0 ) |
 ( (snoop_in == cam_loc92[7:0]) ? cam_loc92 : 16'd0 ) |
 ( (snoop_in == cam_loc93[7:0]) ? cam_loc93 : 16'd0 ) |
 ( (snoop_in == cam_loc94[7:0]) ? cam_loc94 : 16'd0 ) |
 ( (snoop_in == cam_loc95[7:0]) ? cam_loc95 : 16'd0 ) |
 ( (snoop_in == cam_loc96[7:0]) ? cam_loc96 : 16'd0 ) |
 ( (snoop_in == cam_loc97[7:0]) ? cam_loc97 : 16'd0 ) |
 ( (snoop_in == cam_loc98[7:0]) ? cam_loc98 : 16'd0 ) |
 ( (snoop_in == cam_loc99[7:0]) ? cam_loc99 : 16'd0 ) |
 ( (snoop_in == cam_loc100[7:0]) ? cam_loc100 : 16'd0 ) |
 ( (snoop_in == cam_loc101[7:0]) ? cam_loc101 : 16'd0 ) |
 ( (snoop_in == cam_loc102[7:0]) ? cam_loc102 : 16'd0 ) |
 ( (snoop_in == cam_loc103[7:0]) ? cam_loc103 : 16'd0 ) |
 ( (snoop_in == cam_loc104[7:0]) ? cam_loc104 : 16'd0 ) |
 ( (snoop_in == cam_loc105[7:0]) ? cam_loc105 : 16'd0 ) |
 ( (snoop_in == cam_loc106[7:0]) ? cam_loc106 : 16'd0 ) |
 ( (snoop_in == cam_loc107[7:0]) ? cam_loc107 : 16'd0 ) |
 ( (snoop_in == cam_loc108[7:0]) ? cam_loc108 : 16'd0 ) |
 ( (snoop_in == cam_loc109[7:0]) ? cam_loc109 : 16'd0 )

;

wire assign freeup_loc = 7'd0 |
( (snoop_in == cam_loc0[7:0]) ? cam_loc0 : 7'd0 ) |
 ( (snoop_in == cam_loc1[7:0]) ? cam_loc1 : 7'd1 ) |
 ( (snoop_in == cam_loc2[7:0]) ? cam_loc2 : 7'd2 ) |
 ( (snoop_in == cam_loc3[7:0]) ? cam_loc3 : 7'd3 ) |
 ( (snoop_in == cam_loc4[7:0]) ? cam_loc4 : 7'd4 ) |
 ( (snoop_in == cam_loc5[7:0]) ? cam_loc5 : 7'd5 ) |
 ( (snoop_in == cam_loc6[7:0]) ? cam_loc6 : 7'd6 ) |
 ( (snoop_in == cam_loc7[7:0]) ? cam_loc7 : 7'd7 ) |
 ( (snoop_in == cam_loc8[7:0]) ? cam_loc8 : 7'd8 ) |
 ( (snoop_in == cam_loc9[7:0]) ? cam_loc9 : 7'd9 ) |
 ( (snoop_in == cam_loc10[7:0]) ? cam_loc10 : 7'd10 ) |
 ( (snoop_in == cam_loc11[7:0]) ? cam_loc11 : 7'd11 ) |
 ( (snoop_in == cam_loc12[7:0]) ? cam_loc12 : 7'd12 ) |
 ( (snoop_in == cam_loc13[7:0]) ? cam_loc13 : 7'd13 ) |
 ( (snoop_in == cam_loc14[7:0]) ? cam_loc14 : 7'd14 ) |
 ( (snoop_in == cam_loc15[7:0]) ? cam_loc15 : 7'd15 ) |
 ( (snoop_in == cam_loc16[7:0]) ? cam_loc16 : 7'd16 ) |
 ( (snoop_in == cam_loc17[7:0]) ? cam_loc17 : 7'd17 ) |
 ( (snoop_in == cam_loc18[7:0]) ? cam_loc18 : 7'd18 ) |
 ( (snoop_in == cam_loc19[7:0]) ? cam_loc19 : 7'd19 ) |
 ( (snoop_in == cam_loc20[7:0]) ? cam_loc20 : 7'd20 ) |
 ( (snoop_in == cam_loc21[7:0]) ? cam_loc21 : 7'd21 ) |
 ( (snoop_in == cam_loc22[7:0]) ? cam_loc22 : 7'd22 ) |
 ( (snoop_in == cam_loc23[7:0]) ? cam_loc23 : 7'd23 ) |
 ( (snoop_in == cam_loc24[7:0]) ? cam_loc24 : 7'd24 ) |
 ( (snoop_in == cam_loc25[7:0]) ? cam_loc25 : 7'd25 ) |
 ( (snoop_in == cam_loc26[7:0]) ? cam_loc26 : 7'd26 ) |
 ( (snoop_in == cam_loc27[7:0]) ? cam_loc27 : 7'd27 ) |
 ( (snoop_in == cam_loc28[7:0]) ? cam_loc28 : 7'd28 ) |
 ( (snoop_in == cam_loc29[7:0]) ? cam_loc29 : 7'd29 ) |
 ( (snoop_in == cam_loc30[7:0]) ? cam_loc30 : 7'd30 ) |
 ( (snoop_in == cam_loc31[7:0]) ? cam_loc31 : 7'd31 ) |
 ( (snoop_in == cam_loc32[7:0]) ? cam_loc32 : 7'd32 ) |
 ( (snoop_in == cam_loc33[7:0]) ? cam_loc33 : 7'd33 ) |
 ( (snoop_in == cam_loc34[7:0]) ? cam_loc34 : 7'd34 ) |
 ( (snoop_in == cam_loc35[7:0]) ? cam_loc35 : 7'd35 ) |
 ( (snoop_in == cam_loc36[7:0]) ? cam_loc36 : 7'd36 ) |
 ( (snoop_in == cam_loc37[7:0]) ? cam_loc37 : 7'd37 ) |
 ( (snoop_in == cam_loc38[7:0]) ? cam_loc38 : 7'd38 ) |
 ( (snoop_in == cam_loc39[7:0]) ? cam_loc39 : 7'd39 ) |
 ( (snoop_in == cam_loc40[7:0]) ? cam_loc40 : 7'd40 ) |
 ( (snoop_in == cam_loc41[7:0]) ? cam_loc41 : 7'd41 ) |
 ( (snoop_in == cam_loc42[7:0]) ? cam_loc42 : 7'd42 ) |
 ( (snoop_in == cam_loc43[7:0]) ? cam_loc43 : 7'd43 ) |
 ( (snoop_in == cam_loc44[7:0]) ? cam_loc44 : 7'd44 ) |
 ( (snoop_in == cam_loc45[7:0]) ? cam_loc45 : 7'd45 ) |
 ( (snoop_in == cam_loc46[7:0]) ? cam_loc46 : 7'd46 ) |
 ( (snoop_in == cam_loc47[7:0]) ? cam_loc47 : 7'd47 ) |
 ( (snoop_in == cam_loc48[7:0]) ? cam_loc48 : 7'd48 ) |
 ( (snoop_in == cam_loc49[7:0]) ? cam_loc49 : 7'd49 ) |
 ( (snoop_in == cam_loc50[7:0]) ? cam_loc50 : 7'd50 ) |
 ( (snoop_in == cam_loc51[7:0]) ? cam_loc51 : 7'd51 ) |
 ( (snoop_in == cam_loc52[7:0]) ? cam_loc52 : 7'd52 ) |
 ( (snoop_in == cam_loc53[7:0]) ? cam_loc53 : 7'd53 ) |
 ( (snoop_in == cam_loc54[7:0]) ? cam_loc54 : 7'd54 ) |
 ( (snoop_in == cam_loc55[7:0]) ? cam_loc55 : 7'd55 ) |
 ( (snoop_in == cam_loc56[7:0]) ? cam_loc56 : 7'd56 ) |
 ( (snoop_in == cam_loc57[7:0]) ? cam_loc57 : 7'd57 ) |
 ( (snoop_in == cam_loc58[7:0]) ? cam_loc58 : 7'd58 ) |
 ( (snoop_in == cam_loc59[7:0]) ? cam_loc59 : 7'd59 ) |
 ( (snoop_in == cam_loc60[7:0]) ? cam_loc60 : 7'd60 ) |
 ( (snoop_in == cam_loc61[7:0]) ? cam_loc61 : 7'd61 ) |
 ( (snoop_in == cam_loc62[7:0]) ? cam_loc62 : 7'd62 ) |
 ( (snoop_in == cam_loc63[7:0]) ? cam_loc63 : 7'd63 ) |
 ( (snoop_in == cam_loc64[7:0]) ? cam_loc64 : 7'd64 ) |
 ( (snoop_in == cam_loc65[7:0]) ? cam_loc65 : 7'd65 ) |
 ( (snoop_in == cam_loc66[7:0]) ? cam_loc66 : 7'd66 ) |
 ( (snoop_in == cam_loc67[7:0]) ? cam_loc67 : 7'd67 ) |
 ( (snoop_in == cam_loc68[7:0]) ? cam_loc68 : 7'd68 ) |
 ( (snoop_in == cam_loc69[7:0]) ? cam_loc69 : 7'd69 ) |
 ( (snoop_in == cam_loc70[7:0]) ? cam_loc70 : 7'd70 ) |
 ( (snoop_in == cam_loc71[7:0]) ? cam_loc71 : 7'd71 ) |
 ( (snoop_in == cam_loc72[7:0]) ? cam_loc72 : 7'd72 ) |
 ( (snoop_in == cam_loc73[7:0]) ? cam_loc73 : 7'd73 ) |
 ( (snoop_in == cam_loc74[7:0]) ? cam_loc74 : 7'd74 ) |
 ( (snoop_in == cam_loc75[7:0]) ? cam_loc75 : 7'd75 ) |
 ( (snoop_in == cam_loc76[7:0]) ? cam_loc76 : 7'd76 ) |
 ( (snoop_in == cam_loc77[7:0]) ? cam_loc77 : 7'd77 ) |
 ( (snoop_in == cam_loc78[7:0]) ? cam_loc78 : 7'd78 ) |
 ( (snoop_in == cam_loc79[7:0]) ? cam_loc79 : 7'd79 ) |
 ( (snoop_in == cam_loc80[7:0]) ? cam_loc80 : 7'd80 ) |
 ( (snoop_in == cam_loc81[7:0]) ? cam_loc81 : 7'd81 ) |
 ( (snoop_in == cam_loc82[7:0]) ? cam_loc82 : 7'd82 ) |
 ( (snoop_in == cam_loc83[7:0]) ? cam_loc83 : 7'd83 ) |
 ( (snoop_in == cam_loc84[7:0]) ? cam_loc84 : 7'd84 ) |
 ( (snoop_in == cam_loc85[7:0]) ? cam_loc85 : 7'd85 ) |
 ( (snoop_in == cam_loc86[7:0]) ? cam_loc86 : 7'd86 ) |
 ( (snoop_in == cam_loc87[7:0]) ? cam_loc87 : 7'd87 ) |
 ( (snoop_in == cam_loc88[7:0]) ? cam_loc88 : 7'd88 ) |
 ( (snoop_in == cam_loc89[7:0]) ? cam_loc89 : 7'd89 ) |
 ( (snoop_in == cam_loc90[7:0]) ? cam_loc90 : 7'd90 ) |
 ( (snoop_in == cam_loc91[7:0]) ? cam_loc91 : 7'd91 ) |
 ( (snoop_in == cam_loc92[7:0]) ? cam_loc92 : 7'd92 ) |
 ( (snoop_in == cam_loc93[7:0]) ? cam_loc93 : 7'd93 ) |
 ( (snoop_in == cam_loc94[7:0]) ? cam_loc94 : 7'd94 ) |
 ( (snoop_in == cam_loc95[7:0]) ? cam_loc95 : 7'd95 ) |
 ( (snoop_in == cam_loc96[7:0]) ? cam_loc96 : 7'd96 ) |
 ( (snoop_in == cam_loc97[7:0]) ? cam_loc97 : 7'd97 ) |
 ( (snoop_in == cam_loc98[7:0]) ? cam_loc98 : 7'd98 ) |
 ( (snoop_in == cam_loc99[7:0]) ? cam_loc99 : 7'd99 ) |
 ( (snoop_in == cam_loc100[7:0]) ? cam_loc100 : 7'd100 ) |
 ( (snoop_in == cam_loc101[7:0]) ? cam_loc101 : 7'd101 ) |
 ( (snoop_in == cam_loc102[7:0]) ? cam_loc102 : 7'd102 ) |
 ( (snoop_in == cam_loc103[7:0]) ? cam_loc103 : 7'd103 ) |
 ( (snoop_in == cam_loc104[7:0]) ? cam_loc104 : 7'd104 ) |
 ( (snoop_in == cam_loc105[7:0]) ? cam_loc105 : 7'd105 ) |
 ( (snoop_in == cam_loc106[7:0]) ? cam_loc106 : 7'd106 ) |
 ( (snoop_in == cam_loc107[7:0]) ? cam_loc107 : 7'd107 ) |
 ( (snoop_in == cam_loc108[7:0]) ? cam_loc108 : 7'd108 ) |
 ( (snoop_in == cam_loc109[7:0]) ? cam_loc109 : 7'd109 )

;

wire assign freedup_loc_valid = snoop_match;

endmodule
