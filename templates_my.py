
# TODO: Move this template strings to Jinja templates.


module_template = """
module MODULENAME (PORTLIST);

PORTDECLARATION
BODY
endmodule
"""

fifo_body_template = """
// *****************************************************************************
// Body of Module 
// *****************************************************************************
reg [ENCODEDDEPTH:0] wr_ptr, rd_ptr;

always @(posedge clk,negedge rstn)
begin
	if(!rstn) wr_ptr <= 0;
	else if(wr_valid & !wr_busy)  wr_ptr <= (rd_valid & !rd_busy)? wr_ptr : wr_ptr+1;
	else if(rd_valid & !rd_busy)  wr_ptr <= wr_ptr -1 ;
end 
assign wr_busy = (wr_ptr == $fifo_depth)
assign rd_valid = (wr_ptr != 0);

reg [ENCODEDDEPTH - 1 :0] addr;
reg [ENCODEDDEPTH - 1 :0] rd_addr;
always @(posedge clk, negedge rstn)
begin 
	if(!rstn) addr <= 0;
	else if(wr_valid & !wr_busy) 
		addr <= addr+1;
end
wire [FIFOWIDTH-1:0] mem_data[FIFODEPTH - 1 :0];
assign mem_data[addr][FIFOWIDTH-1:0] = wr_data[FIFOWIDTH-1:0]

always @(posedge clk, negedge rstn)
begin 
	if(!rstn) rd_addr <=0;
	else if	(rd_valid & !rd_busy) 
	    rd_addr <= rd_addr +1;
end
assign rd_data = mem_data[rd_addr];
// *****************************************************************************
"""
arbiter_body_template = """
//Rotate -> Priority -> Rotate

module round_robin_arbiter_NUMCLIENTS (
	rst_n,
	clk,
	req,
	grant
	//CFG_DECLARATIONS
);


input		rst_n;
input		clk;
input	[NUMCLIENTS - 1:0]	req; 
output	[NUMCLIENTS - 1:0]	grant;

//INPUT_WEIGHT_VECTORS

reg	[ENCODEDNUMCLIENTS - 1:0]	rotate_ptr;  
reg	[NUMCLIENTS - 1:0]	shift_req;
reg	[NUMCLIENTS - 1:0]	shift_grant;
reg	[NUMCLIENTS - 1:0]	grant_comb;
reg	[NUMCLIENTS - 1:0]	grant;

//WEIGHT_REGISTERS

// shift req to round robin the current priority
always @ (*)
begin
	//SHIFT_REQUEST
	endcase
end

// simple priority arbiter
always @ (*)
begin
	//SHIFT_GRANT
end

// generate grant signal
always @ (*)
begin
	//GRANT_SIGNAL
	endcase
end

always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)	grant[NUMCLIENTS - 1:0] <= NUMCLIENTS'b0;
	else		grant[NUMCLIENTS - 1:0] <= grant_comb[NUMCLIENTS - 1:0] & ~grant[NUMCLIENTS - 1:0];
end

// update the rotate pointer
// rotate pointer will move to the one after the current granted
always @ (posedge clk or negedge rst_n)
begin
	if (!rst_n)
		rotate_ptr[ENCODEDNUMCLIENTS - 1:0] <= ENCODEDNUMCLIENTS'b0;
	else 
		case (1'b1) // synthesis parallel_case
			//ROTATION
		endcase
end

"""

weight_update_template = """
always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin 
//WEIGHT_BIT
       end else begin 
//WEIGHT_NEGATION
       end
end

assign refresh_weights = //REFRESH_WEIGHT 

//ASSIGN_WEIGHT
"""

