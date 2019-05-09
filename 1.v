
module AH_CAM_102_320_56 (clk
,rstn
,wdata
,valid
,ready
,rdata
,valid
,ready
,sdata
,valid
,match
,sin);

input clk;
input rstn;
input [319:0] wdata;
input valid;
output ready;
output [319:0] rdata;
output valid;
input ready;
input [319:0] sdata;
input valid;
input match;
input [55:0] sin;


// ============================================================================
//snoop happens at the LSBs. It is expected that for snoop to happen
// in upper bits, write will be swizzled into LSB locations.



wire [6:0] internal_wr_ptr; // asume CAMDEPTH = 64, then wr-ptr-width is log2(CAMDEPTH).
reg [7:0] wr_loc_counter; // It's log2(CAMDEPTH) +1 from the above


reg [320:0] cam_loc0;
reg [320:0] cam_loc1;
reg [320:0] cam_loc2;
reg [320:0] cam_loc3;
reg [320:0] cam_loc4;
reg [320:0] cam_loc5;
reg [320:0] cam_loc6;
reg [320:0] cam_loc7;
reg [320:0] cam_loc8;
reg [320:0] cam_loc9;
reg [320:0] cam_loc10;
reg [320:0] cam_loc11;
reg [320:0] cam_loc12;
reg [320:0] cam_loc13;
reg [320:0] cam_loc14;
reg [320:0] cam_loc15;
reg [320:0] cam_loc16;
reg [320:0] cam_loc17;
reg [320:0] cam_loc18;
reg [320:0] cam_loc19;
reg [320:0] cam_loc20;
reg [320:0] cam_loc21;
reg [320:0] cam_loc22;
reg [320:0] cam_loc23;
reg [320:0] cam_loc24;
reg [320:0] cam_loc25;
reg [320:0] cam_loc26;
reg [320:0] cam_loc27;
reg [320:0] cam_loc28;
reg [320:0] cam_loc29;
reg [320:0] cam_loc30;
reg [320:0] cam_loc31;
reg [320:0] cam_loc32;
reg [320:0] cam_loc33;
reg [320:0] cam_loc34;
reg [320:0] cam_loc35;
reg [320:0] cam_loc36;
reg [320:0] cam_loc37;
reg [320:0] cam_loc38;
reg [320:0] cam_loc39;
reg [320:0] cam_loc40;
reg [320:0] cam_loc41;
reg [320:0] cam_loc42;
reg [320:0] cam_loc43;
reg [320:0] cam_loc44;
reg [320:0] cam_loc45;
reg [320:0] cam_loc46;
reg [320:0] cam_loc47;
reg [320:0] cam_loc48;
reg [320:0] cam_loc49;
reg [320:0] cam_loc50;
reg [320:0] cam_loc51;
reg [320:0] cam_loc52;
reg [320:0] cam_loc53;
reg [320:0] cam_loc54;
reg [320:0] cam_loc55;
reg [320:0] cam_loc56;
reg [320:0] cam_loc57;
reg [320:0] cam_loc58;
reg [320:0] cam_loc59;
reg [320:0] cam_loc60;
reg [320:0] cam_loc61;
reg [320:0] cam_loc62;
reg [320:0] cam_loc63;
reg [320:0] cam_loc64;
reg [320:0] cam_loc65;
reg [320:0] cam_loc66;
reg [320:0] cam_loc67;
reg [320:0] cam_loc68;
reg [320:0] cam_loc69;
reg [320:0] cam_loc70;
reg [320:0] cam_loc71;
reg [320:0] cam_loc72;
reg [320:0] cam_loc73;
reg [320:0] cam_loc74;
reg [320:0] cam_loc75;
reg [320:0] cam_loc76;
reg [320:0] cam_loc77;
reg [320:0] cam_loc78;
reg [320:0] cam_loc79;
reg [320:0] cam_loc80;
reg [320:0] cam_loc81;
reg [320:0] cam_loc82;
reg [320:0] cam_loc83;
reg [320:0] cam_loc84;
reg [320:0] cam_loc85;
reg [320:0] cam_loc86;
reg [320:0] cam_loc87;
reg [320:0] cam_loc88;
reg [320:0] cam_loc89;
reg [320:0] cam_loc90;
reg [320:0] cam_loc91;
reg [320:0] cam_loc92;
reg [320:0] cam_loc93;
reg [320:0] cam_loc94;
reg [320:0] cam_loc95;
reg [320:0] cam_loc96;
reg [320:0] cam_loc97;
reg [320:0] cam_loc98;
reg [320:0] cam_loc99;
reg [320:0] cam_loc100;
reg [320:0] cam_loc101;

