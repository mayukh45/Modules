
module AH_SnoopableFIFO_32_45_22 (clk
,rstn);

input clk;
input rstn;


reg [6:0] wr_pointer; // 7 = log2(32) + 1

reg [6:0] rd_pointer; // 7



reg [32:0] fifo_loc0;
reg [32:0] fifo_loc1;
reg [32:0] fifo_loc2;
reg [32:0] fifo_loc3;
reg [32:0] fifo_loc4;
reg [32:0] fifo_loc5;
reg [32:0] fifo_loc6;
reg [32:0] fifo_loc7;
reg [32:0] fifo_loc8;
reg [32:0] fifo_loc9;
reg [32:0] fifo_loc10;
reg [32:0] fifo_loc11;
reg [32:0] fifo_loc12;
reg [32:0] fifo_loc13;
reg [32:0] fifo_loc14;
reg [32:0] fifo_loc15;
reg [32:0] fifo_loc16;
reg [32:0] fifo_loc17;
reg [32:0] fifo_loc18;
reg [32:0] fifo_loc19;
reg [32:0] fifo_loc20;
reg [32:0] fifo_loc21;
reg [32:0] fifo_loc22;
reg [32:0] fifo_loc23;
reg [32:0] fifo_loc24;
reg [32:0] fifo_loc25;
reg [32:0] fifo_loc26;
reg [32:0] fifo_loc27;
reg [32:0] fifo_loc28;
reg [32:0] fifo_loc29;
reg [32:0] fifo_loc30;
reg [32:0] fifo_loc31;
reg [32:0] fifo_loc32;
reg [32:0] fifo_loc33;
reg [32:0] fifo_loc34;
reg [32:0] fifo_loc35;
reg [32:0] fifo_loc36;
reg [32:0] fifo_loc37;
reg [32:0] fifo_loc38;
reg [32:0] fifo_loc39;
reg [32:0] fifo_loc40;
reg [32:0] fifo_loc41;
reg [32:0] fifo_loc42;
reg [32:0] fifo_loc43;
reg [32:0] fifo_loc44;




always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             wr_pointer <= 7'd0;

       end else begin

     wr_pointer <= ( (wr_pointer[6] ^ rd_pointer[6]) && (wr_pointer[5:0] == rd_pointer[5:0]) ) ? wr_pointer :

