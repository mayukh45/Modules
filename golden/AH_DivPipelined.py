#==================================================================================================
# This is a pipelined divisor Module. It can have number of pipes which are mentioned by stages
# variable. Also the bit width of divisor is available.
# TODO: A final touch is pending on this block to transform the code into multiple inheritence
# dictionary at class level.
# TODO: The body of the code where main verilog and intermittant Python is written can be
# further moved to bottom side. We need to think through this more.
#==================================================================================================

import sys
import os
from smartasic import BasicModule,Port
from DynamicGenerator import DynamicGenerator
from BusParser import BusParser
from pathlib import Path

class DivPipelined(BasicModule, BusParser):
    def add_ports_from_bus(self, filepath, bus_name):
       # parser = BusParser(filepath, bus_name)
        self.widop_flat('dividend',self.bits)
        self.widop_flat('divisor',self.bits)
        self.get_all_key_value_pairs(self.dict)

    def Create_dic_of_variable(self):
        self.variable_dict['bits']=self.bits
        self.variable_dict['stages']=self.stages


    def get_body(self):
        dynamicgenerator=DynamicGenerator(self.variable_dict,self.DivPipelinedBody)
        self.body+=dynamicgenerator.parse_body()
        self.body=self.body.replace("BITS*2*(STAGES-1)-1",str(self.bits*2*self.stages-1-1))
        self.body=self.body.replace("BITS*2*(STAGES-2)-2",str(self.bits*2*self.stages-2-2))
        self.body=self.body.replace("BITS*2*(STAGES-2)+1",str(self.bits*2*self.stages-2+1))
        self.body=self.body.replace("BITS*2*(STAGES-2)-1",str(self.bits*2*self.stages-2-1))
        self.body=self.body.replace("BITS*2*(STAGES-2)",str(self.bits*2*self.stages-2))
        self.body=self.body.replace("BITS*2*(STAGES-3)",str(self.bits*2*self.stages-3))
        self.body=self.body.replace("BITS*2*2-1",str(self.bits*2*2-1))
        self.body=self.body.replace("BITS*2-1",str(self.bits*2-1))
        self.body=self.body.replace("BITS-2",str(self.bits-2))
        self.body=self.body.replace("BITS*2",str(self.bits*2))
        self.body=self.body.replace("STAGES-2",str(self.stages-2))
        self.body=self.body.replace("STAGES-1",str(self.stages-1))
        self.body=self.body.replace("STAGES-3",str(self.stages-3))
        self.body=self.body.replace("BITS-1",str(self.bits-1))
        dynamicgenerator.silentremove()

    def get_verilog(self):
        modulecode=self.get_header()
        self.get_body()
        modulecode=modulecode.replace("BODY",self.body)
        return modulecode

    def main(self):
        self.write_to_file(self.get_verilog())
        return self.get_verilog()

    def __init__(self,bits,stages,path_of_yaml=None,bus_name=None):
        self.bits=bits
        self.stages=stages
        self.body=""
        self.name="AH_"+self.__class__.__name__+"_"+str(bits)+"_"+str(stages)
        BasicModule.__init__(self , self.name)
        self.variable_dict={}
        BusParser.__init__(self,self.load_dict(path_of_yaml),bus_name)
        self.Create_dic_of_variable()
        self.add_ports_from_bus(path_of_yaml,bus_name)
        self.DivPipelinedBody= """
//=======================================================================================================================================================
`timescale 1ns / 1ps

  reg            			            data_valid;
  reg            			            div_by_zero;
  reg [STAGES-1:0]       		start_gen, negative_quotient_gen, div_by_zero_gen;
  reg [BITS*2*(STAGES-1)-1:0] 		dividend_gen, divisor_gen, quotient_gen;
  wire [BITS-1:0]             	pad_dividend;
  wire [BITS-2:0]            		pad_divisor;

  assign pad_dividend   	= 0;
  assign pad_divisor  		= 0;

  always @ (posedge clk or negedge rst_n)
    begin
      if (!rst_n) begin
        div_by_zero_gen[0] 	 <= 0;
        start_gen[0] 	         <= 0;
        negative_quotient_gen[0] <= 0;
        dividend_gen[BITS*2-1:0] <= 0;
        divisor_gen[BITS*2-1:0] 	<= 0;
    end
      else begin
        div_by_zero_gen[0]       	<= (divisor == 0);
        start_gen[0]             	<= start;
        negative_quotient_gen[0] 	<= dividend[BITS-1] ^ divisor[BITS-1];
        dividend_gen[BITS*2-1:0] 	<= (dividend[BITS-1]) ? ~{dividend,pad_dividend} + 1 : {dividend,pad_dividend};
        divisor_gen[BITS*2-1:0]  	<= (divisor [BITS-1]) ? ~{1'b1,divisor, pad_divisor} + 1 : {1'b0,divisor, pad_divisor};
      end
    end

  always @ (posedge clk or negedge rst_n) begin

    if (!rst_n) begin
      div_by_zero_gen[1]              	<= 0;
      start_gen[1]                    	<= 0;
      negative_quotient_gen[1]        	<= 0;
      divisor_gen[BITS*2*2-1:BITS*2]  	<= 0;
      quotient_gen[BITS*2-1:0]        	<= 0;
      dividend_gen[BITS*2*2-1:BITS*2] 	<= 0;

    end else begin

      div_by_zero_gen[1]             	  <= div_by_zero_gen[0];
      start_gen[1]                   	  <= start_gen[0];
      negative_quotient_gen[1]       	  <= negative_quotient_gen[0];
      divisor_gen[BITS*2*2-1:BITS*2] 	  <= divisor_gen[BITS*2-1:0] >> 1;

      if ( dividend_gen[BITS*2-1:0] 	  <= divisor_gen[BITS*2-1:0]) begin
        quotient_gen[BITS*2-1:0] 	<= 1  << STAGES - 2;
        dividend_gen[BITS*2*2-1:BITS*2] <= dividend_gen[BITS*2-1:0] - divisor_gen[BITS*2-1:0];
      end else begin
        quotient_gen[BITS*2-1:0] 	      <= 0;
        dividend_gen[BITS*2*2-1:BITS*2] <= dividend_gen[BITS*2-1:0];
      end

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

/f_f/
code=""
for i in range(1,stages-2):
    code+="\\nalways @ (posedge clk or negedge rst_n) begin"
    code+="\\n\tif (!rst_n) begin"
    code+="\\n\t\tdiv_by_zero_gen["+str(i+1)+"]\t\t<= 0;"
    code+="\\n\t\tstart_gen["+str(i+1)+"]\t\t\t<= 0;"
    code+="\\n\t\tnegative_quotient_gen["+str(i+1)+"]\t<= 0;"
    code+="\\n\t\tdivisor_gen["+str(bits*2*(i+2)-1)+":"+str(bits*2*(i+1))+"]\t\t<= 0;"
    code+="\\n\t\tquotient_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"]\t\t<= 0;"
    code+="\\n\t\tdividend_gen["+str(bits*2*(i*2)-1)+":"+str(bits*2*(i+1))+"]\t\t<= 0;"
    code+="\\n\tend else begin"
    code+="\\n\t\tdiv_by_zero_gen["+str(i+1)+"]\t\t<=div_by_zero_gen["+str(i)+"];"
    code+="\\n\t\tstart_gen["+str(i+1)+"]\t\t\t<=strat_gen["+str(i)+"];"
    code+="\\n\t\tnegative_quotient_gen["+str(i+1)+"]\t<=negative_quotient_gen["+str(i)+"];"
    code+="\\n\t\tdivisor_gen["+str(bits*2*(i+2)-1)+":"+str(bits*2*(i+1))+"]\t\t<=divisor_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"] >> 1;"
    code+="\\n\t\tif (dividend_gen["+str(bits*2*i+1-1)+":"+str(bits*2*i)+"]\t\t<=divisor_gen["+str(bits*2*i+1-1)+":"+str(bits*2*i)+"] begin"
    code+="\\n\t\tquotient_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"]\t\t<=quotient_gen["+str(bits*2*i-1)+":"+str(bits*2*(i-1))+"] | (1 << "+str(stages-2-i)+")"
    code+="\\n\t\tdividend_gen["+str(bits*2*(i+2)-1)+":"+str(bits*2*(i+1))+"]\t\t<= dividend_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"] - divisor_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"];\\n\tend else begin"
    code+="\\n\t\tquotient_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"]\t\t<= quotient_gen["+str(bits*2*i-1)+":"+str(bits*2*(i-1))+"];"
    code+="\\n\t\tdividend_gen["+str(bits*2*(i+2)-1)+":"+str(bits*2*(i+1))+"]\t\t<= dividend_gen["+str(bits*2*(i+1)-1)+":"+str(bits*2*i)+"];\\n\t\tend \\n\tend \\nend \\n"
/f_f/

/f_f/
code=""
code+="always @ (posedge clk or negedge rst_n) begin"
code+="\\n\tdiv_by_zero_gen["+str(stages-1)+"]\t<= 0;"
code+="\\n\tnegative_quotient_gen["+str(stages-1)+"]\t<= 0;"
code+= "\\n\tquotient_gen["+str(bits*2*(stages-1)-1)+":"+str(bits*2*(stages-2))+"] <= 0; end else begin"
code+="\\n\tdiv_by_zero_gen["+str(stages-1)+"]\t<= div_by_zero_gen["+str(stages-2)+"];"
code+="\\n\tstart_gen["+str(stages-1)+"]\t<= start_gen["+str(stages-2)+"];"
code+="\\n\tnegative_quotient_gen["+str(stages-1)+"]\t<= negative_quotient_gen["+str(stages-2)+"];"
code+="\\n\tif ( dividend_gen["+str(bits*2-1)+":0]\t<= divisor_gen["+str(bits*2-1)+":0]) begin"
code+="\\n\tquotient_gen["+str(bits*2-1)+":0] \t<= 1 << "+str(stages - 2)+";"
code+="\\n\tif ( dividend_gen["+str(bits*2*(stages-1)-1)+":"+str(bits*2*(stages-2))+"] \t<= divisor_gen["+ str(bits*2*(stages-1)-1)+":"+str(bits*2*(stages-2))+"] )"
code+="\\n\tquotient_gen["+str(bits*2*(stages-1)-1)+":"+str(bits*2*(stages-2))+"] 	\t<= quotient_gen["+str(bits*2*(stages-2)-1)+":"+str(bits*2*(stages-3))+"] | 1;\\n\telse"
code+="\\n\tquotient_gen["+str(bits*2*(stages-1)-1)+":"+str(bits*2*(stages-2))+"] 	\t<= quotient_gen["+str(bits*2*(stages-2)-1)+":"+str(bits*2*(stages-3))+"];\\n\t\tend\\n\tend"
 /f_f/


 always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero_gen[STAGES-1]<= 0;
      start_gen[STAGES-1]<= 0;
      negative_quotient_gen[STAGES-1]<= 0;
      quotient_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)]<= 0;
    end else begin
      div_by_zero_gen[STAGES-1]<= div_by_zero_gen[STAGES-2];
      start_gen[STAGES-1]<= start_gen[STAGES-2];
      negative_quotient_gen[STAGES-1]<= negative_quotient_gen[STAGES-2];

      if ( dividend_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)] <= divisor_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)] )
        quotient_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)] <= quotient_gen[BITS*2*(STAGES-2)-1:BITS*2*(STAGES-3)] | 1;
      else
        quotient_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)] <= quotient_gen[BITS*2*(STAGES-2)-1:BITS*2*(STAGES-3)];

    end // else: !if(!rst_n)
  end // always @ (posedge clk)

  always @ (posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      div_by_zero       <= 0;
      data_valid        <= 0;
      quotient          <= 0;
    end else begin
      div_by_zero       <= div_by_zero_gen[STAGES-1];
      data_valid        <= start_gen[STAGES-1];
      quotient          <= (negative_quotient_gen[STAGES-1]) ? ~quotient_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)+1]: quotient_gen[BITS*2*(STAGES-1)-1:BITS*2*(STAGES-2)];
    end
  end

//=======================================================================================================================================================
"""

dp=DivPipelined(int(sys.argv[1]), int(sys.argv[2]), sys.argv[3], sys.argv[4])
dp.main()