cam_body_template = """
module AH_cam_CAMDEPTH_CAMWIDTH_SNOOPWIDTH ( 
rst_an,
clk,
wr_data,
wr_valid,
wr_ready,

snoop_in,
snoop_valid,
snoop_match,
snoop_data
 
);

// ============================================================================
// Below are the main parameters which are used for CAM functionality.
//
// CAMWIDTH --> width of storage - similar to FIFO storage
// CAMDEPTH --> Number of rows the CAM can fit
// ENCODEDDEPTH --> log2 of the CAM depth, the write/read pointers and snoop
// marker all have this width.
//
// SNOOPWIDTH --> width of snoop-in port. This is always lte CAMWIDTH

// ============================================================================



input rst_an;
input clk;

input [CAMWIDTH - 1:0] wr_data;  //POINT --> CAMWIDTH
output wr_valid;
output wr_ready;

// ============================================================================
//snoop happens at the LSBs. It is expected that for snoop to happen
// in upper bits, write will be swizzled into LSB locations.

input [SNOOPWIDTH - 1:0] snoop_in; // SNOOPWIDTH lte CAMWIDTH
input snoop_valid;

output snoop_match;
output [CAMWIDTH - 1:0] snoop_data; // CAMWIDTH here
 

wire [ENCODEDDEPTH - 1:0] internal_wr_ptr; // asume CAMDEPTH = 64, then wr-ptr-width is log2(CAMDEPTH).
req  [ENCODEDDEPTH:0] wr_loc_counter; // It's log2(CAMDEPTH) +1 from the above

//REQUEST_DECLARATION

// ============================================================================
// CAM working principle --
// 1. Initially all the entries are in pool of free locations.
// 2. These are stored in a FIFO - at reset there's a counter which runs
//    and freely increments to keep feeding these locations to write logic. Once initial
// 32/64/256 locations are used, the FIFO takes over. This helps to start the CAM right
// right at the begining without any issues.
//
// 3. Once a snoop comes and if a snoop match happens, the location is invalidated and
// correspnding location is written back into FIFO to be reused.
// the problem with this scheme is that it immediately a reused location isn't available for
// writing.
//
// If we apply a combo based logic, then that's possible - but then the resulting combo can be
// very difficult to meet timing creating pipelining and having delays anyways.
// In general for smaller CAMs, combo based wr-location search might be a good thing.
// ============================================================================


// ============================================================================
// The counter

always @ (posedge clk or negedge rst_an)
begin
if (!rst_an) begin
  wr_loc_counter <= ENCODEDDEPTH+1'd0; // log2(CAMDEPTH) +1
       end else begin
  wr_loc_counter <= wr_location_counter[ENCODEDDEPTH] ? wr_location_counter : wr_location_counter + 1'b1;
       end
end

// ============================================================================
// Instance the reuse FIFO
// Number 6 below is same as ENCODEDDEPTH or log2(CAMDEPTH). Number 64 below is same as CAMDEPTH.

AH_srvfifo_ENCODEDDEPTH_CAMDEPTH u_wrloc_recirfifo (
.wr_valid(freeup_loc)
,.wr_ready(freedup_loc_valid)
,.wr_data(freedup_loc_ready)

,.rd_valid(recir_loc_valid)
,.rd_ready(recir_loc_ready)
,.rd_data(recir_loc)
);


// ============================================================================
// Take the location from recir_loc or from wr_loc_counter and prepare to write an incoming data
// Use the counter for initial phase only - so the MSB of counter when reached to 1, this method
// of using counter shouldn't be used anymore

// These are for CAM locations
assign internal_wr_en = wr_valid & (recir_loc_valid | ~wr_location_counter[ENCODEDDEPTH]);
assign internal_wr_ptr = ~wr_location_counter[ENCODEDDEPTH + 1] ? ~wr_location_counter[ENCODEDDEPTH - 1:0] : recir_loc;

// Handshake with external wr-port
assign wr_ready	= ~wr_location_counter[ENCODEDDEPTH + 1] ? 1'b1 : recir_loc_valid;

// Handshake with recirculation FIFO pop-port
assign recir_loc_ready	= ~wr_location_counter[ENCODEDDEPTH + 1] ? 1'b0 : wr_valid;

// ============================================================================
// Now actual CAM locations
// NOTE:- only 3 locations are shown - it should continue for 64 locations.

always @ (posedge clk or negedge rst_an)
if (!rst_an) begin

//CAM_LOCATIONS
end else begin
//CAM_WRITE
end


// ============================================================================
// Handle the snoop part here.

wire assign snoop_match = freedup_loc_ready) & (

//SNOOP_CAM 

);

wire assign snoop_data = CAMWIDTH'd0 |
//ASSIGN_SNOOP
;

wire assign freeup_loc = ENCODEDDEPTH'd0 |
//ASSIGN_FREEUP
;

wire assign freedup_loc_valid = snoop_match;


endmodule



"""

mux_body_template = """
module NAME_MUXPORTWIDTH_MUXNUMCLIENTS (
//PORT_DECLARATION


);


//VECTOR_DECLARATION


//ASSIGN_DATA


endmodule

"""

