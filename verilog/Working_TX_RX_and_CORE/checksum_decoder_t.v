module checksum_decoder_t();
	

	reg [23:0] stim;
	wire [27:0] encoded;
	wire [23:0] payload;
	wire error;



	checksum_encoder encode(.payload(stim),.out(encoded));
	checksum_decoder decode(.encoded(encoded),.payload(payload),.checksum_err(error));


	initial begin
	
	#5
	stim = 24'b100111110000010110101100;
	#5
	force encoded = 28'h000001;
	#5
	$stop;
	end
endmodule
