module decode_logic_t();

	
	reg [28:0] stim;
	wire [54:0] encoded;
	wire [3:0] addr;
	wire [23:0] out;
	wire [2:0] type;
	wire bad_decode;

	encode_logic enc (.Packet_From_Node(stim),.packet(encoded));
	decode_logic dec  (.RX_Data(encoded),.addr(addr),.bad_decode(bad_decode),.type(type),.Packet_To_Node(out));

	initial begin
	#5
	stim = 29'b10000100111110000010110101100;
	#5
	stim = 29'b10001100111110000010110101100;
	#5
	force encoded = 55'h289f05acb00000;
	#5
	$stop;
	end
endmodule
