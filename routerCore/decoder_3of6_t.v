module decoder_3of6_t();
	

	reg [23:0] stim;
	wire [47:0] encoded;
	wire [23:0] payload;
	wire error;



	three_of_six_encoder encode(.payload(stim),.out(encoded));
	decoder_3of6 decode(.encoded(encoded),.payload(payload),.error_3of6(error));


	initial begin
	
	#5
	stim = 24'b100111110000010110101100;
	#5
	force encoded = 48'b0;
	#5
	$stop;
	end
endmodule
