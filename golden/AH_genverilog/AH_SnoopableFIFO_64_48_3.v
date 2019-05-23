
module AH_SnoopableFIFO_64_48_3 (wdata
,wvalid
,wready
,rdata
,rvalid
,rready
,sdata
,svalid
,smatch);

input [63:0] wdata;
input wvalid;
output wready;
output [63:0] rdata;
output rvalid;
input rready;
input [63:0] sdata;
input svalid;
input smatch;



reg [6:0] wr_pointer; // 7 = log2(32) + 1

reg [6:0] rd_pointer; // 7



reg [63:0] fifo_loc0;
reg [63:0] fifo_loc1;
reg [63:0] fifo_loc2;
reg [63:0] fifo_loc3;
reg [63:0] fifo_loc4;
reg [63:0] fifo_loc5;
reg [63:0] fifo_loc6;
reg [63:0] fifo_loc7;
reg [63:0] fifo_loc8;
reg [63:0] fifo_loc9;
reg [63:0] fifo_loc10;
reg [63:0] fifo_loc11;
reg [63:0] fifo_loc12;
reg [63:0] fifo_loc13;
reg [63:0] fifo_loc14;
reg [63:0] fifo_loc15;
reg [63:0] fifo_loc16;
reg [63:0] fifo_loc17;
reg [63:0] fifo_loc18;
reg [63:0] fifo_loc19;
reg [63:0] fifo_loc20;
reg [63:0] fifo_loc21;
reg [63:0] fifo_loc22;
reg [63:0] fifo_loc23;
reg [63:0] fifo_loc24;
reg [63:0] fifo_loc25;
reg [63:0] fifo_loc26;
reg [63:0] fifo_loc27;
reg [63:0] fifo_loc28;
reg [63:0] fifo_loc29;
reg [63:0] fifo_loc30;
reg [63:0] fifo_loc31;
reg [63:0] fifo_loc32;
reg [63:0] fifo_loc33;
reg [63:0] fifo_loc34;
reg [63:0] fifo_loc35;
reg [63:0] fifo_loc36;
reg [63:0] fifo_loc37;
reg [63:0] fifo_loc38;
reg [63:0] fifo_loc39;
reg [63:0] fifo_loc40;
reg [63:0] fifo_loc41;
reg [63:0] fifo_loc42;
reg [63:0] fifo_loc43;
reg [63:0] fifo_loc44;
reg [63:0] fifo_loc45;
reg [63:0] fifo_loc46;
reg [63:0] fifo_loc47;


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


	fifo_loc0 <= 64'd0;
	fifo_loc1 <= 64'd0;
	fifo_loc2 <= 64'd0;
	fifo_loc3 <= 64'd0;
	fifo_loc4 <= 64'd0;
	fifo_loc5 <= 64'd0;
	fifo_loc6 <= 64'd0;
	fifo_loc7 <= 64'd0;
	fifo_loc8 <= 64'd0;
	fifo_loc9 <= 64'd0;
	fifo_loc10 <= 64'd0;
	fifo_loc11 <= 64'd0;
	fifo_loc12 <= 64'd0;
	fifo_loc13 <= 64'd0;
	fifo_loc14 <= 64'd0;
	fifo_loc15 <= 64'd0;
	fifo_loc16 <= 64'd0;
	fifo_loc17 <= 64'd0;
	fifo_loc18 <= 64'd0;
	fifo_loc19 <= 64'd0;
	fifo_loc20 <= 64'd0;
	fifo_loc21 <= 64'd0;
	fifo_loc22 <= 64'd0;
	fifo_loc23 <= 64'd0;
	fifo_loc24 <= 64'd0;
	fifo_loc25 <= 64'd0;
	fifo_loc26 <= 64'd0;
	fifo_loc27 <= 64'd0;
	fifo_loc28 <= 64'd0;
	fifo_loc29 <= 64'd0;
	fifo_loc30 <= 64'd0;
	fifo_loc31 <= 64'd0;
	fifo_loc32 <= 64'd0;
	fifo_loc33 <= 64'd0;
	fifo_loc34 <= 64'd0;
	fifo_loc35 <= 64'd0;
	fifo_loc36 <= 64'd0;
	fifo_loc37 <= 64'd0;
	fifo_loc38 <= 64'd0;
	fifo_loc39 <= 64'd0;
	fifo_loc40 <= 64'd0;
	fifo_loc41 <= 64'd0;
	fifo_loc42 <= 64'd0;
	fifo_loc43 <= 64'd0;
	fifo_loc44 <= 64'd0;
	fifo_loc45 <= 64'd0;
	fifo_loc46 <= 64'd0;
	fifo_loc47 <= 64'd0;


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
	fifo_loc45 <= (wr_pointer[4:0] == 6'd45) ? wr_data : fifo_loc45;
	fifo_loc46 <= (wr_pointer[4:0] == 6'd46) ? wr_data : fifo_loc46;
	fifo_loc47 <= (wr_pointer[4:0] == 6'd47) ? wr_data : fifo_loc47;


       end

end

wr_ready = ! ( (wr_pointer[6] ^ rd_pointer[6]) && (wr_pointer[5:0] == rd_pointer[5:0]) );

rd_valid = !(rd_pointer[6:0] == rd_pointer[6:0]);

assign rd_data = 64'd0 |

( (rd_pointer[6:0] == 7'd))

assing snoop_match = 1'b0 |

((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[2:0] == snoop_data) ? 1'b1 : 1'b0)


endmodule
