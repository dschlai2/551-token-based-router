module encode_logic_t();

	reg [28:0] stim;
	wire [54:0] out;
	encode_logic logic (.Packet_From_Node(stim),.packet(out));	
	initial begin
	#5
	stim = 29'b10000100111110000010110101100;
	#5
	stim = 29'b10001100111110000010110101100;
	#5
	$stop;
	end
endmodule
	
		
