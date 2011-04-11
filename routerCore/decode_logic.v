module decode_logic(input RX_Data[54:0], output [3:0] addr, output [23:0] Packet_To_Node, output bad_decode, output [2:0] type);

	wire [47:0] raw;
	wire checksum_err, error_3of6;
	wire [23:0] checksum_load, three_six_load;
	wire token, ack, nack, check, three;

	deserialize_rx deserialize (.rx_side(RX_Data),.type(type),.addr(addr),.raw_data(raw));
	checksum_decoder checksum (.encoded(raw[47:20]),.checksum_err(checksum_err),.payload(checksum_load));
	decoder_3of6 three_six(.encoded(raw),.error_3of6(error_3of6),.payload(three_six_load));

	assign Packet_To_Node = check ? checksum_load : three_six_load;
	assign bad_decode = (checksum_err & error_3of6) & (~(token | ack | nack));

endmodule

	
