
module AH_LruArbiter_15 (clk
,rstn
,req
,gnt_busy
,gnt);

input clk;
input rstn;
input [14:0] req;
input [14:0] gnt_busy;
output [14:0] gnt;


req [14:0] req0_used_status;
req [14:0] req1_used_status;
req [14:0] req2_used_status;
req [14:0] req3_used_status;
req [14:0] req4_used_status;
req [14:0] req5_used_status;
req [14:0] req6_used_status;
req [14:0] req7_used_status;
req [14:0] req8_used_status;
req [14:0] req9_used_status;
req [14:0] req10_used_status;
req [14:0] req11_used_status;
req [14:0] req12_used_status;
req [14:0] req13_used_status;
req [14:0] req14_used_status;

always @(posedge clk, negedge rstn) begin
        if(~rstn) begin	

	req0_used_status <= 15'd15;
	req1_used_status <= 15'd14;
	req2_used_status <= 15'd13;
	req3_used_status <= 15'd12;
	req4_used_status <= 15'd11;
	req5_used_status <= 15'd10;
	req6_used_status <= 15'd9;
	req7_used_status <= 15'd8;
	req8_used_status <= 15'd7;
	req9_used_status <= 15'd6;
	req10_used_status <= 15'd5;
	req11_used_status <= 15'd4;
	req12_used_status <= 15'd3;
	req13_used_status <= 15'd2;
	req14_used_status <= 15'd1;

        end
        else begin

	gnt_pre[14:0] = 15'd0
	req_int[14:0]= req[15:0] & {15{gnt_busy}};
	if(req[0]) begin
		gnt_pre[0] = (req0_used_status==15) ? 1'b1 |

	((req1 & (req1_used_status > req0_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req0_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req0_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req0_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req0_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req0_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req0_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req0_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req0_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req0_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req0_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req0_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req0_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req0_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[1]) begin
		gnt_pre[1] = (req1_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req1_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req1_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req1_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req1_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req1_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req1_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req1_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req1_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req1_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req1_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req1_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req1_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req1_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req1_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[2]) begin
		gnt_pre[2] = (req2_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req2_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req2_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req2_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req2_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req2_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req2_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req2_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req2_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req2_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req2_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req2_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req2_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req2_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req2_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[3]) begin
		gnt_pre[3] = (req3_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req3_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req3_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req3_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req3_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req3_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req3_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req3_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req3_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req3_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req3_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req3_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req3_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req3_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req3_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[4]) begin
		gnt_pre[4] = (req4_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req4_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req4_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req4_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req4_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req4_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req4_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req4_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req4_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req4_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req4_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req4_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req4_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req4_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req4_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[5]) begin
		gnt_pre[5] = (req5_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req5_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req5_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req5_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req5_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req5_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req5_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req5_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req5_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req5_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req5_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req5_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req5_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req5_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req5_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[6]) begin
		gnt_pre[6] = (req6_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req6_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req6_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req6_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req6_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req6_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req6_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req6_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req6_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req6_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req6_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req6_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req6_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req6_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req6_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[7]) begin
		gnt_pre[7] = (req7_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req7_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req7_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req7_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req7_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req7_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req7_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req7_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req7_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req7_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req7_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req7_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req7_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req7_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req7_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[8]) begin
		gnt_pre[8] = (req8_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req8_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req8_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req8_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req8_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req8_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req8_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req8_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req8_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req8_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req8_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req8_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req8_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req8_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req8_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[9]) begin
		gnt_pre[9] = (req9_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req9_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req9_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req9_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req9_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req9_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req9_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req9_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req9_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req9_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req9_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req9_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req9_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req9_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req9_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[10]) begin
		gnt_pre[10] = (req10_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req10_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req10_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req10_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req10_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req10_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req10_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req10_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req10_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req10_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req10_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req10_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req10_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req10_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req10_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[11]) begin
		gnt_pre[11] = (req11_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req11_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req11_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req11_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req11_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req11_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req11_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req11_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req11_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req11_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req11_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req11_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req11_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req11_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req11_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[12]) begin
		gnt_pre[12] = (req12_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req12_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req12_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req12_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req12_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req12_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req12_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req12_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req12_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req12_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req12_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req12_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req12_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req12_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req12_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[13]) begin
		gnt_pre[13] = (req13_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req13_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req13_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req13_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req13_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req13_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req13_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req13_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req13_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req13_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req13_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req13_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req13_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req13_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req13_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[14]) begin
		gnt_pre[14] = (req14_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req14_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req14_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req14_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req14_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req14_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req14_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req14_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req14_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req14_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req14_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req14_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req14_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req14_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req14_used_status)) ?1'b0 |
		1'b1;
	end
          
always @(req, gnt_busy) begin

	gnt_pre[14:0] = 15'd0
	req_int[14:0]= req[15:0] & {15{gnt_busy}};
	if(req[0]) begin
		gnt_pre[0] = (req0_used_status==15) ? 1'b1 |

	((req1 & (req1_used_status > req0_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req0_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req0_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req0_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req0_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req0_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req0_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req0_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req0_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req0_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req0_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req0_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req0_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req0_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[1]) begin
		gnt_pre[1] = (req1_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req1_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req1_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req1_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req1_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req1_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req1_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req1_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req1_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req1_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req1_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req1_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req1_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req1_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req1_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[2]) begin
		gnt_pre[2] = (req2_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req2_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req2_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req2_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req2_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req2_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req2_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req2_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req2_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req2_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req2_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req2_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req2_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req2_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req2_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[3]) begin
		gnt_pre[3] = (req3_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req3_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req3_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req3_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req3_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req3_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req3_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req3_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req3_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req3_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req3_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req3_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req3_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req3_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req3_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[4]) begin
		gnt_pre[4] = (req4_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req4_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req4_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req4_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req4_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req4_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req4_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req4_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req4_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req4_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req4_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req4_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req4_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req4_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req4_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[5]) begin
		gnt_pre[5] = (req5_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req5_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req5_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req5_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req5_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req5_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req5_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req5_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req5_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req5_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req5_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req5_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req5_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req5_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req5_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[6]) begin
		gnt_pre[6] = (req6_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req6_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req6_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req6_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req6_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req6_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req6_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req6_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req6_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req6_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req6_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req6_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req6_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req6_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req6_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[7]) begin
		gnt_pre[7] = (req7_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req7_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req7_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req7_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req7_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req7_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req7_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req7_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req7_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req7_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req7_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req7_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req7_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req7_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req7_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[8]) begin
		gnt_pre[8] = (req8_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req8_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req8_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req8_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req8_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req8_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req8_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req8_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req8_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req8_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req8_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req8_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req8_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req8_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req8_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[9]) begin
		gnt_pre[9] = (req9_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req9_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req9_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req9_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req9_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req9_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req9_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req9_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req9_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req9_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req9_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req9_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req9_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req9_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req9_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[10]) begin
		gnt_pre[10] = (req10_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req10_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req10_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req10_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req10_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req10_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req10_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req10_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req10_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req10_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req10_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req10_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req10_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req10_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req10_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[11]) begin
		gnt_pre[11] = (req11_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req11_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req11_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req11_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req11_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req11_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req11_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req11_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req11_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req11_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req11_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req11_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req11_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req11_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req11_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[12]) begin
		gnt_pre[12] = (req12_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req12_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req12_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req12_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req12_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req12_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req12_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req12_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req12_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req12_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req12_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req12_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req12_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req12_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req12_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[13]) begin
		gnt_pre[13] = (req13_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req13_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req13_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req13_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req13_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req13_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req13_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req13_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req13_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req13_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req13_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req13_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req13_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req13_used_status)) ?1'b0 |
	((req14 & (req14_used_status > req13_used_status)) ?1'b0 |
		1'b1;
	end
	if(req[14]) begin
		gnt_pre[14] = (req14_used_status==15) ? 1'b1 |

	((req0 & (req0_used_status > req14_used_status)) ?1'b0 |
	((req1 & (req1_used_status > req14_used_status)) ?1'b0 |
	((req2 & (req2_used_status > req14_used_status)) ?1'b0 |
	((req3 & (req3_used_status > req14_used_status)) ?1'b0 |
	((req4 & (req4_used_status > req14_used_status)) ?1'b0 |
	((req5 & (req5_used_status > req14_used_status)) ?1'b0 |
	((req6 & (req6_used_status > req14_used_status)) ?1'b0 |
	((req7 & (req7_used_status > req14_used_status)) ?1'b0 |
	((req8 & (req8_used_status > req14_used_status)) ?1'b0 |
	((req9 & (req9_used_status > req14_used_status)) ?1'b0 |
	((req10 & (req10_used_status > req14_used_status)) ?1'b0 |
	((req11 & (req11_used_status > req14_used_status)) ?1'b0 |
	((req12 & (req12_used_status > req14_used_status)) ?1'b0 |
	((req13 & (req13_used_status > req14_used_status)) ?1'b0 |
		1'b1;
	end

assign gnt[14:0] = gnt_pre[14:0];

endmodule