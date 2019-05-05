
module AH_DivPipelined_64_10 (clk
,rstn
,start
,dividend
,divisor
,data_valid
,div_by_zero);

input clk;
input rstn;
input start;
input [63:0] dividend;
input [63:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [9:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [1278:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [63:0]             	pad_dividend;
  wire [62:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[127:0] <= 0;
        divisor_gen[127:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[63] ^ divisor[63];
        dividend_gen[127:0] 	<= (dividend[63]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[127:0]  	<= (divisor [63]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[255:128]  	<= 0;
      quotient_gen[127:0]        	<= 0;
      dividend_gen[255:128] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[255:128] 	  <= divisor_gen[127:0] >> 1;

      if ( dividend_gen[127:0] 	  <= divisor_gen[127:0]) begin
        quotient_gen[127:0] 	<= 1  << STAGES - 2;
        dividend_gen[255:128] <= dividend_gen[127:0] - divisor_gen[127:0];
      end else begin
        quotient_gen[127:0] 	      <= 0;
        dividend_gen[255:128] <= dividend_gen[127:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[383:256]		<= 0;
		quotient_gen[255:128]		<= 0;
		dividend_gen[255:256]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[383:256]		<=divisor_gen[255:128] >> 1;
		if (dividend_gen[128:128]		<=divisor_gen[128:128] begin
		quotient_gen[255:128]		<=quotient_gen[127:0] | (1 << 7)
		dividend_gen[383:256]		<= dividend_gen[255:128] - divisor_gen[255:128];
	end else begin
		quotient_gen[255:128]		<= quotient_gen[127:0];
		dividend_gen[383:256]		<= dividend_gen[255:128];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[511:384]		<= 0;
		quotient_gen[383:256]		<= 0;
		dividend_gen[511:384]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[511:384]		<=divisor_gen[383:256] >> 1;
		if (dividend_gen[256:256]		<=divisor_gen[256:256] begin
		quotient_gen[383:256]		<=quotient_gen[255:128] | (1 << 6)
		dividend_gen[511:384]		<= dividend_gen[383:256] - divisor_gen[383:256];
	end else begin
		quotient_gen[383:256]		<= quotient_gen[255:128];
		dividend_gen[511:384]		<= dividend_gen[383:256];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[639:512]		<= 0;
		quotient_gen[511:384]		<= 0;
		dividend_gen[767:512]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[639:512]		<=divisor_gen[511:384] >> 1;
		if (dividend_gen[384:384]		<=divisor_gen[384:384] begin
		quotient_gen[511:384]		<=quotient_gen[383:256] | (1 << 5)
		dividend_gen[639:512]		<= dividend_gen[511:384] - divisor_gen[511:384];
	end else begin
		quotient_gen[511:384]		<= quotient_gen[383:256];
		dividend_gen[639:512]		<= dividend_gen[511:384];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[767:640]		<= 0;
		quotient_gen[639:512]		<= 0;
		dividend_gen[1023:640]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[767:640]		<=divisor_gen[639:512] >> 1;
		if (dividend_gen[512:512]		<=divisor_gen[512:512] begin
		quotient_gen[639:512]		<=quotient_gen[511:384] | (1 << 4)
		dividend_gen[767:640]		<= dividend_gen[639:512] - divisor_gen[639:512];
	end else begin
		quotient_gen[639:512]		<= quotient_gen[511:384];
		dividend_gen[767:640]		<= dividend_gen[639:512];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[895:768]		<= 0;
		quotient_gen[767:640]		<= 0;
		dividend_gen[1279:768]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[895:768]		<=divisor_gen[767:640] >> 1;
		if (dividend_gen[640:640]		<=divisor_gen[640:640] begin
		quotient_gen[767:640]		<=quotient_gen[639:512] | (1 << 3)
		dividend_gen[895:768]		<= dividend_gen[767:640] - divisor_gen[767:640];
	end else begin
		quotient_gen[767:640]		<= quotient_gen[639:512];
		dividend_gen[895:768]		<= dividend_gen[767:640];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[7]		<= 0;
		start_gen[7]			<= 0;
		negative_quotient_gen[7]	<= 0;
		divisor_gen[1023:896]		<= 0;
		quotient_gen[895:768]		<= 0;
		dividend_gen[1535:896]		<= 0;
	end else begin
		div_by_zero_gen[7]		<=div_by_zero_gen[6];
		start_gen[7]			<=strat_gen[6];
		negative_quotient_gen[7]	<=negative_quotient_gen[6];
		divisor_gen[1023:896]		<=divisor_gen[895:768] >> 1;
		if (dividend_gen[768:768]		<=divisor_gen[768:768] begin
		quotient_gen[895:768]		<=quotient_gen[767:640] | (1 << 2)
		dividend_gen[1023:896]		<= dividend_gen[895:768] - divisor_gen[895:768];
	end else begin
		quotient_gen[895:768]		<= quotient_gen[767:640];
		dividend_gen[1023:896]		<= dividend_gen[895:768];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[8]		<= 0;
		start_gen[8]			<= 0;
		negative_quotient_gen[8]	<= 0;
		divisor_gen[1151:1024]		<= 0;
		quotient_gen[1023:896]		<= 0;
		dividend_gen[1791:1024]		<= 0;
	end else begin
		div_by_zero_gen[8]		<=div_by_zero_gen[7];
		start_gen[8]			<=strat_gen[7];
		negative_quotient_gen[8]	<=negative_quotient_gen[7];
		divisor_gen[1151:1024]		<=divisor_gen[1023:896] >> 1;
		if (dividend_gen[896:896]		<=divisor_gen[896:896] begin
		quotient_gen[1023:896]		<=quotient_gen[895:768] | (1 << 1)
		dividend_gen[1151:1024]		<= dividend_gen[1023:896] - divisor_gen[1023:896];
	end else begin
		quotient_gen[1023:896]		<= quotient_gen[895:768];
		dividend_gen[1151:1024]		<= dividend_gen[1023:896];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[9]	<= 0;
	negative_quotient_gen[9]	<= 0;
	quotient_gen[1151:1024] <= 0; end else begin
	div_by_zero_gen[9]	<= div_by_zero_gen[8];
	start_gen[9]	<= start_gen[8];
	negative_quotient_gen[9]	<= negative_quotient_gen[8];
	if ( dividend_gen[127:0]	<= divisor_gen[127:0]) begin
	quotient_gen[127:0] 	<= 1 << 8;
	if ( dividend_gen[1151:1024] 	<= divisor_gen[1151:1024] )
	quotient_gen[1151:1024] 		<= quotient_gen[1023:896] | 1;
	else
	quotient_gen[1151:1024] 		<= quotient_gen[1023:896];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[9]<= 0;
      start_gen[9]<= 0;
      negative_quotient_gen[9]<= 0;
      quotient_gen[1278:1278]<= 0;
    end else begin
      div_by_zero_gen[9]<= div_by_zero_gen[8];
      start_gen[9]<= start_gen[8];
      negative_quotient_gen[9]<= negative_quotient_gen[8];

      if ( dividend_gen[1278:1278] <= divisor_gen[1278:1278] )
        quotient_gen[1278:1278] <= quotient_gen[1277:1277] | 1;
      else
        quotient_gen[1278:1278] <= quotient_gen[1277:1277];

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
      quotient          <= (negative_quotient_gen[9]) ? ~quotient_gen[1278:1279]: quotient_gen[1278:1278];
    end
  end

//=======================================================================================================================================================

endmodule