// ============================================================================
// CAM working principle --
// 1. Initially all the entries are in pool of free locations.
// 2. These are stored in a FIFO - at reset there's a counter which runs
//    and freely increments to keep feeding these locations to write logic. Once initial
// 32/64/256 locations are used, the FIFO takes over. This helps to start the CAM right
// right at the begining without any issues.
//
// 3. Once a snoop comes and if a snoop match happens, the location is invalidated and
// correspnding location is written back into FIFO to be reused.
// the problem with this scheme is that it immediately a reused location isn't available for
// writing.
//
// If we apply a combo based logic, then that's possible - but then the resulting combo can be
// very difficult to meet timing creating pipelining and having delays anyways.
// In general for smaller CAMs, combo based wr-location search might be a good thing.
// ============================================================================


// ============================================================================
// The counter

always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= 7+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[7] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end

// ============================================================================
// Instance the reuse FIFO
// Number 6 below is same as 7 or log2(CAMDEPTH). Number 64 below is same as CAMDEPTH.

AH_srvfifo_7_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);


// ============================================================================
// Take the location from recir_loc or from wr_loc_counter and prepare to write an incoming data
// Use the counter for initial phase only - so the MSB of counter when reached to 1, this method
// of using counter shouldn't be used anymore

// These are for CAM locations
assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[7]);
assign internal_wr_ptr = ~wr_location_counter[7 + 1] ? ~wr_location_counter[6:0] : recir_loc;

// Handshake with external wr-port
assign wr_ready	= ~wr_location_counter[7 + 1] ? 1'b1 : recir_loc_valid;

// Handshake with recirculation FIFO pop-port
assign recir_loc_ready	= ~wr_location_counter[7 + 1] ? 1'b0 : wr_valid;

