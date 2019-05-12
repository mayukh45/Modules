
module AH_DivPipelined_6_8 (start
,dividend
,divisor
,data_valid
,div_by_zero);

input start;
input [5:0] dividend;
input [5:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [7:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [94:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [5:0]             	pad_dividend;
  wire [4:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[11:0] <= 0;
        divisor_gen[11:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[5] ^ divisor[5];
        dividend_gen[11:0] 	<= (dividend[5]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[11:0]  	<= (divisor [5]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[23:12]  	<= 0;
      quotient_gen[11:0]        	<= 0;
      dividend_gen[23:12] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[23:12] 	  <= divisor_gen[11:0] >> 1;

      if ( dividend_gen[11:0] 	  <= divisor_gen[11:0]) begin
        quotient_gen[11:0] 	<= 1  << STAGES - 2;
        dividend_gen[23:12] <= dividend_gen[11:0] - divisor_gen[11:0];
      end else begin
        quotient_gen[11:0] 	      <= 0;
        dividend_gen[23:12] <= dividend_gen[11:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[35:24]		<= 0;
		quotient_gen[23:12]		<= 0;
		dividend_gen[23:24]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[35:24]		<=divisor_gen[23:12] >> 1;
		if (dividend_gen[12:12]		<=divisor_gen[12:12] begin
		quotient_gen[23:12]		<=quotient_gen[11:0] | (1 << 5)
		dividend_gen[35:24]		<= dividend_gen[23:12] - divisor_gen[23:12];
	end else begin
		quotient_gen[23:12]		<= quotient_gen[11:0];
		dividend_gen[35:24]		<= dividend_gen[23:12];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[47:36]		<= 0;
		quotient_gen[35:24]		<= 0;
		dividend_gen[47:36]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[47:36]		<=divisor_gen[35:24] >> 1;
		if (dividend_gen[24:24]		<=divisor_gen[24:24] begin
		quotient_gen[35:24]		<=quotient_gen[23:12] | (1 << 4)
		dividend_gen[47:36]		<= dividend_gen[35:24] - divisor_gen[35:24];
	end else begin
		quotient_gen[35:24]		<= quotient_gen[23:12];
		dividend_gen[47:36]		<= dividend_gen[35:24];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[59:48]		<= 0;
		quotient_gen[47:36]		<= 0;
		dividend_gen[71:48]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[59:48]		<=divisor_gen[47:36] >> 1;
		if (dividend_gen[36:36]		<=divisor_gen[36:36] begin
		quotient_gen[47:36]		<=quotient_gen[35:24] | (1 << 3)
		dividend_gen[59:48]		<= dividend_gen[47:36] - divisor_gen[47:36];
	end else begin
		quotient_gen[47:36]		<= quotient_gen[35:24];
		dividend_gen[59:48]		<= dividend_gen[47:36];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[71:60]		<= 0;
		quotient_gen[59:48]		<= 0;
		dividend_gen[95:60]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[71:60]		<=divisor_gen[59:48] >> 1;
		if (dividend_gen[48:48]		<=divisor_gen[48:48] begin
		quotient_gen[59:48]		<=quotient_gen[47:36] | (1 << 2)
		dividend_gen[71:60]		<= dividend_gen[59:48] - divisor_gen[59:48];
	end else begin
		quotient_gen[59:48]		<= quotient_gen[47:36];
		dividend_gen[71:60]		<= dividend_gen[59:48];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[83:72]		<= 0;
		quotient_gen[71:60]		<= 0;
		dividend_gen[119:72]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[83:72]		<=divisor_gen[71:60] >> 1;
		if (dividend_gen[60:60]		<=divisor_gen[60:60] begin
		quotient_gen[71:60]		<=quotient_gen[59:48] | (1 << 1)
		dividend_gen[83:72]		<= dividend_gen[71:60] - divisor_gen[71:60];
	end else begin
		quotient_gen[71:60]		<= quotient_gen[59:48];
		dividend_gen[83:72]		<= dividend_gen[71:60];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[7]	<= 0;
	negative_quotient_gen[7]	<= 0;
	quotient_gen[83:72] <= 0; end else begin
	div_by_zero_gen[7]	<= div_by_zero_gen[6];
	start_gen[7]	<= start_gen[6];
	negative_quotient_gen[7]	<= negative_quotient_gen[6];
	if ( dividend_gen[11:0]	<= divisor_gen[11:0]) begin
	quotient_gen[11:0] 	<= 1 << 6;
	if ( dividend_gen[83:72] 	<= divisor_gen[83:72] )
	quotient_gen[83:72] 		<= quotient_gen[71:60] | 1;
	else
	quotient_gen[83:72] 		<= quotient_gen[71:60];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[7]<= 0;
      start_gen[7]<= 0;
      negative_quotient_gen[7]<= 0;
      quotient_gen[94:94]<= 0;
    end else begin
      div_by_zero_gen[7]<= div_by_zero_gen[6];
      start_gen[7]<= start_gen[6];
      negative_quotient_gen[7]<= negative_quotient_gen[6];

      if ( dividend_gen[94:94] <= divisor_gen[94:94] )
        quotient_gen[94:94] <= quotient_gen[93:93] | 1;
      else
        quotient_gen[94:94] <= quotient_gen[93:93];

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
      quotient          <= (negative_quotient_gen[7]) ? ~quotient_gen[94:95]: quotient_gen[94:94];
    end
  end

//=======================================================================================================================================================

endmodule
