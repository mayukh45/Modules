
module AH_DivPipelined_8_10 (clk
,rstn
,start
,dividend
,divisor
,data_valid
,div_by_zero);

input clk;
input rstn;
input start;
input [7:0] dividend;
input [7:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [9:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [158:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [7:0]             	pad_dividend;
  wire [6:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[15:0] <= 0;
        divisor_gen[15:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[7] ^ divisor[7];
        dividend_gen[15:0] 	<= (dividend[7]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[15:0]  	<= (divisor [7]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[31:16]  	<= 0;
      quotient_gen[15:0]        	<= 0;
      dividend_gen[31:16] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[31:16] 	  <= divisor_gen[15:0] >> 1;

      if ( dividend_gen[15:0] 	  <= divisor_gen[15:0]) begin
        quotient_gen[15:0] 	<= 1  << STAGES - 2;
        dividend_gen[31:16] <= dividend_gen[15:0] - divisor_gen[15:0];
      end else begin
        quotient_gen[15:0] 	      <= 0;
        dividend_gen[31:16] <= dividend_gen[15:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[47:32]		<= 0;
		quotient_gen[31:16]		<= 0;
		dividend_gen[31:32]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[47:32]		<=divisor_gen[31:16] >> 1;
		if (dividend_gen[16:16]		<=divisor_gen[16:16] begin
		quotient_gen[31:16]		<=quotient_gen[15:0] | (1 << 7)
		dividend_gen[47:32]		<= dividend_gen[31:16] - divisor_gen[31:16];
	end else begin
		quotient_gen[31:16]		<= quotient_gen[15:0];
		dividend_gen[47:32]		<= dividend_gen[31:16];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[63:48]		<= 0;
		quotient_gen[47:32]		<= 0;
		dividend_gen[63:48]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[63:48]		<=divisor_gen[47:32] >> 1;
		if (dividend_gen[32:32]		<=divisor_gen[32:32] begin
		quotient_gen[47:32]		<=quotient_gen[31:16] | (1 << 6)
		dividend_gen[63:48]		<= dividend_gen[47:32] - divisor_gen[47:32];
	end else begin
		quotient_gen[47:32]		<= quotient_gen[31:16];
		dividend_gen[63:48]		<= dividend_gen[47:32];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[79:64]		<= 0;
		quotient_gen[63:48]		<= 0;
		dividend_gen[95:64]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[79:64]		<=divisor_gen[63:48] >> 1;
		if (dividend_gen[48:48]		<=divisor_gen[48:48] begin
		quotient_gen[63:48]		<=quotient_gen[47:32] | (1 << 5)
		dividend_gen[79:64]		<= dividend_gen[63:48] - divisor_gen[63:48];
	end else begin
		quotient_gen[63:48]		<= quotient_gen[47:32];
		dividend_gen[79:64]		<= dividend_gen[63:48];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[95:80]		<= 0;
		quotient_gen[79:64]		<= 0;
		dividend_gen[127:80]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[95:80]		<=divisor_gen[79:64] >> 1;
		if (dividend_gen[64:64]		<=divisor_gen[64:64] begin
		quotient_gen[79:64]		<=quotient_gen[63:48] | (1 << 4)
		dividend_gen[95:80]		<= dividend_gen[79:64] - divisor_gen[79:64];
	end else begin
		quotient_gen[79:64]		<= quotient_gen[63:48];
		dividend_gen[95:80]		<= dividend_gen[79:64];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[111:96]		<= 0;
		quotient_gen[95:80]		<= 0;
		dividend_gen[159:96]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[111:96]		<=divisor_gen[95:80] >> 1;
		if (dividend_gen[80:80]		<=divisor_gen[80:80] begin
		quotient_gen[95:80]		<=quotient_gen[79:64] | (1 << 3)
		dividend_gen[111:96]		<= dividend_gen[95:80] - divisor_gen[95:80];
	end else begin
		quotient_gen[95:80]		<= quotient_gen[79:64];
		dividend_gen[111:96]		<= dividend_gen[95:80];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[7]		<= 0;
		start_gen[7]			<= 0;
		negative_quotient_gen[7]	<= 0;
		divisor_gen[127:112]		<= 0;
		quotient_gen[111:96]		<= 0;
		dividend_gen[191:112]		<= 0;
	end else begin
		div_by_zero_gen[7]		<=div_by_zero_gen[6];
		start_gen[7]			<=strat_gen[6];
		negative_quotient_gen[7]	<=negative_quotient_gen[6];
		divisor_gen[127:112]		<=divisor_gen[111:96] >> 1;
		if (dividend_gen[96:96]		<=divisor_gen[96:96] begin
		quotient_gen[111:96]		<=quotient_gen[95:80] | (1 << 2)
		dividend_gen[127:112]		<= dividend_gen[111:96] - divisor_gen[111:96];
	end else begin
		quotient_gen[111:96]		<= quotient_gen[95:80];
		dividend_gen[127:112]		<= dividend_gen[111:96];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[8]		<= 0;
		start_gen[8]			<= 0;
		negative_quotient_gen[8]	<= 0;
		divisor_gen[143:128]		<= 0;
		quotient_gen[127:112]		<= 0;
		dividend_gen[223:128]		<= 0;
	end else begin
		div_by_zero_gen[8]		<=div_by_zero_gen[7];
		start_gen[8]			<=strat_gen[7];
		negative_quotient_gen[8]	<=negative_quotient_gen[7];
		divisor_gen[143:128]		<=divisor_gen[127:112] >> 1;
		if (dividend_gen[112:112]		<=divisor_gen[112:112] begin
		quotient_gen[127:112]		<=quotient_gen[111:96] | (1 << 1)
		dividend_gen[143:128]		<= dividend_gen[127:112] - divisor_gen[127:112];
	end else begin
		quotient_gen[127:112]		<= quotient_gen[111:96];
		dividend_gen[143:128]		<= dividend_gen[127:112];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[9]	<= 0;
	negative_quotient_gen[9]	<= 0;
	quotient_gen[143:128] <= 0; end else begin
	div_by_zero_gen[9]	<= div_by_zero_gen[8];
	start_gen[9]	<= start_gen[8];
	negative_quotient_gen[9]	<= negative_quotient_gen[8];
	if ( dividend_gen[15:0]	<= divisor_gen[15:0]) begin
	quotient_gen[15:0] 	<= 1 << 8;
	if ( dividend_gen[143:128] 	<= divisor_gen[143:128] )
	quotient_gen[143:128] 		<= quotient_gen[127:112] | 1;
	else
	quotient_gen[143:128] 		<= quotient_gen[127:112];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[9]<= 0;
      start_gen[9]<= 0;
      negative_quotient_gen[9]<= 0;
      quotient_gen[158:158]<= 0;
    end else begin
      div_by_zero_gen[9]<= div_by_zero_gen[8];
      start_gen[9]<= start_gen[8];
      negative_quotient_gen[9]<= negative_quotient_gen[8];

      if ( dividend_gen[158:158] <= divisor_gen[158:158] )
        quotient_gen[158:158] <= quotient_gen[157:157] | 1;
      else
        quotient_gen[158:158] <= quotient_gen[157:157];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[9];
      data_valid        <= start_gen[9];
      quotient          <= (negative_quotient_gen[9]) ? ~quotient_gen[158:159]: quotient_gen[158:158];
    end
  end

//=======================================================================================================================================================

endmodule
