
module AH_CAM_10_10_15 (clk
,rstn
,wr_data
,wr_valid
,wr_credit
,snoop_data
,snoop_valid
,snoop_match
,snoop_in);

input clk;
input rstn;
input [9:0] wr_data;
input wr_valid;
output wr_credit;
input [9:0] snoop_data;
input snoop_valid;
input snoop_match;
input [14:0] snoop_in;

wire [3:0] internal_wr_ptr;
req  [4:0] wr_loc_counter;
        req  [9:0] cam_loc0;
req  [9:0] cam_loc1;
req  [9:0] cam_loc2;
req  [9:0] cam_loc3;
req  [9:0] cam_loc4;
req  [9:0] cam_loc5;
req  [9:0] cam_loc6;
req  [9:0] cam_loc7;
req  [9:0] cam_loc8;
req  [9:0] cam_loc9;

        always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= 4+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[4] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end
AH_srvfifo_4_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);

assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[4]);
assign internal_wr_ptr = ~wr_location_counter[4 + 1] ? ~wr_location_counter[3:0] : recir_loc;

assign wr_ready	= ~wr_location_counter[4 + 1] ? 1'b1 : recir_loc_valid;

assign recir_loc_ready	= ~wr_location_counter[4 + 1] ? 1'b0 : wr_valid;

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin


	cam_loc0 <= 10'd0;
	cam_loc1 <= 10'd0;
	cam_loc2 <= 10'd0;
	cam_loc3 <= 10'd0;
	cam_loc4 <= 10'd0;
	cam_loc5 <= 10'd0;
	cam_loc6 <= 10'd0;
	cam_loc7 <= 10'd0;
	cam_loc8 <= 10'd0;
	cam_loc9 <= 10'd0;


end else begin

	cam_loc0 <= (internal_wr_en & (internal_wr_ptr == 4'd0) ) ? wr_data : cam_loc0;
	cam_loc1 <= (internal_wr_en & (internal_wr_ptr == 4'd1) ) ? wr_data : cam_loc1;
	cam_loc2 <= (internal_wr_en & (internal_wr_ptr == 4'd2) ) ? wr_data : cam_loc2;
	cam_loc3 <= (internal_wr_en & (internal_wr_ptr == 4'd3) ) ? wr_data : cam_loc3;
	cam_loc4 <= (internal_wr_en & (internal_wr_ptr == 4'd4) ) ? wr_data : cam_loc4;
	cam_loc5 <= (internal_wr_en & (internal_wr_ptr == 4'd5) ) ? wr_data : cam_loc5;
	cam_loc6 <= (internal_wr_en & (internal_wr_ptr == 4'd6) ) ? wr_data : cam_loc6;
	cam_loc7 <= (internal_wr_en & (internal_wr_ptr == 4'd7) ) ? wr_data : cam_loc7;
	cam_loc8 <= (internal_wr_en & (internal_wr_ptr == 4'd8) ) ? wr_data : cam_loc8;
	cam_loc9 <= (internal_wr_en & (internal_wr_ptr == 4'd9) ) ? wr_data : cam_loc9;


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
 (snoop_in == cam_loc9[14:0])

);

wire assign snoop_data = 10'd0 |
( (snoop_in == cam_loc0[14:0]) ? cam_loc0 : 10'd0 ) |
 ( (snoop_in == cam_loc1[14:0]) ? cam_loc1 : 10'd0 ) |
 ( (snoop_in == cam_loc2[14:0]) ? cam_loc2 : 10'd0 ) |
 ( (snoop_in == cam_loc3[14:0]) ? cam_loc3 : 10'd0 ) |
 ( (snoop_in == cam_loc4[14:0]) ? cam_loc4 : 10'd0 ) |
 ( (snoop_in == cam_loc5[14:0]) ? cam_loc5 : 10'd0 ) |
 ( (snoop_in == cam_loc6[14:0]) ? cam_loc6 : 10'd0 ) |
 ( (snoop_in == cam_loc7[14:0]) ? cam_loc7 : 10'd0 ) |
 ( (snoop_in == cam_loc8[14:0]) ? cam_loc8 : 10'd0 ) |
 ( (snoop_in == cam_loc9[14:0]) ? cam_loc9 : 10'd0 )

;

wire assign freeup_loc = 4'd0 |
( (snoop_in == cam_loc0[14:0]) ? cam_loc0 : 4'd0 ) |
 ( (snoop_in == cam_loc1[14:0]) ? cam_loc1 : 4'd1 ) |
 ( (snoop_in == cam_loc2[14:0]) ? cam_loc2 : 4'd2 ) |
 ( (snoop_in == cam_loc3[14:0]) ? cam_loc3 : 4'd3 ) |
 ( (snoop_in == cam_loc4[14:0]) ? cam_loc4 : 4'd4 ) |
 ( (snoop_in == cam_loc5[14:0]) ? cam_loc5 : 4'd5 ) |
 ( (snoop_in == cam_loc6[14:0]) ? cam_loc6 : 4'd6 ) |
 ( (snoop_in == cam_loc7[14:0]) ? cam_loc7 : 4'd7 ) |
 ( (snoop_in == cam_loc8[14:0]) ? cam_loc8 : 4'd8 ) |
 ( (snoop_in == cam_loc9[14:0]) ? cam_loc9 : 4'd9 )

;

wire assign freedup_loc_valid = snoop_match;

endmodule
