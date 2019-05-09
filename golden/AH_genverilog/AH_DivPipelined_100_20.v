
module AH_DivPipelined_100_20 (clk
,rstn
,start
,dividend
,divisor
,data_valid
,div_by_zero);

input clk;
input rstn;
input start;
input [99:0] dividend;
input [99:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [19:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [3998:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [99:0]             	pad_dividend;
  wire [98:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[199:0] <= 0;
        divisor_gen[199:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[99] ^ divisor[99];
        dividend_gen[199:0] 	<= (dividend[99]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[199:0]  	<= (divisor [99]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[399:200]  	<= 0;
      quotient_gen[199:0]        	<= 0;
      dividend_gen[399:200] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[399:200] 	  <= divisor_gen[199:0] >> 1;

      if ( dividend_gen[199:0] 	  <= divisor_gen[199:0]) begin
        quotient_gen[199:0] 	<= 1  << STAGES - 2;
        dividend_gen[399:200] <= dividend_gen[199:0] - divisor_gen[199:0];
      end else begin
        quotient_gen[199:0] 	      <= 0;
        dividend_gen[399:200] <= dividend_gen[199:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[599:400]		<= 0;
		quotient_gen[399:200]		<= 0;
		dividend_gen[399:400]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[599:400]		<=divisor_gen[399:200] >> 1;
		if (dividend_gen[200:200]		<=divisor_gen[200:200] begin
		quotient_gen[399:200]		<=quotient_gen[199:0] | (1 << 17)
		dividend_gen[599:400]		<= dividend_gen[399:200] - divisor_gen[399:200];
	end else begin
		quotient_gen[399:200]		<= quotient_gen[199:0];
		dividend_gen[599:400]		<= dividend_gen[399:200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[799:600]		<= 0;
		quotient_gen[599:400]		<= 0;
		dividend_gen[799:600]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[799:600]		<=divisor_gen[599:400] >> 1;
		if (dividend_gen[400:400]		<=divisor_gen[400:400] begin
		quotient_gen[599:400]		<=quotient_gen[399:200] | (1 << 16)
		dividend_gen[799:600]		<= dividend_gen[599:400] - divisor_gen[599:400];
	end else begin
		quotient_gen[599:400]		<= quotient_gen[399:200];
		dividend_gen[799:600]		<= dividend_gen[599:400];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[999:800]		<= 0;
		quotient_gen[799:600]		<= 0;
		dividend_gen[1199:800]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[999:800]		<=divisor_gen[799:600] >> 1;
		if (dividend_gen[600:600]		<=divisor_gen[600:600] begin
		quotient_gen[799:600]		<=quotient_gen[599:400] | (1 << 15)
		dividend_gen[999:800]		<= dividend_gen[799:600] - divisor_gen[799:600];
	end else begin
		quotient_gen[799:600]		<= quotient_gen[599:400];
		dividend_gen[999:800]		<= dividend_gen[799:600];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[1199:1000]		<= 0;
		quotient_gen[999:800]		<= 0;
		dividend_gen[1599:1000]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[1199:1000]		<=divisor_gen[999:800] >> 1;
		if (dividend_gen[800:800]		<=divisor_gen[800:800] begin
		quotient_gen[999:800]		<=quotient_gen[799:600] | (1 << 14)
		dividend_gen[1199:1000]		<= dividend_gen[999:800] - divisor_gen[999:800];
	end else begin
		quotient_gen[999:800]		<= quotient_gen[799:600];
		dividend_gen[1199:1000]		<= dividend_gen[999:800];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[1399:1200]		<= 0;
		quotient_gen[1199:1000]		<= 0;
		dividend_gen[1999:1200]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[1399:1200]		<=divisor_gen[1199:1000] >> 1;
		if (dividend_gen[1000:1000]		<=divisor_gen[1000:1000] begin
		quotient_gen[1199:1000]		<=quotient_gen[999:800] | (1 << 13)
		dividend_gen[1399:1200]		<= dividend_gen[1199:1000] - divisor_gen[1199:1000];
	end else begin
		quotient_gen[1199:1000]		<= quotient_gen[999:800];
		dividend_gen[1399:1200]		<= dividend_gen[1199:1000];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[7]		<= 0;
		start_gen[7]			<= 0;
		negative_quotient_gen[7]	<= 0;
		divisor_gen[1599:1400]		<= 0;
		quotient_gen[1399:1200]		<= 0;
		dividend_gen[2399:1400]		<= 0;
	end else begin
		div_by_zero_gen[7]		<=div_by_zero_gen[6];
		start_gen[7]			<=strat_gen[6];
		negative_quotient_gen[7]	<=negative_quotient_gen[6];
		divisor_gen[1599:1400]		<=divisor_gen[1399:1200] >> 1;
		if (dividend_gen[1200:1200]		<=divisor_gen[1200:1200] begin
		quotient_gen[1399:1200]		<=quotient_gen[1199:1000] | (1 << 12)
		dividend_gen[1599:1400]		<= dividend_gen[1399:1200] - divisor_gen[1399:1200];
	end else begin
		quotient_gen[1399:1200]		<= quotient_gen[1199:1000];
		dividend_gen[1599:1400]		<= dividend_gen[1399:1200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[8]		<= 0;
		start_gen[8]			<= 0;
		negative_quotient_gen[8]	<= 0;
		divisor_gen[1799:1600]		<= 0;
		quotient_gen[1599:1400]		<= 0;
		dividend_gen[2799:1600]		<= 0;
	end else begin
		div_by_zero_gen[8]		<=div_by_zero_gen[7];
		start_gen[8]			<=strat_gen[7];
		negative_quotient_gen[8]	<=negative_quotient_gen[7];
		divisor_gen[1799:1600]		<=divisor_gen[1599:1400] >> 1;
		if (dividend_gen[1400:1400]		<=divisor_gen[1400:1400] begin
		quotient_gen[1599:1400]		<=quotient_gen[1399:1200] | (1 << 11)
		dividend_gen[1799:1600]		<= dividend_gen[1599:1400] - divisor_gen[1599:1400];
	end else begin
		quotient_gen[1599:1400]		<= quotient_gen[1399:1200];
		dividend_gen[1799:1600]		<= dividend_gen[1599:1400];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[9]		<= 0;
		start_gen[9]			<= 0;
		negative_quotient_gen[9]	<= 0;
		divisor_gen[1999:1800]		<= 0;
		quotient_gen[1799:1600]		<= 0;
		dividend_gen[3199:1800]		<= 0;
	end else begin
		div_by_zero_gen[9]		<=div_by_zero_gen[8];
		start_gen[9]			<=strat_gen[8];
		negative_quotient_gen[9]	<=negative_quotient_gen[8];
		divisor_gen[1999:1800]		<=divisor_gen[1799:1600] >> 1;
		if (dividend_gen[1600:1600]		<=divisor_gen[1600:1600] begin
		quotient_gen[1799:1600]		<=quotient_gen[1599:1400] | (1 << 10)
		dividend_gen[1999:1800]		<= dividend_gen[1799:1600] - divisor_gen[1799:1600];
	end else begin
		quotient_gen[1799:1600]		<= quotient_gen[1599:1400];
		dividend_gen[1999:1800]		<= dividend_gen[1799:1600];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[10]		<= 0;
		start_gen[10]			<= 0;
		negative_quotient_gen[10]	<= 0;
		divisor_gen[2199:2000]		<= 0;
		quotient_gen[1999:1800]		<= 0;
		dividend_gen[3599:2000]		<= 0;
	end else begin
		div_by_zero_gen[10]		<=div_by_zero_gen[9];
		start_gen[10]			<=strat_gen[9];
		negative_quotient_gen[10]	<=negative_quotient_gen[9];
		divisor_gen[2199:2000]		<=divisor_gen[1999:1800] >> 1;
		if (dividend_gen[1800:1800]		<=divisor_gen[1800:1800] begin
		quotient_gen[1999:1800]		<=quotient_gen[1799:1600] | (1 << 9)
		dividend_gen[2199:2000]		<= dividend_gen[1999:1800] - divisor_gen[1999:1800];
	end else begin
		quotient_gen[1999:1800]		<= quotient_gen[1799:1600];
		dividend_gen[2199:2000]		<= dividend_gen[1999:1800];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[11]		<= 0;
		start_gen[11]			<= 0;
		negative_quotient_gen[11]	<= 0;
		divisor_gen[2399:2200]		<= 0;
		quotient_gen[2199:2000]		<= 0;
		dividend_gen[3999:2200]		<= 0;
	end else begin
		div_by_zero_gen[11]		<=div_by_zero_gen[10];
		start_gen[11]			<=strat_gen[10];
		negative_quotient_gen[11]	<=negative_quotient_gen[10];
		divisor_gen[2399:2200]		<=divisor_gen[2199:2000] >> 1;
		if (dividend_gen[2000:2000]		<=divisor_gen[2000:2000] begin
		quotient_gen[2199:2000]		<=quotient_gen[1999:1800] | (1 << 8)
		dividend_gen[2399:2200]		<= dividend_gen[2199:2000] - divisor_gen[2199:2000];
	end else begin
		quotient_gen[2199:2000]		<= quotient_gen[1999:1800];
		dividend_gen[2399:2200]		<= dividend_gen[2199:2000];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[12]		<= 0;
		start_gen[12]			<= 0;
		negative_quotient_gen[12]	<= 0;
		divisor_gen[2599:2400]		<= 0;
		quotient_gen[2399:2200]		<= 0;
		dividend_gen[4399:2400]		<= 0;
	end else begin
		div_by_zero_gen[12]		<=div_by_zero_gen[11];
		start_gen[12]			<=strat_gen[11];
		negative_quotient_gen[12]	<=negative_quotient_gen[11];
		divisor_gen[2599:2400]		<=divisor_gen[2399:2200] >> 1;
		if (dividend_gen[2200:2200]		<=divisor_gen[2200:2200] begin
		quotient_gen[2399:2200]		<=quotient_gen[2199:2000] | (1 << 7)
		dividend_gen[2599:2400]		<= dividend_gen[2399:2200] - divisor_gen[2399:2200];
	end else begin
		quotient_gen[2399:2200]		<= quotient_gen[2199:2000];
		dividend_gen[2599:2400]		<= dividend_gen[2399:2200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[13]		<= 0;
		start_gen[13]			<= 0;
		negative_quotient_gen[13]	<= 0;
		divisor_gen[2799:2600]		<= 0;
		quotient_gen[2599:2400]		<= 0;
		dividend_gen[4799:2600]		<= 0;
	end else begin
		div_by_zero_gen[13]		<=div_by_zero_gen[12];
		start_gen[13]			<=strat_gen[12];
		negative_quotient_gen[13]	<=negative_quotient_gen[12];
		divisor_gen[2799:2600]		<=divisor_gen[2599:2400] >> 1;
		if (dividend_gen[2400:2400]		<=divisor_gen[2400:2400] begin
		quotient_gen[2599:2400]		<=quotient_gen[2399:2200] | (1 << 6)
		dividend_gen[2799:2600]		<= dividend_gen[2599:2400] - divisor_gen[2599:2400];
	end else begin
		quotient_gen[2599:2400]		<= quotient_gen[2399:2200];
		dividend_gen[2799:2600]		<= dividend_gen[2599:2400];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[14]		<= 0;
		start_gen[14]			<= 0;
		negative_quotient_gen[14]	<= 0;
		divisor_gen[2999:2800]		<= 0;
		quotient_gen[2799:2600]		<= 0;
		dividend_gen[5199:2800]		<= 0;
	end else begin
		div_by_zero_gen[14]		<=div_by_zero_gen[13];
		start_gen[14]			<=strat_gen[13];
		negative_quotient_gen[14]	<=negative_quotient_gen[13];
		divisor_gen[2999:2800]		<=divisor_gen[2799:2600] >> 1;
		if (dividend_gen[2600:2600]		<=divisor_gen[2600:2600] begin
		quotient_gen[2799:2600]		<=quotient_gen[2599:2400] | (1 << 5)
		dividend_gen[2999:2800]		<= dividend_gen[2799:2600] - divisor_gen[2799:2600];
	end else begin
		quotient_gen[2799:2600]		<= quotient_gen[2599:2400];
		dividend_gen[2999:2800]		<= dividend_gen[2799:2600];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[15]		<= 0;
		start_gen[15]			<= 0;
		negative_quotient_gen[15]	<= 0;
		divisor_gen[3199:3000]		<= 0;
		quotient_gen[2999:2800]		<= 0;
		dividend_gen[5599:3000]		<= 0;
	end else begin
		div_by_zero_gen[15]		<=div_by_zero_gen[14];
		start_gen[15]			<=strat_gen[14];
		negative_quotient_gen[15]	<=negative_quotient_gen[14];
		divisor_gen[3199:3000]		<=divisor_gen[2999:2800] >> 1;
		if (dividend_gen[2800:2800]		<=divisor_gen[2800:2800] begin
		quotient_gen[2999:2800]		<=quotient_gen[2799:2600] | (1 << 4)
		dividend_gen[3199:3000]		<= dividend_gen[2999:2800] - divisor_gen[2999:2800];
	end else begin
		quotient_gen[2999:2800]		<= quotient_gen[2799:2600];
		dividend_gen[3199:3000]		<= dividend_gen[2999:2800];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[16]		<= 0;
		start_gen[16]			<= 0;
		negative_quotient_gen[16]	<= 0;
		divisor_gen[3399:3200]		<= 0;
		quotient_gen[3199:3000]		<= 0;
		dividend_gen[5999:3200]		<= 0;
	end else begin
		div_by_zero_gen[16]		<=div_by_zero_gen[15];
		start_gen[16]			<=strat_gen[15];
		negative_quotient_gen[16]	<=negative_quotient_gen[15];
		divisor_gen[3399:3200]		<=divisor_gen[3199:3000] >> 1;
		if (dividend_gen[3000:3000]		<=divisor_gen[3000:3000] begin
		quotient_gen[3199:3000]		<=quotient_gen[2999:2800] | (1 << 3)
		dividend_gen[3399:3200]		<= dividend_gen[3199:3000] - divisor_gen[3199:3000];
	end else begin
		quotient_gen[3199:3000]		<= quotient_gen[2999:2800];
		dividend_gen[3399:3200]		<= dividend_gen[3199:3000];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[17]		<= 0;
		start_gen[17]			<= 0;
		negative_quotient_gen[17]	<= 0;
		divisor_gen[3599:3400]		<= 0;
		quotient_gen[3399:3200]		<= 0;
		dividend_gen[6399:3400]		<= 0;
	end else begin
		div_by_zero_gen[17]		<=div_by_zero_gen[16];
		start_gen[17]			<=strat_gen[16];
		negative_quotient_gen[17]	<=negative_quotient_gen[16];
		divisor_gen[3599:3400]		<=divisor_gen[3399:3200] >> 1;
		if (dividend_gen[3200:3200]		<=divisor_gen[3200:3200] begin
		quotient_gen[3399:3200]		<=quotient_gen[3199:3000] | (1 << 2)
		dividend_gen[3599:3400]		<= dividend_gen[3399:3200] - divisor_gen[3399:3200];
	end else begin
		quotient_gen[3399:3200]		<= quotient_gen[3199:3000];
		dividend_gen[3599:3400]		<= dividend_gen[3399:3200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[18]		<= 0;
		start_gen[18]			<= 0;
		negative_quotient_gen[18]	<= 0;
		divisor_gen[3799:3600]		<= 0;
		quotient_gen[3599:3400]		<= 0;
		dividend_gen[6799:3600]		<= 0;
	end else begin
		div_by_zero_gen[18]		<=div_by_zero_gen[17];
		start_gen[18]			<=strat_gen[17];
		negative_quotient_gen[18]	<=negative_quotient_gen[17];
		divisor_gen[3799:3600]		<=divisor_gen[3599:3400] >> 1;
		if (dividend_gen[3400:3400]		<=divisor_gen[3400:3400] begin
		quotient_gen[3599:3400]		<=quotient_gen[3399:3200] | (1 << 1)
		dividend_gen[3799:3600]		<= dividend_gen[3599:3400] - divisor_gen[3599:3400];
	end else begin
		quotient_gen[3599:3400]		<= quotient_gen[3399:3200];
		dividend_gen[3799:3600]		<= dividend_gen[3599:3400];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[19]	<= 0;
	negative_quotient_gen[19]	<= 0;
	quotient_gen[3799:3600] <= 0; end else begin
	div_by_zero_gen[19]	<= div_by_zero_gen[18];
	start_gen[19]	<= start_gen[18];
	negative_quotient_gen[19]	<= negative_quotient_gen[18];
	if ( dividend_gen[199:0]	<= divisor_gen[199:0]) begin
	quotient_gen[199:0] 	<= 1 << 18;
	if ( dividend_gen[3799:3600] 	<= divisor_gen[3799:3600] )
	quotient_gen[3799:3600] 		<= quotient_gen[3599:3400] | 1;
	else
	quotient_gen[3799:3600] 		<= quotient_gen[3599:3400];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[19]<= 0;
      start_gen[19]<= 0;
      negative_quotient_gen[19]<= 0;
      quotient_gen[3998:3998]<= 0;
    end else begin
      div_by_zero_gen[19]<= div_by_zero_gen[18];
      start_gen[19]<= start_gen[18];
      negative_quotient_gen[19]<= negative_quotient_gen[18];

      if ( dividend_gen[3998:3998] <= divisor_gen[3998:3998] )
        quotient_gen[3998:3998] <= quotient_gen[3997:3997] | 1;
      else
        quotient_gen[3998:3998] <= quotient_gen[3997:3997];

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
      quotient          <= (negative_quotient_gen[19]) ? ~quotient_gen[3998:3999]: quotient_gen[3998:3998];
    end
  end

//=======================================================================================================================================================

endmodule