snoopable_fifo_template = """
// 20 - FIFOWIDTH
// 32 - FIFODEPTH
// 10 - SNOOPWIDTH
// FIFONAME carries these 3 string. It can carry
// other stuffs as srv (sync/ready-valid)

module FIFO_FIFOWIDTH_FIFODEPTH_SNOOPWIDTH_snoopable (

clk,
rstn,
wr_valid,
wr_ready,
wr_data,
rd_valid,
rd_ready,
rd_data,
snoop_data,
snoop_valid,
snoop_match
);

input rstn,
intput clk,
input [FIFOWIDTH - 1:0] wr_data; //FIFOWIDTH
input wr_valid;
input wr_ready;

out [FIFOWIDTH - 1:0] rd_data; //FIFOWIDTH
input rd_valid;
input rd_ready;
input [SNOOPWIDTH - 1:0] snoop_data; // SNOOPWIDTH
input snoop_valid;
input snoop_match;



reg [ENCODEDDEPTH:0] wr_pointer; // ENCODEDDEPTH + 1 = log2(32) + 1

reg [ENCODEDDEPTH:0] rd_pointer; // ENCODEDDEPTH + 1 


//REG_DECLARATIONS




always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             wr_pointer <= ENCODEDDEPTH + 1'd0;

       end else begin

     wr_pointer <= ( (wr_pointer[ENCODEDDEPTH] ^ rd_pointer[ENCODEDDEPTH]) && (wr_pointer[ENCODEDDEPTH - 1:0] == rd_pointer[ENCODEDDEPTH - 1:0]) ) ? wr_pointer :

wr_valid ? ( wr_pointer + 1'b1) : wr_pointer;

       end

end



always @ (posedge clk or negedge rstn)

begin

       if(rstn) begin

             rd_pointer <= ENCODEDDEPTH + 1'd0;

       end else begin

     rd_pointer <= (rd_pointer[ENCODEDDEPTH:0] == rd_pointer[ENCODEDDEPTH:0]) ? rd_pointer : rd_ready ? (rd_pointer + 1'b1) : rd_pointer;

       end

end





always @ (posedge clk or negedge rstn)

begin

       if(!rstn) begin

//ASSIGN_LOC

       end else begin

//LOC_WRITE




       end

end

wr_ready = ! ( (wr_pointer[ENCODEDDEPTH] ^ rd_pointer[ENCODEDDEPTH]) && (wr_pointer[ENCODEDDEPTH - 1:0] == rd_pointer[ENCODEDDEPTH - 1:0]) );

rd_valid = !(rd_pointer[ENCODEDDEPTH:0] == rd_pointer[ENCODEDDEPTH:0]);

assign rd_data = FIFOWIDTH'd0 |
//ASSIGN_READ


assing snoop_match = 1'b0 |
//ASSIGN_SNOOP_MATCH


// snoop_match isn't used now - it can be in future.

endmodule
"""

packet_converter_template = """
module AH_NAME (
clk,
rstn,

in_data,
in_valid,
in_ready,

out_data,
out_valid,
out_ready

);


input in_valid;
output in_ready;
output out_valid;
input out_ready;
//DECLARATIONS



//============================================================
// wide to narrow ratio should be an integer.
// TODO:// As an extension of this module, in future we should
// support rational numbers - or M/N.

reg [VECWIDTH - 1:0] packet_lane; // Vec width log2(WIDEWIDTH/NARROWWIDTH)
wire [VECWIDTH - 1:0] npacket_lane;




always(@posedge clk or negedge rstn) begin
if (!rstn) begin
    packet_lane <= VECWIDTH'd0; // log2(WIDEWIDTH/NARROWWIDTH)
//COLLATED
end else begin
    packet_lane <= npacket_lane;
//NCOLLATED
end
end



// 3 is basically (WIDEWIDTH/NARROWWIDTH) -1
//

//ASSIGN_DATA


endmodule
"""

pipe_body_template = """
module_pipe_WIDTH(
wr_data,
wr_valid,
wr_ready,
rd_data,
rd_valid,
rd_ready,
clk,
rstn
);
//di -> wr_data/ vi --> wr_valid / ro ---> wr_ready/
//do --> rd_data/vo --> rd_valid/ ri ---> rd_ready /

input clk;
input rst;
input  wr_valid;
output wr_ready;
input  [WIDEWIDTH - 1:0] wr_data;
output rd_valid;
input  rd_ready;
output [WIDEWIDTH - 1:0] rd_data;        
reg rd_valid
//SKID_REGISTERS

//PIPE

//SKID

// PIPE OUTPUT
assign wr_ready = rd_ready;
assign rd_valid = wr_valid;
assign rd_data = wr_data;

endmodule
"""

ordering_point_template ="""
module AH_ordering_point_NUMCLIENTS (
//MODULE_DEC

);

//I/O_DEC


//WIRE_ASSIGN

"""

