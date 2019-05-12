
module AH_CAM_50_64_35 (wdata
,wvalid
,wcredit
,sdata
,svalid
,smatch
,sin);

input [63:0] wdata;
input wvalid;
output wcredit;
input [63:0] sdata;
input svalid;
input smatch;
input [34:0] sin;

wire [5:0] internal_wr_ptr;
req  [6:0] wr_loc_counter;
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

        always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= 6+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[6] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end
AH_srvfifo_6_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);

assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[6]);
assign internal_wr_ptr = ~wr_location_counter[6 + 1] ? ~wr_location_counter[5:0] : recir_loc;

assign wr_ready	= ~wr_location_counter[6 + 1] ? 1'b1 : recir_loc_valid;

assign recir_loc_ready	= ~wr_location_counter[6 + 1] ? 1'b0 : wr_valid;

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


end else begin

	cam_loc0 <= (internal_wr_en & (internal_wr_ptr == 6'd0) ) ? wr_data : cam_loc0;
	cam_loc1 <= (internal_wr_en & (internal_wr_ptr == 6'd1) ) ? wr_data : cam_loc1;
	cam_loc2 <= (internal_wr_en & (internal_wr_ptr == 6'd2) ) ? wr_data : cam_loc2;
	cam_loc3 <= (internal_wr_en & (internal_wr_ptr == 6'd3) ) ? wr_data : cam_loc3;
	cam_loc4 <= (internal_wr_en & (internal_wr_ptr == 6'd4) ) ? wr_data : cam_loc4;
	cam_loc5 <= (internal_wr_en & (internal_wr_ptr == 6'd5) ) ? wr_data : cam_loc5;
	cam_loc6 <= (internal_wr_en & (internal_wr_ptr == 6'd6) ) ? wr_data : cam_loc6;
	cam_loc7 <= (internal_wr_en & (internal_wr_ptr == 6'd7) ) ? wr_data : cam_loc7;
	cam_loc8 <= (internal_wr_en & (internal_wr_ptr == 6'd8) ) ? wr_data : cam_loc8;
	cam_loc9 <= (internal_wr_en & (internal_wr_ptr == 6'd9) ) ? wr_data : cam_loc9;
	cam_loc10 <= (internal_wr_en & (internal_wr_ptr == 6'd10) ) ? wr_data : cam_loc10;
	cam_loc11 <= (internal_wr_en & (internal_wr_ptr == 6'd11) ) ? wr_data : cam_loc11;
	cam_loc12 <= (internal_wr_en & (internal_wr_ptr == 6'd12) ) ? wr_data : cam_loc12;
	cam_loc13 <= (internal_wr_en & (internal_wr_ptr == 6'd13) ) ? wr_data : cam_loc13;
	cam_loc14 <= (internal_wr_en & (internal_wr_ptr == 6'd14) ) ? wr_data : cam_loc14;
	cam_loc15 <= (internal_wr_en & (internal_wr_ptr == 6'd15) ) ? wr_data : cam_loc15;
	cam_loc16 <= (internal_wr_en & (internal_wr_ptr == 6'd16) ) ? wr_data : cam_loc16;
	cam_loc17 <= (internal_wr_en & (internal_wr_ptr == 6'd17) ) ? wr_data : cam_loc17;
	cam_loc18 <= (internal_wr_en & (internal_wr_ptr == 6'd18) ) ? wr_data : cam_loc18;
	cam_loc19 <= (internal_wr_en & (internal_wr_ptr == 6'd19) ) ? wr_data : cam_loc19;
	cam_loc20 <= (internal_wr_en & (internal_wr_ptr == 6'd20) ) ? wr_data : cam_loc20;
	cam_loc21 <= (internal_wr_en & (internal_wr_ptr == 6'd21) ) ? wr_data : cam_loc21;
	cam_loc22 <= (internal_wr_en & (internal_wr_ptr == 6'd22) ) ? wr_data : cam_loc22;
	cam_loc23 <= (internal_wr_en & (internal_wr_ptr == 6'd23) ) ? wr_data : cam_loc23;
	cam_loc24 <= (internal_wr_en & (internal_wr_ptr == 6'd24) ) ? wr_data : cam_loc24;
	cam_loc25 <= (internal_wr_en & (internal_wr_ptr == 6'd25) ) ? wr_data : cam_loc25;
	cam_loc26 <= (internal_wr_en & (internal_wr_ptr == 6'd26) ) ? wr_data : cam_loc26;
	cam_loc27 <= (internal_wr_en & (internal_wr_ptr == 6'd27) ) ? wr_data : cam_loc27;
	cam_loc28 <= (internal_wr_en & (internal_wr_ptr == 6'd28) ) ? wr_data : cam_loc28;
	cam_loc29 <= (internal_wr_en & (internal_wr_ptr == 6'd29) ) ? wr_data : cam_loc29;
	cam_loc30 <= (internal_wr_en & (internal_wr_ptr == 6'd30) ) ? wr_data : cam_loc30;
	cam_loc31 <= (internal_wr_en & (internal_wr_ptr == 6'd31) ) ? wr_data : cam_loc31;
	cam_loc32 <= (internal_wr_en & (internal_wr_ptr == 6'd32) ) ? wr_data : cam_loc32;
	cam_loc33 <= (internal_wr_en & (internal_wr_ptr == 6'd33) ) ? wr_data : cam_loc33;
	cam_loc34 <= (internal_wr_en & (internal_wr_ptr == 6'd34) ) ? wr_data : cam_loc34;
	cam_loc35 <= (internal_wr_en & (internal_wr_ptr == 6'd35) ) ? wr_data : cam_loc35;
	cam_loc36 <= (internal_wr_en & (internal_wr_ptr == 6'd36) ) ? wr_data : cam_loc36;
	cam_loc37 <= (internal_wr_en & (internal_wr_ptr == 6'd37) ) ? wr_data : cam_loc37;
	cam_loc38 <= (internal_wr_en & (internal_wr_ptr == 6'd38) ) ? wr_data : cam_loc38;
	cam_loc39 <= (internal_wr_en & (internal_wr_ptr == 6'd39) ) ? wr_data : cam_loc39;
	cam_loc40 <= (internal_wr_en & (internal_wr_ptr == 6'd40) ) ? wr_data : cam_loc40;
	cam_loc41 <= (internal_wr_en & (internal_wr_ptr == 6'd41) ) ? wr_data : cam_loc41;
	cam_loc42 <= (internal_wr_en & (internal_wr_ptr == 6'd42) ) ? wr_data : cam_loc42;
	cam_loc43 <= (internal_wr_en & (internal_wr_ptr == 6'd43) ) ? wr_data : cam_loc43;
	cam_loc44 <= (internal_wr_en & (internal_wr_ptr == 6'd44) ) ? wr_data : cam_loc44;
	cam_loc45 <= (internal_wr_en & (internal_wr_ptr == 6'd45) ) ? wr_data : cam_loc45;
	cam_loc46 <= (internal_wr_en & (internal_wr_ptr == 6'd46) ) ? wr_data : cam_loc46;
	cam_loc47 <= (internal_wr_en & (internal_wr_ptr == 6'd47) ) ? wr_data : cam_loc47;
	cam_loc48 <= (internal_wr_en & (internal_wr_ptr == 6'd48) ) ? wr_data : cam_loc48;
	cam_loc49 <= (internal_wr_en & (internal_wr_ptr == 6'd49) ) ? wr_data : cam_loc49;


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
 (snoop_in == cam_loc49[34:0])

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
 ( (snoop_in == cam_loc49[34:0]) ? cam_loc49 : 64'd0 )

;

wire assign freeup_loc = 6'd0 |
( (snoop_in == cam_loc0[34:0]) ? cam_loc0 : 6'd0 ) |
 ( (snoop_in == cam_loc1[34:0]) ? cam_loc1 : 6'd1 ) |
 ( (snoop_in == cam_loc2[34:0]) ? cam_loc2 : 6'd2 ) |
 ( (snoop_in == cam_loc3[34:0]) ? cam_loc3 : 6'd3 ) |
 ( (snoop_in == cam_loc4[34:0]) ? cam_loc4 : 6'd4 ) |
 ( (snoop_in == cam_loc5[34:0]) ? cam_loc5 : 6'd5 ) |
 ( (snoop_in == cam_loc6[34:0]) ? cam_loc6 : 6'd6 ) |
 ( (snoop_in == cam_loc7[34:0]) ? cam_loc7 : 6'd7 ) |
 ( (snoop_in == cam_loc8[34:0]) ? cam_loc8 : 6'd8 ) |
 ( (snoop_in == cam_loc9[34:0]) ? cam_loc9 : 6'd9 ) |
 ( (snoop_in == cam_loc10[34:0]) ? cam_loc10 : 6'd10 ) |
 ( (snoop_in == cam_loc11[34:0]) ? cam_loc11 : 6'd11 ) |
 ( (snoop_in == cam_loc12[34:0]) ? cam_loc12 : 6'd12 ) |
 ( (snoop_in == cam_loc13[34:0]) ? cam_loc13 : 6'd13 ) |
 ( (snoop_in == cam_loc14[34:0]) ? cam_loc14 : 6'd14 ) |
 ( (snoop_in == cam_loc15[34:0]) ? cam_loc15 : 6'd15 ) |
 ( (snoop_in == cam_loc16[34:0]) ? cam_loc16 : 6'd16 ) |
 ( (snoop_in == cam_loc17[34:0]) ? cam_loc17 : 6'd17 ) |
 ( (snoop_in == cam_loc18[34:0]) ? cam_loc18 : 6'd18 ) |
 ( (snoop_in == cam_loc19[34:0]) ? cam_loc19 : 6'd19 ) |
 ( (snoop_in == cam_loc20[34:0]) ? cam_loc20 : 6'd20 ) |
 ( (snoop_in == cam_loc21[34:0]) ? cam_loc21 : 6'd21 ) |
 ( (snoop_in == cam_loc22[34:0]) ? cam_loc22 : 6'd22 ) |
 ( (snoop_in == cam_loc23[34:0]) ? cam_loc23 : 6'd23 ) |
 ( (snoop_in == cam_loc24[34:0]) ? cam_loc24 : 6'd24 ) |
 ( (snoop_in == cam_loc25[34:0]) ? cam_loc25 : 6'd25 ) |
 ( (snoop_in == cam_loc26[34:0]) ? cam_loc26 : 6'd26 ) |
 ( (snoop_in == cam_loc27[34:0]) ? cam_loc27 : 6'd27 ) |
 ( (snoop_in == cam_loc28[34:0]) ? cam_loc28 : 6'd28 ) |
 ( (snoop_in == cam_loc29[34:0]) ? cam_loc29 : 6'd29 ) |
 ( (snoop_in == cam_loc30[34:0]) ? cam_loc30 : 6'd30 ) |
 ( (snoop_in == cam_loc31[34:0]) ? cam_loc31 : 6'd31 ) |
 ( (snoop_in == cam_loc32[34:0]) ? cam_loc32 : 6'd32 ) |
 ( (snoop_in == cam_loc33[34:0]) ? cam_loc33 : 6'd33 ) |
 ( (snoop_in == cam_loc34[34:0]) ? cam_loc34 : 6'd34 ) |
 ( (snoop_in == cam_loc35[34:0]) ? cam_loc35 : 6'd35 ) |
 ( (snoop_in == cam_loc36[34:0]) ? cam_loc36 : 6'd36 ) |
 ( (snoop_in == cam_loc37[34:0]) ? cam_loc37 : 6'd37 ) |
 ( (snoop_in == cam_loc38[34:0]) ? cam_loc38 : 6'd38 ) |
 ( (snoop_in == cam_loc39[34:0]) ? cam_loc39 : 6'd39 ) |
 ( (snoop_in == cam_loc40[34:0]) ? cam_loc40 : 6'd40 ) |
 ( (snoop_in == cam_loc41[34:0]) ? cam_loc41 : 6'd41 ) |
 ( (snoop_in == cam_loc42[34:0]) ? cam_loc42 : 6'd42 ) |
 ( (snoop_in == cam_loc43[34:0]) ? cam_loc43 : 6'd43 ) |
 ( (snoop_in == cam_loc44[34:0]) ? cam_loc44 : 6'd44 ) |
 ( (snoop_in == cam_loc45[34:0]) ? cam_loc45 : 6'd45 ) |
 ( (snoop_in == cam_loc46[34:0]) ? cam_loc46 : 6'd46 ) |
 ( (snoop_in == cam_loc47[34:0]) ? cam_loc47 : 6'd47 ) |
 ( (snoop_in == cam_loc48[34:0]) ? cam_loc48 : 6'd48 ) |
 ( (snoop_in == cam_loc49[34:0]) ? cam_loc49 : 6'd49 )

;

wire assign freedup_loc_valid = snoop_match;

endmodule
