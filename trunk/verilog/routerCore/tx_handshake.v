/**
 This module provides an interface for the routercore to the TX unit.
 
 TX_Ready will be high any time the TX unit can send data, and zero otherwise (during transmission).
 
 The routercore should only put new data on the line when TX_Ready is high, and
    should hold data while TX_Ready is low.
 
 **/

module tx_handshake(tx_ready, rc_has_data, TX_Data_Valid, TX_Data_Ready, clk, rst_n, data_to_tx, TX_Data);
   input rc_has_data, TX_Data_Ready, clk, rst_n;
   output reg tx_ready, TX_Data_Valid;
   output reg [54:0] TX_Data;
   input [54:0] data_to_tx;
   
   parameter RST = 2'd0;
   parameter WAIT = 2'd1;
   parameter TRANSFER = 2'd2;
   parameter ERR = 2'd3;

   reg [54:0] 	    next_TX_Data;
   reg [1:0] state, next_state;


   /* sequential logic */
   always @(posedge clk, negedge rst_n) begin
      if (~rst_n) begin
	 state <= RST;
	 TX_Data <= 55'b0;
      end else begin
	 state <= next_state;
	 TX_Data <= next_TX_Data;
      end
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
	   next_TX_Data = data_to_tx;
	   if (TX_Data_Ready)  // wait for TX_Data_Ready to go high before raising ready sig
	     next_state = WAIT;
	   else
	     next_state = RST;
	end
	
	WAIT: begin
	   next_TX_Data = data_to_tx;
	   if (rc_has_data) begin
	     next_state = TRANSFER;
	   end else begin
	     next_state = WAIT;
	   end
	end

	TRANSFER: begin
	   next_TX_Data = TX_Data;
	   if (TX_Data_Ready)
	     next_state = TRANSFER;
	   else
	     next_state = RST;
	end

	default: begin
	   next_state = ERR;
	   next_TX_Data = 55'bx;
	end
      endcase // case (state)
   end // always @ (*)
	   

endmodule // tx_handshake
