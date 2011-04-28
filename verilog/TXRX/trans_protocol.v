module trans_protocol(TX_Data,
		      start, rst, clk, ready, S_Data);
   input [54:0] TX_Data;
   input       start, rst, clk;
   output reg  ready, S_Data;

   /* Packet Size */
   parameter sz_Packet = 6'd61;  

   /* States */
   parameter WAIT = 3'd0;
   parameter TRANSMIT = 3'd1;

   /* Assembled Packet */
   wire [60:0] packet = {6'b01_1111, TX_Data}; 

   /* Count of how many bits remain to transmit */
   reg [5:0]   counter, next_counter;

   /* State logic */
   reg [1:0]   state, next_state;

   /* Output */
   reg 	       next_S_Data, next_ready;

   
   /* State transitions */
   always @(posedge clk, posedge rst) begin
      if (rst) begin
	 state <= WAIT;
	 S_Data <= 1'b1;
	 ready <= 1'b0;
	 counter <= 6'bx;
      end else begin
	 S_Data <= next_S_Data;
	 state <= next_state;
	 counter <= next_counter;
	 ready <= next_ready;
      end // else: !if(rst)
   end // always @ (posedge clk, posedge rst)

   /* State logic */
   always @(*) begin
      case (state)
	/* Start signal given */
	WAIT:
	  if (start) begin
	     next_state = TRANSMIT;
	     next_counter = sz_Packet;
	  end else begin
	     next_state = WAIT;
	     next_counter = 6'bx;
	  end
	
	/* Transmitting */
	TRANSMIT:
	  if (counter > 0) begin
	     next_state = TRANSMIT;
	     next_counter = counter - 1;
	  end else begin
	     next_state = WAIT;
	     next_counter = 6'bx;
	  end
      endcase // case (state)
   end // always @ (*)


   /* Output logic */
   always @(*) begin
      case (state)
	WAIT: begin
	   if (start)
	     next_S_Data = 1'b1;
	   else
	     next_S_Data = 1'b1;
	   next_ready = 1'b0;
	end

	TRANSMIT: begin
	   if (counter > 0) begin
	      next_S_Data = packet[counter-1];
	      next_ready = 1'b0;
	   end else begin
	      next_S_Data = 1'b1;
	      next_ready = 1'b1;
	   end
	end
      endcase // case (state)
   end // always @ (*)
   
endmodule // trans_protocol
