/**
 This module provides an interface for the routercore to the TX unit.
 
 TX_Ready will be high any time the TX unit can send data, and zero otherwise (during transmission).
 
 The routercore should only put new data on the line when TX_Ready is high, and
    should hold data while TX_Ready is low.
 
 **/

module tx_handshake(tx_ready, rc_has_data, TX_Data_Valid, TX_Data_Ready, clk, rst_n);
   input rc_has_data, TX_Data_Ready, clk, rst_n;
   output reg tx_ready, TX_Data_Valid;

   parameter RST = 2'd0;
   parameter WAIT = 2'd1;
   parameter TRANSFER = 2'd2;
   parameter ERR = 2'd3;

   reg [1:0] state, next_state;

   /* sequential logic */
   always @(posedge clk, negedge rst_n) begin
      if (~rst_n)
	state <= RST;
      else
	state <= next_state;
   end

   /* output logic */
   always @(state) begin
      case (state)
	RST: begin
	   tx_ready = 1'b0;
	   TX_Data_Valid = 1'b0;
	end

	WAIT: begin
	   tx_ready = 1'b1;
	   TX_Data_Valid = 1'b0;
	end

	TRANSFER: begin
	   tx_ready = 1'b0;
	   TX_Data_Valid = 1'b1;
	end

	default: begin
	   tx_ready = 1'bx;
	   TX_Data_Valid = 1'bx;
	end
      endcase // case (state)
   end // always @ (state)

   /* state logic */
   always @(*) begin
      case (state)
	RST: begin
	   if (TX_Data_Ready)  // wait for TX_Data_Ready to go high before raising ready sig
	     next_state = WAIT;
	   else
	     next_state = RST;
	end
	
	WAIT: begin
	   if (rc_has_data)
	     next_state = TRANSFER;
	   else
	     next_state = WAIT;
	end

	TRANSFER: begin
	   if (TX_Data_Ready)
	     next_state = TRANSFER;
	   else
	     next_state = RST;
	end

	default: begin
	   next_state = ERR;
	end
      endcase // case (state)
   end // always @ (*)
	   

endmodule // tx_handshake
