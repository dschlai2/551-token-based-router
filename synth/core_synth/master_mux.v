module master_mux(input [54:0] token, nack, ack, buffer, data,input [2:0] TX_data_select, output reg [54:0] out);

always@(*) begin 
	case(TX_data_select)

	3'd2: out = data;

	3'd4: out = buffer;

	3'd3: out = token;

	3'd1: out = nack;

	3'd0: out = ack;

	default: out = 55'b0;

	endcase
end

endmodule
