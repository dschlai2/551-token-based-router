// TX Unit Behavioral Verilog //

module transmitter (input [54:0] TX_Data,
                    input TX_Data_Valid, Clk_S, Rst_n,
		    output reg TX_Ready,
                    output     S_Data);

   parameter RST = 2'd0,
	     RDY = 2'd1,
	     TRANSMIT = 2'd2;

   reg [1:0] state, next_state;
   wire      ready;
   reg 	     start, next_start;

   trans_protocol protocol(.clk(Clk_S), 
			   .start(start), 
			   .TX_Data(TX_Data),
			   .S_Data(S_Data),
			   .rst(~Rst_n),
			   .ready(ready));

   always @(posedge Clk_S, negedge Rst_n) begin
      if (!Rst_n) begin
	 state <= RST;
	 TX_Ready <= 1'b0;
	 start <= 1'b0;
      end
      else begin
	start <= next_start;
	state <= next_state;
      end
   end

   always @(TX_Data_Valid, ready, state) begin
      case (state)

	RST: begin
	   if (!TX_Data_Valid) begin
	      next_state = RDY;
	      next_start = 1'b0;
	   end else begin
	      next_state = RST;
	      next_start = 1'b0;
	   end
	end

	RDY: begin
	   if (TX_Data_Valid) begin
	      next_state = TRANSMIT;
	      next_start = 1'b1;
	   end else begin
	      next_state = RDY;
	      next_start = 1'b0;
	   end
	end
	
	TRANSMIT: begin
	   if (~ready) begin
	      next_state = TRANSMIT;
	      next_start = 1'b0;
	   end else begin
	      next_state = RST;
	      next_start = 1'b0;
	   end
	end

	default:
	  next_state = 2'bxx;
      endcase // case (state)
   end // always @ (TX_Data_Valid, ready, state)

   // Output logic
   always @(state) begin
      case(state)

	RST: begin
	   TX_Ready = 1'b0;
	end

	RDY: begin
	   TX_Ready = 1'b1;
	end

	TRANSMIT: begin
	   TX_Ready = 1'b0;
	end
      endcase
   end // always @ (state)
endmodule // transmitter


	   
			  
			   
  
   
   
		    