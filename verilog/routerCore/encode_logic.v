module encode_logic(input [28:0] Packet_From_Node, output [54:0] packet);

	wire [23:0] payload;
	wire encode_type;
	wire [3:0] addr;
	wire [47:0] three_six;
	wire [27:0] checksum;
	wire [47:0] encoded_data;

	deserialize_core deserialize (.addr(addr),.payload(payload),.Packet_From_Node(Packet_From_Node), .encode_type(encode_type));
	three_of_six_encoder three (.payload(payload), .out(three_six));
	checksum_encoder check (.payload(payload), .out(checksum));

	assign packet = encode_type ? {3'b001,addr,three_six} : {3'b010,addr,checksum,20'b0};

endmodule
