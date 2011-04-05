module trans_protocol(TX_Data,
    start, rst, clk,
    ready, S_Data);

   input [54:0] TX_Data;
   input 	start, rst, clk;
   output reg 	ready, S_Data;
      
   parameter [4:0] sz_START_SEQ = 5'd6;
   parameter [5:0] sz_DATA =  6'd55;
      
   parameter [5:0] START_SEQ = 6'b01_1111;
   parameter [2:0] START = 3'd0;
   parameter [2:0] S_SEQ = 3'd1;
   parameter [2:0] TRANSMIT = 3'd4;
   parameter [2:0] DONE = 3'd5;
   parameter [2:0] WAIT = 3'd6;

   reg 	     next_ready, next_S_Data;
   reg [3:0] state, next_state;
   reg [5:0] next_counter, counter;
   wire [5:0] counter_1;

   assign counter_1 = counter -1;

   /* State transitions */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 state <= WAIT;
	 S_Data <= 1'b0;
	 ready <= 1'b0;
	 counter <= 6'b1;
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
	     next_counter = 6'b1;
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
	     next_counter = 6'b1;
	  end


      /* Return to WAIT */
	DONE: begin
	   next_state = WAIT;
	   next_counter = 6'b1;
	end
	
	default: begin
	   next_state = WAIT;
	   next_counter = 6'b1;
	end
      endcase // case (state)
   end // always @ (state)

   
   /* Output logic */
   always @(state, counter) begin
      case (state)
	 START: begin
	    if (counter > 0) begin
	      next_S_Data = START_SEQ[counter_1];
	    end else
	      next_S_Data = 1'b1;
	    next_ready = 1'b0;
	 end

	 TRANSMIT: begin
	    if (counter > 0) begin
	      next_S_Data = TX_Data[counter_1];
	    end else
	      next_S_Data = 1'b1;
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
	   next_S_Data = 1'b1;
	   next_ready = 1'b0;
	end
	
      endcase // case state

   end // always @ (state, counter)
   
endmodule
	
     
	 
	 
		     
		    