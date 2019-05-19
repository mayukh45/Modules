
module AH_DivPipelined_256_4 (clk
,rstn
,start
,dividend
,divisor
,data_valid
,div_by_zero);

input clk;
input rstn;
input start;
input [255:0] dividend;
input [255:0] divisor;
output data_valid;
output div_by_zero;
 
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [3:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [2046:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [255:0]             	pad_dividend;
  wire [254:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[511:0] <= 0;
        divisor_gen[511:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[255] ^ divisor[255];
        dividend_gen[511:0] 	<= (dividend[255]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[511:0]  	<= (divisor [255]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[1023:512]  	<= 0;
      quotient_gen[511:0]        	<= 0;
      dividend_gen[1023:512] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[1023:512] 	  <= divisor_gen[511:0] >> 1;

      if ( dividend_gen[511:0] 	  <= divisor_gen[511:0]) begin
        quotient_gen[511:0] 	<= 1  << STAGES - 2;
        dividend_gen[1023:512] <= dividend_gen[511:0] - divisor_gen[511:0];
      end else begin
        quotient_gen[511:0] 	      <= 0;
        dividend_gen[1023:512] <= dividend_gen[511:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[1535:1024]		<= 0;
		quotient_gen[1023:512]		<= 0;
		dividend_gen[1023:1024]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[1535:1024]		<=divisor_gen[1023:512] >> 1;
		if (dividend_gen[512:512]		<=divisor_gen[512:512] begin
		quotient_gen[1023:512]		<=quotient_gen[511:0] | (1 << 1)
		dividend_gen[1535:1024]		<= dividend_gen[1023:512] - divisor_gen[1023:512];
	end else begin
		quotient_gen[1023:512]		<= quotient_gen[511:0];
		dividend_gen[1535:1024]		<= dividend_gen[1023:512];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[3]	<= 0;
	negative_quotient_gen[3]	<= 0;
	quotient_gen[1535:1024] <= 0; end else begin
	div_by_zero_gen[3]	<= div_by_zero_gen[2];
	start_gen[3]	<= start_gen[2];
	negative_quotient_gen[3]	<= negative_quotient_gen[2];
	if ( dividend_gen[511:0]	<= divisor_gen[511:0]) begin
	quotient_gen[511:0] 	<= 1 << 2;
	if ( dividend_gen[1535:1024] 	<= divisor_gen[1535:1024] )
	quotient_gen[1535:1024] 		<= quotient_gen[1023:512] | 1;
	else
	quotient_gen[1535:1024] 		<= quotient_gen[1023:512];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[3]<= 0;
      start_gen[3]<= 0;
      negative_quotient_gen[3]<= 0;
      quotient_gen[2046:2046]<= 0;
    end else begin
      div_by_zero_gen[3]<= div_by_zero_gen[2];
      start_gen[3]<= start_gen[2];
      negative_quotient_gen[3]<= negative_quotient_gen[2];

      if ( dividend_gen[2046:2046] <= divisor_gen[2046:2046] )
        quotient_gen[2046:2046] <= quotient_gen[2045:2045] | 1;
      else
        quotient_gen[2046:2046] <= quotient_gen[2045:2045];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[3];
      data_valid        <= start_gen[3];
      quotient          <= (negative_quotient_gen[3]) ? ~quotient_gen[2046:2047]: quotient_gen[2046:2046];
    end
  end


endmodule