// ============================================================================
// Now actual CAM locations
// NOTE:- only 3 locations are shown - it should continue for 64 locations.

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin


	cam_loc0 <= 320'd0;
	cam_loc1 <= 320'd0;
	cam_loc2 <= 320'd0;
	cam_loc3 <= 320'd0;
	cam_loc4 <= 320'd0;
	cam_loc5 <= 320'd0;
	cam_loc6 <= 320'd0;
	cam_loc7 <= 320'd0;
	cam_loc8 <= 320'd0;
	cam_loc9 <= 320'd0;
	cam_loc10 <= 320'd0;
	cam_loc11 <= 320'd0;
	cam_loc12 <= 320'd0;
	cam_loc13 <= 320'd0;
	cam_loc14 <= 320'd0;
	cam_loc15 <= 320'd0;
	cam_loc16 <= 320'd0;
	cam_loc17 <= 320'd0;
	cam_loc18 <= 320'd0;
	cam_loc19 <= 320'd0;
	cam_loc20 <= 320'd0;
	cam_loc21 <= 320'd0;
	cam_loc22 <= 320'd0;
	cam_loc23 <= 320'd0;
	cam_loc24 <= 320'd0;
	cam_loc25 <= 320'd0;
	cam_loc26 <= 320'd0;
	cam_loc27 <= 320'd0;
	cam_loc28 <= 320'd0;
	cam_loc29 <= 320'd0;
	cam_loc30 <= 320'd0;
	cam_loc31 <= 320'd0;
	cam_loc32 <= 320'd0;
	cam_loc33 <= 320'd0;
	cam_loc34 <= 320'd0;
	cam_loc35 <= 320'd0;
	cam_loc36 <= 320'd0;
	cam_loc37 <= 320'd0;
	cam_loc38 <= 320'd0;
	cam_loc39 <= 320'd0;
	cam_loc40 <= 320'd0;
	cam_loc41 <= 320'd0;
	cam_loc42 <= 320'd0;
	cam_loc43 <= 320'd0;
	cam_loc44 <= 320'd0;
	cam_loc45 <= 320'd0;
	cam_loc46 <= 320'd0;
	cam_loc47 <= 320'd0;
	cam_loc48 <= 320'd0;
	cam_loc49 <= 320'd0;
	cam_loc50 <= 320'd0;
	cam_loc51 <= 320'd0;
	cam_loc52 <= 320'd0;
	cam_loc53 <= 320'd0;
	cam_loc54 <= 320'd0;
	cam_loc55 <= 320'd0;
	cam_loc56 <= 320'd0;
	cam_loc57 <= 320'd0;
	cam_loc58 <= 320'd0;
	cam_loc59 <= 320'd0;
	cam_loc60 <= 320'd0;
	cam_loc61 <= 320'd0;
	cam_loc62 <= 320'd0;
	cam_loc63 <= 320'd0;
	cam_loc64 <= 320'd0;
	cam_loc65 <= 320'd0;
	cam_loc66 <= 320'd0;
	cam_loc67 <= 320'd0;
	cam_loc68 <= 320'd0;
	cam_loc69 <= 320'd0;
	cam_loc70 <= 320'd0;
	cam_loc71 <= 320'd0;
	cam_loc72 <= 320'd0;
	cam_loc73 <= 320'd0;
	cam_loc74 <= 320'd0;
	cam_loc75 <= 320'd0;
	cam_loc76 <= 320'd0;
	cam_loc77 <= 320'd0;
	cam_loc78 <= 320'd0;
	cam_loc79 <= 320'd0;
	cam_loc80 <= 320'd0;
	cam_loc81 <= 320'd0;
	cam_loc82 <= 320'd0;
	cam_loc83 <= 320'd0;
	cam_loc84 <= 320'd0;
	cam_loc85 <= 320'd0;
	cam_loc86 <= 320'd0;
	cam_loc87 <= 320'd0;
	cam_loc88 <= 320'd0;
	cam_loc89 <= 320'd0;
	cam_loc90 <= 320'd0;
	cam_loc91 <= 320'd0;
	cam_loc92 <= 320'd0;
	cam_loc93 <= 320'd0;
	cam_loc94 <= 320'd0;
	cam_loc95 <= 320'd0;
	cam_loc96 <= 320'd0;
	cam_loc97 <= 320'd0;
	cam_loc98 <= 320'd0;
	cam_loc99 <= 320'd0;
	cam_loc100 <= 320'd0;
	cam_loc101 <= 320'd0;
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
end


// ============================================================================
// Handle the snoop part here.