lruArbiter_body = """
module lru_arbiter (
        clk,
        rstn,
        req,
        gnt_busy,
        gnt
);


input clk, rstn
input [NUMCLIENTS - 1:0] req;
input [NUMCLIENTS - 1:0] gnt_busy;
output [NUMCLIENTS - 1:0] gnt;


##reg [NUMCLIENTS - 1:0] req0_used_status;
##reg [NUMCLIENTS - 1:0] req1_used_status;
##reg [NUMCLIENTS - 1:0] req2_used_status;
##reg [NUMCLIENTS - 1:0] req3_used_status;
//REG_STATUS




always @(posedge clk, negedge rstn) begin
        if(~rstn) begin
        req0_used_status <= 4'd4;
        req1_used_status <= 4'd3;
        req2_used_status <= 4'd2;
        req3_used_status <= 4'd1;
        end
	//STATUS_USED
        else begin
                if(gnt[0]& !gnt_busy) begin
                        ##req0_used_status <= 4'b1;
                        ##req1_used_status <= req1_used_status<req0_used_status ? req1_used_status + 1'b1 : req1_used_status;
                        ##req2_used_status <= req2_used_status<req0_used_status ? req2_used_status + 1'b1 : req2_used_status ;
                        ##req3_used_status <= req3_used_status<req0_used_status ? req3_used_status + 1'b1 : req3_used_status ;
                end
                if(gnt[1] & !gnt_busy) begin
                       ## req1_used_status <= 4'b1;
                       ## req0_used_status <= req0_used_status<req1_used_status ? req0_used_status + 1'b1 : req0_used_status;
                        ##req2_used_status <= req2_used_status<req1_used_status ? req2_used_status + 1'b1 : req2_used_status ;
                        ##req3_used_status <= req3_used_status<req1_used_status ? req3_used_status + 1'b1 : req3_used_status ;
                end
                if(gnt[2]& !gnt_busy) begin
                        ##req2_used_status <= 4'b1;
                       # # req0_used_status <= req0_used_status<req0_used_status ? req0_used_status + 1'b1 : req0_used_status;
                        ##req1_used_status <= req1_used_status<req0_used_status ? req1_used_status + 1'b1 : req1_used_status ;
                        ##req3_used_status <= req3_used_status<req0_used_status ? req3_used_status + 1'b1 : req3_used_status ;
                end
                if(gnt[3] & !gnt_busy) begin
                        ##req3_used_status <= 4'b1;
                        ##req0_used_status <= req0_used_status<req0_used_status ? req0_used_status + 1'b1 : req0_used_status;
                        ##req1_used_status <= req1_used_status<req1_used_status ? req1_used_status + 1'b1 : req1_used_status ;
                        ##req2_used_status <= req2_used_status<req2_used_status ? req2_used_status + 1'b1 : req2_used_status ;
                end

        end
	//GNT_STATUS
end

always @(req, gnt_busy) begin
        gnt_pre[3:0] = 4'd0;
        req_int [3:0]= req[3:0] & {4{gnt_busy}};
        if(req[0]) begin
                gnt_pre[0] = (req0_used_status==4) ? 1'b1 :
                             ((req1 & (req1_used_status > req0_used_status)) ? 1'b0 :
                             ((req2 & (req2_used_status > req0_used_status)) ? 1'b0 :
                             ((req3 & (req3_used_status > req0_used_status)) ? 1'b0 :
                             1'b1;
                 end
        if(req[1]) begin
                gnt_pre[1] = (req1_used_status==4) ? 1'b1 :
                             ((req0 & (req0_used_status > req1_used_status)) ? 1'b0 :
                             ((req2 & (req2_used_status > req1_used_status)) ? 1'b0 :
                             ((req3 & (req3_used_status > req1_used_status)) ? 1'b0 :
                             1'b1;
                 end

        if(req[2]) begin
                gnt_pre[2] = (req2_used_status==4) ? 1'b1 :
                             ((req1 & (req1_used_status > req2_used_status)) ? 1'b0 :
                             ((req0 & (req0_used_status > req2_used_status)) ? 1'b0 :
                             ((req3 & (req3_used_status > req2_used_status)) ? 1'b0 :
                             1'b1;
                 end
        if(req[3]) begin
                gnt_pre[3] = (req3_used_status==4) ? 1'b1 :
                             ((req0 & (req0_used_status > req3_used_status)) ? 1'b0 :
                             ((req2 & (req2_used_status > req3_used_status)) ? 1'b0 :
                             ((req1 & (req1_used_status > req3_used_status)) ? 1'b0 :
                             1'b1;
                 end
end
	//GNT_REQUEST

assign gnt[NUMCLIENTS - 1:0] = gnt_pre[NUMCLIENTS - 1:0];

<<<<<<< HEAD
"""
=======
endmodule
"""
>>>>>>> 4006e27d0108573ad2367bef47ea28d7408e5b8e
