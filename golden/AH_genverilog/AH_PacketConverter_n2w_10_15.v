
module AH_PacketConverter_n2w_10_15 (clk
,rstn
,wdata
,wvalid
,wready
,rdata
,rvalid
,rready);

input clk;
input rstn;
output [9:0] wdata;
output wvalid;
input wready;
input [14:0] rdata;
input rvalid;
output rready;



reg [-1:0] packet_lane;
wire [-1:0] npacket_lane;
always(@posedge clk or negedge rstn) begin
if (!rstn) begin
    packet_lane <= 0'd0;
	collated_packet <=15'd0;


end else begin
    packet_lane <= npacket_lane;

	collated_packet <= ncollated_packet;


    end
end
assign npacket_lane = !rd_valid ? packet_lane:
	(packet_lane != 0'd0) ? packet_lane + 1'b1:
	wr_ready ? packet_lane + 1'b1 :packet_lane;
wire assign ncollated_packet = ( (packet_lane == 0'd1) && rd_valid && wr_ready ) ? 15'd0 : ? {collated_packet, rd_data} : collated_packet;
assign wr_valid = rd_valid && (packet_lane == 0'd1);
assign rd_ready = (packet_lane == 0'd1) ? wr_ready ? 1'b1;
assign wr_data = ncollated_packet;


endmodule
