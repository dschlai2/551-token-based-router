module decode_logic_t();

	
	reg [54:0] encoded;
	wire [3:0] addr;
	wire [23:0] out;
	wire [2:0] type;
	wire bad_decode;

	decode_logic dec  (.RX_Data(encoded),.addr(addr),.bad_decode(bad_decode),.type(type),.Packet_To_Node(out));

	initial begin
	#10
	force encoded = {3'b001,4'b0001,48'h123456789abc};
	#5
	force encoded = {3'b010,4'b0001,48'h123456789abc};
	#5
	$stop;
	end
endmodule
