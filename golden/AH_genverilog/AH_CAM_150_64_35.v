
module AH_CAM_150_64_35 (wdata
,wvalid
,wready
,sdata
,svalid
,smatch
,sin);

input [63:0] wdata;
input wvalid;
output wready;
input [63:0] sdata;
input svalid;
input smatch;
input [34:0] sin;

wire [7:0] internal_wr_ptr;
req  [8:0] wr_loc_counter;
        req  [63:0] cam_loc0;
req  [63:0] cam_loc1;
req  [63:0] cam_loc2;
req  [63:0] cam_loc3;
req  [63:0] cam_loc4;
req  [63:0] cam_loc5;
req  [63:0] cam_loc6;
req  [63:0] cam_loc7;
req  [63:0] cam_loc8;
req  [63:0] cam_loc9;
req  [63:0] cam_loc10;
req  [63:0] cam_loc11;
req  [63:0] cam_loc12;
req  [63:0] cam_loc13;
req  [63:0] cam_loc14;
req  [63:0] cam_loc15;
req  [63:0] cam_loc16;
req  [63:0] cam_loc17;
req  [63:0] cam_loc18;
req  [63:0] cam_loc19;
req  [63:0] cam_loc20;
req  [63:0] cam_loc21;
req  [63:0] cam_loc22;
req  [63:0] cam_loc23;
req  [63:0] cam_loc24;
req  [63:0] cam_loc25;
req  [63:0] cam_loc26;
req  [63:0] cam_loc27;
req  [63:0] cam_loc28;
req  [63:0] cam_loc29;
req  [63:0] cam_loc30;
req  [63:0] cam_loc31;
req  [63:0] cam_loc32;
req  [63:0] cam_loc33;
req  [63:0] cam_loc34;
req  [63:0] cam_loc35;
req  [63:0] cam_loc36;
req  [63:0] cam_loc37;
req  [63:0] cam_loc38;
req  [63:0] cam_loc39;
req  [63:0] cam_loc40;
req  [63:0] cam_loc41;
req  [63:0] cam_loc42;
req  [63:0] cam_loc43;
req  [63:0] cam_loc44;
req  [63:0] cam_loc45;
req  [63:0] cam_loc46;
req  [63:0] cam_loc47;
req  [63:0] cam_loc48;
req  [63:0] cam_loc49;
req  [63:0] cam_loc50;
req  [63:0] cam_loc51;
req  [63:0] cam_loc52;
req  [63:0] cam_loc53;
req  [63:0] cam_loc54;
req  [63:0] cam_loc55;
req  [63:0] cam_loc56;
req  [63:0] cam_loc57;
req  [63:0] cam_loc58;
req  [63:0] cam_loc59;
req  [63:0] cam_loc60;
req  [63:0] cam_loc61;
req  [63:0] cam_loc62;
req  [63:0] cam_loc63;
req  [63:0] cam_loc64;
req  [63:0] cam_loc65;
req  [63:0] cam_loc66;
req  [63:0] cam_loc67;
req  [63:0] cam_loc68;
req  [63:0] cam_loc69;
req  [63:0] cam_loc70;
req  [63:0] cam_loc71;
req  [63:0] cam_loc72;
req  [63:0] cam_loc73;
req  [63:0] cam_loc74;
req  [63:0] cam_loc75;
req  [63:0] cam_loc76;
req  [63:0] cam_loc77;
req  [63:0] cam_loc78;
req  [63:0] cam_loc79;
req  [63:0] cam_loc80;
req  [63:0] cam_loc81;
req  [63:0] cam_loc82;
req  [63:0] cam_loc83;
req  [63:0] cam_loc84;
req  [63:0] cam_loc85;
req  [63:0] cam_loc86;
req  [63:0] cam_loc87;
req  [63:0] cam_loc88;
req  [63:0] cam_loc89;
req  [63:0] cam_loc90;
req  [63:0] cam_loc91;
req  [63:0] cam_loc92;
req  [63:0] cam_loc93;
req  [63:0] cam_loc94;
req  [63:0] cam_loc95;
req  [63:0] cam_loc96;
req  [63:0] cam_loc97;
req  [63:0] cam_loc98;
req  [63:0] cam_loc99;
req  [63:0] cam_loc100;
req  [63:0] cam_loc101;
req  [63:0] cam_loc102;
req  [63:0] cam_loc103;
req  [63:0] cam_loc104;
req  [63:0] cam_loc105;
req  [63:0] cam_loc106;
req  [63:0] cam_loc107;
req  [63:0] cam_loc108;
req  [63:0] cam_loc109;
req  [63:0] cam_loc110;
req  [63:0] cam_loc111;
req  [63:0] cam_loc112;
req  [63:0] cam_loc113;
req  [63:0] cam_loc114;
req  [63:0] cam_loc115;
req  [63:0] cam_loc116;
req  [63:0] cam_loc117;
req  [63:0] cam_loc118;
req  [63:0] cam_loc119;
req  [63:0] cam_loc120;
req  [63:0] cam_loc121;
req  [63:0] cam_loc122;
req  [63:0] cam_loc123;
req  [63:0] cam_loc124;
req  [63:0] cam_loc125;
req  [63:0] cam_loc126;
req  [63:0] cam_loc127;
req  [63:0] cam_loc128;
req  [63:0] cam_loc129;
req  [63:0] cam_loc130;
req  [63:0] cam_loc131;
req  [63:0] cam_loc132;
req  [63:0] cam_loc133;
req  [63:0] cam_loc134;
req  [63:0] cam_loc135;
req  [63:0] cam_loc136;
req  [63:0] cam_loc137;
req  [63:0] cam_loc138;
req  [63:0] cam_loc139;
req  [63:0] cam_loc140;
req  [63:0] cam_loc141;
req  [63:0] cam_loc142;
req  [63:0] cam_loc143;
req  [63:0] cam_loc144;
req  [63:0] cam_loc145;
req  [63:0] cam_loc146;
req  [63:0] cam_loc147;
req  [63:0] cam_loc148;
req  [63:0] cam_loc149;

        always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= 8+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[8] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end
AH_srvfifo_8_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);

assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[8]);
assign internal_wr_ptr = ~wr_location_counter[8 + 1] ? ~wr_location_counter[7:0] : recir_loc;

assign wr_ready	= ~wr_location_counter[8 + 1] ? 1'b1 : recir_loc_valid;

