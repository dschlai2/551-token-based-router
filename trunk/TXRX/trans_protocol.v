/* This module handles the transmission protocol for the
 TX unit.  Transmission begins on start signal.  */
 
module trans_protocol(input [54:0] TX_Data,
    input start, rst, clk,
    output reg ready, S_Data);
   
   parameter sz_START_SEQ = 5'd6,
	       sz_DATA =  6'd55;
      
   parameter START_SEQ = 6'b01_1111;
   parameter START = 3'd0,
		S_SEQ = 3'd1, 
		TRANSMIT = 3'd4,
		DONE = 3'd5,
		WAIT = 3'd6;
   
   reg [3:0] state, next_state;
   reg [5:0] next_counter, counter;

   /* State transitions */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 state <= WAIT;
	 S_Data <= 1'b0;
	 ready <= 1'b0;
      end else begin
	 state <= next_state;
	 counter <= next_counter;
      end
   end
      
   /* State logic */
   always @(state, start, counter) begin
      case (state)
	/* Start signal given */
	WAIT:
	  if (start) begin
	     next_state = START;
	     next_counter = sz_START_SEQ;
	  end else
	    next_state = WAIT;

	/* Transmitting start_seq */
	START: begin
	   ready = 1'b0;
	   if (counter > 1) begin
	      next_state = START;
	      next_counter = counter - 1;
	   end
	   
	   /* Begin transmitting data */
	   else begin
	      next_state = TRANSMIT;
	      next_counter = sz_DATA;
	   end
	end // case: START
	
	/* Transmitting data */
	TRANSMIT:
	  if (counter > 1) begin
	     next_state = TRANSMIT;
	     next_counter = counter - 1;
	  end else begin
	     next_state = DONE;
	  end


      /* Return to WAIT */
	DONE:
	  next_state = WAIT;
	default:
	  next_state = WAIT;
      endcase // case (state)
   end // always @ (state)

   
   /* Output logic */
   always @(state, counter) begin
      case (state)
	 START: begin
	    S_Data = START_SEQ[counter-1];
	    ready = 1'b0;
	 end

	 TRANSMIT: begin
	    S_Data = TX_Data[counter-1];
	    ready = 1'b0;
	 end	

	DONE: begin
	   S_Data = 1'b0;
	   ready = 1'b1;
	end
	
	default: begin
	   S_Data = 1'bx;
	   ready = 1'bx;
	end
	
      endcase // case state

   end // always @ (state, counter)
   
endmodule
	
     
	 
	 
		     
		    