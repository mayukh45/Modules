
module AH_DivPipelined_10_32 (start
,dividend
,divisor
,data_valid
,div_by_zero);

input start;
input [9:0] dividend;
input [9:0] divisor;
output data_valid;
output div_by_zero;

//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [31:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [638:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [9:0]             	pad_dividend;
  wire [8:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[19:0] <= 0;
        divisor_gen[19:0] 	<= 0;
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[9] ^ divisor[9];
        dividend_gen[19:0] 	<= (dividend[9]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[19:0]  	<= (divisor [9]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[39:20]  	<= 0;
      quotient_gen[19:0]        	<= 0;
      dividend_gen[39:20] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[39:20] 	  <= divisor_gen[19:0] >> 1;

      if ( dividend_gen[19:0] 	  <= divisor_gen[19:0]) begin
        quotient_gen[19:0] 	<= 1  << STAGES - 2;
        dividend_gen[39:20] <= dividend_gen[19:0] - divisor_gen[19:0];
      end else begin
        quotient_gen[19:0] 	      <= 0;
        dividend_gen[39:20] <= dividend_gen[19:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)


always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[59:40]		<= 0;
		quotient_gen[39:20]		<= 0;
		dividend_gen[39:40]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[59:40]		<=divisor_gen[39:20] >> 1;
		if (dividend_gen[20:20]		<=divisor_gen[20:20] begin
		quotient_gen[39:20]		<=quotient_gen[19:0] | (1 << 29)
		dividend_gen[59:40]		<= dividend_gen[39:20] - divisor_gen[39:20];
	end else begin
		quotient_gen[39:20]		<= quotient_gen[19:0];
		dividend_gen[59:40]		<= dividend_gen[39:20];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[79:60]		<= 0;
		quotient_gen[59:40]		<= 0;
		dividend_gen[79:60]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[79:60]		<=divisor_gen[59:40] >> 1;
		if (dividend_gen[40:40]		<=divisor_gen[40:40] begin
		quotient_gen[59:40]		<=quotient_gen[39:20] | (1 << 28)
		dividend_gen[79:60]		<= dividend_gen[59:40] - divisor_gen[59:40];
	end else begin
		quotient_gen[59:40]		<= quotient_gen[39:20];
		dividend_gen[79:60]		<= dividend_gen[59:40];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[99:80]		<= 0;
		quotient_gen[79:60]		<= 0;
		dividend_gen[119:80]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[99:80]		<=divisor_gen[79:60] >> 1;
		if (dividend_gen[60:60]		<=divisor_gen[60:60] begin
		quotient_gen[79:60]		<=quotient_gen[59:40] | (1 << 27)
		dividend_gen[99:80]		<= dividend_gen[79:60] - divisor_gen[79:60];
	end else begin
		quotient_gen[79:60]		<= quotient_gen[59:40];
		dividend_gen[99:80]		<= dividend_gen[79:60];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[119:100]		<= 0;
		quotient_gen[99:80]		<= 0;
		dividend_gen[159:100]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[119:100]		<=divisor_gen[99:80] >> 1;
		if (dividend_gen[80:80]		<=divisor_gen[80:80] begin
		quotient_gen[99:80]		<=quotient_gen[79:60] | (1 << 26)
		dividend_gen[119:100]		<= dividend_gen[99:80] - divisor_gen[99:80];
	end else begin
		quotient_gen[99:80]		<= quotient_gen[79:60];
		dividend_gen[119:100]		<= dividend_gen[99:80];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[139:120]		<= 0;
		quotient_gen[119:100]		<= 0;
		dividend_gen[199:120]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[139:120]		<=divisor_gen[119:100] >> 1;
		if (dividend_gen[100:100]		<=divisor_gen[100:100] begin
		quotient_gen[119:100]		<=quotient_gen[99:80] | (1 << 25)
		dividend_gen[139:120]		<= dividend_gen[119:100] - divisor_gen[119:100];
	end else begin
		quotient_gen[119:100]		<= quotient_gen[99:80];
		dividend_gen[139:120]		<= dividend_gen[119:100];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[7]		<= 0;
		start_gen[7]			<= 0;
		negative_quotient_gen[7]	<= 0;
		divisor_gen[159:140]		<= 0;
		quotient_gen[139:120]		<= 0;
		dividend_gen[239:140]		<= 0;
	end else begin
		div_by_zero_gen[7]		<=div_by_zero_gen[6];
		start_gen[7]			<=strat_gen[6];
		negative_quotient_gen[7]	<=negative_quotient_gen[6];
		divisor_gen[159:140]		<=divisor_gen[139:120] >> 1;
		if (dividend_gen[120:120]		<=divisor_gen[120:120] begin
		quotient_gen[139:120]		<=quotient_gen[119:100] | (1 << 24)
		dividend_gen[159:140]		<= dividend_gen[139:120] - divisor_gen[139:120];
	end else begin
		quotient_gen[139:120]		<= quotient_gen[119:100];
		dividend_gen[159:140]		<= dividend_gen[139:120];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[8]		<= 0;
		start_gen[8]			<= 0;
		negative_quotient_gen[8]	<= 0;
		divisor_gen[179:160]		<= 0;
		quotient_gen[159:140]		<= 0;
		dividend_gen[279:160]		<= 0;
	end else begin
		div_by_zero_gen[8]		<=div_by_zero_gen[7];
		start_gen[8]			<=strat_gen[7];
		negative_quotient_gen[8]	<=negative_quotient_gen[7];
		divisor_gen[179:160]		<=divisor_gen[159:140] >> 1;
		if (dividend_gen[140:140]		<=divisor_gen[140:140] begin
		quotient_gen[159:140]		<=quotient_gen[139:120] | (1 << 23)
		dividend_gen[179:160]		<= dividend_gen[159:140] - divisor_gen[159:140];
	end else begin
		quotient_gen[159:140]		<= quotient_gen[139:120];
		dividend_gen[179:160]		<= dividend_gen[159:140];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[9]		<= 0;
		start_gen[9]			<= 0;
		negative_quotient_gen[9]	<= 0;
		divisor_gen[199:180]		<= 0;
		quotient_gen[179:160]		<= 0;
		dividend_gen[319:180]		<= 0;
	end else begin
		div_by_zero_gen[9]		<=div_by_zero_gen[8];
		start_gen[9]			<=strat_gen[8];
		negative_quotient_gen[9]	<=negative_quotient_gen[8];
		divisor_gen[199:180]		<=divisor_gen[179:160] >> 1;
		if (dividend_gen[160:160]		<=divisor_gen[160:160] begin
		quotient_gen[179:160]		<=quotient_gen[159:140] | (1 << 22)
		dividend_gen[199:180]		<= dividend_gen[179:160] - divisor_gen[179:160];
	end else begin
		quotient_gen[179:160]		<= quotient_gen[159:140];
		dividend_gen[199:180]		<= dividend_gen[179:160];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[10]		<= 0;
		start_gen[10]			<= 0;
		negative_quotient_gen[10]	<= 0;
		divisor_gen[219:200]		<= 0;
		quotient_gen[199:180]		<= 0;
		dividend_gen[359:200]		<= 0;
	end else begin
		div_by_zero_gen[10]		<=div_by_zero_gen[9];
		start_gen[10]			<=strat_gen[9];
		negative_quotient_gen[10]	<=negative_quotient_gen[9];
		divisor_gen[219:200]		<=divisor_gen[199:180] >> 1;
		if (dividend_gen[180:180]		<=divisor_gen[180:180] begin
		quotient_gen[199:180]		<=quotient_gen[179:160] | (1 << 21)
		dividend_gen[219:200]		<= dividend_gen[199:180] - divisor_gen[199:180];
	end else begin
		quotient_gen[199:180]		<= quotient_gen[179:160];
		dividend_gen[219:200]		<= dividend_gen[199:180];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[11]		<= 0;
		start_gen[11]			<= 0;
		negative_quotient_gen[11]	<= 0;
		divisor_gen[239:220]		<= 0;
		quotient_gen[219:200]		<= 0;
		dividend_gen[399:220]		<= 0;
	end else begin
		div_by_zero_gen[11]		<=div_by_zero_gen[10];
		start_gen[11]			<=strat_gen[10];
		negative_quotient_gen[11]	<=negative_quotient_gen[10];
		divisor_gen[239:220]		<=divisor_gen[219:200] >> 1;
		if (dividend_gen[200:200]		<=divisor_gen[200:200] begin
		quotient_gen[219:200]		<=quotient_gen[199:180] | (1 << 20)
		dividend_gen[239:220]		<= dividend_gen[219:200] - divisor_gen[219:200];
	end else begin
		quotient_gen[219:200]		<= quotient_gen[199:180];
		dividend_gen[239:220]		<= dividend_gen[219:200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[12]		<= 0;
		start_gen[12]			<= 0;
		negative_quotient_gen[12]	<= 0;
		divisor_gen[259:240]		<= 0;
		quotient_gen[239:220]		<= 0;
		dividend_gen[439:240]		<= 0;
	end else begin
		div_by_zero_gen[12]		<=div_by_zero_gen[11];
		start_gen[12]			<=strat_gen[11];
		negative_quotient_gen[12]	<=negative_quotient_gen[11];
		divisor_gen[259:240]		<=divisor_gen[239:220] >> 1;
		if (dividend_gen[220:220]		<=divisor_gen[220:220] begin
		quotient_gen[239:220]		<=quotient_gen[219:200] | (1 << 19)
		dividend_gen[259:240]		<= dividend_gen[239:220] - divisor_gen[239:220];
	end else begin
		quotient_gen[239:220]		<= quotient_gen[219:200];
		dividend_gen[259:240]		<= dividend_gen[239:220];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[13]		<= 0;
		start_gen[13]			<= 0;
		negative_quotient_gen[13]	<= 0;
		divisor_gen[279:260]		<= 0;
		quotient_gen[259:240]		<= 0;
		dividend_gen[479:260]		<= 0;
	end else begin
		div_by_zero_gen[13]		<=div_by_zero_gen[12];
		start_gen[13]			<=strat_gen[12];
		negative_quotient_gen[13]	<=negative_quotient_gen[12];
		divisor_gen[279:260]		<=divisor_gen[259:240] >> 1;
		if (dividend_gen[240:240]		<=divisor_gen[240:240] begin
		quotient_gen[259:240]		<=quotient_gen[239:220] | (1 << 18)
		dividend_gen[279:260]		<= dividend_gen[259:240] - divisor_gen[259:240];
	end else begin
		quotient_gen[259:240]		<= quotient_gen[239:220];
		dividend_gen[279:260]		<= dividend_gen[259:240];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[14]		<= 0;
		start_gen[14]			<= 0;
		negative_quotient_gen[14]	<= 0;
		divisor_gen[299:280]		<= 0;
		quotient_gen[279:260]		<= 0;
		dividend_gen[519:280]		<= 0;
	end else begin
		div_by_zero_gen[14]		<=div_by_zero_gen[13];
		start_gen[14]			<=strat_gen[13];
		negative_quotient_gen[14]	<=negative_quotient_gen[13];
		divisor_gen[299:280]		<=divisor_gen[279:260] >> 1;
		if (dividend_gen[260:260]		<=divisor_gen[260:260] begin
		quotient_gen[279:260]		<=quotient_gen[259:240] | (1 << 17)
		dividend_gen[299:280]		<= dividend_gen[279:260] - divisor_gen[279:260];
	end else begin
		quotient_gen[279:260]		<= quotient_gen[259:240];
		dividend_gen[299:280]		<= dividend_gen[279:260];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[15]		<= 0;
		start_gen[15]			<= 0;
		negative_quotient_gen[15]	<= 0;
		divisor_gen[319:300]		<= 0;
		quotient_gen[299:280]		<= 0;
		dividend_gen[559:300]		<= 0;
	end else begin
		div_by_zero_gen[15]		<=div_by_zero_gen[14];
		start_gen[15]			<=strat_gen[14];
		negative_quotient_gen[15]	<=negative_quotient_gen[14];
		divisor_gen[319:300]		<=divisor_gen[299:280] >> 1;
		if (dividend_gen[280:280]		<=divisor_gen[280:280] begin
		quotient_gen[299:280]		<=quotient_gen[279:260] | (1 << 16)
		dividend_gen[319:300]		<= dividend_gen[299:280] - divisor_gen[299:280];
	end else begin
		quotient_gen[299:280]		<= quotient_gen[279:260];
		dividend_gen[319:300]		<= dividend_gen[299:280];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[16]		<= 0;
		start_gen[16]			<= 0;
		negative_quotient_gen[16]	<= 0;
		divisor_gen[339:320]		<= 0;
		quotient_gen[319:300]		<= 0;
		dividend_gen[599:320]		<= 0;
	end else begin
		div_by_zero_gen[16]		<=div_by_zero_gen[15];
		start_gen[16]			<=strat_gen[15];
		negative_quotient_gen[16]	<=negative_quotient_gen[15];
		divisor_gen[339:320]		<=divisor_gen[319:300] >> 1;
		if (dividend_gen[300:300]		<=divisor_gen[300:300] begin
		quotient_gen[319:300]		<=quotient_gen[299:280] | (1 << 15)
		dividend_gen[339:320]		<= dividend_gen[319:300] - divisor_gen[319:300];
	end else begin
		quotient_gen[319:300]		<= quotient_gen[299:280];
		dividend_gen[339:320]		<= dividend_gen[319:300];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[17]		<= 0;
		start_gen[17]			<= 0;
		negative_quotient_gen[17]	<= 0;
		divisor_gen[359:340]		<= 0;
		quotient_gen[339:320]		<= 0;
		dividend_gen[639:340]		<= 0;
	end else begin
		div_by_zero_gen[17]		<=div_by_zero_gen[16];
		start_gen[17]			<=strat_gen[16];
		negative_quotient_gen[17]	<=negative_quotient_gen[16];
		divisor_gen[359:340]		<=divisor_gen[339:320] >> 1;
		if (dividend_gen[320:320]		<=divisor_gen[320:320] begin
		quotient_gen[339:320]		<=quotient_gen[319:300] | (1 << 14)
		dividend_gen[359:340]		<= dividend_gen[339:320] - divisor_gen[339:320];
	end else begin
		quotient_gen[339:320]		<= quotient_gen[319:300];
		dividend_gen[359:340]		<= dividend_gen[339:320];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[18]		<= 0;
		start_gen[18]			<= 0;
		negative_quotient_gen[18]	<= 0;
		divisor_gen[379:360]		<= 0;
		quotient_gen[359:340]		<= 0;
		dividend_gen[679:360]		<= 0;
	end else begin
		div_by_zero_gen[18]		<=div_by_zero_gen[17];
		start_gen[18]			<=strat_gen[17];
		negative_quotient_gen[18]	<=negative_quotient_gen[17];
		divisor_gen[379:360]		<=divisor_gen[359:340] >> 1;
		if (dividend_gen[340:340]		<=divisor_gen[340:340] begin
		quotient_gen[359:340]		<=quotient_gen[339:320] | (1 << 13)
		dividend_gen[379:360]		<= dividend_gen[359:340] - divisor_gen[359:340];
	end else begin
		quotient_gen[359:340]		<= quotient_gen[339:320];
		dividend_gen[379:360]		<= dividend_gen[359:340];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[19]		<= 0;
		start_gen[19]			<= 0;
		negative_quotient_gen[19]	<= 0;
		divisor_gen[399:380]		<= 0;
		quotient_gen[379:360]		<= 0;
		dividend_gen[719:380]		<= 0;
	end else begin
		div_by_zero_gen[19]		<=div_by_zero_gen[18];
		start_gen[19]			<=strat_gen[18];
		negative_quotient_gen[19]	<=negative_quotient_gen[18];
		divisor_gen[399:380]		<=divisor_gen[379:360] >> 1;
		if (dividend_gen[360:360]		<=divisor_gen[360:360] begin
		quotient_gen[379:360]		<=quotient_gen[359:340] | (1 << 12)
		dividend_gen[399:380]		<= dividend_gen[379:360] - divisor_gen[379:360];
	end else begin
		quotient_gen[379:360]		<= quotient_gen[359:340];
		dividend_gen[399:380]		<= dividend_gen[379:360];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[20]		<= 0;
		start_gen[20]			<= 0;
		negative_quotient_gen[20]	<= 0;
		divisor_gen[419:400]		<= 0;
		quotient_gen[399:380]		<= 0;
		dividend_gen[759:400]		<= 0;
	end else begin
		div_by_zero_gen[20]		<=div_by_zero_gen[19];
		start_gen[20]			<=strat_gen[19];
		negative_quotient_gen[20]	<=negative_quotient_gen[19];
		divisor_gen[419:400]		<=divisor_gen[399:380] >> 1;
		if (dividend_gen[380:380]		<=divisor_gen[380:380] begin
		quotient_gen[399:380]		<=quotient_gen[379:360] | (1 << 11)
		dividend_gen[419:400]		<= dividend_gen[399:380] - divisor_gen[399:380];
	end else begin
		quotient_gen[399:380]		<= quotient_gen[379:360];
		dividend_gen[419:400]		<= dividend_gen[399:380];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[21]		<= 0;
		start_gen[21]			<= 0;
		negative_quotient_gen[21]	<= 0;
		divisor_gen[439:420]		<= 0;
		quotient_gen[419:400]		<= 0;
		dividend_gen[799:420]		<= 0;
	end else begin
		div_by_zero_gen[21]		<=div_by_zero_gen[20];
		start_gen[21]			<=strat_gen[20];
		negative_quotient_gen[21]	<=negative_quotient_gen[20];
		divisor_gen[439:420]		<=divisor_gen[419:400] >> 1;
		if (dividend_gen[400:400]		<=divisor_gen[400:400] begin
		quotient_gen[419:400]		<=quotient_gen[399:380] | (1 << 10)
		dividend_gen[439:420]		<= dividend_gen[419:400] - divisor_gen[419:400];
	end else begin
		quotient_gen[419:400]		<= quotient_gen[399:380];
		dividend_gen[439:420]		<= dividend_gen[419:400];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[22]		<= 0;
		start_gen[22]			<= 0;
		negative_quotient_gen[22]	<= 0;
		divisor_gen[459:440]		<= 0;
		quotient_gen[439:420]		<= 0;
		dividend_gen[839:440]		<= 0;
	end else begin
		div_by_zero_gen[22]		<=div_by_zero_gen[21];
		start_gen[22]			<=strat_gen[21];
		negative_quotient_gen[22]	<=negative_quotient_gen[21];
		divisor_gen[459:440]		<=divisor_gen[439:420] >> 1;
		if (dividend_gen[420:420]		<=divisor_gen[420:420] begin
		quotient_gen[439:420]		<=quotient_gen[419:400] | (1 << 9)
		dividend_gen[459:440]		<= dividend_gen[439:420] - divisor_gen[439:420];
	end else begin
		quotient_gen[439:420]		<= quotient_gen[419:400];
		dividend_gen[459:440]		<= dividend_gen[439:420];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[23]		<= 0;
		start_gen[23]			<= 0;
		negative_quotient_gen[23]	<= 0;
		divisor_gen[479:460]		<= 0;
		quotient_gen[459:440]		<= 0;
		dividend_gen[879:460]		<= 0;
	end else begin
		div_by_zero_gen[23]		<=div_by_zero_gen[22];
		start_gen[23]			<=strat_gen[22];
		negative_quotient_gen[23]	<=negative_quotient_gen[22];
		divisor_gen[479:460]		<=divisor_gen[459:440] >> 1;
		if (dividend_gen[440:440]		<=divisor_gen[440:440] begin
		quotient_gen[459:440]		<=quotient_gen[439:420] | (1 << 8)
		dividend_gen[479:460]		<= dividend_gen[459:440] - divisor_gen[459:440];
	end else begin
		quotient_gen[459:440]		<= quotient_gen[439:420];
		dividend_gen[479:460]		<= dividend_gen[459:440];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[24]		<= 0;
		start_gen[24]			<= 0;
		negative_quotient_gen[24]	<= 0;
		divisor_gen[499:480]		<= 0;
		quotient_gen[479:460]		<= 0;
		dividend_gen[919:480]		<= 0;
	end else begin
		div_by_zero_gen[24]		<=div_by_zero_gen[23];
		start_gen[24]			<=strat_gen[23];
		negative_quotient_gen[24]	<=negative_quotient_gen[23];
		divisor_gen[499:480]		<=divisor_gen[479:460] >> 1;
		if (dividend_gen[460:460]		<=divisor_gen[460:460] begin
		quotient_gen[479:460]		<=quotient_gen[459:440] | (1 << 7)
		dividend_gen[499:480]		<= dividend_gen[479:460] - divisor_gen[479:460];
	end else begin
		quotient_gen[479:460]		<= quotient_gen[459:440];
		dividend_gen[499:480]		<= dividend_gen[479:460];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[25]		<= 0;
		start_gen[25]			<= 0;
		negative_quotient_gen[25]	<= 0;
		divisor_gen[519:500]		<= 0;
		quotient_gen[499:480]		<= 0;
		dividend_gen[959:500]		<= 0;
	end else begin
		div_by_zero_gen[25]		<=div_by_zero_gen[24];
		start_gen[25]			<=strat_gen[24];
		negative_quotient_gen[25]	<=negative_quotient_gen[24];
		divisor_gen[519:500]		<=divisor_gen[499:480] >> 1;
		if (dividend_gen[480:480]		<=divisor_gen[480:480] begin
		quotient_gen[499:480]		<=quotient_gen[479:460] | (1 << 6)
		dividend_gen[519:500]		<= dividend_gen[499:480] - divisor_gen[499:480];
	end else begin
		quotient_gen[499:480]		<= quotient_gen[479:460];
		dividend_gen[519:500]		<= dividend_gen[499:480];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[26]		<= 0;
		start_gen[26]			<= 0;
		negative_quotient_gen[26]	<= 0;
		divisor_gen[539:520]		<= 0;
		quotient_gen[519:500]		<= 0;
		dividend_gen[999:520]		<= 0;
	end else begin
		div_by_zero_gen[26]		<=div_by_zero_gen[25];
		start_gen[26]			<=strat_gen[25];
		negative_quotient_gen[26]	<=negative_quotient_gen[25];
		divisor_gen[539:520]		<=divisor_gen[519:500] >> 1;
		if (dividend_gen[500:500]		<=divisor_gen[500:500] begin
		quotient_gen[519:500]		<=quotient_gen[499:480] | (1 << 5)
		dividend_gen[539:520]		<= dividend_gen[519:500] - divisor_gen[519:500];
	end else begin
		quotient_gen[519:500]		<= quotient_gen[499:480];
		dividend_gen[539:520]		<= dividend_gen[519:500];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[27]		<= 0;
		start_gen[27]			<= 0;
		negative_quotient_gen[27]	<= 0;
		divisor_gen[559:540]		<= 0;
		quotient_gen[539:520]		<= 0;
		dividend_gen[1039:540]		<= 0;
	end else begin
		div_by_zero_gen[27]		<=div_by_zero_gen[26];
		start_gen[27]			<=strat_gen[26];
		negative_quotient_gen[27]	<=negative_quotient_gen[26];
		divisor_gen[559:540]		<=divisor_gen[539:520] >> 1;
		if (dividend_gen[520:520]		<=divisor_gen[520:520] begin
		quotient_gen[539:520]		<=quotient_gen[519:500] | (1 << 4)
		dividend_gen[559:540]		<= dividend_gen[539:520] - divisor_gen[539:520];
	end else begin
		quotient_gen[539:520]		<= quotient_gen[519:500];
		dividend_gen[559:540]		<= dividend_gen[539:520];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[28]		<= 0;
		start_gen[28]			<= 0;
		negative_quotient_gen[28]	<= 0;
		divisor_gen[579:560]		<= 0;
		quotient_gen[559:540]		<= 0;
		dividend_gen[1079:560]		<= 0;
	end else begin
		div_by_zero_gen[28]		<=div_by_zero_gen[27];
		start_gen[28]			<=strat_gen[27];
		negative_quotient_gen[28]	<=negative_quotient_gen[27];
		divisor_gen[579:560]		<=divisor_gen[559:540] >> 1;
		if (dividend_gen[540:540]		<=divisor_gen[540:540] begin
		quotient_gen[559:540]		<=quotient_gen[539:520] | (1 << 3)
		dividend_gen[579:560]		<= dividend_gen[559:540] - divisor_gen[559:540];
	end else begin
		quotient_gen[559:540]		<= quotient_gen[539:520];
		dividend_gen[579:560]		<= dividend_gen[559:540];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[29]		<= 0;
		start_gen[29]			<= 0;
		negative_quotient_gen[29]	<= 0;
		divisor_gen[599:580]		<= 0;
		quotient_gen[579:560]		<= 0;
		dividend_gen[1119:580]		<= 0;
	end else begin
		div_by_zero_gen[29]		<=div_by_zero_gen[28];
		start_gen[29]			<=strat_gen[28];
		negative_quotient_gen[29]	<=negative_quotient_gen[28];
		divisor_gen[599:580]		<=divisor_gen[579:560] >> 1;
		if (dividend_gen[560:560]		<=divisor_gen[560:560] begin
		quotient_gen[579:560]		<=quotient_gen[559:540] | (1 << 2)
		dividend_gen[599:580]		<= dividend_gen[579:560] - divisor_gen[579:560];
	end else begin
		quotient_gen[579:560]		<= quotient_gen[559:540];
		dividend_gen[599:580]		<= dividend_gen[579:560];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[30]		<= 0;
		start_gen[30]			<= 0;
		negative_quotient_gen[30]	<= 0;
		divisor_gen[619:600]		<= 0;
		quotient_gen[599:580]		<= 0;
		dividend_gen[1159:600]		<= 0;
	end else begin
		div_by_zero_gen[30]		<=div_by_zero_gen[29];
		start_gen[30]			<=strat_gen[29];
		negative_quotient_gen[30]	<=negative_quotient_gen[29];
		divisor_gen[619:600]		<=divisor_gen[599:580] >> 1;
		if (dividend_gen[580:580]		<=divisor_gen[580:580] begin
		quotient_gen[599:580]		<=quotient_gen[579:560] | (1 << 1)
		dividend_gen[619:600]		<= dividend_gen[599:580] - divisor_gen[599:580];
	end else begin
		quotient_gen[599:580]		<= quotient_gen[579:560];
		dividend_gen[619:600]		<= dividend_gen[599:580];
		end 
	end 
end 



always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[31]	<= 0;
	negative_quotient_gen[31]	<= 0;
	quotient_gen[619:600] <= 0; end else begin
	div_by_zero_gen[31]	<= div_by_zero_gen[30];
	start_gen[31]	<= start_gen[30];
	negative_quotient_gen[31]	<= negative_quotient_gen[30];
	if ( dividend_gen[19:0]	<= divisor_gen[19:0]) begin
	quotient_gen[19:0] 	<= 1 << 30;
	if ( dividend_gen[619:600] 	<= divisor_gen[619:600] )
	quotient_gen[619:600] 		<= quotient_gen[599:580] | 1;
	else
	quotient_gen[619:600] 		<= quotient_gen[599:580];
		end
	end



 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[31]<= 0;
      start_gen[31]<= 0;
      negative_quotient_gen[31]<= 0;
      quotient_gen[638:638]<= 0;
    end else begin
      div_by_zero_gen[31]<= div_by_zero_gen[30];
      start_gen[31]<= start_gen[30];
      negative_quotient_gen[31]<= negative_quotient_gen[30];

      if ( dividend_gen[638:638] <= divisor_gen[638:638] )
        quotient_gen[638:638] <= quotient_gen[637:637] | 1;
      else
        quotient_gen[638:638] <= quotient_gen[637:637];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[31];
      data_valid        <= start_gen[31];
      quotient          <= (negative_quotient_gen[31]) ? ~quotient_gen[638:639]: quotient_gen[638:638];
    end
  end

//=======================================================================================================================================================

endmodule