wire assign snoop_match = freedup_loc_ready) & (


((cam_loc0[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc1[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc2[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc3[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc4[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc5[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc6[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc7[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc8[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc9[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc10[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc11[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc12[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc13[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc14[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc15[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc16[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc17[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc18[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc19[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc20[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc21[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc22[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc23[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc24[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc25[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc26[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc27[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc28[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc29[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc30[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc31[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc32[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc33[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc34[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc35[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc36[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc37[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc38[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc39[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc40[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc41[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc42[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc43[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc44[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc45[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc46[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc47[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc48[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc49[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc50[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc51[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc52[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc53[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc54[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc55[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc56[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc57[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc58[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc59[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc60[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc61[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc62[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc63[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc64[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc65[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc66[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc67[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc68[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc69[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc70[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc71[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc72[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc73[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc74[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc75[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc76[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc77[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc78[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc79[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc80[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc81[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc82[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc83[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc84[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc85[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc86[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc87[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc88[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc89[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc90[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc91[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc92[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc93[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc94[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc95[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc96[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc97[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc98[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc99[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc100[55:0] == snoop_in) ? 1'b1 : 1'b0)|
((cam_loc101[55:0] == snoop_in) ? 1'b1 : 1'b0)

);

wire assign snoop_data = 320'd0 |

( (snoop_in == cam_loc0[55:0]) ? cam_loc0 : 320'd0 )
( (snoop_in == cam_loc1[55:0]) ? cam_loc1 : 320'd0 )
( (snoop_in == cam_loc2[55:0]) ? cam_loc2 : 320'd0 )
( (snoop_in == cam_loc3[55:0]) ? cam_loc3 : 320'd0 )
( (snoop_in == cam_loc4[55:0]) ? cam_loc4 : 320'd0 )
( (snoop_in == cam_loc5[55:0]) ? cam_loc5 : 320'd0 )
( (snoop_in == cam_loc6[55:0]) ? cam_loc6 : 320'd0 )
( (snoop_in == cam_loc7[55:0]) ? cam_loc7 : 320'd0 )
( (snoop_in == cam_loc8[55:0]) ? cam_loc8 : 320'd0 )
( (snoop_in == cam_loc9[55:0]) ? cam_loc9 : 320'd0 )
( (snoop_in == cam_loc10[55:0]) ? cam_loc10 : 320'd0 )
( (snoop_in == cam_loc11[55:0]) ? cam_loc11 : 320'd0 )
( (snoop_in == cam_loc12[55:0]) ? cam_loc12 : 320'd0 )
( (snoop_in == cam_loc13[55:0]) ? cam_loc13 : 320'd0 )
( (snoop_in == cam_loc14[55:0]) ? cam_loc14 : 320'd0 )
( (snoop_in == cam_loc15[55:0]) ? cam_loc15 : 320'd0 )
( (snoop_in == cam_loc16[55:0]) ? cam_loc16 : 320'd0 )
( (snoop_in == cam_loc17[55:0]) ? cam_loc17 : 320'd0 )
( (snoop_in == cam_loc18[55:0]) ? cam_loc18 : 320'd0 )
( (snoop_in == cam_loc19[55:0]) ? cam_loc19 : 320'd0 )
( (snoop_in == cam_loc20[55:0]) ? cam_loc20 : 320'd0 )
( (snoop_in == cam_loc21[55:0]) ? cam_loc21 : 320'd0 )
( (snoop_in == cam_loc22[55:0]) ? cam_loc22 : 320'd0 )
( (snoop_in == cam_loc23[55:0]) ? cam_loc23 : 320'd0 )
( (snoop_in == cam_loc24[55:0]) ? cam_loc24 : 320'd0 )
( (snoop_in == cam_loc25[55:0]) ? cam_loc25 : 320'd0 )
( (snoop_in == cam_loc26[55:0]) ? cam_loc26 : 320'd0 )
( (snoop_in == cam_loc27[55:0]) ? cam_loc27 : 320'd0 )
( (snoop_in == cam_loc28[55:0]) ? cam_loc28 : 320'd0 )
( (snoop_in == cam_loc29[55:0]) ? cam_loc29 : 320'd0 )
( (snoop_in == cam_loc30[55:0]) ? cam_loc30 : 320'd0 )
( (snoop_in == cam_loc31[55:0]) ? cam_loc31 : 320'd0 )
( (snoop_in == cam_loc32[55:0]) ? cam_loc32 : 320'd0 )
( (snoop_in == cam_loc33[55:0]) ? cam_loc33 : 320'd0 )
( (snoop_in == cam_loc34[55:0]) ? cam_loc34 : 320'd0 )
( (snoop_in == cam_loc35[55:0]) ? cam_loc35 : 320'd0 )
( (snoop_in == cam_loc36[55:0]) ? cam_loc36 : 320'd0 )
( (snoop_in == cam_loc37[55:0]) ? cam_loc37 : 320'd0 )
( (snoop_in == cam_loc38[55:0]) ? cam_loc38 : 320'd0 )
( (snoop_in == cam_loc39[55:0]) ? cam_loc39 : 320'd0 )
( (snoop_in == cam_loc40[55:0]) ? cam_loc40 : 320'd0 )
( (snoop_in == cam_loc41[55:0]) ? cam_loc41 : 320'd0 )
( (snoop_in == cam_loc42[55:0]) ? cam_loc42 : 320'd0 )
( (snoop_in == cam_loc43[55:0]) ? cam_loc43 : 320'd0 )
( (snoop_in == cam_loc44[55:0]) ? cam_loc44 : 320'd0 )
( (snoop_in == cam_loc45[55:0]) ? cam_loc45 : 320'd0 )
( (snoop_in == cam_loc46[55:0]) ? cam_loc46 : 320'd0 )
( (snoop_in == cam_loc47[55:0]) ? cam_loc47 : 320'd0 )
( (snoop_in == cam_loc48[55:0]) ? cam_loc48 : 320'd0 )
( (snoop_in == cam_loc49[55:0]) ? cam_loc49 : 320'd0 )
( (snoop_in == cam_loc50[55:0]) ? cam_loc50 : 320'd0 )
( (snoop_in == cam_loc51[55:0]) ? cam_loc51 : 320'd0 )
( (snoop_in == cam_loc52[55:0]) ? cam_loc52 : 320'd0 )
( (snoop_in == cam_loc53[55:0]) ? cam_loc53 : 320'd0 )
( (snoop_in == cam_loc54[55:0]) ? cam_loc54 : 320'd0 )
( (snoop_in == cam_loc55[55:0]) ? cam_loc55 : 320'd0 )
( (snoop_in == cam_loc56[55:0]) ? cam_loc56 : 320'd0 )
( (snoop_in == cam_loc57[55:0]) ? cam_loc57 : 320'd0 )
( (snoop_in == cam_loc58[55:0]) ? cam_loc58 : 320'd0 )
( (snoop_in == cam_loc59[55:0]) ? cam_loc59 : 320'd0 )
( (snoop_in == cam_loc60[55:0]) ? cam_loc60 : 320'd0 )
( (snoop_in == cam_loc61[55:0]) ? cam_loc61 : 320'd0 )
( (snoop_in == cam_loc62[55:0]) ? cam_loc62 : 320'd0 )
( (snoop_in == cam_loc63[55:0]) ? cam_loc63 : 320'd0 )
( (snoop_in == cam_loc64[55:0]) ? cam_loc64 : 320'd0 )
( (snoop_in == cam_loc65[55:0]) ? cam_loc65 : 320'd0 )
( (snoop_in == cam_loc66[55:0]) ? cam_loc66 : 320'd0 )
( (snoop_in == cam_loc67[55:0]) ? cam_loc67 : 320'd0 )
( (snoop_in == cam_loc68[55:0]) ? cam_loc68 : 320'd0 )
( (snoop_in == cam_loc69[55:0]) ? cam_loc69 : 320'd0 )
( (snoop_in == cam_loc70[55:0]) ? cam_loc70 : 320'd0 )
( (snoop_in == cam_loc71[55:0]) ? cam_loc71 : 320'd0 )
( (snoop_in == cam_loc72[55:0]) ? cam_loc72 : 320'd0 )
( (snoop_in == cam_loc73[55:0]) ? cam_loc73 : 320'd0 )
( (snoop_in == cam_loc74[55:0]) ? cam_loc74 : 320'd0 )
( (snoop_in == cam_loc75[55:0]) ? cam_loc75 : 320'd0 )
( (snoop_in == cam_loc76[55:0]) ? cam_loc76 : 320'd0 )
( (snoop_in == cam_loc77[55:0]) ? cam_loc77 : 320'd0 )
( (snoop_in == cam_loc78[55:0]) ? cam_loc78 : 320'd0 )
( (snoop_in == cam_loc79[55:0]) ? cam_loc79 : 320'd0 )
( (snoop_in == cam_loc80[55:0]) ? cam_loc80 : 320'd0 )
( (snoop_in == cam_loc81[55:0]) ? cam_loc81 : 320'd0 )
( (snoop_in == cam_loc82[55:0]) ? cam_loc82 : 320'd0 )
( (snoop_in == cam_loc83[55:0]) ? cam_loc83 : 320'd0 )
( (snoop_in == cam_loc84[55:0]) ? cam_loc84 : 320'd0 )
( (snoop_in == cam_loc85[55:0]) ? cam_loc85 : 320'd0 )
( (snoop_in == cam_loc86[55:0]) ? cam_loc86 : 320'd0 )
( (snoop_in == cam_loc87[55:0]) ? cam_loc87 : 320'd0 )
( (snoop_in == cam_loc88[55:0]) ? cam_loc88 : 320'd0 )
( (snoop_in == cam_loc89[55:0]) ? cam_loc89 : 320'd0 )
( (snoop_in == cam_loc90[55:0]) ? cam_loc90 : 320'd0 )
( (snoop_in == cam_loc91[55:0]) ? cam_loc91 : 320'd0 )
( (snoop_in == cam_loc92[55:0]) ? cam_loc92 : 320'd0 )
( (snoop_in == cam_loc93[55:0]) ? cam_loc93 : 320'd0 )
( (snoop_in == cam_loc94[55:0]) ? cam_loc94 : 320'd0 )
( (snoop_in == cam_loc95[55:0]) ? cam_loc95 : 320'd0 )
( (snoop_in == cam_loc96[55:0]) ? cam_loc96 : 320'd0 )
( (snoop_in == cam_loc97[55:0]) ? cam_loc97 : 320'd0 )
( (snoop_in == cam_loc98[55:0]) ? cam_loc98 : 320'd0 )
( (snoop_in == cam_loc99[55:0]) ? cam_loc99 : 320'd0 )
( (snoop_in == cam_loc100[55:0]) ? cam_loc100 : 320'd0 )
( (snoop_in == cam_loc101[55:0]) ? cam_loc101 : 320'd0 )
;

wire assign freeup_loc = 7'd0 |
( (snoop_in == cam_loc0[55:0]) ?cam_loc0 : 7'd0 )|
( (snoop_in == cam_loc1[55:0]) ?cam_loc1 : 7'd1 )|
( (snoop_in == cam_loc2[55:0]) ?cam_loc2 : 7'd2 )|
( (snoop_in == cam_loc3[55:0]) ?cam_loc3 : 7'd3 )|
( (snoop_in == cam_loc4[55:0]) ?cam_loc4 : 7'd4 )|
( (snoop_in == cam_loc5[55:0]) ?cam_loc5 : 7'd5 )|
( (snoop_in == cam_loc6[55:0]) ?cam_loc6 : 7'd6 )|
( (snoop_in == cam_loc7[55:0]) ?cam_loc7 : 7'd7 )|
( (snoop_in == cam_loc8[55:0]) ?cam_loc8 : 7'd8 )|
( (snoop_in == cam_loc9[55:0]) ?cam_loc9 : 7'd9 )|
( (snoop_in == cam_loc10[55:0]) ?cam_loc10 : 7'd10 )|
( (snoop_in == cam_loc11[55:0]) ?cam_loc11 : 7'd11 )|
( (snoop_in == cam_loc12[55:0]) ?cam_loc12 : 7'd12 )|
( (snoop_in == cam_loc13[55:0]) ?cam_loc13 : 7'd13 )|
( (snoop_in == cam_loc14[55:0]) ?cam_loc14 : 7'd14 )|
( (snoop_in == cam_loc15[55:0]) ?cam_loc15 : 7'd15 )|
( (snoop_in == cam_loc16[55:0]) ?cam_loc16 : 7'd16 )|
( (snoop_in == cam_loc17[55:0]) ?cam_loc17 : 7'd17 )|
( (snoop_in == cam_loc18[55:0]) ?cam_loc18 : 7'd18 )|
( (snoop_in == cam_loc19[55:0]) ?cam_loc19 : 7'd19 )|
( (snoop_in == cam_loc20[55:0]) ?cam_loc20 : 7'd20 )|
( (snoop_in == cam_loc21[55:0]) ?cam_loc21 : 7'd21 )|
( (snoop_in == cam_loc22[55:0]) ?cam_loc22 : 7'd22 )|
( (snoop_in == cam_loc23[55:0]) ?cam_loc23 : 7'd23 )|
( (snoop_in == cam_loc24[55:0]) ?cam_loc24 : 7'd24 )|
( (snoop_in == cam_loc25[55:0]) ?cam_loc25 : 7'd25 )|
( (snoop_in == cam_loc26[55:0]) ?cam_loc26 : 7'd26 )|
( (snoop_in == cam_loc27[55:0]) ?cam_loc27 : 7'd27 )|
( (snoop_in == cam_loc28[55:0]) ?cam_loc28 : 7'd28 )|
( (snoop_in == cam_loc29[55:0]) ?cam_loc29 : 7'd29 )|
( (snoop_in == cam_loc30[55:0]) ?cam_loc30 : 7'd30 )|
( (snoop_in == cam_loc31[55:0]) ?cam_loc31 : 7'd31 )|
( (snoop_in == cam_loc32[55:0]) ?cam_loc32 : 7'd32 )|
( (snoop_in == cam_loc33[55:0]) ?cam_loc33 : 7'd33 )|
( (snoop_in == cam_loc34[55:0]) ?cam_loc34 : 7'd34 )|
( (snoop_in == cam_loc35[55:0]) ?cam_loc35 : 7'd35 )|
( (snoop_in == cam_loc36[55:0]) ?cam_loc36 : 7'd36 )|
( (snoop_in == cam_loc37[55:0]) ?cam_loc37 : 7'd37 )|
( (snoop_in == cam_loc38[55:0]) ?cam_loc38 : 7'd38 )|
( (snoop_in == cam_loc39[55:0]) ?cam_loc39 : 7'd39 )|
( (snoop_in == cam_loc40[55:0]) ?cam_loc40 : 7'd40 )|
( (snoop_in == cam_loc41[55:0]) ?cam_loc41 : 7'd41 )|
( (snoop_in == cam_loc42[55:0]) ?cam_loc42 : 7'd42 )|
( (snoop_in == cam_loc43[55:0]) ?cam_loc43 : 7'd43 )|
( (snoop_in == cam_loc44[55:0]) ?cam_loc44 : 7'd44 )|
( (snoop_in == cam_loc45[55:0]) ?cam_loc45 : 7'd45 )|
( (snoop_in == cam_loc46[55:0]) ?cam_loc46 : 7'd46 )|
( (snoop_in == cam_loc47[55:0]) ?cam_loc47 : 7'd47 )|
( (snoop_in == cam_loc48[55:0]) ?cam_loc48 : 7'd48 )|
( (snoop_in == cam_loc49[55:0]) ?cam_loc49 : 7'd49 )|
( (snoop_in == cam_loc50[55:0]) ?cam_loc50 : 7'd50 )|
( (snoop_in == cam_loc51[55:0]) ?cam_loc51 : 7'd51 )|
( (snoop_in == cam_loc52[55:0]) ?cam_loc52 : 7'd52 )|
( (snoop_in == cam_loc53[55:0]) ?cam_loc53 : 7'd53 )|
( (snoop_in == cam_loc54[55:0]) ?cam_loc54 : 7'd54 )|
( (snoop_in == cam_loc55[55:0]) ?cam_loc55 : 7'd55 )|
( (snoop_in == cam_loc56[55:0]) ?cam_loc56 : 7'd56 )|
( (snoop_in == cam_loc57[55:0]) ?cam_loc57 : 7'd57 )|
( (snoop_in == cam_loc58[55:0]) ?cam_loc58 : 7'd58 )|
( (snoop_in == cam_loc59[55:0]) ?cam_loc59 : 7'd59 )|
( (snoop_in == cam_loc60[55:0]) ?cam_loc60 : 7'd60 )|
( (snoop_in == cam_loc61[55:0]) ?cam_loc61 : 7'd61 )|
( (snoop_in == cam_loc62[55:0]) ?cam_loc62 : 7'd62 )|
( (snoop_in == cam_loc63[55:0]) ?cam_loc63 : 7'd63 )|
( (snoop_in == cam_loc64[55:0]) ?cam_loc64 : 7'd64 )|
( (snoop_in == cam_loc65[55:0]) ?cam_loc65 : 7'd65 )|
( (snoop_in == cam_loc66[55:0]) ?cam_loc66 : 7'd66 )|
( (snoop_in == cam_loc67[55:0]) ?cam_loc67 : 7'd67 )|
( (snoop_in == cam_loc68[55:0]) ?cam_loc68 : 7'd68 )|
( (snoop_in == cam_loc69[55:0]) ?cam_loc69 : 7'd69 )|
( (snoop_in == cam_loc70[55:0]) ?cam_loc70 : 7'd70 )|
( (snoop_in == cam_loc71[55:0]) ?cam_loc71 : 7'd71 )|
( (snoop_in == cam_loc72[55:0]) ?cam_loc72 : 7'd72 )|
( (snoop_in == cam_loc73[55:0]) ?cam_loc73 : 7'd73 )|
( (snoop_in == cam_loc74[55:0]) ?cam_loc74 : 7'd74 )|
( (snoop_in == cam_loc75[55:0]) ?cam_loc75 : 7'd75 )|
( (snoop_in == cam_loc76[55:0]) ?cam_loc76 : 7'd76 )|
( (snoop_in == cam_loc77[55:0]) ?cam_loc77 : 7'd77 )|
( (snoop_in == cam_loc78[55:0]) ?cam_loc78 : 7'd78 )|
( (snoop_in == cam_loc79[55:0]) ?cam_loc79 : 7'd79 )|
( (snoop_in == cam_loc80[55:0]) ?cam_loc80 : 7'd80 )|
( (snoop_in == cam_loc81[55:0]) ?cam_loc81 : 7'd81 )|
( (snoop_in == cam_loc82[55:0]) ?cam_loc82 : 7'd82 )|
( (snoop_in == cam_loc83[55:0]) ?cam_loc83 : 7'd83 )|
( (snoop_in == cam_loc84[55:0]) ?cam_loc84 : 7'd84 )|
( (snoop_in == cam_loc85[55:0]) ?cam_loc85 : 7'd85 )|
( (snoop_in == cam_loc86[55:0]) ?cam_loc86 : 7'd86 )|
( (snoop_in == cam_loc87[55:0]) ?cam_loc87 : 7'd87 )|
( (snoop_in == cam_loc88[55:0]) ?cam_loc88 : 7'd88 )|
( (snoop_in == cam_loc89[55:0]) ?cam_loc89 : 7'd89 )|
( (snoop_in == cam_loc90[55:0]) ?cam_loc90 : 7'd90 )|
( (snoop_in == cam_loc91[55:0]) ?cam_loc91 : 7'd91 )|
( (snoop_in == cam_loc92[55:0]) ?cam_loc92 : 7'd92 )|
( (snoop_in == cam_loc93[55:0]) ?cam_loc93 : 7'd93 )|
( (snoop_in == cam_loc94[55:0]) ?cam_loc94 : 7'd94 )|
( (snoop_in == cam_loc95[55:0]) ?cam_loc95 : 7'd95 )|
( (snoop_in == cam_loc96[55:0]) ?cam_loc96 : 7'd96 )|
( (snoop_in == cam_loc97[55:0]) ?cam_loc97 : 7'd97 )|
( (snoop_in == cam_loc98[55:0]) ?cam_loc98 : 7'd98 )|
( (snoop_in == cam_loc99[55:0]) ?cam_loc99 : 7'd99 )|
( (snoop_in == cam_loc100[55:0]) ?cam_loc100 : 7'd100 )|
( (snoop_in == cam_loc101[55:0]) ?cam_loc101 : 7'd101 )
;

wire assign freedup_loc_valid = snoop_match;





endmodule