wr_valid ? ( wr_pointer + 1'b1) : wr_pointer;

       end

end



always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             rd_pointer <= 7'd0;

       end else begin

     rd_pointer <= (rd_pointer[6:0] == rd_pointer[6:0]) ? rd_pointer : rd_ready ? (rd_pointer + 1'b1) : rd_pointer;

       end

end





always @ (posedge clk or negedge rstn)

begin

       if(!rstn) begin


	fifo_loc0 <= 32'd0;
	fifo_loc1 <= 32'd0;
	fifo_loc2 <= 32'd0;
	fifo_loc3 <= 32'd0;
	fifo_loc4 <= 32'd0;
	fifo_loc5 <= 32'd0;
	fifo_loc6 <= 32'd0;
	fifo_loc7 <= 32'd0;
	fifo_loc8 <= 32'd0;
	fifo_loc9 <= 32'd0;
	fifo_loc10 <= 32'd0;
	fifo_loc11 <= 32'd0;
	fifo_loc12 <= 32'd0;
	fifo_loc13 <= 32'd0;
	fifo_loc14 <= 32'd0;
	fifo_loc15 <= 32'd0;
	fifo_loc16 <= 32'd0;
	fifo_loc17 <= 32'd0;
	fifo_loc18 <= 32'd0;
	fifo_loc19 <= 32'd0;
	fifo_loc20 <= 32'd0;
	fifo_loc21 <= 32'd0;
	fifo_loc22 <= 32'd0;
	fifo_loc23 <= 32'd0;
	fifo_loc24 <= 32'd0;
	fifo_loc25 <= 32'd0;
	fifo_loc26 <= 32'd0;
	fifo_loc27 <= 32'd0;
	fifo_loc28 <= 32'd0;
	fifo_loc29 <= 32'd0;
	fifo_loc30 <= 32'd0;
	fifo_loc31 <= 32'd0;
	fifo_loc32 <= 32'd0;
	fifo_loc33 <= 32'd0;
	fifo_loc34 <= 32'd0;
	fifo_loc35 <= 32'd0;
	fifo_loc36 <= 32'd0;
	fifo_loc37 <= 32'd0;
	fifo_loc38 <= 32'd0;
	fifo_loc39 <= 32'd0;
	fifo_loc40 <= 32'd0;
	fifo_loc41 <= 32'd0;
	fifo_loc42 <= 32'd0;
	fifo_loc43 <= 32'd0;
	fifo_loc44 <= 32'd0;

       end else begin


	fifo_loc0 <= (wr_pointer[4:0] == 6'd0) ? wr_data : fifo_loc0;
	fifo_loc1 <= (wr_pointer[4:0] == 6'd1) ? wr_data : fifo_loc1;
	fifo_loc2 <= (wr_pointer[4:0] == 6'd2) ? wr_data : fifo_loc2;
	fifo_loc3 <= (wr_pointer[4:0] == 6'd3) ? wr_data : fifo_loc3;
	fifo_loc4 <= (wr_pointer[4:0] == 6'd4) ? wr_data : fifo_loc4;
	fifo_loc5 <= (wr_pointer[4:0] == 6'd5) ? wr_data : fifo_loc5;
	fifo_loc6 <= (wr_pointer[4:0] == 6'd6) ? wr_data : fifo_loc6;
	fifo_loc7 <= (wr_pointer[4:0] == 6'd7) ? wr_data : fifo_loc7;
	fifo_loc8 <= (wr_pointer[4:0] == 6'd8) ? wr_data : fifo_loc8;
	fifo_loc9 <= (wr_pointer[4:0] == 6'd9) ? wr_data : fifo_loc9;
	fifo_loc10 <= (wr_pointer[4:0] == 6'd10) ? wr_data : fifo_loc10;
	fifo_loc11 <= (wr_pointer[4:0] == 6'd11) ? wr_data : fifo_loc11;
	fifo_loc12 <= (wr_pointer[4:0] == 6'd12) ? wr_data : fifo_loc12;
	fifo_loc13 <= (wr_pointer[4:0] == 6'd13) ? wr_data : fifo_loc13;
	fifo_loc14 <= (wr_pointer[4:0] == 6'd14) ? wr_data : fifo_loc14;
	fifo_loc15 <= (wr_pointer[4:0] == 6'd15) ? wr_data : fifo_loc15;
	fifo_loc16 <= (wr_pointer[4:0] == 6'd16) ? wr_data : fifo_loc16;
	fifo_loc17 <= (wr_pointer[4:0] == 6'd17) ? wr_data : fifo_loc17;
	fifo_loc18 <= (wr_pointer[4:0] == 6'd18) ? wr_data : fifo_loc18;
	fifo_loc19 <= (wr_pointer[4:0] == 6'd19) ? wr_data : fifo_loc19;
	fifo_loc20 <= (wr_pointer[4:0] == 6'd20) ? wr_data : fifo_loc20;
	fifo_loc21 <= (wr_pointer[4:0] == 6'd21) ? wr_data : fifo_loc21;
	fifo_loc22 <= (wr_pointer[4:0] == 6'd22) ? wr_data : fifo_loc22;
	fifo_loc23 <= (wr_pointer[4:0] == 6'd23) ? wr_data : fifo_loc23;
	fifo_loc24 <= (wr_pointer[4:0] == 6'd24) ? wr_data : fifo_loc24;
	fifo_loc25 <= (wr_pointer[4:0] == 6'd25) ? wr_data : fifo_loc25;
	fifo_loc26 <= (wr_pointer[4:0] == 6'd26) ? wr_data : fifo_loc26;
	fifo_loc27 <= (wr_pointer[4:0] == 6'd27) ? wr_data : fifo_loc27;
	fifo_loc28 <= (wr_pointer[4:0] == 6'd28) ? wr_data : fifo_loc28;
	fifo_loc29 <= (wr_pointer[4:0] == 6'd29) ? wr_data : fifo_loc29;
	fifo_loc30 <= (wr_pointer[4:0] == 6'd30) ? wr_data : fifo_loc30;
	fifo_loc31 <= (wr_pointer[4:0] == 6'd31) ? wr_data : fifo_loc31;
	fifo_loc32 <= (wr_pointer[4:0] == 6'd32) ? wr_data : fifo_loc32;
	fifo_loc33 <= (wr_pointer[4:0] == 6'd33) ? wr_data : fifo_loc33;
	fifo_loc34 <= (wr_pointer[4:0] == 6'd34) ? wr_data : fifo_loc34;
	fifo_loc35 <= (wr_pointer[4:0] == 6'd35) ? wr_data : fifo_loc35;
	fifo_loc36 <= (wr_pointer[4:0] == 6'd36) ? wr_data : fifo_loc36;
	fifo_loc37 <= (wr_pointer[4:0] == 6'd37) ? wr_data : fifo_loc37;
	fifo_loc38 <= (wr_pointer[4:0] == 6'd38) ? wr_data : fifo_loc38;
	fifo_loc39 <= (wr_pointer[4:0] == 6'd39) ? wr_data : fifo_loc39;
	fifo_loc40 <= (wr_pointer[4:0] == 6'd40) ? wr_data : fifo_loc40;
	fifo_loc41 <= (wr_pointer[4:0] == 6'd41) ? wr_data : fifo_loc41;
	fifo_loc42 <= (wr_pointer[4:0] == 6'd42) ? wr_data : fifo_loc42;
	fifo_loc43 <= (wr_pointer[4:0] == 6'd43) ? wr_data : fifo_loc43;
	fifo_loc44 <= (wr_pointer[4:0] == 6'd44) ? wr_data : fifo_loc44;




       end

end

wr_ready = ! ( (wr_pointer[6] ^ rd_pointer[6]) && (wr_pointer[5:0] == rd_pointer[5:0]) );

rd_valid = !(rd_pointer[6:0] == rd_pointer[6:0]);

assign rd_data = 32'd0 |

( (rd_pointer[6:0] == 7'd0) ? fifo_loc0 : 32'd0)|
( (rd_pointer[6:0] == 7'd1) ? fifo_loc1 : 32'd0)|
( (rd_pointer[6:0] == 7'd2) ? fifo_loc2 : 32'd0)|
( (rd_pointer[6:0] == 7'd3) ? fifo_loc3 : 32'd0)|
( (rd_pointer[6:0] == 7'd4) ? fifo_loc4 : 32'd0)|
( (rd_pointer[6:0] == 7'd5) ? fifo_loc5 : 32'd0)|
( (rd_pointer[6:0] == 7'd6) ? fifo_loc6 : 32'd0)|
( (rd_pointer[6:0] == 7'd7) ? fifo_loc7 : 32'd0)|
( (rd_pointer[6:0] == 7'd8) ? fifo_loc8 : 32'd0)|
( (rd_pointer[6:0] == 7'd9) ? fifo_loc9 : 32'd0)|
( (rd_pointer[6:0] == 7'd10) ? fifo_loc10 : 32'd0)|
( (rd_pointer[6:0] == 7'd11) ? fifo_loc11 : 32'd0)|
( (rd_pointer[6:0] == 7'd12) ? fifo_loc12 : 32'd0)|
( (rd_pointer[6:0] == 7'd13) ? fifo_loc13 : 32'd0)|
( (rd_pointer[6:0] == 7'd14) ? fifo_loc14 : 32'd0)|
( (rd_pointer[6:0] == 7'd15) ? fifo_loc15 : 32'd0)|
( (rd_pointer[6:0] == 7'd16) ? fifo_loc16 : 32'd0)|
( (rd_pointer[6:0] == 7'd17) ? fifo_loc17 : 32'd0)|
( (rd_pointer[6:0] == 7'd18) ? fifo_loc18 : 32'd0)|
( (rd_pointer[6:0] == 7'd19) ? fifo_loc19 : 32'd0)|
( (rd_pointer[6:0] == 7'd20) ? fifo_loc20 : 32'd0)|
( (rd_pointer[6:0] == 7'd21) ? fifo_loc21 : 32'd0)|
( (rd_pointer[6:0] == 7'd22) ? fifo_loc22 : 32'd0)|
( (rd_pointer[6:0] == 7'd23) ? fifo_loc23 : 32'd0)|
( (rd_pointer[6:0] == 7'd24) ? fifo_loc24 : 32'd0)|
( (rd_pointer[6:0] == 7'd25) ? fifo_loc25 : 32'd0)|
( (rd_pointer[6:0] == 7'd26) ? fifo_loc26 : 32'd0)|
( (rd_pointer[6:0] == 7'd27) ? fifo_loc27 : 32'd0)|
( (rd_pointer[6:0] == 7'd28) ? fifo_loc28 : 32'd0)|
( (rd_pointer[6:0] == 7'd29) ? fifo_loc29 : 32'd0)|
( (rd_pointer[6:0] == 7'd30) ? fifo_loc30 : 32'd0)|
( (rd_pointer[6:0] == 7'd31) ? fifo_loc31 : 32'd0)|
( (rd_pointer[6:0] == 7'd32) ? fifo_loc32 : 32'd0)|
( (rd_pointer[6:0] == 7'd33) ? fifo_loc33 : 32'd0)|
( (rd_pointer[6:0] == 7'd34) ? fifo_loc34 : 32'd0)|
( (rd_pointer[6:0] == 7'd35) ? fifo_loc35 : 32'd0)|
( (rd_pointer[6:0] == 7'd36) ? fifo_loc36 : 32'd0)|
( (rd_pointer[6:0] == 7'd37) ? fifo_loc37 : 32'd0)|
( (rd_pointer[6:0] == 7'd38) ? fifo_loc38 : 32'd0)|
( (rd_pointer[6:0] == 7'd39) ? fifo_loc39 : 32'd0)|
( (rd_pointer[6:0] == 7'd40) ? fifo_loc40 : 32'd0)|
( (rd_pointer[6:0] == 7'd41) ? fifo_loc41 : 32'd0)|
( (rd_pointer[6:0] == 7'd42) ? fifo_loc42 : 32'd0)|
( (rd_pointer[6:0] == 7'd43) ? fifo_loc43 : 32'd0)|
( (rd_pointer[6:0] == 7'd44) ? fifo_loc44 : 32'd0)


assing snoop_match = 1'b0 |

((fifo_loc0[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc1[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc2[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc3[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc4[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc5[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc6[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc7[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc8[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc9[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc10[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc11[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc12[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc13[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc14[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc15[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc16[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc17[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc18[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc19[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc20[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc21[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc22[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc23[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc24[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc25[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc26[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc27[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc28[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc29[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc30[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc31[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc32[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc33[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc34[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc35[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc36[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc37[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc38[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc39[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc40[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc41[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc42[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc43[21:0] == snoop_data) ? 1'b1 : 1'b0)|
((fifo_loc44[21:0] == snoop_data) ? 1'b1 : 1'b0)


// snoop_match isn't used now - it can be in future.


endmodule

