
module AHLruArbitor_8 (clk
,rstn
,req);

input clk;
input rstn;
input [31:0] req;

module lru_arbiter (
        clk,
        rstn,
        req,
        gnt_busy,
        gnt
);


input clk, rstn
input [NUMCLIENTS - 1:0] req;
input [NUMCLIENTS - 1:0] gnt_busy;
output [NUMCLIENTS - 1:0] gnt;

reg [NUMCLIENTS - 1:0] req0_used_status;
reg [NUMCLIENTS - 1:0] req1_used_status;
reg [NUMCLIENTS - 1:0] req2_used_status;
reg [NUMCLIENTS - 1:0] req3_used_status;

reg [8:0] req0;
reg [8:0] req1;
reg [8:0] req2;
reg [8:0] req3;
reg [8:0] req4;
reg [8:0] req5;
reg [8:0] req6;
reg [8:0] req7;_used_status

always @(posedge clk, negedge rstn) begin
        if(~rstn) begin
        req0_used_status <= 4'd4;
        req1_used_status <= 4'd3;
        req2_used_status <= 4'd2;
        req3_used_status <= 4'd1;
	//STATUS_USED
        end
        else begin
	//GNT_STATUS
                if(gnt[0]& !gnt_busy) begin

                        req0_used_status <= 4'b1;
                        req1_used_status <= req1_used_status<req0_used_status ? req1_used_status + 1'b1 : req1_used_status;
                        req2_used_status <= req2_used_status<req0_used_status ? req2_used_status + 1'b1 : req2_used_status ;
                        req3_used_status <= req3_used_status<req0_used_status ? req3_used_status + 1'b1 : req3_used_status ;
                end
                if(gnt[1] & !gnt_busy) begin
                        req1_used_status <= 4'b1;
                        req0_used_status <= req0_used_status<req1_used_status ? req0_used_status + 1'b1 : req0_used_status;
                        req2_used_status <= req2_used_status<req1_used_status ? req2_used_status + 1'b1 : req2_used_status ;
                        req3_used_status <= req3_used_status<req1_used_status ? req3_used_status + 1'b1 : req3_used_status ;
                end
                if(gnt[2]& !gnt_busy) begin
                        req2_used_status <= 4'b1;
                        req0_used_status <= req0_used_status<req0_used_status ? req0_used_status + 1'b1 : req0_used_status;
                        req1_used_status <= req1_used_status<req0_used_status ? req1_used_status + 1'b1 : req1_used_status ;
                        req3_used_status <= req3_used_status<req0_used_status ? req3_used_status + 1'b1 : req3_used_status ;
                end
                if(gnt[3] & !gnt_busy) begin
                        req3_used_status <= 4'b1;
                        req0_used_status <= req0_used_status<req0_used_status ? req0_used_status + 1'b1 : req0_used_status;
                        req1_used_status <= req1_used_status<req1_used_status ? req1_used_status + 1'b1 : req1_used_status ;
                        req2_used_status <= req2_used_status<req2_used_status ? req2_used_status + 1'b1 : req2_used_status ;
                end

        end
end

always @(req, gnt_busy) begin
//GNT_REQUEST
        gnt_pre[3:0] = 4'd0;
        req_int [3:0]= req[3:0] & {4{gnt_busy}};
        if(req[0]) begin
                gnt_pre[0] = (req0_used_status==4) ? 1'b1 :
                             ((req1 & (req1_used_status > req0_used_status)) ? 1'b0 :
                             ((req2 & (req2_used_status > req0_used_status)) ? 1'b0 :
                             ((req3 & (req3_used_status > req0_used_status)) ? 1'b0 :
                             1'b1;
                 end
        if(req[1]) begin
                gnt_pre[1] = (req1_used_status==4) ? 1'b1 :
                             ((req0 & (req0_used_status > req1_used_status)) ? 1'b0 :
                             ((req2 & (req2_used_status > req1_used_status)) ? 1'b0 :
                             ((req3 & (req3_used_status > req1_used_status)) ? 1'b0 :
                             1'b1;
                 end

        if(req[2]) begin
                gnt_pre[2] = (req2_used_status==4) ? 1'b1 :
                             ((req1 & (req1_used_status > req2_used_status)) ? 1'b0 :
                             ((req0 & (req0_used_status > req2_used_status)) ? 1'b0 :
                             ((req3 & (req3_used_status > req2_used_status)) ? 1'b0 :
                             1'b1;
                 end
        if(req[3]) begin
                gnt_pre[3] = (req3_used_status==4) ? 1'b1 :
                             ((req0 & (req0_used_status > req3_used_status)) ? 1'b0 :
                             ((req2 & (req2_used_status > req3_used_status)) ? 1'b0 :
                             ((req1 & (req1_used_status > req3_used_status)) ? 1'b0 :
                             1'b1;
                 end
end

assign gnt[NUMCLIENTS - 1:0] = gnt_pre[NUMCLIENTS - 1:0];

endmodule

endmodule

