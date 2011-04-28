module deserialize_core(input [28:0] Packet_From_Node, output encode_type, output [3:0] addr, output [23:0] payload);

	assign payload = Packet_From_Node[23:0];
	assign encode_type = Packet_From_Node[24];
	assign addr = Packet_From_Node[28:25];

endmodule