assign recir_loc_ready	= ~wr_location_counter[8 + 1] ? 1'b0 : wr_valid;

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin


	cam_loc0 <= 64'd0;
	cam_loc1 <= 64'd0;
	cam_loc2 <= 64'd0;
	cam_loc3 <= 64'd0;
	cam_loc4 <= 64'd0;
	cam_loc5 <= 64'd0;
	cam_loc6 <= 64'd0;
	cam_loc7 <= 64'd0;
	cam_loc8 <= 64'd0;
	cam_loc9 <= 64'd0;
	cam_loc10 <= 64'd0;
	cam_loc11 <= 64'd0;
	cam_loc12 <= 64'd0;
	cam_loc13 <= 64'd0;
	cam_loc14 <= 64'd0;
	cam_loc15 <= 64'd0;
	cam_loc16 <= 64'd0;
	cam_loc17 <= 64'd0;
	cam_loc18 <= 64'd0;
	cam_loc19 <= 64'd0;
	cam_loc20 <= 64'd0;
	cam_loc21 <= 64'd0;
	cam_loc22 <= 64'd0;
	cam_loc23 <= 64'd0;
	cam_loc24 <= 64'd0;
	cam_loc25 <= 64'd0;
	cam_loc26 <= 64'd0;
	cam_loc27 <= 64'd0;
	cam_loc28 <= 64'd0;
	cam_loc29 <= 64'd0;
	cam_loc30 <= 64'd0;
	cam_loc31 <= 64'd0;
	cam_loc32 <= 64'd0;
	cam_loc33 <= 64'd0;
	cam_loc34 <= 64'd0;
	cam_loc35 <= 64'd0;
	cam_loc36 <= 64'd0;
	cam_loc37 <= 64'd0;
	cam_loc38 <= 64'd0;
	cam_loc39 <= 64'd0;
	cam_loc40 <= 64'd0;
	cam_loc41 <= 64'd0;
	cam_loc42 <= 64'd0;
	cam_loc43 <= 64'd0;
	cam_loc44 <= 64'd0;
	cam_loc45 <= 64'd0;
	cam_loc46 <= 64'd0;
	cam_loc47 <= 64'd0;
	cam_loc48 <= 64'd0;
	cam_loc49 <= 64'd0;
	cam_loc50 <= 64'd0;
	cam_loc51 <= 64'd0;
	cam_loc52 <= 64'd0;
	cam_loc53 <= 64'd0;
	cam_loc54 <= 64'd0;
	cam_loc55 <= 64'd0;
	cam_loc56 <= 64'd0;
	cam_loc57 <= 64'd0;
	cam_loc58 <= 64'd0;
	cam_loc59 <= 64'd0;
	cam_loc60 <= 64'd0;
	cam_loc61 <= 64'd0;
	cam_loc62 <= 64'd0;
	cam_loc63 <= 64'd0;
	cam_loc64 <= 64'd0;
	cam_loc65 <= 64'd0;
	cam_loc66 <= 64'd0;
	cam_loc67 <= 64'd0;
	cam_loc68 <= 64'd0;
	cam_loc69 <= 64'd0;
	cam_loc70 <= 64'd0;
	cam_loc71 <= 64'd0;
	cam_loc72 <= 64'd0;
	cam_loc73 <= 64'd0;
	cam_loc74 <= 64'd0;
	cam_loc75 <= 64'd0;
	cam_loc76 <= 64'd0;
	cam_loc77 <= 64'd0;
	cam_loc78 <= 64'd0;
	cam_loc79 <= 64'd0;
	cam_loc80 <= 64'd0;
	cam_loc81 <= 64'd0;
	cam_loc82 <= 64'd0;
	cam_loc83 <= 64'd0;
	cam_loc84 <= 64'd0;
	cam_loc85 <= 64'd0;
	cam_loc86 <= 64'd0;
	cam_loc87 <= 64'd0;
	cam_loc88 <= 64'd0;
	cam_loc89 <= 64'd0;
	cam_loc90 <= 64'd0;
	cam_loc91 <= 64'd0;
	cam_loc92 <= 64'd0;
	cam_loc93 <= 64'd0;
	cam_loc94 <= 64'd0;
	cam_loc95 <= 64'd0;
	cam_loc96 <= 64'd0;
	cam_loc97 <= 64'd0;
	cam_loc98 <= 64'd0;
	cam_loc99 <= 64'd0;
	cam_loc100 <= 64'd0;
	cam_loc101 <= 64'd0;
	cam_loc102 <= 64'd0;
	cam_loc103 <= 64'd0;
	cam_loc104 <= 64'd0;
	cam_loc105 <= 64'd0;
	cam_loc106 <= 64'd0;
	cam_loc107 <= 64'd0;
	cam_loc108 <= 64'd0;
	cam_loc109 <= 64'd0;
	cam_loc110 <= 64'd0;
	cam_loc111 <= 64'd0;
	cam_loc112 <= 64'd0;
	cam_loc113 <= 64'd0;
	cam_loc114 <= 64'd0;
	cam_loc115 <= 64'd0;
	cam_loc116 <= 64'd0;
	cam_loc117 <= 64'd0;
	cam_loc118 <= 64'd0;
	cam_loc119 <= 64'd0;
	cam_loc120 <= 64'd0;
	cam_loc121 <= 64'd0;
	cam_loc122 <= 64'd0;
	cam_loc123 <= 64'd0;
	cam_loc124 <= 64'd0;
	cam_loc125 <= 64'd0;
	cam_loc126 <= 64'd0;
	cam_loc127 <= 64'd0;
	cam_loc128 <= 64'd0;
	cam_loc129 <= 64'd0;
	cam_loc130 <= 64'd0;
	cam_loc131 <= 64'd0;
	cam_loc132 <= 64'd0;
	cam_loc133 <= 64'd0;
	cam_loc134 <= 64'd0;
	cam_loc135 <= 64'd0;
	cam_loc136 <= 64'd0;
	cam_loc137 <= 64'd0;
	cam_loc138 <= 64'd0;
	cam_loc139 <= 64'd0;
	cam_loc140 <= 64'd0;
	cam_loc141 <= 64'd0;
	cam_loc142 <= 64'd0;
	cam_loc143 <= 64'd0;
	cam_loc144 <= 64'd0;
	cam_loc145 <= 64'd0;
	cam_loc146 <= 64'd0;
	cam_loc147 <= 64'd0;
	cam_loc148 <= 64'd0;
	cam_loc149 <= 64'd0;


