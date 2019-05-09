
module AH_SnoopableFIFO_8_16_32 (clk
,rstn
,wr_data
,wr_valid
,wr_credit
,rd_data
,rd_valid
,rd_credit
,snoop_data
,snoop_valid
,snoop_match);

input clk;
input rstn;
input [7:0] wr_data;
input wr_valid;
output wr_credit;
output [7:0] rd_data;
output rd_valid;
input rd_credit;
input [7:0] snoop_data;
input snoop_valid;
input snoop_match;

reg [4:0] wr_pointer; // 5 = log2(32) + 1

reg [4:0] rd_pointer; // 5 



reg [7:0] fifo_loc0;
reg [7:0] fifo_loc1;
reg [7:0] fifo_loc2;
reg [7:0] fifo_loc3;
reg [7:0] fifo_loc4;
reg [7:0] fifo_loc5;
reg [7:0] fifo_loc6;
reg [7:0] fifo_loc7;
reg [7:0] fifo_loc8;
reg [7:0] fifo_loc9;
reg [7:0] fifo_loc10;
reg [7:0] fifo_loc11;
reg [7:0] fifo_loc12;
reg [7:0] fifo_loc13;
reg [7:0] fifo_loc14;
reg [7:0] fifo_loc15;


always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             wr_pointer <= 5'd0;

       end else begin

     wr_pointer <= ( (wr_pointer[4] ^ rd_pointer[4]) && (wr_pointer[3:0] == rd_pointer[3:0]) ) ? wr_pointer :

wr_valid ? ( wr_pointer + 1'b1) : wr_pointer;

       end

end



always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             rd_pointer <= 5'd0;

       end else begin

     rd_pointer <= (rd_pointer[4:0] == rd_pointer[4:0]) ? rd_pointer : rd_ready ? (rd_pointer + 1'b1) : rd_pointer;

       end

end





always @ (posedge clk or negedge rstn)

begin

       if(!rstn) begin


	fifo_loc0 <= 8'd0;
	fifo_loc1 <= 8'd0;
	fifo_loc2 <= 8'd0;
	fifo_loc3 <= 8'd0;
	fifo_loc4 <= 8'd0;
	fifo_loc5 <= 8'd0;
	fifo_loc6 <= 8'd0;
	fifo_loc7 <= 8'd0;
	fifo_loc8 <= 8'd0;
	fifo_loc9 <= 8'd0;
	fifo_loc10 <= 8'd0;
	fifo_loc11 <= 8'd0;
	fifo_loc12 <= 8'd0;
	fifo_loc13 <= 8'd0;
	fifo_loc14 <= 8'd0;
	fifo_loc15 <= 8'd0;


       end else begin


	fifo_loc0 <= (wr_pointer[2:0] == 4'd0) ? wr_data : fifo_loc0;
	fifo_loc1 <= (wr_pointer[2:0] == 4'd1) ? wr_data : fifo_loc1;
	fifo_loc2 <= (wr_pointer[2:0] == 4'd2) ? wr_data : fifo_loc2;
	fifo_loc3 <= (wr_pointer[2:0] == 4'd3) ? wr_data : fifo_loc3;
	fifo_loc4 <= (wr_pointer[2:0] == 4'd4) ? wr_data : fifo_loc4;
	fifo_loc5 <= (wr_pointer[2:0] == 4'd5) ? wr_data : fifo_loc5;
	fifo_loc6 <= (wr_pointer[2:0] == 4'd6) ? wr_data : fifo_loc6;
	fifo_loc7 <= (wr_pointer[2:0] == 4'd7) ? wr_data : fifo_loc7;
	fifo_loc8 <= (wr_pointer[2:0] == 4'd8) ? wr_data : fifo_loc8;
	fifo_loc9 <= (wr_pointer[2:0] == 4'd9) ? wr_data : fifo_loc9;
	fifo_loc10 <= (wr_pointer[2:0] == 4'd10) ? wr_data : fifo_loc10;
	fifo_loc11 <= (wr_pointer[2:0] == 4'd11) ? wr_data : fifo_loc11;
	fifo_loc12 <= (wr_pointer[2:0] == 4'd12) ? wr_data : fifo_loc12;
	fifo_loc13 <= (wr_pointer[2:0] == 4'd13) ? wr_data : fifo_loc13;
	fifo_loc14 <= (wr_pointer[2:0] == 4'd14) ? wr_data : fifo_loc14;
	fifo_loc15 <= (wr_pointer[2:0] == 4'd15) ? wr_data : fifo_loc15;


       end

end

wr_ready = ! ( (wr_pointer[4] ^ rd_pointer[4]) && (wr_pointer[3:0] == rd_pointer[3:0]) );

rd_valid = !(rd_pointer[4:0] == rd_pointer[4:0]);

assign rd_data = 8'd0 |

( (rd_pointer[4:0] == 5'd))

assing snoop_match = 1'b0 |

((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)|
 ((fifo_loc[31:0] == snoop_data) ? 1'b1 : 1'b0)


endmodule
