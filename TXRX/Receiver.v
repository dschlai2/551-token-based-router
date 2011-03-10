module Receiver(input RX_Ready, Clk_S, Rst_n, S_data, output reg RX_Data_Valid, output [54:0] RX_Data);

	reg[1:0] state, nextState;

	parameter receiveSignal = 2'b00, readyTT = 2'b01, transmit = 2'b11;	// State values


	// Transmission Protocol Unit
	trans_Protocol rx_side(	.clk		(Clk_S),
				.rst		(Reset_n),
				.S_Data		(S_Data),
				.ready		(good_data),
				.packet		(RX_Data[54:0]));


	// Sequential Logic
	always@(posedge Clk_S, negedge Rst_n) begin
		
		if (~Rst_n) begin
			state <= receiveSignal;
		end

		else begin
			state <= nextState;
		end

	end // always


	// Next state logic
	always@(state, good_data, RX_Ready) begin

		case(state)

		receiveSignal: if (good_data)
				nextState = readyTT;
				else
				nextState = receiveSignal;
		
		readyTT: if(RX_Ready)
			nextState = transmit;
			else
			nextState = readyTT;

		transmit: if(~RX_Ready)
			nextState = receiveSignal;
			else
			nextState = transmit;

		default: nextState = 2'bxx;
		endcase

	end // always

	// Output logic
	always@(state) begin

		case (state)

		receiveSignal: RX_Data_Valid = 1'b0;
		readyTT: RX_Data_Valid = 1'b0;
		transmit: RX_Data_Valid = 1'b1;
		default: RX_Data_Valid = 1'bx;
	
		endcase

	end // always
	
endmodule