end else begin

	cam_loc0 <= (internal_wr_en & (internal_wr_ptr == 8'd0) ) ? wr_data : cam_loc0;
	cam_loc1 <= (internal_wr_en & (internal_wr_ptr == 8'd1) ) ? wr_data : cam_loc1;
	cam_loc2 <= (internal_wr_en & (internal_wr_ptr == 8'd2) ) ? wr_data : cam_loc2;
	cam_loc3 <= (internal_wr_en & (internal_wr_ptr == 8'd3) ) ? wr_data : cam_loc3;
	cam_loc4 <= (internal_wr_en & (internal_wr_ptr == 8'd4) ) ? wr_data : cam_loc4;
	cam_loc5 <= (internal_wr_en & (internal_wr_ptr == 8'd5) ) ? wr_data : cam_loc5;
	cam_loc6 <= (internal_wr_en & (internal_wr_ptr == 8'd6) ) ? wr_data : cam_loc6;
	cam_loc7 <= (internal_wr_en & (internal_wr_ptr == 8'd7) ) ? wr_data : cam_loc7;
	cam_loc8 <= (internal_wr_en & (internal_wr_ptr == 8'd8) ) ? wr_data : cam_loc8;
	cam_loc9 <= (internal_wr_en & (internal_wr_ptr == 8'd9) ) ? wr_data : cam_loc9;
	cam_loc10 <= (internal_wr_en & (internal_wr_ptr == 8'd10) ) ? wr_data : cam_loc10;
	cam_loc11 <= (internal_wr_en & (internal_wr_ptr == 8'd11) ) ? wr_data : cam_loc11;
	cam_loc12 <= (internal_wr_en & (internal_wr_ptr == 8'd12) ) ? wr_data : cam_loc12;
	cam_loc13 <= (internal_wr_en & (internal_wr_ptr == 8'd13) ) ? wr_data : cam_loc13;
	cam_loc14 <= (internal_wr_en & (internal_wr_ptr == 8'd14) ) ? wr_data : cam_loc14;
	cam_loc15 <= (internal_wr_en & (internal_wr_ptr == 8'd15) ) ? wr_data : cam_loc15;
	cam_loc16 <= (internal_wr_en & (internal_wr_ptr == 8'd16) ) ? wr_data : cam_loc16;
	cam_loc17 <= (internal_wr_en & (internal_wr_ptr == 8'd17) ) ? wr_data : cam_loc17;
	cam_loc18 <= (internal_wr_en & (internal_wr_ptr == 8'd18) ) ? wr_data : cam_loc18;
	cam_loc19 <= (internal_wr_en & (internal_wr_ptr == 8'd19) ) ? wr_data : cam_loc19;
	cam_loc20 <= (internal_wr_en & (internal_wr_ptr == 8'd20) ) ? wr_data : cam_loc20;
	cam_loc21 <= (internal_wr_en & (internal_wr_ptr == 8'd21) ) ? wr_data : cam_loc21;
	cam_loc22 <= (internal_wr_en & (internal_wr_ptr == 8'd22) ) ? wr_data : cam_loc22;
	cam_loc23 <= (internal_wr_en & (internal_wr_ptr == 8'd23) ) ? wr_data : cam_loc23;
	cam_loc24 <= (internal_wr_en & (internal_wr_ptr == 8'd24) ) ? wr_data : cam_loc24;
	cam_loc25 <= (internal_wr_en & (internal_wr_ptr == 8'd25) ) ? wr_data : cam_loc25;
	cam_loc26 <= (internal_wr_en & (internal_wr_ptr == 8'd26) ) ? wr_data : cam_loc26;
	cam_loc27 <= (internal_wr_en & (internal_wr_ptr == 8'd27) ) ? wr_data : cam_loc27;
	cam_loc28 <= (internal_wr_en & (internal_wr_ptr == 8'd28) ) ? wr_data : cam_loc28;
	cam_loc29 <= (internal_wr_en & (internal_wr_ptr == 8'd29) ) ? wr_data : cam_loc29;
	cam_loc30 <= (internal_wr_en & (internal_wr_ptr == 8'd30) ) ? wr_data : cam_loc30;
	cam_loc31 <= (internal_wr_en & (internal_wr_ptr == 8'd31) ) ? wr_data : cam_loc31;
	cam_loc32 <= (internal_wr_en & (internal_wr_ptr == 8'd32) ) ? wr_data : cam_loc32;
	cam_loc33 <= (internal_wr_en & (internal_wr_ptr == 8'd33) ) ? wr_data : cam_loc33;
	cam_loc34 <= (internal_wr_en & (internal_wr_ptr == 8'd34) ) ? wr_data : cam_loc34;
	cam_loc35 <= (internal_wr_en & (internal_wr_ptr == 8'd35) ) ? wr_data : cam_loc35;
	cam_loc36 <= (internal_wr_en & (internal_wr_ptr == 8'd36) ) ? wr_data : cam_loc36;
	cam_loc37 <= (internal_wr_en & (internal_wr_ptr == 8'd37) ) ? wr_data : cam_loc37;
	cam_loc38 <= (internal_wr_en & (internal_wr_ptr == 8'd38) ) ? wr_data : cam_loc38;
	cam_loc39 <= (internal_wr_en & (internal_wr_ptr == 8'd39) ) ? wr_data : cam_loc39;
	cam_loc40 <= (internal_wr_en & (internal_wr_ptr == 8'd40) ) ? wr_data : cam_loc40;
	cam_loc41 <= (internal_wr_en & (internal_wr_ptr == 8'd41) ) ? wr_data : cam_loc41;
	cam_loc42 <= (internal_wr_en & (internal_wr_ptr == 8'd42) ) ? wr_data : cam_loc42;
	cam_loc43 <= (internal_wr_en & (internal_wr_ptr == 8'd43) ) ? wr_data : cam_loc43;
	cam_loc44 <= (internal_wr_en & (internal_wr_ptr == 8'd44) ) ? wr_data : cam_loc44;
	cam_loc45 <= (internal_wr_en & (internal_wr_ptr == 8'd45) ) ? wr_data : cam_loc45;
	cam_loc46 <= (internal_wr_en & (internal_wr_ptr == 8'd46) ) ? wr_data : cam_loc46;
	cam_loc47 <= (internal_wr_en & (internal_wr_ptr == 8'd47) ) ? wr_data : cam_loc47;
	cam_loc48 <= (internal_wr_en & (internal_wr_ptr == 8'd48) ) ? wr_data : cam_loc48;
	cam_loc49 <= (internal_wr_en & (internal_wr_ptr == 8'd49) ) ? wr_data : cam_loc49;
	cam_loc50 <= (internal_wr_en & (internal_wr_ptr == 8'd50) ) ? wr_data : cam_loc50;
	cam_loc51 <= (internal_wr_en & (internal_wr_ptr == 8'd51) ) ? wr_data : cam_loc51;
	cam_loc52 <= (internal_wr_en & (internal_wr_ptr == 8'd52) ) ? wr_data : cam_loc52;
	cam_loc53 <= (internal_wr_en & (internal_wr_ptr == 8'd53) ) ? wr_data : cam_loc53;
	cam_loc54 <= (internal_wr_en & (internal_wr_ptr == 8'd54) ) ? wr_data : cam_loc54;
	cam_loc55 <= (internal_wr_en & (internal_wr_ptr == 8'd55) ) ? wr_data : cam_loc55;
	cam_loc56 <= (internal_wr_en & (internal_wr_ptr == 8'd56) ) ? wr_data : cam_loc56;
	cam_loc57 <= (internal_wr_en & (internal_wr_ptr == 8'd57) ) ? wr_data : cam_loc57;
	cam_loc58 <= (internal_wr_en & (internal_wr_ptr == 8'd58) ) ? wr_data : cam_loc58;
	cam_loc59 <= (internal_wr_en & (internal_wr_ptr == 8'd59) ) ? wr_data : cam_loc59;
	cam_loc60 <= (internal_wr_en & (internal_wr_ptr == 8'd60) ) ? wr_data : cam_loc60;
	cam_loc61 <= (internal_wr_en & (internal_wr_ptr == 8'd61) ) ? wr_data : cam_loc61;
	cam_loc62 <= (internal_wr_en & (internal_wr_ptr == 8'd62) ) ? wr_data : cam_loc62;
	cam_loc63 <= (internal_wr_en & (internal_wr_ptr == 8'd63) ) ? wr_data : cam_loc63;
	cam_loc64 <= (internal_wr_en & (internal_wr_ptr == 8'd64) ) ? wr_data : cam_loc64;
	cam_loc65 <= (internal_wr_en & (internal_wr_ptr == 8'd65) ) ? wr_data : cam_loc65;
	cam_loc66 <= (internal_wr_en & (internal_wr_ptr == 8'd66) ) ? wr_data : cam_loc66;
	cam_loc67 <= (internal_wr_en & (internal_wr_ptr == 8'd67) ) ? wr_data : cam_loc67;
	cam_loc68 <= (internal_wr_en & (internal_wr_ptr == 8'd68) ) ? wr_data : cam_loc68;
	cam_loc69 <= (internal_wr_en & (internal_wr_ptr == 8'd69) ) ? wr_data : cam_loc69;
	cam_loc70 <= (internal_wr_en & (internal_wr_ptr == 8'd70) ) ? wr_data : cam_loc70;
	cam_loc71 <= (internal_wr_en & (internal_wr_ptr == 8'd71) ) ? wr_data : cam_loc71;
	cam_loc72 <= (internal_wr_en & (internal_wr_ptr == 8'd72) ) ? wr_data : cam_loc72;
	cam_loc73 <= (internal_wr_en & (internal_wr_ptr == 8'd73) ) ? wr_data : cam_loc73;
	cam_loc74 <= (internal_wr_en & (internal_wr_ptr == 8'd74) ) ? wr_data : cam_loc74;
	cam_loc75 <= (internal_wr_en & (internal_wr_ptr == 8'd75) ) ? wr_data : cam_loc75;
	cam_loc76 <= (internal_wr_en & (internal_wr_ptr == 8'd76) ) ? wr_data : cam_loc76;
	cam_loc77 <= (internal_wr_en & (internal_wr_ptr == 8'd77) ) ? wr_data : cam_loc77;
	cam_loc78 <= (internal_wr_en & (internal_wr_ptr == 8'd78) ) ? wr_data : cam_loc78;
	cam_loc79 <= (internal_wr_en & (internal_wr_ptr == 8'd79) ) ? wr_data : cam_loc79;
	cam_loc80 <= (internal_wr_en & (internal_wr_ptr == 8'd80) ) ? wr_data : cam_loc80;
	cam_loc81 <= (internal_wr_en & (internal_wr_ptr == 8'd81) ) ? wr_data : cam_loc81;
	cam_loc82 <= (internal_wr_en & (internal_wr_ptr == 8'd82) ) ? wr_data : cam_loc82;
	cam_loc83 <= (internal_wr_en & (internal_wr_ptr == 8'd83) ) ? wr_data : cam_loc83;
	cam_loc84 <= (internal_wr_en & (internal_wr_ptr == 8'd84) ) ? wr_data : cam_loc84;
	cam_loc85 <= (internal_wr_en & (internal_wr_ptr == 8'd85) ) ? wr_data : cam_loc85;
	cam_loc86 <= (internal_wr_en & (internal_wr_ptr == 8'd86) ) ? wr_data : cam_loc86;
	cam_loc87 <= (internal_wr_en & (internal_wr_ptr == 8'd87) ) ? wr_data : cam_loc87;
	cam_loc88 <= (internal_wr_en & (internal_wr_ptr == 8'd88) ) ? wr_data : cam_loc88;
	cam_loc89 <= (internal_wr_en & (internal_wr_ptr == 8'd89) ) ? wr_data : cam_loc89;
	cam_loc90 <= (internal_wr_en & (internal_wr_ptr == 8'd90) ) ? wr_data : cam_loc90;
	cam_loc91 <= (internal_wr_en & (internal_wr_ptr == 8'd91) ) ? wr_data : cam_loc91;
	cam_loc92 <= (internal_wr_en & (internal_wr_ptr == 8'd92) ) ? wr_data : cam_loc92;
	cam_loc93 <= (internal_wr_en & (internal_wr_ptr == 8'd93) ) ? wr_data : cam_loc93;
	cam_loc94 <= (internal_wr_en & (internal_wr_ptr == 8'd94) ) ? wr_data : cam_loc94;
	cam_loc95 <= (internal_wr_en & (internal_wr_ptr == 8'd95) ) ? wr_data : cam_loc95;
	cam_loc96 <= (internal_wr_en & (internal_wr_ptr == 8'd96) ) ? wr_data : cam_loc96;
	cam_loc97 <= (internal_wr_en & (internal_wr_ptr == 8'd97) ) ? wr_data : cam_loc97;
	cam_loc98 <= (internal_wr_en & (internal_wr_ptr == 8'd98) ) ? wr_data : cam_loc98;
	cam_loc99 <= (internal_wr_en & (internal_wr_ptr == 8'd99) ) ? wr_data : cam_loc99;
	cam_loc100 <= (internal_wr_en & (internal_wr_ptr == 8'd100) ) ? wr_data : cam_loc100;
	cam_loc101 <= (internal_wr_en & (internal_wr_ptr == 8'd101) ) ? wr_data : cam_loc101;
	cam_loc102 <= (internal_wr_en & (internal_wr_ptr == 8'd102) ) ? wr_data : cam_loc102;
	cam_loc103 <= (internal_wr_en & (internal_wr_ptr == 8'd103) ) ? wr_data : cam_loc103;
	cam_loc104 <= (internal_wr_en & (internal_wr_ptr == 8'd104) ) ? wr_data : cam_loc104;
	cam_loc105 <= (internal_wr_en & (internal_wr_ptr == 8'd105) ) ? wr_data : cam_loc105;
	cam_loc106 <= (internal_wr_en & (internal_wr_ptr == 8'd106) ) ? wr_data : cam_loc106;
	cam_loc107 <= (internal_wr_en & (internal_wr_ptr == 8'd107) ) ? wr_data : cam_loc107;
	cam_loc108 <= (internal_wr_en & (internal_wr_ptr == 8'd108) ) ? wr_data : cam_loc108;
	cam_loc109 <= (internal_wr_en & (internal_wr_ptr == 8'd109) ) ? wr_data : cam_loc109;
	cam_loc110 <= (internal_wr_en & (internal_wr_ptr == 8'd110) ) ? wr_data : cam_loc110;
	cam_loc111 <= (internal_wr_en & (internal_wr_ptr == 8'd111) ) ? wr_data : cam_loc111;
	cam_loc112 <= (internal_wr_en & (internal_wr_ptr == 8'd112) ) ? wr_data : cam_loc112;
	cam_loc113 <= (internal_wr_en & (internal_wr_ptr == 8'd113) ) ? wr_data : cam_loc113;
	cam_loc114 <= (internal_wr_en & (internal_wr_ptr == 8'd114) ) ? wr_data : cam_loc114;
	cam_loc115 <= (internal_wr_en & (internal_wr_ptr == 8'd115) ) ? wr_data : cam_loc115;
	cam_loc116 <= (internal_wr_en & (internal_wr_ptr == 8'd116) ) ? wr_data : cam_loc116;
	cam_loc117 <= (internal_wr_en & (internal_wr_ptr == 8'd117) ) ? wr_data : cam_loc117;
	cam_loc118 <= (internal_wr_en & (internal_wr_ptr == 8'd118) ) ? wr_data : cam_loc118;
	cam_loc119 <= (internal_wr_en & (internal_wr_ptr == 8'd119) ) ? wr_data : cam_loc119;
	cam_loc120 <= (internal_wr_en & (internal_wr_ptr == 8'd120) ) ? wr_data : cam_loc120;
	cam_loc121 <= (internal_wr_en & (internal_wr_ptr == 8'd121) ) ? wr_data : cam_loc121;
	cam_loc122 <= (internal_wr_en & (internal_wr_ptr == 8'd122) ) ? wr_data : cam_loc122;
	cam_loc123 <= (internal_wr_en & (internal_wr_ptr == 8'd123) ) ? wr_data : cam_loc123;
	cam_loc124 <= (internal_wr_en & (internal_wr_ptr == 8'd124) ) ? wr_data : cam_loc124;
	cam_loc125 <= (internal_wr_en & (internal_wr_ptr == 8'd125) ) ? wr_data : cam_loc125;
	cam_loc126 <= (internal_wr_en & (internal_wr_ptr == 8'd126) ) ? wr_data : cam_loc126;
	cam_loc127 <= (internal_wr_en & (internal_wr_ptr == 8'd127) ) ? wr_data : cam_loc127;
	cam_loc128 <= (internal_wr_en & (internal_wr_ptr == 8'd128) ) ? wr_data : cam_loc128;
	cam_loc129 <= (internal_wr_en & (internal_wr_ptr == 8'd129) ) ? wr_data : cam_loc129;
	cam_loc130 <= (internal_wr_en & (internal_wr_ptr == 8'd130) ) ? wr_data : cam_loc130;
	cam_loc131 <= (internal_wr_en & (internal_wr_ptr == 8'd131) ) ? wr_data : cam_loc131;
	cam_loc132 <= (internal_wr_en & (internal_wr_ptr == 8'd132) ) ? wr_data : cam_loc132;
	cam_loc133 <= (internal_wr_en & (internal_wr_ptr == 8'd133) ) ? wr_data : cam_loc133;
	cam_loc134 <= (internal_wr_en & (internal_wr_ptr == 8'd134) ) ? wr_data : cam_loc134;
	cam_loc135 <= (internal_wr_en & (internal_wr_ptr == 8'd135) ) ? wr_data : cam_loc135;
	cam_loc136 <= (internal_wr_en & (internal_wr_ptr == 8'd136) ) ? wr_data : cam_loc136;
	cam_loc137 <= (internal_wr_en & (internal_wr_ptr == 8'd137) ) ? wr_data : cam_loc137;
	cam_loc138 <= (internal_wr_en & (internal_wr_ptr == 8'd138) ) ? wr_data : cam_loc138;
	cam_loc139 <= (internal_wr_en & (internal_wr_ptr == 8'd139) ) ? wr_data : cam_loc139;
	cam_loc140 <= (internal_wr_en & (internal_wr_ptr == 8'd140) ) ? wr_data : cam_loc140;
	cam_loc141 <= (internal_wr_en & (internal_wr_ptr == 8'd141) ) ? wr_data : cam_loc141;
	cam_loc142 <= (internal_wr_en & (internal_wr_ptr == 8'd142) ) ? wr_data : cam_loc142;
	cam_loc143 <= (internal_wr_en & (internal_wr_ptr == 8'd143) ) ? wr_data : cam_loc143;
	cam_loc144 <= (internal_wr_en & (internal_wr_ptr == 8'd144) ) ? wr_data : cam_loc144;
	cam_loc145 <= (internal_wr_en & (internal_wr_ptr == 8'd145) ) ? wr_data : cam_loc145;
	cam_loc146 <= (internal_wr_en & (internal_wr_ptr == 8'd146) ) ? wr_data : cam_loc146;
	cam_loc147 <= (internal_wr_en & (internal_wr_ptr == 8'd147) ) ? wr_data : cam_loc147;
	cam_loc148 <= (internal_wr_en & (internal_wr_ptr == 8'd148) ) ? wr_data : cam_loc148;
	cam_loc149 <= (internal_wr_en & (internal_wr_ptr == 8'd149) ) ? wr_data : cam_loc149;


end

wire assign snoop_match = freedup_loc_ready) & (

(snoop_in == cam_loc0[34:0]) |
 (snoop_in == cam_loc1[34:0]) |
 (snoop_in == cam_loc2[34:0]) |
 (snoop_in == cam_loc3[34:0]) |
 (snoop_in == cam_loc4[34:0]) |
 (snoop_in == cam_loc5[34:0]) |
 (snoop_in == cam_loc6[34:0]) |
 (snoop_in == cam_loc7[34:0]) |
 (snoop_in == cam_loc8[34:0]) |
 (snoop_in == cam_loc9[34:0]) |
 (snoop_in == cam_loc10[34:0]) |
 (snoop_in == cam_loc11[34:0]) |
 (snoop_in == cam_loc12[34:0]) |
 (snoop_in == cam_loc13[34:0]) |
 (snoop_in == cam_loc14[34:0]) |
 (snoop_in == cam_loc15[34:0]) |
 (snoop_in == cam_loc16[34:0]) |
 (snoop_in == cam_loc17[34:0]) |
 (snoop_in == cam_loc18[34:0]) |
 (snoop_in == cam_loc19[34:0]) |
 (snoop_in == cam_loc20[34:0]) |
 (snoop_in == cam_loc21[34:0]) |
 (snoop_in == cam_loc22[34:0]) |
 (snoop_in == cam_loc23[34:0]) |
 (snoop_in == cam_loc24[34:0]) |
 (snoop_in == cam_loc25[34:0]) |
 (snoop_in == cam_loc26[34:0]) |
 (snoop_in == cam_loc27[34:0]) |
 (snoop_in == cam_loc28[34:0]) |
 (snoop_in == cam_loc29[34:0]) |
 (snoop_in == cam_loc30[34:0]) |
 (snoop_in == cam_loc31[34:0]) |
 (snoop_in == cam_loc32[34:0]) |
 (snoop_in == cam_loc33[34:0]) |
 (snoop_in == cam_loc34[34:0]) |
 (snoop_in == cam_loc35[34:0]) |
 (snoop_in == cam_loc36[34:0]) |
 (snoop_in == cam_loc37[34:0]) |
 (snoop_in == cam_loc38[34:0]) |
 (snoop_in == cam_loc39[34:0]) |
 (snoop_in == cam_loc40[34:0]) |
 (snoop_in == cam_loc41[34:0]) |
 (snoop_in == cam_loc42[34:0]) |
 (snoop_in == cam_loc43[34:0]) |
 (snoop_in == cam_loc44[34:0]) |
 (snoop_in == cam_loc45[34:0]) |
 (snoop_in == cam_loc46[34:0]) |
 (snoop_in == cam_loc47[34:0]) |
 (snoop_in == cam_loc48[34:0]) |
 (snoop_in == cam_loc49[34:0]) |
 (snoop_in == cam_loc50[34:0]) |
 (snoop_in == cam_loc51[34:0]) |
 (snoop_in == cam_loc52[34:0]) |
 (snoop_in == cam_loc53[34:0]) |
 (snoop_in == cam_loc54[34:0]) |
 (snoop_in == cam_loc55[34:0]) |
 (snoop_in == cam_loc56[34:0]) |
 (snoop_in == cam_loc57[34:0]) |
 (snoop_in == cam_loc58[34:0]) |
 (snoop_in == cam_loc59[34:0]) |
 (snoop_in == cam_loc60[34:0]) |
 (snoop_in == cam_loc61[34:0]) |
 (snoop_in == cam_loc62[34:0]) |
 (snoop_in == cam_loc63[34:0]) |
 (snoop_in == cam_loc64[34:0]) |
 (snoop_in == cam_loc65[34:0]) |
 (snoop_in == cam_loc66[34:0]) |
 (snoop_in == cam_loc67[34:0]) |
 (snoop_in == cam_loc68[34:0]) |
 (snoop_in == cam_loc69[34:0]) |
 (snoop_in == cam_loc70[34:0]) |
 (snoop_in == cam_loc71[34:0]) |
 (snoop_in == cam_loc72[34:0]) |
 (snoop_in == cam_loc73[34:0]) |
 (snoop_in == cam_loc74[34:0]) |
 (snoop_in == cam_loc75[34:0]) |
 (snoop_in == cam_loc76[34:0]) |
 (snoop_in == cam_loc77[34:0]) |
 (snoop_in == cam_loc78[34:0]) |
 (snoop_in == cam_loc79[34:0]) |
 (snoop_in == cam_loc80[34:0]) |
 (snoop_in == cam_loc81[34:0]) |
 (snoop_in == cam_loc82[34:0]) |
 (snoop_in == cam_loc83[34:0]) |
 (snoop_in == cam_loc84[34:0]) |
 (snoop_in == cam_loc85[34:0]) |
 (snoop_in == cam_loc86[34:0]) |
 (snoop_in == cam_loc87[34:0]) |
 (snoop_in == cam_loc88[34:0]) |
 (snoop_in == cam_loc89[34:0]) |
 (snoop_in == cam_loc90[34:0]) |
 (snoop_in == cam_loc91[34:0]) |
 (snoop_in == cam_loc92[34:0]) |
 (snoop_in == cam_loc93[34:0]) |
 (snoop_in == cam_loc94[34:0]) |
 (snoop_in == cam_loc95[34:0]) |
 (snoop_in == cam_loc96[34:0]) |
 (snoop_in == cam_loc97[34:0]) |
 (snoop_in == cam_loc98[34:0]) |
 (snoop_in == cam_loc99[34:0]) |
 (snoop_in == cam_loc100[34:0]) |
 (snoop_in == cam_loc101[34:0]) |
 (snoop_in == cam_loc102[34:0]) |
 (snoop_in == cam_loc103[34:0]) |
 (snoop_in == cam_loc104[34:0]) |
 (snoop_in == cam_loc105[34:0]) |
 (snoop_in == cam_loc106[34:0]) |
 (snoop_in == cam_loc107[34:0]) |
 (snoop_in == cam_loc108[34:0]) |
 (snoop_in == cam_loc109[34:0]) |
 (snoop_in == cam_loc110[34:0]) |
 (snoop_in == cam_loc111[34:0]) |
 (snoop_in == cam_loc112[34:0]) |
 (snoop_in == cam_loc113[34:0]) |
 (snoop_in == cam_loc114[34:0]) |
 (snoop_in == cam_loc115[34:0]) |
 (snoop_in == cam_loc116[34:0]) |
 (snoop_in == cam_loc117[34:0]) |
 (snoop_in == cam_loc118[34:0]) |
 (snoop_in == cam_loc119[34:0]) |
 (snoop_in == cam_loc120[34:0]) |
 (snoop_in == cam_loc121[34:0]) |
 (snoop_in == cam_loc122[34:0]) |
 (snoop_in == cam_loc123[34:0]) |
 (snoop_in == cam_loc124[34:0]) |
 (snoop_in == cam_loc125[34:0]) |
 (snoop_in == cam_loc126[34:0]) |
 (snoop_in == cam_loc127[34:0]) |
 (snoop_in == cam_loc128[34:0]) |
 (snoop_in == cam_loc129[34:0]) |
 (snoop_in == cam_loc130[34:0]) |
 (snoop_in == cam_loc131[34:0]) |
 (snoop_in == cam_loc132[34:0]) |
 (snoop_in == cam_loc133[34:0]) |
 (snoop_in == cam_loc134[34:0]) |
 (snoop_in == cam_loc135[34:0]) |
 (snoop_in == cam_loc136[34:0]) |
 (snoop_in == cam_loc137[34:0]) |
 (snoop_in == cam_loc138[34:0]) |
 (snoop_in == cam_loc139[34:0]) |
 (snoop_in == cam_loc140[34:0]) |
 (snoop_in == cam_loc141[34:0]) |
 (snoop_in == cam_loc142[34:0]) |
 (snoop_in == cam_loc143[34:0]) |
 (snoop_in == cam_loc144[34:0]) |
 (snoop_in == cam_loc145[34:0]) |
 (snoop_in == cam_loc146[34:0]) |
 (snoop_in == cam_loc147[34:0]) |
 (snoop_in == cam_loc148[34:0]) |
 (snoop_in == cam_loc149[34:0])

);

wire assign snoop_data = 64'd0 |
( (snoop_in == cam_loc0[34:0]) ? cam_loc0 : 64'd0 ) |
 ( (snoop_in == cam_loc1[34:0]) ? cam_loc1 : 64'd0 ) |
 ( (snoop_in == cam_loc2[34:0]) ? cam_loc2 : 64'd0 ) |
 ( (snoop_in == cam_loc3[34:0]) ? cam_loc3 : 64'd0 ) |
 ( (snoop_in == cam_loc4[34:0]) ? cam_loc4 : 64'd0 ) |
 ( (snoop_in == cam_loc5[34:0]) ? cam_loc5 : 64'd0 ) |
 ( (snoop_in == cam_loc6[34:0]) ? cam_loc6 : 64'd0 ) |
 ( (snoop_in == cam_loc7[34:0]) ? cam_loc7 : 64'd0 ) |
 ( (snoop_in == cam_loc8[34:0]) ? cam_loc8 : 64'd0 ) |
 ( (snoop_in == cam_loc9[34:0]) ? cam_loc9 : 64'd0 ) |
 ( (snoop_in == cam_loc10[34:0]) ? cam_loc10 : 64'd0 ) |
 ( (snoop_in == cam_loc11[34:0]) ? cam_loc11 : 64'd0 ) |
 ( (snoop_in == cam_loc12[34:0]) ? cam_loc12 : 64'd0 ) |
 ( (snoop_in == cam_loc13[34:0]) ? cam_loc13 : 64'd0 ) |
 ( (snoop_in == cam_loc14[34:0]) ? cam_loc14 : 64'd0 ) |
 ( (snoop_in == cam_loc15[34:0]) ? cam_loc15 : 64'd0 ) |
 ( (snoop_in == cam_loc16[34:0]) ? cam_loc16 : 64'd0 ) |
 ( (snoop_in == cam_loc17[34:0]) ? cam_loc17 : 64'd0 ) |
 ( (snoop_in == cam_loc18[34:0]) ? cam_loc18 : 64'd0 ) |
 ( (snoop_in == cam_loc19[34:0]) ? cam_loc19 : 64'd0 ) |
 ( (snoop_in == cam_loc20[34:0]) ? cam_loc20 : 64'd0 ) |
 ( (snoop_in == cam_loc21[34:0]) ? cam_loc21 : 64'd0 ) |
 ( (snoop_in == cam_loc22[34:0]) ? cam_loc22 : 64'd0 ) |
 ( (snoop_in == cam_loc23[34:0]) ? cam_loc23 : 64'd0 ) |
 ( (snoop_in == cam_loc24[34:0]) ? cam_loc24 : 64'd0 ) |
 ( (snoop_in == cam_loc25[34:0]) ? cam_loc25 : 64'd0 ) |
 ( (snoop_in == cam_loc26[34:0]) ? cam_loc26 : 64'd0 ) |
 ( (snoop_in == cam_loc27[34:0]) ? cam_loc27 : 64'd0 ) |
 ( (snoop_in == cam_loc28[34:0]) ? cam_loc28 : 64'd0 ) |
 ( (snoop_in == cam_loc29[34:0]) ? cam_loc29 : 64'd0 ) |
 ( (snoop_in == cam_loc30[34:0]) ? cam_loc30 : 64'd0 ) |
 ( (snoop_in == cam_loc31[34:0]) ? cam_loc31 : 64'd0 ) |
 ( (snoop_in == cam_loc32[34:0]) ? cam_loc32 : 64'd0 ) |
 ( (snoop_in == cam_loc33[34:0]) ? cam_loc33 : 64'd0 ) |
 ( (snoop_in == cam_loc34[34:0]) ? cam_loc34 : 64'd0 ) |
 ( (snoop_in == cam_loc35[34:0]) ? cam_loc35 : 64'd0 ) |
 ( (snoop_in == cam_loc36[34:0]) ? cam_loc36 : 64'd0 ) |
 ( (snoop_in == cam_loc37[34:0]) ? cam_loc37 : 64'd0 ) |
 ( (snoop_in == cam_loc38[34:0]) ? cam_loc38 : 64'd0 ) |
 ( (snoop_in == cam_loc39[34:0]) ? cam_loc39 : 64'd0 ) |
 ( (snoop_in == cam_loc40[34:0]) ? cam_loc40 : 64'd0 ) |
 ( (snoop_in == cam_loc41[34:0]) ? cam_loc41 : 64'd0 ) |
 ( (snoop_in == cam_loc42[34:0]) ? cam_loc42 : 64'd0 ) |
 ( (snoop_in == cam_loc43[34:0]) ? cam_loc43 : 64'd0 ) |
 ( (snoop_in == cam_loc44[34:0]) ? cam_loc44 : 64'd0 ) |
 ( (snoop_in == cam_loc45[34:0]) ? cam_loc45 : 64'd0 ) |
 ( (snoop_in == cam_loc46[34:0]) ? cam_loc46 : 64'd0 ) |
 ( (snoop_in == cam_loc47[34:0]) ? cam_loc47 : 64'd0 ) |
 ( (snoop_in == cam_loc48[34:0]) ? cam_loc48 : 64'd0 ) |
 ( (snoop_in == cam_loc49[34:0]) ? cam_loc49 : 64'd0 ) |
 ( (snoop_in == cam_loc50[34:0]) ? cam_loc50 : 64'd0 ) |
 ( (snoop_in == cam_loc51[34:0]) ? cam_loc51 : 64'd0 ) |
 ( (snoop_in == cam_loc52[34:0]) ? cam_loc52 : 64'd0 ) |
 ( (snoop_in == cam_loc53[34:0]) ? cam_loc53 : 64'd0 ) |
 ( (snoop_in == cam_loc54[34:0]) ? cam_loc54 : 64'd0 ) |
 ( (snoop_in == cam_loc55[34:0]) ? cam_loc55 : 64'd0 ) |
 ( (snoop_in == cam_loc56[34:0]) ? cam_loc56 : 64'd0 ) |
 ( (snoop_in == cam_loc57[34:0]) ? cam_loc57 : 64'd0 ) |
 ( (snoop_in == cam_loc58[34:0]) ? cam_loc58 : 64'd0 ) |
 ( (snoop_in == cam_loc59[34:0]) ? cam_loc59 : 64'd0 ) |
 ( (snoop_in == cam_loc60[34:0]) ? cam_loc60 : 64'd0 ) |
 ( (snoop_in == cam_loc61[34:0]) ? cam_loc61 : 64'd0 ) |
 ( (snoop_in == cam_loc62[34:0]) ? cam_loc62 : 64'd0 ) |
 ( (snoop_in == cam_loc63[34:0]) ? cam_loc63 : 64'd0 ) |
 ( (snoop_in == cam_loc64[34:0]) ? cam_loc64 : 64'd0 ) |
 ( (snoop_in == cam_loc65[34:0]) ? cam_loc65 : 64'd0 ) |
 ( (snoop_in == cam_loc66[34:0]) ? cam_loc66 : 64'd0 ) |
 ( (snoop_in == cam_loc67[34:0]) ? cam_loc67 : 64'd0 ) |
 ( (snoop_in == cam_loc68[34:0]) ? cam_loc68 : 64'd0 ) |
 ( (snoop_in == cam_loc69[34:0]) ? cam_loc69 : 64'd0 ) |
 ( (snoop_in == cam_loc70[34:0]) ? cam_loc70 : 64'd0 ) |
 ( (snoop_in == cam_loc71[34:0]) ? cam_loc71 : 64'd0 ) |
 ( (snoop_in == cam_loc72[34:0]) ? cam_loc72 : 64'd0 ) |
 ( (snoop_in == cam_loc73[34:0]) ? cam_loc73 : 64'd0 ) |
 ( (snoop_in == cam_loc74[34:0]) ? cam_loc74 : 64'd0 ) |
 ( (snoop_in == cam_loc75[34:0]) ? cam_loc75 : 64'd0 ) |
 ( (snoop_in == cam_loc76[34:0]) ? cam_loc76 : 64'd0 ) |
 ( (snoop_in == cam_loc77[34:0]) ? cam_loc77 : 64'd0 ) |
 ( (snoop_in == cam_loc78[34:0]) ? cam_loc78 : 64'd0 ) |
 ( (snoop_in == cam_loc79[34:0]) ? cam_loc79 : 64'd0 ) |
 ( (snoop_in == cam_loc80[34:0]) ? cam_loc80 : 64'd0 ) |
 ( (snoop_in == cam_loc81[34:0]) ? cam_loc81 : 64'd0 ) |
 ( (snoop_in == cam_loc82[34:0]) ? cam_loc82 : 64'd0 ) |
 ( (snoop_in == cam_loc83[34:0]) ? cam_loc83 : 64'd0 ) |
 ( (snoop_in == cam_loc84[34:0]) ? cam_loc84 : 64'd0 ) |
 ( (snoop_in == cam_loc85[34:0]) ? cam_loc85 : 64'd0 ) |
 ( (snoop_in == cam_loc86[34:0]) ? cam_loc86 : 64'd0 ) |
 ( (snoop_in == cam_loc87[34:0]) ? cam_loc87 : 64'd0 ) |
 ( (snoop_in == cam_loc88[34:0]) ? cam_loc88 : 64'd0 ) |
 ( (snoop_in == cam_loc89[34:0]) ? cam_loc89 : 64'd0 ) |
 ( (snoop_in == cam_loc90[34:0]) ? cam_loc90 : 64'd0 ) |
 ( (snoop_in == cam_loc91[34:0]) ? cam_loc91 : 64'd0 ) |
 ( (snoop_in == cam_loc92[34:0]) ? cam_loc92 : 64'd0 ) |
 ( (snoop_in == cam_loc93[34:0]) ? cam_loc93 : 64'd0 ) |
 ( (snoop_in == cam_loc94[34:0]) ? cam_loc94 : 64'd0 ) |
 ( (snoop_in == cam_loc95[34:0]) ? cam_loc95 : 64'd0 ) |
 ( (snoop_in == cam_loc96[34:0]) ? cam_loc96 : 64'd0 ) |
 ( (snoop_in == cam_loc97[34:0]) ? cam_loc97 : 64'd0 ) |
 ( (snoop_in == cam_loc98[34:0]) ? cam_loc98 : 64'd0 ) |
 ( (snoop_in == cam_loc99[34:0]) ? cam_loc99 : 64'd0 ) |
 ( (snoop_in == cam_loc100[34:0]) ? cam_loc100 : 64'd0 ) |
 ( (snoop_in == cam_loc101[34:0]) ? cam_loc101 : 64'd0 ) |
 ( (snoop_in == cam_loc102[34:0]) ? cam_loc102 : 64'd0 ) |
 ( (snoop_in == cam_loc103[34:0]) ? cam_loc103 : 64'd0 ) |
 ( (snoop_in == cam_loc104[34:0]) ? cam_loc104 : 64'd0 ) |
 ( (snoop_in == cam_loc105[34:0]) ? cam_loc105 : 64'd0 ) |
 ( (snoop_in == cam_loc106[34:0]) ? cam_loc106 : 64'd0 ) |
 ( (snoop_in == cam_loc107[34:0]) ? cam_loc107 : 64'd0 ) |
 ( (snoop_in == cam_loc108[34:0]) ? cam_loc108 : 64'd0 ) |
 ( (snoop_in == cam_loc109[34:0]) ? cam_loc109 : 64'd0 ) |
 ( (snoop_in == cam_loc110[34:0]) ? cam_loc110 : 64'd0 ) |
 ( (snoop_in == cam_loc111[34:0]) ? cam_loc111 : 64'd0 ) |
 ( (snoop_in == cam_loc112[34:0]) ? cam_loc112 : 64'd0 ) |
 ( (snoop_in == cam_loc113[34:0]) ? cam_loc113 : 64'd0 ) |
 ( (snoop_in == cam_loc114[34:0]) ? cam_loc114 : 64'd0 ) |
 ( (snoop_in == cam_loc115[34:0]) ? cam_loc115 : 64'd0 ) |
 ( (snoop_in == cam_loc116[34:0]) ? cam_loc116 : 64'd0 ) |
 ( (snoop_in == cam_loc117[34:0]) ? cam_loc117 : 64'd0 ) |
 ( (snoop_in == cam_loc118[34:0]) ? cam_loc118 : 64'd0 ) |
 ( (snoop_in == cam_loc119[34:0]) ? cam_loc119 : 64'd0 ) |
 ( (snoop_in == cam_loc120[34:0]) ? cam_loc120 : 64'd0 ) |
 ( (snoop_in == cam_loc121[34:0]) ? cam_loc121 : 64'd0 ) |
 ( (snoop_in == cam_loc122[34:0]) ? cam_loc122 : 64'd0 ) |
 ( (snoop_in == cam_loc123[34:0]) ? cam_loc123 : 64'd0 ) |
 ( (snoop_in == cam_loc124[34:0]) ? cam_loc124 : 64'd0 ) |
 ( (snoop_in == cam_loc125[34:0]) ? cam_loc125 : 64'd0 ) |
 ( (snoop_in == cam_loc126[34:0]) ? cam_loc126 : 64'd0 ) |
 ( (snoop_in == cam_loc127[34:0]) ? cam_loc127 : 64'd0 ) |
 ( (snoop_in == cam_loc128[34:0]) ? cam_loc128 : 64'd0 ) |
 ( (snoop_in == cam_loc129[34:0]) ? cam_loc129 : 64'd0 ) |
 ( (snoop_in == cam_loc130[34:0]) ? cam_loc130 : 64'd0 ) |
 ( (snoop_in == cam_loc131[34:0]) ? cam_loc131 : 64'd0 ) |
 ( (snoop_in == cam_loc132[34:0]) ? cam_loc132 : 64'd0 ) |
 ( (snoop_in == cam_loc133[34:0]) ? cam_loc133 : 64'd0 ) |
 ( (snoop_in == cam_loc134[34:0]) ? cam_loc134 : 64'd0 ) |
 ( (snoop_in == cam_loc135[34:0]) ? cam_loc135 : 64'd0 ) |
 ( (snoop_in == cam_loc136[34:0]) ? cam_loc136 : 64'd0 ) |
 ( (snoop_in == cam_loc137[34:0]) ? cam_loc137 : 64'd0 ) |
 ( (snoop_in == cam_loc138[34:0]) ? cam_loc138 : 64'd0 ) |
 ( (snoop_in == cam_loc139[34:0]) ? cam_loc139 : 64'd0 ) |
 ( (snoop_in == cam_loc140[34:0]) ? cam_loc140 : 64'd0 ) |
 ( (snoop_in == cam_loc141[34:0]) ? cam_loc141 : 64'd0 ) |
 ( (snoop_in == cam_loc142[34:0]) ? cam_loc142 : 64'd0 ) |
 ( (snoop_in == cam_loc143[34:0]) ? cam_loc143 : 64'd0 ) |
 ( (snoop_in == cam_loc144[34:0]) ? cam_loc144 : 64'd0 ) |
 ( (snoop_in == cam_loc145[34:0]) ? cam_loc145 : 64'd0 ) |
 ( (snoop_in == cam_loc146[34:0]) ? cam_loc146 : 64'd0 ) |
 ( (snoop_in == cam_loc147[34:0]) ? cam_loc147 : 64'd0 ) |
 ( (snoop_in == cam_loc148[34:0]) ? cam_loc148 : 64'd0 ) |
 ( (snoop_in == cam_loc149[34:0]) ? cam_loc149 : 64'd0 )

;

wire assign freeup_loc = 8'd0 |
( (snoop_in == cam_loc0[34:0]) ? cam_loc0 : 8'd0 ) |
 ( (snoop_in == cam_loc1[34:0]) ? cam_loc1 : 8'd1 ) |
 ( (snoop_in == cam_loc2[34:0]) ? cam_loc2 : 8'd2 ) |
 ( (snoop_in == cam_loc3[34:0]) ? cam_loc3 : 8'd3 ) |
 ( (snoop_in == cam_loc4[34:0]) ? cam_loc4 : 8'd4 ) |
 ( (snoop_in == cam_loc5[34:0]) ? cam_loc5 : 8'd5 ) |
 ( (snoop_in == cam_loc6[34:0]) ? cam_loc6 : 8'd6 ) |
 ( (snoop_in == cam_loc7[34:0]) ? cam_loc7 : 8'd7 ) |
 ( (snoop_in == cam_loc8[34:0]) ? cam_loc8 : 8'd8 ) |
 ( (snoop_in == cam_loc9[34:0]) ? cam_loc9 : 8'd9 ) |
 ( (snoop_in == cam_loc10[34:0]) ? cam_loc10 : 8'd10 ) |
 ( (snoop_in == cam_loc11[34:0]) ? cam_loc11 : 8'd11 ) |
 ( (snoop_in == cam_loc12[34:0]) ? cam_loc12 : 8'd12 ) |
 ( (snoop_in == cam_loc13[34:0]) ? cam_loc13 : 8'd13 ) |
 ( (snoop_in == cam_loc14[34:0]) ? cam_loc14 : 8'd14 ) |
 ( (snoop_in == cam_loc15[34:0]) ? cam_loc15 : 8'd15 ) |
 ( (snoop_in == cam_loc16[34:0]) ? cam_loc16 : 8'd16 ) |
 ( (snoop_in == cam_loc17[34:0]) ? cam_loc17 : 8'd17 ) |
 ( (snoop_in == cam_loc18[34:0]) ? cam_loc18 : 8'd18 ) |
 ( (snoop_in == cam_loc19[34:0]) ? cam_loc19 : 8'd19 ) |
 ( (snoop_in == cam_loc20[34:0]) ? cam_loc20 : 8'd20 ) |
 ( (snoop_in == cam_loc21[34:0]) ? cam_loc21 : 8'd21 ) |
 ( (snoop_in == cam_loc22[34:0]) ? cam_loc22 : 8'd22 ) |
 ( (snoop_in == cam_loc23[34:0]) ? cam_loc23 : 8'd23 ) |
 ( (snoop_in == cam_loc24[34:0]) ? cam_loc24 : 8'd24 ) |
 ( (snoop_in == cam_loc25[34:0]) ? cam_loc25 : 8'd25 ) |
 ( (snoop_in == cam_loc26[34:0]) ? cam_loc26 : 8'd26 ) |
 ( (snoop_in == cam_loc27[34:0]) ? cam_loc27 : 8'd27 ) |
 ( (snoop_in == cam_loc28[34:0]) ? cam_loc28 : 8'd28 ) |
 ( (snoop_in == cam_loc29[34:0]) ? cam_loc29 : 8'd29 ) |
 ( (snoop_in == cam_loc30[34:0]) ? cam_loc30 : 8'd30 ) |
 ( (snoop_in == cam_loc31[34:0]) ? cam_loc31 : 8'd31 ) |
 ( (snoop_in == cam_loc32[34:0]) ? cam_loc32 : 8'd32 ) |
 ( (snoop_in == cam_loc33[34:0]) ? cam_loc33 : 8'd33 ) |
 ( (snoop_in == cam_loc34[34:0]) ? cam_loc34 : 8'd34 ) |
 ( (snoop_in == cam_loc35[34:0]) ? cam_loc35 : 8'd35 ) |
 ( (snoop_in == cam_loc36[34:0]) ? cam_loc36 : 8'd36 ) |
 ( (snoop_in == cam_loc37[34:0]) ? cam_loc37 : 8'd37 ) |
 ( (snoop_in == cam_loc38[34:0]) ? cam_loc38 : 8'd38 ) |
 ( (snoop_in == cam_loc39[34:0]) ? cam_loc39 : 8'd39 ) |
 ( (snoop_in == cam_loc40[34:0]) ? cam_loc40 : 8'd40 ) |
 ( (snoop_in == cam_loc41[34:0]) ? cam_loc41 : 8'd41 ) |
 ( (snoop_in == cam_loc42[34:0]) ? cam_loc42 : 8'd42 ) |
 ( (snoop_in == cam_loc43[34:0]) ? cam_loc43 : 8'd43 ) |
 ( (snoop_in == cam_loc44[34:0]) ? cam_loc44 : 8'd44 ) |
 ( (snoop_in == cam_loc45[34:0]) ? cam_loc45 : 8'd45 ) |
 ( (snoop_in == cam_loc46[34:0]) ? cam_loc46 : 8'd46 ) |
 ( (snoop_in == cam_loc47[34:0]) ? cam_loc47 : 8'd47 ) |
 ( (snoop_in == cam_loc48[34:0]) ? cam_loc48 : 8'd48 ) |
 ( (snoop_in == cam_loc49[34:0]) ? cam_loc49 : 8'd49 ) |
 ( (snoop_in == cam_loc50[34:0]) ? cam_loc50 : 8'd50 ) |
 ( (snoop_in == cam_loc51[34:0]) ? cam_loc51 : 8'd51 ) |
 ( (snoop_in == cam_loc52[34:0]) ? cam_loc52 : 8'd52 ) |
 ( (snoop_in == cam_loc53[34:0]) ? cam_loc53 : 8'd53 ) |
 ( (snoop_in == cam_loc54[34:0]) ? cam_loc54 : 8'd54 ) |
 ( (snoop_in == cam_loc55[34:0]) ? cam_loc55 : 8'd55 ) |
 ( (snoop_in == cam_loc56[34:0]) ? cam_loc56 : 8'd56 ) |
 ( (snoop_in == cam_loc57[34:0]) ? cam_loc57 : 8'd57 ) |
 ( (snoop_in == cam_loc58[34:0]) ? cam_loc58 : 8'd58 ) |
 ( (snoop_in == cam_loc59[34:0]) ? cam_loc59 : 8'd59 ) |
 ( (snoop_in == cam_loc60[34:0]) ? cam_loc60 : 8'd60 ) |
 ( (snoop_in == cam_loc61[34:0]) ? cam_loc61 : 8'd61 ) |
 ( (snoop_in == cam_loc62[34:0]) ? cam_loc62 : 8'd62 ) |
 ( (snoop_in == cam_loc63[34:0]) ? cam_loc63 : 8'd63 ) |
 ( (snoop_in == cam_loc64[34:0]) ? cam_loc64 : 8'd64 ) |
 ( (snoop_in == cam_loc65[34:0]) ? cam_loc65 : 8'd65 ) |
 ( (snoop_in == cam_loc66[34:0]) ? cam_loc66 : 8'd66 ) |
 ( (snoop_in == cam_loc67[34:0]) ? cam_loc67 : 8'd67 ) |
 ( (snoop_in == cam_loc68[34:0]) ? cam_loc68 : 8'd68 ) |
 ( (snoop_in == cam_loc69[34:0]) ? cam_loc69 : 8'd69 ) |
 ( (snoop_in == cam_loc70[34:0]) ? cam_loc70 : 8'd70 ) |
 ( (snoop_in == cam_loc71[34:0]) ? cam_loc71 : 8'd71 ) |
 ( (snoop_in == cam_loc72[34:0]) ? cam_loc72 : 8'd72 ) |
 ( (snoop_in == cam_loc73[34:0]) ? cam_loc73 : 8'd73 ) |
 ( (snoop_in == cam_loc74[34:0]) ? cam_loc74 : 8'd74 ) |
 ( (snoop_in == cam_loc75[34:0]) ? cam_loc75 : 8'd75 ) |
 ( (snoop_in == cam_loc76[34:0]) ? cam_loc76 : 8'd76 ) |
 ( (snoop_in == cam_loc77[34:0]) ? cam_loc77 : 8'd77 ) |
 ( (snoop_in == cam_loc78[34:0]) ? cam_loc78 : 8'd78 ) |
 ( (snoop_in == cam_loc79[34:0]) ? cam_loc79 : 8'd79 ) |
 ( (snoop_in == cam_loc80[34:0]) ? cam_loc80 : 8'd80 ) |
 ( (snoop_in == cam_loc81[34:0]) ? cam_loc81 : 8'd81 ) |
 ( (snoop_in == cam_loc82[34:0]) ? cam_loc82 : 8'd82 ) |
 ( (snoop_in == cam_loc83[34:0]) ? cam_loc83 : 8'd83 ) |
 ( (snoop_in == cam_loc84[34:0]) ? cam_loc84 : 8'd84 ) |
 ( (snoop_in == cam_loc85[34:0]) ? cam_loc85 : 8'd85 ) |
 ( (snoop_in == cam_loc86[34:0]) ? cam_loc86 : 8'd86 ) |
 ( (snoop_in == cam_loc87[34:0]) ? cam_loc87 : 8'd87 ) |
 ( (snoop_in == cam_loc88[34:0]) ? cam_loc88 : 8'd88 ) |
 ( (snoop_in == cam_loc89[34:0]) ? cam_loc89 : 8'd89 ) |
 ( (snoop_in == cam_loc90[34:0]) ? cam_loc90 : 8'd90 ) |
 ( (snoop_in == cam_loc91[34:0]) ? cam_loc91 : 8'd91 ) |
 ( (snoop_in == cam_loc92[34:0]) ? cam_loc92 : 8'd92 ) |
 ( (snoop_in == cam_loc93[34:0]) ? cam_loc93 : 8'd93 ) |
 ( (snoop_in == cam_loc94[34:0]) ? cam_loc94 : 8'd94 ) |
 ( (snoop_in == cam_loc95[34:0]) ? cam_loc95 : 8'd95 ) |
 ( (snoop_in == cam_loc96[34:0]) ? cam_loc96 : 8'd96 ) |
 ( (snoop_in == cam_loc97[34:0]) ? cam_loc97 : 8'd97 ) |
 ( (snoop_in == cam_loc98[34:0]) ? cam_loc98 : 8'd98 ) |
 ( (snoop_in == cam_loc99[34:0]) ? cam_loc99 : 8'd99 ) |
 ( (snoop_in == cam_loc100[34:0]) ? cam_loc100 : 8'd100 ) |
 ( (snoop_in == cam_loc101[34:0]) ? cam_loc101 : 8'd101 ) |
 ( (snoop_in == cam_loc102[34:0]) ? cam_loc102 : 8'd102 ) |
 ( (snoop_in == cam_loc103[34:0]) ? cam_loc103 : 8'd103 ) |
 ( (snoop_in == cam_loc104[34:0]) ? cam_loc104 : 8'd104 ) |
 ( (snoop_in == cam_loc105[34:0]) ? cam_loc105 : 8'd105 ) |
 ( (snoop_in == cam_loc106[34:0]) ? cam_loc106 : 8'd106 ) |
 ( (snoop_in == cam_loc107[34:0]) ? cam_loc107 : 8'd107 ) |
 ( (snoop_in == cam_loc108[34:0]) ? cam_loc108 : 8'd108 ) |
 ( (snoop_in == cam_loc109[34:0]) ? cam_loc109 : 8'd109 ) |
 ( (snoop_in == cam_loc110[34:0]) ? cam_loc110 : 8'd110 ) |
 ( (snoop_in == cam_loc111[34:0]) ? cam_loc111 : 8'd111 ) |
 ( (snoop_in == cam_loc112[34:0]) ? cam_loc112 : 8'd112 ) |
 ( (snoop_in == cam_loc113[34:0]) ? cam_loc113 : 8'd113 ) |
 ( (snoop_in == cam_loc114[34:0]) ? cam_loc114 : 8'd114 ) |
 ( (snoop_in == cam_loc115[34:0]) ? cam_loc115 : 8'd115 ) |
 ( (snoop_in == cam_loc116[34:0]) ? cam_loc116 : 8'd116 ) |
 ( (snoop_in == cam_loc117[34:0]) ? cam_loc117 : 8'd117 ) |
 ( (snoop_in == cam_loc118[34:0]) ? cam_loc118 : 8'd118 ) |
 ( (snoop_in == cam_loc119[34:0]) ? cam_loc119 : 8'd119 ) |
 ( (snoop_in == cam_loc120[34:0]) ? cam_loc120 : 8'd120 ) |
 ( (snoop_in == cam_loc121[34:0]) ? cam_loc121 : 8'd121 ) |
 ( (snoop_in == cam_loc122[34:0]) ? cam_loc122 : 8'd122 ) |
 ( (snoop_in == cam_loc123[34:0]) ? cam_loc123 : 8'd123 ) |
 ( (snoop_in == cam_loc124[34:0]) ? cam_loc124 : 8'd124 ) |
 ( (snoop_in == cam_loc125[34:0]) ? cam_loc125 : 8'd125 ) |
 ( (snoop_in == cam_loc126[34:0]) ? cam_loc126 : 8'd126 ) |
 ( (snoop_in == cam_loc127[34:0]) ? cam_loc127 : 8'd127 ) |
 ( (snoop_in == cam_loc128[34:0]) ? cam_loc128 : 8'd128 ) |
 ( (snoop_in == cam_loc129[34:0]) ? cam_loc129 : 8'd129 ) |
 ( (snoop_in == cam_loc130[34:0]) ? cam_loc130 : 8'd130 ) |
 ( (snoop_in == cam_loc131[34:0]) ? cam_loc131 : 8'd131 ) |
 ( (snoop_in == cam_loc132[34:0]) ? cam_loc132 : 8'd132 ) |
 ( (snoop_in == cam_loc133[34:0]) ? cam_loc133 : 8'd133 ) |
 ( (snoop_in == cam_loc134[34:0]) ? cam_loc134 : 8'd134 ) |
 ( (snoop_in == cam_loc135[34:0]) ? cam_loc135 : 8'd135 ) |
 ( (snoop_in == cam_loc136[34:0]) ? cam_loc136 : 8'd136 ) |
 ( (snoop_in == cam_loc137[34:0]) ? cam_loc137 : 8'd137 ) |
 ( (snoop_in == cam_loc138[34:0]) ? cam_loc138 : 8'd138 ) |
 ( (snoop_in == cam_loc139[34:0]) ? cam_loc139 : 8'd139 ) |
 ( (snoop_in == cam_loc140[34:0]) ? cam_loc140 : 8'd140 ) |
 ( (snoop_in == cam_loc141[34:0]) ? cam_loc141 : 8'd141 ) |
 ( (snoop_in == cam_loc142[34:0]) ? cam_loc142 : 8'd142 ) |
 ( (snoop_in == cam_loc143[34:0]) ? cam_loc143 : 8'd143 ) |
 ( (snoop_in == cam_loc144[34:0]) ? cam_loc144 : 8'd144 ) |
 ( (snoop_in == cam_loc145[34:0]) ? cam_loc145 : 8'd145 ) |
 ( (snoop_in == cam_loc146[34:0]) ? cam_loc146 : 8'd146 ) |
 ( (snoop_in == cam_loc147[34:0]) ? cam_loc147 : 8'd147 ) |
 ( (snoop_in == cam_loc148[34:0]) ? cam_loc148 : 8'd148 ) |
 ( (snoop_in == cam_loc149[34:0]) ? cam_loc149 : 8'd149 )

;

wire assign freedup_loc_valid = snoop_match;

endmodule
