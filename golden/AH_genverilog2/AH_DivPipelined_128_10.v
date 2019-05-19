
module AH_DivPipelined_128_10 (start
,dividend
,divisor
,data_valid
,div_by_zero);

input start;
input [127:0] dividend;
input [127:0] divisor;
output data_valid;
output div_by_zero;

//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [9:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [2558:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [127:0]             	pad_dividend;
  wire [126:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[255:0] <= 0;
        divisor_gen[255:0] 	<= 0;
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[127] ^ divisor[127];
        dividend_gen[255:0] 	<= (dividend[127]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[255:0]  	<= (divisor [127]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[511:256]  	<= 0;
      quotient_gen[255:0]        	<= 0;
      dividend_gen[511:256] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[511:256] 	  <= divisor_gen[255:0] >> 1;

      if ( dividend_gen[255:0] 	  <= divisor_gen[255:0]) begin
        quotient_gen[255:0] 	<= 1  << STAGES - 2;
        dividend_gen[511:256] <= dividend_gen[255:0] - divisor_gen[255:0];
      end else begin
        quotient_gen[255:0] 	      <= 0;
        dividend_gen[511:256] <= dividend_gen[255:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)


always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[767:512]		<= 0;
		quotient_gen[511:256]		<= 0;
		dividend_gen[511:512]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[767:512]		<=divisor_gen[511:256] >> 1;
		if (dividend_gen[256:256]		<=divisor_gen[256:256] begin
		quotient_gen[511:256]		<=quotient_gen[255:0] | (1 << 7)
		dividend_gen[767:512]		<= dividend_gen[511:256] - divisor_gen[511:256];
	end else begin
		quotient_gen[511:256]		<= quotient_gen[255:0];
		dividend_gen[767:512]		<= dividend_gen[511:256];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[1023:768]		<= 0;
		quotient_gen[767:512]		<= 0;
		dividend_gen[1023:768]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[1023:768]		<=divisor_gen[767:512] >> 1;
		if (dividend_gen[512:512]		<=divisor_gen[512:512] begin
		quotient_gen[767:512]		<=quotient_gen[511:256] | (1 << 6)
		dividend_gen[1023:768]		<= dividend_gen[767:512] - divisor_gen[767:512];
	end else begin
		quotient_gen[767:512]		<= quotient_gen[511:256];
		dividend_gen[1023:768]		<= dividend_gen[767:512];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[1279:1024]		<= 0;
		quotient_gen[1023:768]		<= 0;
		dividend_gen[1535:1024]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[1279:1024]		<=divisor_gen[1023:768] >> 1;
		if (dividend_gen[768:768]		<=divisor_gen[768:768] begin
		quotient_gen[1023:768]		<=quotient_gen[767:512] | (1 << 5)
		dividend_gen[1279:1024]		<= dividend_gen[1023:768] - divisor_gen[1023:768];
	end else begin
		quotient_gen[1023:768]		<= quotient_gen[767:512];
		dividend_gen[1279:1024]		<= dividend_gen[1023:768];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[1535:1280]		<= 0;
		quotient_gen[1279:1024]		<= 0;
		dividend_gen[2047:1280]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[1535:1280]		<=divisor_gen[1279:1024] >> 1;
		if (dividend_gen[1024:1024]		<=divisor_gen[1024:1024] begin
		quotient_gen[1279:1024]		<=quotient_gen[1023:768] | (1 << 4)
		dividend_gen[1535:1280]		<= dividend_gen[1279:1024] - divisor_gen[1279:1024];
	end else begin
		quotient_gen[1279:1024]		<= quotient_gen[1023:768];
		dividend_gen[1535:1280]		<= dividend_gen[1279:1024];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[1791:1536]		<= 0;
		quotient_gen[1535:1280]		<= 0;
		dividend_gen[2559:1536]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[1791:1536]		<=divisor_gen[1535:1280] >> 1;
		if (dividend_gen[1280:1280]		<=divisor_gen[1280:1280] begin
		quotient_gen[1535:1280]		<=quotient_gen[1279:1024] | (1 << 3)
		dividend_gen[1791:1536]		<= dividend_gen[1535:1280] - divisor_gen[1535:1280];
	end else begin
		quotient_gen[1535:1280]		<= quotient_gen[1279:1024];
		dividend_gen[1791:1536]		<= dividend_gen[1535:1280];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[7]		<= 0;
		start_gen[7]			<= 0;
		negative_quotient_gen[7]	<= 0;
		divisor_gen[2047:1792]		<= 0;
		quotient_gen[1791:1536]		<= 0;
		dividend_gen[3071:1792]		<= 0;
	end else begin
		div_by_zero_gen[7]		<=div_by_zero_gen[6];
		start_gen[7]			<=strat_gen[6];
		negative_quotient_gen[7]	<=negative_quotient_gen[6];
		divisor_gen[2047:1792]		<=divisor_gen[1791:1536] >> 1;
		if (dividend_gen[1536:1536]		<=divisor_gen[1536:1536] begin
		quotient_gen[1791:1536]		<=quotient_gen[1535:1280] | (1 << 2)
		dividend_gen[2047:1792]		<= dividend_gen[1791:1536] - divisor_gen[1791:1536];
	end else begin
		quotient_gen[1791:1536]		<= quotient_gen[1535:1280];
		dividend_gen[2047:1792]		<= dividend_gen[1791:1536];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[8]		<= 0;
		start_gen[8]			<= 0;
		negative_quotient_gen[8]	<= 0;
		divisor_gen[2303:2048]		<= 0;
		quotient_gen[2047:1792]		<= 0;
		dividend_gen[3583:2048]		<= 0;
	end else begin
		div_by_zero_gen[8]		<=div_by_zero_gen[7];
		start_gen[8]			<=strat_gen[7];
		negative_quotient_gen[8]	<=negative_quotient_gen[7];
		divisor_gen[2303:2048]		<=divisor_gen[2047:1792] >> 1;
		if (dividend_gen[1792:1792]		<=divisor_gen[1792:1792] begin
		quotient_gen[2047:1792]		<=quotient_gen[1791:1536] | (1 << 1)
		dividend_gen[2303:2048]		<= dividend_gen[2047:1792] - divisor_gen[2047:1792];
	end else begin
		quotient_gen[2047:1792]		<= quotient_gen[1791:1536];
		dividend_gen[2303:2048]		<= dividend_gen[2047:1792];
		end 
	end 
end 



always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[9]	<= 0;
	negative_quotient_gen[9]	<= 0;
	quotient_gen[2303:2048] <= 0; end else begin
	div_by_zero_gen[9]	<= div_by_zero_gen[8];
	start_gen[9]	<= start_gen[8];
	negative_quotient_gen[9]	<= negative_quotient_gen[8];
	if ( dividend_gen[255:0]	<= divisor_gen[255:0]) begin
	quotient_gen[255:0] 	<= 1 << 8;
	if ( dividend_gen[2303:2048] 	<= divisor_gen[2303:2048] )
	quotient_gen[2303:2048] 		<= quotient_gen[2047:1792] | 1;
	else
	quotient_gen[2303:2048] 		<= quotient_gen[2047:1792];
		end
	end



 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[9]<= 0;
      start_gen[9]<= 0;
      negative_quotient_gen[9]<= 0;
      quotient_gen[2558:2558]<= 0;
    end else begin
      div_by_zero_gen[9]<= div_by_zero_gen[8];
      start_gen[9]<= start_gen[8];
      negative_quotient_gen[9]<= negative_quotient_gen[8];

      if ( dividend_gen[2558:2558] <= divisor_gen[2558:2558] )
        quotient_gen[2558:2558] <= quotient_gen[2557:2557] | 1;
      else
        quotient_gen[2558:2558] <= quotient_gen[2557:2557];

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
      quotient          <= (negative_quotient_gen[9]) ? ~quotient_gen[2558:2559]: quotient_gen[2558:2558];
    end
  end

//=======================================================================================================================================================

endmodule
