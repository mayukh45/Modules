
module AH_SnoopableFIFO_140_78_3 (clk
,rstn
,wdata
,wvalid
,wcredit
,rdata
,rvalid
,rcredit
,sdata
,svalid
,smatch);

input clk;
input rstn;
input [139:0] wdata;
input wvalid;
output wcredit;
output [139:0] rdata;
output rvalid;
input rcredit;
input [139:0] sdata;
input svalid;
input smatch;

reg [7:0] wr_pointer; // 8 = log2(32) + 1

reg [7:0] rd_pointer; // 8 



reg [139:0] fifo_loc0;
reg [139:0] fifo_loc1;
reg [139:0] fifo_loc2;
reg [139:0] fifo_loc3;
reg [139:0] fifo_loc4;
reg [139:0] fifo_loc5;
reg [139:0] fifo_loc6;
reg [139:0] fifo_loc7;
reg [139:0] fifo_loc8;
reg [139:0] fifo_loc9;
reg [139:0] fifo_loc10;
reg [139:0] fifo_loc11;
reg [139:0] fifo_loc12;
reg [139:0] fifo_loc13;
reg [139:0] fifo_loc14;
reg [139:0] fifo_loc15;
reg [139:0] fifo_loc16;
reg [139:0] fifo_loc17;
reg [139:0] fifo_loc18;
reg [139:0] fifo_loc19;
reg [139:0] fifo_loc20;
reg [139:0] fifo_loc21;
reg [139:0] fifo_loc22;
reg [139:0] fifo_loc23;
reg [139:0] fifo_loc24;
reg [139:0] fifo_loc25;
reg [139:0] fifo_loc26;
reg [139:0] fifo_loc27;
reg [139:0] fifo_loc28;
reg [139:0] fifo_loc29;
reg [139:0] fifo_loc30;
reg [139:0] fifo_loc31;
reg [139:0] fifo_loc32;
reg [139:0] fifo_loc33;
reg [139:0] fifo_loc34;
reg [139:0] fifo_loc35;
reg [139:0] fifo_loc36;
reg [139:0] fifo_loc37;
reg [139:0] fifo_loc38;
reg [139:0] fifo_loc39;
reg [139:0] fifo_loc40;
reg [139:0] fifo_loc41;
reg [139:0] fifo_loc42;
reg [139:0] fifo_loc43;
reg [139:0] fifo_loc44;
reg [139:0] fifo_loc45;
reg [139:0] fifo_loc46;
reg [139:0] fifo_loc47;
reg [139:0] fifo_loc48;
reg [139:0] fifo_loc49;
reg [139:0] fifo_loc50;
reg [139:0] fifo_loc51;
reg [139:0] fifo_loc52;
reg [139:0] fifo_loc53;
reg [139:0] fifo_loc54;
reg [139:0] fifo_loc55;
reg [139:0] fifo_loc56;
reg [139:0] fifo_loc57;
reg [139:0] fifo_loc58;
reg [139:0] fifo_loc59;
reg [139:0] fifo_loc60;
reg [139:0] fifo_loc61;
reg [139:0] fifo_loc62;
reg [139:0] fifo_loc63;
reg [139:0] fifo_loc64;
reg [139:0] fifo_loc65;
reg [139:0] fifo_loc66;
reg [139:0] fifo_loc67;
reg [139:0] fifo_loc68;
reg [139:0] fifo_loc69;
reg [139:0] fifo_loc70;
reg [139:0] fifo_loc71;
reg [139:0] fifo_loc72;
reg [139:0] fifo_loc73;
reg [139:0] fifo_loc74;
reg [139:0] fifo_loc75;
reg [139:0] fifo_loc76;
reg [139:0] fifo_loc77;


always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             wr_pointer <= 8'd0;

       end else begin

     wr_pointer <= ( (wr_pointer[7] ^ rd_pointer[7]) && (wr_pointer[6:0] == rd_pointer[6:0]) ) ? wr_pointer :

