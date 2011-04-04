module trans_protocol(TX_Data,
    start, rst, clk,
    ready, S_Data);

   input [54:0] TX_Data;
   input 	start, rst, clk;
   output reg 	ready, S_Data;
      
   parameter sz_START_SEQ = 5'd6,
	       sz_DATA =  6'd55;
      
   parameter START_SEQ = 6'b01_1111;
   parameter START = 3'd0,
		S_SEQ = 3'd1, 
		TRANSMIT = 3'd4,
		DONE = 3'd5,
		WAIT = 3'd6;

   reg 	     next_ready, next_S_Data;
   reg [3:0] state, next_state;
   reg [5:0] next_counter, counter;

   /* State transitions */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 state <= WAIT;
	 S_Data <= 1'b0;
	 ready <= 1'b0;
      end else begin
	 S_Data <= next_S_Data;
	 state <= next_state;
	 counter <= next_counter;
	 ready <= next_ready;
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
	  end else begin
	     next_state = WAIT;
	     next_counter = 6'bx;
	  end

	/* Transmitting start_seq */
	START: begin
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
	     next_counter = 6'bx;
	  end


      /* Return to WAIT */
	DONE: begin
	   next_state = WAIT;
	   next_counter = 6'bx;
	end
	
	default: begin
	   next_state = WAIT;
	   next_counter = 6'bx;
	end
      endcase // case (state)
   end // always @ (state)

   
   /* Output logic */
   always @(state, counter) begin
      case (state)
	 START: begin
	    next_S_Data = START_SEQ[counter-1];
	    next_ready = 1'b0;
	 end

	 TRANSMIT: begin
	    next_S_Data = TX_Data[counter-1];
	    next_ready = 1'b0;
	 end	

	DONE: begin
	   next_S_Data = 1'b0;
	   next_ready = 1'b1;
	end

	WAIT: begin
	   next_S_Data = 1'b0;
	   next_ready = 1'b0;
	end
	
	default: begin
	   next_S_Data = 1'bx;
	   next_ready = 1'bx;
	end
	
      endcase // case state

   end // always @ (state, counter)
   
endmodule
	
     
	 
	 
		     
		    