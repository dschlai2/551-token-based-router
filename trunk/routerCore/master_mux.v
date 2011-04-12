module master_mux(input [54:0] token, nack, ack, buffer, data,input [2:0] TX_data_select, output [54:0] out);



always@(TX_data_select) begin 
	case(TX_data_select)

	3'd0: out = data;

	3'd1: out = buffer;

	3'd2: out = token;

	3'd3: out = nack;

	3'd4: out = ack;

	endcase

endmodule
