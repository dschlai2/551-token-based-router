/**
 This module provides an interface for the routercore to the RX unit.
 
 rx_has_data goes to 1 for one clock cycle to indicate a new packet has arrived.
 Whenever rc_ready is high, this module will try to initiate packet transfer
 with the rx unit.
 
 **/

module rx_handshake(RX_Data_Ready, RX_Data_Valid, rc_ready, rx_has_data, clk, rst_n);
   input RX_Data_Valid, rc_ready, clk, rst_n;
   output reg RX_Data_Ready, rx_has_data;

   parameter RST = 2'd0;
   parameter WAIT = 2'd1;
   parameter TRANSFER = 2'd3;
   parameter HOLD = 2'd2;

   reg [1:0] state, next_state;

   /* sequential logic */
   always @(posedge clk, negedge rst_n) begin
      if (~rst_n) begin
	 state <= RST;
      end else begin
	 state <= next_state;
      end
   end

   /* state logic */
   always @(*) begin
      case (state)
	RST: begin
	   if (RX_Data_Valid)  // on reset, wait for RX_Data_Valid to go to 0
	     next_state = RST;
	   else
	     next_state = WAIT;
	end

	WAIT: begin
	   if (RX_Data_Valid & rc_ready) // Keep RX_Data_Ready high while the core is not ready for a packet
	     next_state = HOLD;
	   else
	     next_state = WAIT;
	end

	HOLD: begin
	   next_state = TRANSFER;  // When the core and TX are both ready, raise rx_has_data for one clock cycle
	end

	TRANSFER: begin
	   if (RX_Data_Valid == 1'b1)  // Lower RX_Data_Ready until RX_Data_Valid goes low
	     next_state = TRANSFER;
	   else
	     next_state = WAIT;
	end
      endcase // case (state)
   end // always @ (*)
  
   /* output logic */
   always @(state) begin
      case (state)
	RST: begin
	   rx_has_data = 1'b0;
	   RX_Data_Ready = 1'b0;
	end

	WAIT: begin
	   rx_has_data = 1'b0;
	   RX_Data_Ready = 1'b1;
	end

	HOLD: begin
	   rx_has_data = 1'b1;
	   RX_Data_Ready = 1'b1;
	end

	TRANSFER: begin
	   rx_has_data = 1'b0;
	   RX_Data_Ready = 1'b0;
	end
      endcase // case (state)
   end // always @ (state)
   
endmodule



	    
   