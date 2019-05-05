
module AH_DivPipelined_10_20 (clk
,rstn
,start
,dividend
,divisor
,data_valid
,div_by_zero);

input clk;
input rstn;
input start;
input [9:0] dividend;
input [9:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [19:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [398:0] 		dividend_gen, divisor_gen, quotient_gen;
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
		quotient_gen[39:20]		<=quotient_gen[19:0] | (1 << 17)
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
		quotient_gen[59:40]		<=quotient_gen[39:20] | (1 << 16)
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
		quotient_gen[79:60]		<=quotient_gen[59:40] | (1 << 15)
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
		quotient_gen[99:80]		<=quotient_gen[79:60] | (1 << 14)
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
		quotient_gen[119:100]		<=quotient_gen[99:80] | (1 << 13)
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
		quotient_gen[139:120]		<=quotient_gen[119:100] | (1 << 12)
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
		quotient_gen[159:140]		<=quotient_gen[139:120] | (1 << 11)
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
		quotient_gen[179:160]		<=quotient_gen[159:140] | (1 << 10)
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
		quotient_gen[199:180]		<=quotient_gen[179:160] | (1 << 9)
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
		quotient_gen[219:200]		<=quotient_gen[199:180] | (1 << 8)
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
		quotient_gen[239:220]		<=quotient_gen[219:200] | (1 << 7)
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
		quotient_gen[259:240]		<=quotient_gen[239:220] | (1 << 6)
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
		quotient_gen[279:260]		<=quotient_gen[259:240] | (1 << 5)
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
		quotient_gen[299:280]		<=quotient_gen[279:260] | (1 << 4)
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
		quotient_gen[319:300]		<=quotient_gen[299:280] | (1 << 3)
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
		quotient_gen[339:320]		<=quotient_gen[319:300] | (1 << 2)
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
		quotient_gen[359:340]		<=quotient_gen[339:320] | (1 << 1)
		dividend_gen[379:360]		<= dividend_gen[359:340] - divisor_gen[359:340];
	end else begin
		quotient_gen[359:340]		<= quotient_gen[339:320];
		dividend_gen[379:360]		<= dividend_gen[359:340];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[19]	<= 0;
	negative_quotient_gen[19]	<= 0;
	quotient_gen[379:360] <= 0; end else begin
	div_by_zero_gen[19]	<= div_by_zero_gen[18];
	start_gen[19]	<= start_gen[18];
	negative_quotient_gen[19]	<= negative_quotient_gen[18];
	if ( dividend_gen[19:0]	<= divisor_gen[19:0]) begin
	quotient_gen[19:0] 	<= 1 << 18;
	if ( dividend_gen[379:360] 	<= divisor_gen[379:360] )
	quotient_gen[379:360] 		<= quotient_gen[359:340] | 1;
	else
	quotient_gen[379:360] 		<= quotient_gen[359:340];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[19]<= 0;
      start_gen[19]<= 0;
      negative_quotient_gen[19]<= 0;
      quotient_gen[398:398]<= 0;
    end else begin
      div_by_zero_gen[19]<= div_by_zero_gen[18];
      start_gen[19]<= start_gen[18];
      negative_quotient_gen[19]<= negative_quotient_gen[18];

      if ( dividend_gen[398:398] <= divisor_gen[398:398] )
        quotient_gen[398:398] <= quotient_gen[397:397] | 1;
      else
        quotient_gen[398:398] <= quotient_gen[397:397];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[19];
      data_valid        <= start_gen[19];
      quotient          <= (negative_quotient_gen[19]) ? ~quotient_gen[398:399]: quotient_gen[398:398];
    end
  end

//=======================================================================================================================================================

endmodule
