
module AH_CAM_20_128_68 (clk
,rstn
,wdata
,wvalid
,wcredit
,sdata
,svalid
,smatch
,sin);

input clk;
input rstn;
input [127:0] wdata;
input wvalid;
output wcredit;
input [127:0] sdata;
input svalid;
input smatch;
input [67:0] sin;

wire [4:0] internal_wr_ptr;
req  [5:0] wr_loc_counter;
        req  [127:0] cam_loc0;
req  [127:0] cam_loc1;
req  [127:0] cam_loc2;
req  [127:0] cam_loc3;
req  [127:0] cam_loc4;
req  [127:0] cam_loc5;
req  [127:0] cam_loc6;
req  [127:0] cam_loc7;
req  [127:0] cam_loc8;
req  [127:0] cam_loc9;
req  [127:0] cam_loc10;
req  [127:0] cam_loc11;
req  [127:0] cam_loc12;
req  [127:0] cam_loc13;
req  [127:0] cam_loc14;
req  [127:0] cam_loc15;
req  [127:0] cam_loc16;
req  [127:0] cam_loc17;
req  [127:0] cam_loc18;
req  [127:0] cam_loc19;

        always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= 5+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[5] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end
AH_srvfifo_5_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);

assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[5]);
assign internal_wr_ptr = ~wr_location_counter[5 + 1] ? ~wr_location_counter[4:0] : recir_loc;

assign wr_ready	= ~wr_location_counter[5 + 1] ? 1'b1 : recir_loc_valid;

assign recir_loc_ready	= ~wr_location_counter[5 + 1] ? 1'b0 : wr_valid;

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin


	cam_loc0 <= 128'd0;
	cam_loc1 <= 128'd0;
	cam_loc2 <= 128'd0;
	cam_loc3 <= 128'd0;
	cam_loc4 <= 128'd0;
	cam_loc5 <= 128'd0;
	cam_loc6 <= 128'd0;
	cam_loc7 <= 128'd0;
	cam_loc8 <= 128'd0;
	cam_loc9 <= 128'd0;
	cam_loc10 <= 128'd0;
	cam_loc11 <= 128'd0;
	cam_loc12 <= 128'd0;
	cam_loc13 <= 128'd0;
	cam_loc14 <= 128'd0;
	cam_loc15 <= 128'd0;
	cam_loc16 <= 128'd0;
	cam_loc17 <= 128'd0;
	cam_loc18 <= 128'd0;
	cam_loc19 <= 128'd0;


