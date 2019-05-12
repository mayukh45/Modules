
module AH_DivPipelined_50_16 (start
,dividend
,divisor
,data_valid
,div_by_zero);

input start;
input [49:0] dividend;
input [49:0] divisor;
output data_valid;
output div_by_zero;
 
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [15:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [1598:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [49:0]             	pad_dividend;
  wire [48:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[99:0] <= 0;
        divisor_gen[99:0] 	<= 0; 
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[49] ^ divisor[49];
        dividend_gen[99:0] 	<= (dividend[49]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[99:0]  	<= (divisor [49]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[199:100]  	<= 0;
      quotient_gen[99:0]        	<= 0;
      dividend_gen[199:100] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[199:100] 	  <= divisor_gen[99:0] >> 1;

      if ( dividend_gen[99:0] 	  <= divisor_gen[99:0]) begin
        quotient_gen[99:0] 	<= 1  << STAGES - 2;
        dividend_gen[199:100] <= dividend_gen[99:0] - divisor_gen[99:0];
      end else begin
        quotient_gen[99:0] 	      <= 0;
        dividend_gen[199:100] <= dividend_gen[99:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)
  

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[2]		<= 0;
		start_gen[2]			<= 0;
		negative_quotient_gen[2]	<= 0;
		divisor_gen[299:200]		<= 0;
		quotient_gen[199:100]		<= 0;
		dividend_gen[199:200]		<= 0;
	end else begin
		div_by_zero_gen[2]		<=div_by_zero_gen[1];
		start_gen[2]			<=strat_gen[1];
		negative_quotient_gen[2]	<=negative_quotient_gen[1];
		divisor_gen[299:200]		<=divisor_gen[199:100] >> 1;
		if (dividend_gen[100:100]		<=divisor_gen[100:100] begin
		quotient_gen[199:100]		<=quotient_gen[99:0] | (1 << 13)
		dividend_gen[299:200]		<= dividend_gen[199:100] - divisor_gen[199:100];
	end else begin
		quotient_gen[199:100]		<= quotient_gen[99:0];
		dividend_gen[299:200]		<= dividend_gen[199:100];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[3]		<= 0;
		start_gen[3]			<= 0;
		negative_quotient_gen[3]	<= 0;
		divisor_gen[399:300]		<= 0;
		quotient_gen[299:200]		<= 0;
		dividend_gen[399:300]		<= 0;
	end else begin
		div_by_zero_gen[3]		<=div_by_zero_gen[2];
		start_gen[3]			<=strat_gen[2];
		negative_quotient_gen[3]	<=negative_quotient_gen[2];
		divisor_gen[399:300]		<=divisor_gen[299:200] >> 1;
		if (dividend_gen[200:200]		<=divisor_gen[200:200] begin
		quotient_gen[299:200]		<=quotient_gen[199:100] | (1 << 12)
		dividend_gen[399:300]		<= dividend_gen[299:200] - divisor_gen[299:200];
	end else begin
		quotient_gen[299:200]		<= quotient_gen[199:100];
		dividend_gen[399:300]		<= dividend_gen[299:200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[4]		<= 0;
		start_gen[4]			<= 0;
		negative_quotient_gen[4]	<= 0;
		divisor_gen[499:400]		<= 0;
		quotient_gen[399:300]		<= 0;
		dividend_gen[599:400]		<= 0;
	end else begin
		div_by_zero_gen[4]		<=div_by_zero_gen[3];
		start_gen[4]			<=strat_gen[3];
		negative_quotient_gen[4]	<=negative_quotient_gen[3];
		divisor_gen[499:400]		<=divisor_gen[399:300] >> 1;
		if (dividend_gen[300:300]		<=divisor_gen[300:300] begin
		quotient_gen[399:300]		<=quotient_gen[299:200] | (1 << 11)
		dividend_gen[499:400]		<= dividend_gen[399:300] - divisor_gen[399:300];
	end else begin
		quotient_gen[399:300]		<= quotient_gen[299:200];
		dividend_gen[499:400]		<= dividend_gen[399:300];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[5]		<= 0;
		start_gen[5]			<= 0;
		negative_quotient_gen[5]	<= 0;
		divisor_gen[599:500]		<= 0;
		quotient_gen[499:400]		<= 0;
		dividend_gen[799:500]		<= 0;
	end else begin
		div_by_zero_gen[5]		<=div_by_zero_gen[4];
		start_gen[5]			<=strat_gen[4];
		negative_quotient_gen[5]	<=negative_quotient_gen[4];
		divisor_gen[599:500]		<=divisor_gen[499:400] >> 1;
		if (dividend_gen[400:400]		<=divisor_gen[400:400] begin
		quotient_gen[499:400]		<=quotient_gen[399:300] | (1 << 10)
		dividend_gen[599:500]		<= dividend_gen[499:400] - divisor_gen[499:400];
	end else begin
		quotient_gen[499:400]		<= quotient_gen[399:300];
		dividend_gen[599:500]		<= dividend_gen[499:400];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[6]		<= 0;
		start_gen[6]			<= 0;
		negative_quotient_gen[6]	<= 0;
		divisor_gen[699:600]		<= 0;
		quotient_gen[599:500]		<= 0;
		dividend_gen[999:600]		<= 0;
	end else begin
		div_by_zero_gen[6]		<=div_by_zero_gen[5];
		start_gen[6]			<=strat_gen[5];
		negative_quotient_gen[6]	<=negative_quotient_gen[5];
		divisor_gen[699:600]		<=divisor_gen[599:500] >> 1;
		if (dividend_gen[500:500]		<=divisor_gen[500:500] begin
		quotient_gen[599:500]		<=quotient_gen[499:400] | (1 << 9)
		dividend_gen[699:600]		<= dividend_gen[599:500] - divisor_gen[599:500];
	end else begin
		quotient_gen[599:500]		<= quotient_gen[499:400];
		dividend_gen[699:600]		<= dividend_gen[599:500];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[7]		<= 0;
		start_gen[7]			<= 0;
		negative_quotient_gen[7]	<= 0;
		divisor_gen[799:700]		<= 0;
		quotient_gen[699:600]		<= 0;
		dividend_gen[1199:700]		<= 0;
	end else begin
		div_by_zero_gen[7]		<=div_by_zero_gen[6];
		start_gen[7]			<=strat_gen[6];
		negative_quotient_gen[7]	<=negative_quotient_gen[6];
		divisor_gen[799:700]		<=divisor_gen[699:600] >> 1;
		if (dividend_gen[600:600]		<=divisor_gen[600:600] begin
		quotient_gen[699:600]		<=quotient_gen[599:500] | (1 << 8)
		dividend_gen[799:700]		<= dividend_gen[699:600] - divisor_gen[699:600];
	end else begin
		quotient_gen[699:600]		<= quotient_gen[599:500];
		dividend_gen[799:700]		<= dividend_gen[699:600];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[8]		<= 0;
		start_gen[8]			<= 0;
		negative_quotient_gen[8]	<= 0;
		divisor_gen[899:800]		<= 0;
		quotient_gen[799:700]		<= 0;
		dividend_gen[1399:800]		<= 0;
	end else begin
		div_by_zero_gen[8]		<=div_by_zero_gen[7];
		start_gen[8]			<=strat_gen[7];
		negative_quotient_gen[8]	<=negative_quotient_gen[7];
		divisor_gen[899:800]		<=divisor_gen[799:700] >> 1;
		if (dividend_gen[700:700]		<=divisor_gen[700:700] begin
		quotient_gen[799:700]		<=quotient_gen[699:600] | (1 << 7)
		dividend_gen[899:800]		<= dividend_gen[799:700] - divisor_gen[799:700];
	end else begin
		quotient_gen[799:700]		<= quotient_gen[699:600];
		dividend_gen[899:800]		<= dividend_gen[799:700];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[9]		<= 0;
		start_gen[9]			<= 0;
		negative_quotient_gen[9]	<= 0;
		divisor_gen[999:900]		<= 0;
		quotient_gen[899:800]		<= 0;
		dividend_gen[1599:900]		<= 0;
	end else begin
		div_by_zero_gen[9]		<=div_by_zero_gen[8];
		start_gen[9]			<=strat_gen[8];
		negative_quotient_gen[9]	<=negative_quotient_gen[8];
		divisor_gen[999:900]		<=divisor_gen[899:800] >> 1;
		if (dividend_gen[800:800]		<=divisor_gen[800:800] begin
		quotient_gen[899:800]		<=quotient_gen[799:700] | (1 << 6)
		dividend_gen[999:900]		<= dividend_gen[899:800] - divisor_gen[899:800];
	end else begin
		quotient_gen[899:800]		<= quotient_gen[799:700];
		dividend_gen[999:900]		<= dividend_gen[899:800];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[10]		<= 0;
		start_gen[10]			<= 0;
		negative_quotient_gen[10]	<= 0;
		divisor_gen[1099:1000]		<= 0;
		quotient_gen[999:900]		<= 0;
		dividend_gen[1799:1000]		<= 0;
	end else begin
		div_by_zero_gen[10]		<=div_by_zero_gen[9];
		start_gen[10]			<=strat_gen[9];
		negative_quotient_gen[10]	<=negative_quotient_gen[9];
		divisor_gen[1099:1000]		<=divisor_gen[999:900] >> 1;
		if (dividend_gen[900:900]		<=divisor_gen[900:900] begin
		quotient_gen[999:900]		<=quotient_gen[899:800] | (1 << 5)
		dividend_gen[1099:1000]		<= dividend_gen[999:900] - divisor_gen[999:900];
	end else begin
		quotient_gen[999:900]		<= quotient_gen[899:800];
		dividend_gen[1099:1000]		<= dividend_gen[999:900];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[11]		<= 0;
		start_gen[11]			<= 0;
		negative_quotient_gen[11]	<= 0;
		divisor_gen[1199:1100]		<= 0;
		quotient_gen[1099:1000]		<= 0;
		dividend_gen[1999:1100]		<= 0;
	end else begin
		div_by_zero_gen[11]		<=div_by_zero_gen[10];
		start_gen[11]			<=strat_gen[10];
		negative_quotient_gen[11]	<=negative_quotient_gen[10];
		divisor_gen[1199:1100]		<=divisor_gen[1099:1000] >> 1;
		if (dividend_gen[1000:1000]		<=divisor_gen[1000:1000] begin
		quotient_gen[1099:1000]		<=quotient_gen[999:900] | (1 << 4)
		dividend_gen[1199:1100]		<= dividend_gen[1099:1000] - divisor_gen[1099:1000];
	end else begin
		quotient_gen[1099:1000]		<= quotient_gen[999:900];
		dividend_gen[1199:1100]		<= dividend_gen[1099:1000];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[12]		<= 0;
		start_gen[12]			<= 0;
		negative_quotient_gen[12]	<= 0;
		divisor_gen[1299:1200]		<= 0;
		quotient_gen[1199:1100]		<= 0;
		dividend_gen[2199:1200]		<= 0;
	end else begin
		div_by_zero_gen[12]		<=div_by_zero_gen[11];
		start_gen[12]			<=strat_gen[11];
		negative_quotient_gen[12]	<=negative_quotient_gen[11];
		divisor_gen[1299:1200]		<=divisor_gen[1199:1100] >> 1;
		if (dividend_gen[1100:1100]		<=divisor_gen[1100:1100] begin
		quotient_gen[1199:1100]		<=quotient_gen[1099:1000] | (1 << 3)
		dividend_gen[1299:1200]		<= dividend_gen[1199:1100] - divisor_gen[1199:1100];
	end else begin
		quotient_gen[1199:1100]		<= quotient_gen[1099:1000];
		dividend_gen[1299:1200]		<= dividend_gen[1199:1100];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[13]		<= 0;
		start_gen[13]			<= 0;
		negative_quotient_gen[13]	<= 0;
		divisor_gen[1399:1300]		<= 0;
		quotient_gen[1299:1200]		<= 0;
		dividend_gen[2399:1300]		<= 0;
	end else begin
		div_by_zero_gen[13]		<=div_by_zero_gen[12];
		start_gen[13]			<=strat_gen[12];
		negative_quotient_gen[13]	<=negative_quotient_gen[12];
		divisor_gen[1399:1300]		<=divisor_gen[1299:1200] >> 1;
		if (dividend_gen[1200:1200]		<=divisor_gen[1200:1200] begin
		quotient_gen[1299:1200]		<=quotient_gen[1199:1100] | (1 << 2)
		dividend_gen[1399:1300]		<= dividend_gen[1299:1200] - divisor_gen[1299:1200];
	end else begin
		quotient_gen[1299:1200]		<= quotient_gen[1199:1100];
		dividend_gen[1399:1300]		<= dividend_gen[1299:1200];
		end 
	end 
end 

always @ (posedge clk or negedge rst_n) begin
	if (!rst_n) begin
		div_by_zero_gen[14]		<= 0;
		start_gen[14]			<= 0;
		negative_quotient_gen[14]	<= 0;
		divisor_gen[1499:1400]		<= 0;
		quotient_gen[1399:1300]		<= 0;
		dividend_gen[2599:1400]		<= 0;
	end else begin
		div_by_zero_gen[14]		<=div_by_zero_gen[13];
		start_gen[14]			<=strat_gen[13];
		negative_quotient_gen[14]	<=negative_quotient_gen[13];
		divisor_gen[1499:1400]		<=divisor_gen[1399:1300] >> 1;
		if (dividend_gen[1300:1300]		<=divisor_gen[1300:1300] begin
		quotient_gen[1399:1300]		<=quotient_gen[1299:1200] | (1 << 1)
		dividend_gen[1499:1400]		<= dividend_gen[1399:1300] - divisor_gen[1399:1300];
	end else begin
		quotient_gen[1399:1300]		<= quotient_gen[1299:1200];
		dividend_gen[1499:1400]		<= dividend_gen[1399:1300];
		end 
	end 
end 


 
always @ (posedge clk or negedge rst_n) begin
	div_by_zero_gen[15]	<= 0;
	negative_quotient_gen[15]	<= 0;
	quotient_gen[1499:1400] <= 0; end else begin
	div_by_zero_gen[15]	<= div_by_zero_gen[14];
	start_gen[15]	<= start_gen[14];
	negative_quotient_gen[15]	<= negative_quotient_gen[14];
	if ( dividend_gen[99:0]	<= divisor_gen[99:0]) begin
	quotient_gen[99:0] 	<= 1 << 14;
	if ( dividend_gen[1499:1400] 	<= divisor_gen[1499:1400] )
	quotient_gen[1499:1400] 		<= quotient_gen[1399:1300] | 1;
	else
	quotient_gen[1499:1400] 		<= quotient_gen[1399:1300];
		end
	end

 
 
 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[15]<= 0;
      start_gen[15]<= 0;
      negative_quotient_gen[15]<= 0;
      quotient_gen[1598:1598]<= 0;
    end else begin
      div_by_zero_gen[15]<= div_by_zero_gen[14];
      start_gen[15]<= start_gen[14];
      negative_quotient_gen[15]<= negative_quotient_gen[14];

      if ( dividend_gen[1598:1598] <= divisor_gen[1598:1598] )
        quotient_gen[1598:1598] <= quotient_gen[1597:1597] | 1;
      else
        quotient_gen[1598:1598] <= quotient_gen[1597:1597];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[15];
      data_valid        <= start_gen[15];
      quotient          <= (negative_quotient_gen[15]) ? ~quotient_gen[1598:1599]: quotient_gen[1598:1598];
    end
  end

//=======================================================================================================================================================

endmodule
