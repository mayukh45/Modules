
module AH_DivPipelined_4_8 (start
,dividend
,divisor
,data_valid
,div_by_zero);

input start;
input [3:0] dividend;
input [3:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [7:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [62:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [3:0]             	pad_dividend;
  wire [2:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[7:0] <= 0;
        divisor_gen[7:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[3] ^ divisor[3];
        dividend_gen[7:0] 	<= (dividend[3]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[7:0]  	<= (divisor [3]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[15:8]  	<= 0;
      quotient_gen[7:0]        	<= 0;
      dividend_gen[15:8] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[15:8] 	  <= divisor_gen[7:0] >> 1;

      if ( dividend_gen[7:0] 	  <= divisor_gen[7:0]) begin
        quotient_gen[7:0] 	<= 1  << STAGES - 2;
        dividend_gen[15:8] <= dividend_gen[7:0] - divisor_gen[7:0];
      end else begin
        quotient_gen[7:0] 	      <= 0;
        dividend_gen[15:8] <= dividend_gen[7:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[23:16]		<= 0;
		quotient_gen[15:8]		<= 0;
		dividend_gen[15:16]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[23:16]		<=divisor_gen[15:8] >> 1;
		if (dividend_gen[8:8]		<=divisor_gen[8:8] begin
		quotient_gen[15:8]		<=quotient_gen[7:0] | (1 << 5)
		dividend_gen[23:16]		<= dividend_gen[15:8] - divisor_gen[15:8];
	end else begin
		quotient_gen[15:8]		<= quotient_gen[7:0];
		dividend_gen[23:16]		<= dividend_gen[15:8];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[31:24]		<= 0;
		quotient_gen[23:16]		<= 0;
		dividend_gen[31:24]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[31:24]		<=divisor_gen[23:16] >> 1;
		if (dividend_gen[16:16]		<=divisor_gen[16:16] begin
		quotient_gen[23:16]		<=quotient_gen[15:8] | (1 << 4)
		dividend_gen[31:24]		<= dividend_gen[23:16] - divisor_gen[23:16];
	end else begin
		quotient_gen[23:16]		<= quotient_gen[15:8];
		dividend_gen[31:24]		<= dividend_gen[23:16];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[39:32]		<= 0;
		quotient_gen[31:24]		<= 0;
		dividend_gen[47:32]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[39:32]		<=divisor_gen[31:24] >> 1;
		if (dividend_gen[24:24]		<=divisor_gen[24:24] begin
		quotient_gen[31:24]		<=quotient_gen[23:16] | (1 << 3)
		dividend_gen[39:32]		<= dividend_gen[31:24] - divisor_gen[31:24];
	end else begin
		quotient_gen[31:24]		<= quotient_gen[23:16];
		dividend_gen[39:32]		<= dividend_gen[31:24];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[47:40]		<= 0;
		quotient_gen[39:32]		<= 0;
		dividend_gen[63:40]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[47:40]		<=divisor_gen[39:32] >> 1;
		if (dividend_gen[32:32]		<=divisor_gen[32:32] begin
		quotient_gen[39:32]		<=quotient_gen[31:24] | (1 << 2)
		dividend_gen[47:40]		<= dividend_gen[39:32] - divisor_gen[39:32];
	end else begin
		quotient_gen[39:32]		<= quotient_gen[31:24];
		dividend_gen[47:40]		<= dividend_gen[39:32];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[55:48]		<= 0;
		quotient_gen[47:40]		<= 0;
		dividend_gen[79:48]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[55:48]		<=divisor_gen[47:40] >> 1;
		if (dividend_gen[40:40]		<=divisor_gen[40:40] begin
		quotient_gen[47:40]		<=quotient_gen[39:32] | (1 << 1)
		dividend_gen[55:48]		<= dividend_gen[47:40] - divisor_gen[47:40];
	end else begin
		quotient_gen[47:40]		<= quotient_gen[39:32];
		dividend_gen[55:48]		<= dividend_gen[47:40];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[7]	<= 0;
	negative_quotient_gen[7]	<= 0;
	quotient_gen[55:48] <= 0; end else begin
	div_by_zero_gen[7]	<= div_by_zero_gen[6];
	start_gen[7]	<= start_gen[6];
	negative_quotient_gen[7]	<= negative_quotient_gen[6];
	if ( dividend_gen[7:0]	<= divisor_gen[7:0]) begin
	quotient_gen[7:0] 	<= 1 << 6;
	if ( dividend_gen[55:48] 	<= divisor_gen[55:48] )
	quotient_gen[55:48] 		<= quotient_gen[47:40] | 1;
	else
	quotient_gen[55:48] 		<= quotient_gen[47:40];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[7]<= 0;
      start_gen[7]<= 0;
      negative_quotient_gen[7]<= 0;
      quotient_gen[62:62]<= 0;
    end else begin
      div_by_zero_gen[7]<= div_by_zero_gen[6];
      start_gen[7]<= start_gen[6];
      negative_quotient_gen[7]<= negative_quotient_gen[6];

      if ( dividend_gen[62:62] <= divisor_gen[62:62] )
        quotient_gen[62:62] <= quotient_gen[61:61] | 1;
      else
        quotient_gen[62:62] <= quotient_gen[61:61];

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
      quotient          <= (negative_quotient_gen[7]) ? ~quotient_gen[62:63]: quotient_gen[62:62];
    end
  end

//=======================================================================================================================================================

endmodule