wr_valid ? ( wr_pointer + 1'b1) : wr_pointer;

       end

end



always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             rd_pointer <= 8'd0;

       end else begin

     rd_pointer <= (rd_pointer[7:0] == rd_pointer[7:0]) ? rd_pointer : rd_ready ? (rd_pointer + 1'b1) : rd_pointer;

       end

end





always @ (posedge clk or negedge rstn)

begin

       if(!rstn) begin


	fifo_loc0 <= 140'd0;
	fifo_loc1 <= 140'd0;
	fifo_loc2 <= 140'd0;
	fifo_loc3 <= 140'd0;
	fifo_loc4 <= 140'd0;
	fifo_loc5 <= 140'd0;
	fifo_loc6 <= 140'd0;
	fifo_loc7 <= 140'd0;
	fifo_loc8 <= 140'd0;
	fifo_loc9 <= 140'd0;
	fifo_loc10 <= 140'd0;
	fifo_loc11 <= 140'd0;
	fifo_loc12 <= 140'd0;
	fifo_loc13 <= 140'd0;
	fifo_loc14 <= 140'd0;
	fifo_loc15 <= 140'd0;
	fifo_loc16 <= 140'd0;
	fifo_loc17 <= 140'd0;
	fifo_loc18 <= 140'd0;
	fifo_loc19 <= 140'd0;
	fifo_loc20 <= 140'd0;
	fifo_loc21 <= 140'd0;
	fifo_loc22 <= 140'd0;
	fifo_loc23 <= 140'd0;
	fifo_loc24 <= 140'd0;
	fifo_loc25 <= 140'd0;
	fifo_loc26 <= 140'd0;
	fifo_loc27 <= 140'd0;
	fifo_loc28 <= 140'd0;
	fifo_loc29 <= 140'd0;
	fifo_loc30 <= 140'd0;
	fifo_loc31 <= 140'd0;
	fifo_loc32 <= 140'd0;
	fifo_loc33 <= 140'd0;
	fifo_loc34 <= 140'd0;
	fifo_loc35 <= 140'd0;
	fifo_loc36 <= 140'd0;
	fifo_loc37 <= 140'd0;
	fifo_loc38 <= 140'd0;
	fifo_loc39 <= 140'd0;
	fifo_loc40 <= 140'd0;
	fifo_loc41 <= 140'd0;
	fifo_loc42 <= 140'd0;
	fifo_loc43 <= 140'd0;
	fifo_loc44 <= 140'd0;
	fifo_loc45 <= 140'd0;
	fifo_loc46 <= 140'd0;
	fifo_loc47 <= 140'd0;
	fifo_loc48 <= 140'd0;
	fifo_loc49 <= 140'd0;
	fifo_loc50 <= 140'd0;
	fifo_loc51 <= 140'd0;
	fifo_loc52 <= 140'd0;
	fifo_loc53 <= 140'd0;
	fifo_loc54 <= 140'd0;
	fifo_loc55 <= 140'd0;
	fifo_loc56 <= 140'd0;
	fifo_loc57 <= 140'd0;
	fifo_loc58 <= 140'd0;
	fifo_loc59 <= 140'd0;
	fifo_loc60 <= 140'd0;
	fifo_loc61 <= 140'd0;
	fifo_loc62 <= 140'd0;
	fifo_loc63 <= 140'd0;
	fifo_loc64 <= 140'd0;
	fifo_loc65 <= 140'd0;
	fifo_loc66 <= 140'd0;
	fifo_loc67 <= 140'd0;
	fifo_loc68 <= 140'd0;
	fifo_loc69 <= 140'd0;
	fifo_loc70 <= 140'd0;
	fifo_loc71 <= 140'd0;
	fifo_loc72 <= 140'd0;
	fifo_loc73 <= 140'd0;
	fifo_loc74 <= 140'd0;
	fifo_loc75 <= 140'd0;
	fifo_loc76 <= 140'd0;
	fifo_loc77 <= 140'd0;


       end else begin


	fifo_loc0 <= (wr_pointer[5:0] == 7'd0) ? wr_data : fifo_loc0;
	fifo_loc1 <= (wr_pointer[5:0] == 7'd1) ? wr_data : fifo_loc1;
	fifo_loc2 <= (wr_pointer[5:0] == 7'd2) ? wr_data : fifo_loc2;
	fifo_loc3 <= (wr_pointer[5:0] == 7'd3) ? wr_data : fifo_loc3;
	fifo_loc4 <= (wr_pointer[5:0] == 7'd4) ? wr_data : fifo_loc4;
	fifo_loc5 <= (wr_pointer[5:0] == 7'd5) ? wr_data : fifo_loc5;
	fifo_loc6 <= (wr_pointer[5:0] == 7'd6) ? wr_data : fifo_loc6;
	fifo_loc7 <= (wr_pointer[5:0] == 7'd7) ? wr_data : fifo_loc7;
	fifo_loc8 <= (wr_pointer[5:0] == 7'd8) ? wr_data : fifo_loc8;
	fifo_loc9 <= (wr_pointer[5:0] == 7'd9) ? wr_data : fifo_loc9;
	fifo_loc10 <= (wr_pointer[5:0] == 7'd10) ? wr_data : fifo_loc10;
	fifo_loc11 <= (wr_pointer[5:0] == 7'd11) ? wr_data : fifo_loc11;
	fifo_loc12 <= (wr_pointer[5:0] == 7'd12) ? wr_data : fifo_loc12;
	fifo_loc13 <= (wr_pointer[5:0] == 7'd13) ? wr_data : fifo_loc13;
	fifo_loc14 <= (wr_pointer[5:0] == 7'd14) ? wr_data : fifo_loc14;
	fifo_loc15 <= (wr_pointer[5:0] == 7'd15) ? wr_data : fifo_loc15;
	fifo_loc16 <= (wr_pointer[5:0] == 7'd16) ? wr_data : fifo_loc16;
	fifo_loc17 <= (wr_pointer[5:0] == 7'd17) ? wr_data : fifo_loc17;
	fifo_loc18 <= (wr_pointer[5:0] == 7'd18) ? wr_data : fifo_loc18;
	fifo_loc19 <= (wr_pointer[5:0] == 7'd19) ? wr_data : fifo_loc19;
	fifo_loc20 <= (wr_pointer[5:0] == 7'd20) ? wr_data : fifo_loc20;
	fifo_loc21 <= (wr_pointer[5:0] == 7'd21) ? wr_data : fifo_loc21;
	fifo_loc22 <= (wr_pointer[5:0] == 7'd22) ? wr_data : fifo_loc22;
	fifo_loc23 <= (wr_pointer[5:0] == 7'd23) ? wr_data : fifo_loc23;
	fifo_loc24 <= (wr_pointer[5:0] == 7'd24) ? wr_data : fifo_loc24;
	fifo_loc25 <= (wr_pointer[5:0] == 7'd25) ? wr_data : fifo_loc25;
	fifo_loc26 <= (wr_pointer[5:0] == 7'd26) ? wr_data : fifo_loc26;
	fifo_loc27 <= (wr_pointer[5:0] == 7'd27) ? wr_data : fifo_loc27;
	fifo_loc28 <= (wr_pointer[5:0] == 7'd28) ? wr_data : fifo_loc28;
	fifo_loc29 <= (wr_pointer[5:0] == 7'd29) ? wr_data : fifo_loc29;
	fifo_loc30 <= (wr_pointer[5:0] == 7'd30) ? wr_data : fifo_loc30;
	fifo_loc31 <= (wr_pointer[5:0] == 7'd31) ? wr_data : fifo_loc31;
	fifo_loc32 <= (wr_pointer[5:0] == 7'd32) ? wr_data : fifo_loc32;
	fifo_loc33 <= (wr_pointer[5:0] == 7'd33) ? wr_data : fifo_loc33;
	fifo_loc34 <= (wr_pointer[5:0] == 7'd34) ? wr_data : fifo_loc34;
	fifo_loc35 <= (wr_pointer[5:0] == 7'd35) ? wr_data : fifo_loc35;
	fifo_loc36 <= (wr_pointer[5:0] == 7'd36) ? wr_data : fifo_loc36;
	fifo_loc37 <= (wr_pointer[5:0] == 7'd37) ? wr_data : fifo_loc37;
	fifo_loc38 <= (wr_pointer[5:0] == 7'd38) ? wr_data : fifo_loc38;
	fifo_loc39 <= (wr_pointer[5:0] == 7'd39) ? wr_data : fifo_loc39;
	fifo_loc40 <= (wr_pointer[5:0] == 7'd40) ? wr_data : fifo_loc40;
	fifo_loc41 <= (wr_pointer[5:0] == 7'd41) ? wr_data : fifo_loc41;
	fifo_loc42 <= (wr_pointer[5:0] == 7'd42) ? wr_data : fifo_loc42;
	fifo_loc43 <= (wr_pointer[5:0] == 7'd43) ? wr_data : fifo_loc43;
	fifo_loc44 <= (wr_pointer[5:0] == 7'd44) ? wr_data : fifo_loc44;
	fifo_loc45 <= (wr_pointer[5:0] == 7'd45) ? wr_data : fifo_loc45;
	fifo_loc46 <= (wr_pointer[5:0] == 7'd46) ? wr_data : fifo_loc46;
	fifo_loc47 <= (wr_pointer[5:0] == 7'd47) ? wr_data : fifo_loc47;
	fifo_loc48 <= (wr_pointer[5:0] == 7'd48) ? wr_data : fifo_loc48;
	fifo_loc49 <= (wr_pointer[5:0] == 7'd49) ? wr_data : fifo_loc49;
	fifo_loc50 <= (wr_pointer[5:0] == 7'd50) ? wr_data : fifo_loc50;
	fifo_loc51 <= (wr_pointer[5:0] == 7'd51) ? wr_data : fifo_loc51;
	fifo_loc52 <= (wr_pointer[5:0] == 7'd52) ? wr_data : fifo_loc52;
	fifo_loc53 <= (wr_pointer[5:0] == 7'd53) ? wr_data : fifo_loc53;
	fifo_loc54 <= (wr_pointer[5:0] == 7'd54) ? wr_data : fifo_loc54;
	fifo_loc55 <= (wr_pointer[5:0] == 7'd55) ? wr_data : fifo_loc55;
	fifo_loc56 <= (wr_pointer[5:0] == 7'd56) ? wr_data : fifo_loc56;
	fifo_loc57 <= (wr_pointer[5:0] == 7'd57) ? wr_data : fifo_loc57;
	fifo_loc58 <= (wr_pointer[5:0] == 7'd58) ? wr_data : fifo_loc58;
	fifo_loc59 <= (wr_pointer[5:0] == 7'd59) ? wr_data : fifo_loc59;
	fifo_loc60 <= (wr_pointer[5:0] == 7'd60) ? wr_data : fifo_loc60;
	fifo_loc61 <= (wr_pointer[5:0] == 7'd61) ? wr_data : fifo_loc61;
	fifo_loc62 <= (wr_pointer[5:0] == 7'd62) ? wr_data : fifo_loc62;
	fifo_loc63 <= (wr_pointer[5:0] == 7'd63) ? wr_data : fifo_loc63;
	fifo_loc64 <= (wr_pointer[5:0] == 7'd64) ? wr_data : fifo_loc64;
	fifo_loc65 <= (wr_pointer[5:0] == 7'd65) ? wr_data : fifo_loc65;
	fifo_loc66 <= (wr_pointer[5:0] == 7'd66) ? wr_data : fifo_loc66;
	fifo_loc67 <= (wr_pointer[5:0] == 7'd67) ? wr_data : fifo_loc67;
	fifo_loc68 <= (wr_pointer[5:0] == 7'd68) ? wr_data : fifo_loc68;
	fifo_loc69 <= (wr_pointer[5:0] == 7'd69) ? wr_data : fifo_loc69;
	fifo_loc70 <= (wr_pointer[5:0] == 7'd70) ? wr_data : fifo_loc70;
	fifo_loc71 <= (wr_pointer[5:0] == 7'd71) ? wr_data : fifo_loc71;
	fifo_loc72 <= (wr_pointer[5:0] == 7'd72) ? wr_data : fifo_loc72;
	fifo_loc73 <= (wr_pointer[5:0] == 7'd73) ? wr_data : fifo_loc73;
	fifo_loc74 <= (wr_pointer[5:0] == 7'd74) ? wr_data : fifo_loc74;
	fifo_loc75 <= (wr_pointer[5:0] == 7'd75) ? wr_data : fifo_loc75;
	fifo_loc76 <= (wr_pointer[5:0] == 7'd76) ? wr_data : fifo_loc76;
	fifo_loc77 <= (wr_pointer[5:0] == 7'd77) ? wr_data : fifo_loc77;


       end

end

wr_ready = ! ( (wr_pointer[7] ^ rd_pointer[7]) && (wr_pointer[6:0] == rd_pointer[6:0]) );

rd_valid = !(rd_pointer[7:0] == rd_pointer[7:0]);

assign rd_data = 140'd0 |

( (rd_pointer[7:0] == 8'd))

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