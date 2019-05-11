
module AH_LruArbiter_8 (req
,gnt_busy
,gnt);

input [7:0] req;
input [7:0] gnt_busy;
output [7:0] gnt;


req [7:0] req0_used_status;
req [7:0] req1_used_status;
req [7:0] req2_used_status;
req [7:0] req3_used_status;
req [7:0] req4_used_status;
req [7:0] req5_used_status;
req [7:0] req6_used_status;
req [7:0] req7_used_status;

always @(posedge clk, negedge rstn) begin
        if(~rstn) begin	

	req0_used_status <= 8'd8;
	req1_used_status <= 8'd7;
	req2_used_status <= 8'd6;
	req3_used_status <= 8'd5;
	req4_used_status <= 8'd4;
	req5_used_status <= 8'd3;
	req6_used_status <= 8'd2;
	req7_used_status <= 8'd1;

        end
        else begin

	gnt_pre[7:0] = 8'd0
	req_int[7:0]= req[8:0] & {8{gnt_busy}};
	if(req[0]) begin
		gnt_pre[0] = (req0_used_status==8) ? 1'b1 |

	((req1 & (req1_used_status > req0_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req0_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req0_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req0_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req0_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req0_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req0_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[1]) begin
		gnt_pre[1] = (req1_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req1_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req1_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req1_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req1_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req1_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req1_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req1_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[2]) begin
		gnt_pre[2] = (req2_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req2_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req2_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req2_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req2_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req2_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req2_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req2_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[3]) begin
		gnt_pre[3] = (req3_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req3_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req3_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req3_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req3_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req3_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req3_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req3_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[4]) begin
		gnt_pre[4] = (req4_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req4_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req4_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req4_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req4_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req4_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req4_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req4_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[5]) begin
		gnt_pre[5] = (req5_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req5_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req5_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req5_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req5_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req5_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req5_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req5_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[6]) begin
		gnt_pre[6] = (req6_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req6_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req6_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req6_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req6_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req6_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req6_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req6_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[7]) begin
		gnt_pre[7] = (req7_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req7_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req7_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req7_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req7_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req7_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req7_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req7_used_status)) ?1'b0 |
		1'b1;
	end
          
always @(req, gnt_busy) begin

	gnt_pre[7:0] = 8'd0
	req_int[7:0]= req[8:0] & {8{gnt_busy}};
	if(req[0]) begin
		gnt_pre[0] = (req0_used_status==8) ? 1'b1 |

	((req1 & (req1_used_status > req0_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req0_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req0_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req0_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req0_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req0_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req0_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[1]) begin
		gnt_pre[1] = (req1_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req1_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req1_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req1_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req1_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req1_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req1_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req1_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[2]) begin
		gnt_pre[2] = (req2_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req2_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req2_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req2_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req2_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req2_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req2_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req2_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[3]) begin
		gnt_pre[3] = (req3_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req3_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req3_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req3_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req3_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req3_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req3_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req3_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[4]) begin
		gnt_pre[4] = (req4_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req4_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req4_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req4_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req4_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req4_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req4_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req4_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[5]) begin
		gnt_pre[5] = (req5_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req5_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req5_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req5_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req5_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req5_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req5_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req5_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[6]) begin
		gnt_pre[6] = (req6_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req6_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req6_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req6_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req6_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req6_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req6_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req6_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[7]) begin
		gnt_pre[7] = (req7_used_status==8) ? 1'b1 |

	((req0 & (req0_used_status > req7_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req7_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req7_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req7_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req7_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req7_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req7_used_status)) ?1'b0 |
		1'b1;
	end

assign gnt[7:0] = gnt_pre[7:0];

endmodule
