astob:								astob:
  hier0:							  hier0:
    wr:								    wr:
      hier00:							      hier00:
        hier000:						        hier000:
          wready:						          wready:
            direction: output					            direction: output
            type: nonfluid					            type: nonfluid
            width: 1						            width: 1
        wvalid:							        wvalid:
          direction: input				      |	          direction: output
          type: nonfluid					          type: nonfluid
          width: 1						          width: 1
      wdata:							      wdata:
        direction: input					        direction: input
        type: fluid						        type: fluid
        width: 18					      |	        width: 10
  hier1:						      |	  rd:
    rd:							      |	    hier10:
      hier10:						      |	      rdata:
        rdata:						      <
          direction: output				      <
          type: fluid					      <
          width: 18					      <
      hier11:						      <
        rready:						      <
          direction: input				      <
          type: nonfluid				      <
          width: 1					      <
      rvalid:						      <
        direction: output					        direction: output
							      >	        type: fluid
							      >	        width: 10
							      >	    hier11:
							      >	      rready:
							      >	        direction: input
        type: nonfluid						        type: nonfluid
        width: 1						        width: 1
							      >	    rvalid:
							      >	      direction: output
							      >	      type: nonfluid
							      >	      width: 1
  snoop:							  snoop:
							      >	    hello: world
    sdata:							    sdata:
      direction: input						      direction: input
							      >	      prefix: usb2usb
							      >	      prefloat: usb2cpu
      type: fluid						      type: fluid
      width: 18							      width: 18
    smatch:							    smatch:
      direction: input						      direction: input
      type: nonfluid						      type: nonfluid
      width: 1							      width: 1
    svalid:							    svalid:
      direction: input						      direction: input
      type: nonfluid						      type: nonfluid
      width: 1							      width: 1
