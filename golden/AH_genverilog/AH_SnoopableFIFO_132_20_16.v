
module AH_SnoopableFIFO_132_20_16 (wdata
,wvalid
,wready
,rdata
,rvalid
,rready
,sdata
,svalid
,smatch);

input [131:0] wdata;
input wvalid;
output wready;
output [131:0] rdata;
output rvalid;
input rready;
input [131:0] sdata;
input svalid;
input smatch;



reg [5:0] wr_pointer; // 6 = log2(32) + 1

reg [5:0] rd_pointer; // 6



reg [131:0] fifo_loc0;
reg [131:0] fifo_loc1;
reg [131:0] fifo_loc2;
reg [131:0] fifo_loc3;
reg [131:0] fifo_loc4;
reg [131:0] fifo_loc5;
reg [131:0] fifo_loc6;
reg [131:0] fifo_loc7;
reg [131:0] fifo_loc8;
reg [131:0] fifo_loc9;
reg [131:0] fifo_loc10;
reg [131:0] fifo_loc11;
reg [131:0] fifo_loc12;
reg [131:0] fifo_loc13;
reg [131:0] fifo_loc14;
reg [131:0] fifo_loc15;
reg [131:0] fifo_loc16;
reg [131:0] fifo_loc17;
reg [131:0] fifo_loc18;
reg [131:0] fifo_loc19;


always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             wr_pointer <= 6'd0;

       end else begin

     wr_pointer <= ( (wr_pointer[5] ^ rd_pointer[5]) && (wr_pointer[4:0] == rd_pointer[4:0]) ) ? wr_pointer :

wr_valid ? ( wr_pointer + 1'b1) : wr_pointer;

       end

end



always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             rd_pointer <= 6'd0;

       end else begin

     rd_pointer <= (rd_pointer[5:0] == rd_pointer[5:0]) ? rd_pointer : rd_ready ? (rd_pointer + 1'b1) : rd_pointer;

       end

end





always @ (posedge clk or negedge rstn)

begin

       if(!rstn) begin


	fifo_loc0 <= 132'd0;
	fifo_loc1 <= 132'd0;
	fifo_loc2 <= 132'd0;
	fifo_loc3 <= 132'd0;
	fifo_loc4 <= 132'd0;
	fifo_loc5 <= 132'd0;
	fifo_loc6 <= 132'd0;
	fifo_loc7 <= 132'd0;
	fifo_loc8 <= 132'd0;
	fifo_loc9 <= 132'd0;
	fifo_loc10 <= 132'd0;
	fifo_loc11 <= 132'd0;
	fifo_loc12 <= 132'd0;
	fifo_loc13 <= 132'd0;
	fifo_loc14 <= 132'd0;
	fifo_loc15 <= 132'd0;
	fifo_loc16 <= 132'd0;
	fifo_loc17 <= 132'd0;
	fifo_loc18 <= 132'd0;
	fifo_loc19 <= 132'd0;


       end else begin


	fifo_loc0 <= (wr_pointer[3:0] == 5'd0) ? wr_data : fifo_loc0;
	fifo_loc1 <= (wr_pointer[3:0] == 5'd1) ? wr_data : fifo_loc1;
	fifo_loc2 <= (wr_pointer[3:0] == 5'd2) ? wr_data : fifo_loc2;
	fifo_loc3 <= (wr_pointer[3:0] == 5'd3) ? wr_data : fifo_loc3;
	fifo_loc4 <= (wr_pointer[3:0] == 5'd4) ? wr_data : fifo_loc4;
	fifo_loc5 <= (wr_pointer[3:0] == 5'd5) ? wr_data : fifo_loc5;
	fifo_loc6 <= (wr_pointer[3:0] == 5'd6) ? wr_data : fifo_loc6;
	fifo_loc7 <= (wr_pointer[3:0] == 5'd7) ? wr_data : fifo_loc7;
	fifo_loc8 <= (wr_pointer[3:0] == 5'd8) ? wr_data : fifo_loc8;
	fifo_loc9 <= (wr_pointer[3:0] == 5'd9) ? wr_data : fifo_loc9;
	fifo_loc10 <= (wr_pointer[3:0] == 5'd10) ? wr_data : fifo_loc10;
	fifo_loc11 <= (wr_pointer[3:0] == 5'd11) ? wr_data : fifo_loc11;
	fifo_loc12 <= (wr_pointer[3:0] == 5'd12) ? wr_data : fifo_loc12;
	fifo_loc13 <= (wr_pointer[3:0] == 5'd13) ? wr_data : fifo_loc13;
	fifo_loc14 <= (wr_pointer[3:0] == 5'd14) ? wr_data : fifo_loc14;
	fifo_loc15 <= (wr_pointer[3:0] == 5'd15) ? wr_data : fifo_loc15;
	fifo_loc16 <= (wr_pointer[3:0] == 5'd16) ? wr_data : fifo_loc16;
	fifo_loc17 <= (wr_pointer[3:0] == 5'd17) ? wr_data : fifo_loc17;
	fifo_loc18 <= (wr_pointer[3:0] == 5'd18) ? wr_data : fifo_loc18;
	fifo_loc19 <= (wr_pointer[3:0] == 5'd19) ? wr_data : fifo_loc19;


       end

end

wr_ready = ! ( (wr_pointer[5] ^ rd_pointer[5]) && (wr_pointer[4:0] == rd_pointer[4:0]) );

rd_valid = !(rd_pointer[5:0] == rd_pointer[5:0]);

assign rd_data = 132'd0 |

( (rd_pointer[5:0] == 6'd))

assing snoop_match = 1'b0 |

((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[15:0] == snoop_data) ? 1'b1 : 1'b0)


endmodule
