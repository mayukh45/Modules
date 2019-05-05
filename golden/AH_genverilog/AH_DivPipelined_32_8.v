
module AH_DivPipelined_32_8 (clk
,rstn
,start
,dividend
,divisor
,data_valid
,div_by_zero);

input clk;
input rstn;
input start;
input [31:0] dividend;
input [31:0] divisor;
output data_valid;
output div_by_zero;
 
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [7:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [510:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [31:0]             	pad_dividend;
  wire [30:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[63:0] <= 0;
        divisor_gen[63:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[31] ^ divisor[31];
        dividend_gen[63:0] 	<= (dividend[31]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[63:0]  	<= (divisor [31]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[127:64]  	<= 0;
      quotient_gen[63:0]        	<= 0;
      dividend_gen[127:64] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[127:64] 	  <= divisor_gen[63:0] >> 1;

      if ( dividend_gen[63:0] 	  <= divisor_gen[63:0]) begin
        quotient_gen[63:0] 	<= 1  << STAGES - 2;
        dividend_gen[127:64] <= dividend_gen[63:0] - divisor_gen[63:0];
      end else begin
        quotient_gen[63:0] 	      <= 0;
        dividend_gen[127:64] <= dividend_gen[63:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[191:128]		<= 0;
		quotient_gen[127:64]		<= 0;
		dividend_gen[127:128]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[191:128]		<=divisor_gen[127:64] >> 1;
		if (dividend_gen[64:64]		<=divisor_gen[64:64] begin
		quotient_gen[127:64]		<=quotient_gen[63:0] | (1 << 5)
		dividend_gen[191:128]		<= dividend_gen[127:64] - divisor_gen[127:64];
	end else begin
		quotient_gen[127:64]		<= quotient_gen[63:0];
		dividend_gen[191:128]		<= dividend_gen[127:64];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[255:192]		<= 0;
		quotient_gen[191:128]		<= 0;
		dividend_gen[255:192]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[255:192]		<=divisor_gen[191:128] >> 1;
		if (dividend_gen[128:128]		<=divisor_gen[128:128] begin
		quotient_gen[191:128]		<=quotient_gen[127:64] | (1 << 4)
		dividend_gen[255:192]		<= dividend_gen[191:128] - divisor_gen[191:128];
	end else begin
		quotient_gen[191:128]		<= quotient_gen[127:64];
		dividend_gen[255:192]		<= dividend_gen[191:128];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[319:256]		<= 0;
		quotient_gen[255:192]		<= 0;
		dividend_gen[383:256]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[319:256]		<=divisor_gen[255:192] >> 1;
		if (dividend_gen[192:192]		<=divisor_gen[192:192] begin
		quotient_gen[255:192]		<=quotient_gen[191:128] | (1 << 3)
		dividend_gen[319:256]		<= dividend_gen[255:192] - divisor_gen[255:192];
	end else begin
		quotient_gen[255:192]		<= quotient_gen[191:128];
		dividend_gen[319:256]		<= dividend_gen[255:192];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[383:320]		<= 0;
		quotient_gen[319:256]		<= 0;
		dividend_gen[511:320]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[383:320]		<=divisor_gen[319:256] >> 1;
		if (dividend_gen[256:256]		<=divisor_gen[256:256] begin
		quotient_gen[319:256]		<=quotient_gen[255:192] | (1 << 2)
		dividend_gen[383:320]		<= dividend_gen[319:256] - divisor_gen[319:256];
	end else begin
		quotient_gen[319:256]		<= quotient_gen[255:192];
		dividend_gen[383:320]		<= dividend_gen[319:256];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[447:384]		<= 0;
		quotient_gen[383:320]		<= 0;
		dividend_gen[639:384]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[447:384]		<=divisor_gen[383:320] >> 1;
		if (dividend_gen[320:320]		<=divisor_gen[320:320] begin
		quotient_gen[383:320]		<=quotient_gen[319:256] | (1 << 1)
		dividend_gen[447:384]		<= dividend_gen[383:320] - divisor_gen[383:320];
	end else begin
		quotient_gen[383:320]		<= quotient_gen[319:256];
		dividend_gen[447:384]		<= dividend_gen[383:320];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[7]	<= 0;
	negative_quotient_gen[7]	<= 0;
	quotient_gen[447:384] <= 0; end else begin
	div_by_zero_gen[7]	<= div_by_zero_gen[6];
	start_gen[7]	<= start_gen[6];
	negative_quotient_gen[7]	<= negative_quotient_gen[6];
	if ( dividend_gen[63:0]	<= divisor_gen[63:0]) begin
	quotient_gen[63:0] 	<= 1 << 6;
	if ( dividend_gen[447:384] 	<= divisor_gen[447:384] )
	quotient_gen[447:384] 		<= quotient_gen[383:320] | 1;
	else
	quotient_gen[447:384] 		<= quotient_gen[383:320];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[7]<= 0;
      start_gen[7]<= 0;
      negative_quotient_gen[7]<= 0;
      quotient_gen[510:510]<= 0;
    end else begin
      div_by_zero_gen[7]<= div_by_zero_gen[6];
      start_gen[7]<= start_gen[6];
      negative_quotient_gen[7]<= negative_quotient_gen[6];

      if ( dividend_gen[510:510] <= divisor_gen[510:510] )
        quotient_gen[510:510] <= quotient_gen[509:509] | 1;
      else
        quotient_gen[510:510] <= quotient_gen[509:509];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[7];
      data_valid        <= start_gen[7];
      quotient          <= (negative_quotient_gen[7]) ? ~quotient_gen[510:511]: quotient_gen[510:510];
    end
  end


endmodule
