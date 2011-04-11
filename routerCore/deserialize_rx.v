module deserialize_rx(input [54:0] rx_side, output [47:0] raw_data, output [2:0] type, output [3:0] addr);

	assign raw_data = rx_side[47:0];
	assign type = rx_side[54:52];
	assign addr = rx_side[51:48];
endmodule
	