end else begin

	cam_loc0 <= (internal_wr_en & (internal_wr_ptr == 5'd0) ) ? wr_data : cam_loc0;
	cam_loc1 <= (internal_wr_en & (internal_wr_ptr == 5'd1) ) ? wr_data : cam_loc1;
	cam_loc2 <= (internal_wr_en & (internal_wr_ptr == 5'd2) ) ? wr_data : cam_loc2;
	cam_loc3 <= (internal_wr_en & (internal_wr_ptr == 5'd3) ) ? wr_data : cam_loc3;
	cam_loc4 <= (internal_wr_en & (internal_wr_ptr == 5'd4) ) ? wr_data : cam_loc4;
	cam_loc5 <= (internal_wr_en & (internal_wr_ptr == 5'd5) ) ? wr_data : cam_loc5;
	cam_loc6 <= (internal_wr_en & (internal_wr_ptr == 5'd6) ) ? wr_data : cam_loc6;
	cam_loc7 <= (internal_wr_en & (internal_wr_ptr == 5'd7) ) ? wr_data : cam_loc7;
	cam_loc8 <= (internal_wr_en & (internal_wr_ptr == 5'd8) ) ? wr_data : cam_loc8;
	cam_loc9 <= (internal_wr_en & (internal_wr_ptr == 5'd9) ) ? wr_data : cam_loc9;
	cam_loc10 <= (internal_wr_en & (internal_wr_ptr == 5'd10) ) ? wr_data : cam_loc10;
	cam_loc11 <= (internal_wr_en & (internal_wr_ptr == 5'd11) ) ? wr_data : cam_loc11;
	cam_loc12 <= (internal_wr_en & (internal_wr_ptr == 5'd12) ) ? wr_data : cam_loc12;
	cam_loc13 <= (internal_wr_en & (internal_wr_ptr == 5'd13) ) ? wr_data : cam_loc13;
	cam_loc14 <= (internal_wr_en & (internal_wr_ptr == 5'd14) ) ? wr_data : cam_loc14;
	cam_loc15 <= (internal_wr_en & (internal_wr_ptr == 5'd15) ) ? wr_data : cam_loc15;
	cam_loc16 <= (internal_wr_en & (internal_wr_ptr == 5'd16) ) ? wr_data : cam_loc16;
	cam_loc17 <= (internal_wr_en & (internal_wr_ptr == 5'd17) ) ? wr_data : cam_loc17;
	cam_loc18 <= (internal_wr_en & (internal_wr_ptr == 5'd18) ) ? wr_data : cam_loc18;
	cam_loc19 <= (internal_wr_en & (internal_wr_ptr == 5'd19) ) ? wr_data : cam_loc19;


end

wire assign snoop_match = freedup_loc_ready) & (

(snoop_in == cam_loc0[67:0]) |
 (snoop_in == cam_loc1[67:0]) |
 (snoop_in == cam_loc2[67:0]) |
 (snoop_in == cam_loc3[67:0]) |
 (snoop_in == cam_loc4[67:0]) |
 (snoop_in == cam_loc5[67:0]) |
 (snoop_in == cam_loc6[67:0]) |
 (snoop_in == cam_loc7[67:0]) |
 (snoop_in == cam_loc8[67:0]) |
 (snoop_in == cam_loc9[67:0]) |
 (snoop_in == cam_loc10[67:0]) |
 (snoop_in == cam_loc11[67:0]) |
 (snoop_in == cam_loc12[67:0]) |
 (snoop_in == cam_loc13[67:0]) |
 (snoop_in == cam_loc14[67:0]) |
 (snoop_in == cam_loc15[67:0]) |
 (snoop_in == cam_loc16[67:0]) |
 (snoop_in == cam_loc17[67:0]) |
 (snoop_in == cam_loc18[67:0]) |
 (snoop_in == cam_loc19[67:0])

);

wire assign snoop_data = 128'd0 |
( (snoop_in == cam_loc0[67:0]) ? cam_loc0 : 128'd0 ) |
 ( (snoop_in == cam_loc1[67:0]) ? cam_loc1 : 128'd0 ) |
 ( (snoop_in == cam_loc2[67:0]) ? cam_loc2 : 128'd0 ) |
 ( (snoop_in == cam_loc3[67:0]) ? cam_loc3 : 128'd0 ) |
 ( (snoop_in == cam_loc4[67:0]) ? cam_loc4 : 128'd0 ) |
 ( (snoop_in == cam_loc5[67:0]) ? cam_loc5 : 128'd0 ) |
 ( (snoop_in == cam_loc6[67:0]) ? cam_loc6 : 128'd0 ) |
 ( (snoop_in == cam_loc7[67:0]) ? cam_loc7 : 128'd0 ) |
 ( (snoop_in == cam_loc8[67:0]) ? cam_loc8 : 128'd0 ) |
 ( (snoop_in == cam_loc9[67:0]) ? cam_loc9 : 128'd0 ) |
 ( (snoop_in == cam_loc10[67:0]) ? cam_loc10 : 128'd0 ) |
 ( (snoop_in == cam_loc11[67:0]) ? cam_loc11 : 128'd0 ) |
 ( (snoop_in == cam_loc12[67:0]) ? cam_loc12 : 128'd0 ) |
 ( (snoop_in == cam_loc13[67:0]) ? cam_loc13 : 128'd0 ) |
 ( (snoop_in == cam_loc14[67:0]) ? cam_loc14 : 128'd0 ) |
 ( (snoop_in == cam_loc15[67:0]) ? cam_loc15 : 128'd0 ) |
 ( (snoop_in == cam_loc16[67:0]) ? cam_loc16 : 128'd0 ) |
 ( (snoop_in == cam_loc17[67:0]) ? cam_loc17 : 128'd0 ) |
 ( (snoop_in == cam_loc18[67:0]) ? cam_loc18 : 128'd0 ) |
 ( (snoop_in == cam_loc19[67:0]) ? cam_loc19 : 128'd0 )

;

wire assign freeup_loc = 5'd0 |
( (snoop_in == cam_loc0[67:0]) ? cam_loc0 : 5'd0 ) |
 ( (snoop_in == cam_loc1[67:0]) ? cam_loc1 : 5'd1 ) |
 ( (snoop_in == cam_loc2[67:0]) ? cam_loc2 : 5'd2 ) |
 ( (snoop_in == cam_loc3[67:0]) ? cam_loc3 : 5'd3 ) |
 ( (snoop_in == cam_loc4[67:0]) ? cam_loc4 : 5'd4 ) |
 ( (snoop_in == cam_loc5[67:0]) ? cam_loc5 : 5'd5 ) |
 ( (snoop_in == cam_loc6[67:0]) ? cam_loc6 : 5'd6 ) |
 ( (snoop_in == cam_loc7[67:0]) ? cam_loc7 : 5'd7 ) |
 ( (snoop_in == cam_loc8[67:0]) ? cam_loc8 : 5'd8 ) |
 ( (snoop_in == cam_loc9[67:0]) ? cam_loc9 : 5'd9 ) |
 ( (snoop_in == cam_loc10[67:0]) ? cam_loc10 : 5'd10 ) |
 ( (snoop_in == cam_loc11[67:0]) ? cam_loc11 : 5'd11 ) |
 ( (snoop_in == cam_loc12[67:0]) ? cam_loc12 : 5'd12 ) |
 ( (snoop_in == cam_loc13[67:0]) ? cam_loc13 : 5'd13 ) |
 ( (snoop_in == cam_loc14[67:0]) ? cam_loc14 : 5'd14 ) |
 ( (snoop_in == cam_loc15[67:0]) ? cam_loc15 : 5'd15 ) |
 ( (snoop_in == cam_loc16[67:0]) ? cam_loc16 : 5'd16 ) |
 ( (snoop_in == cam_loc17[67:0]) ? cam_loc17 : 5'd17 ) |
 ( (snoop_in == cam_loc18[67:0]) ? cam_loc18 : 5'd18 ) |
 ( (snoop_in == cam_loc19[67:0]) ? cam_loc19 : 5'd19 )

;

wire assign freedup_loc_valid = snoop_match;

endmodule
