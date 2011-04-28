module checksum_decoder(input [27:0] encoded, output reg checksum_err, output reg [23:0] payload);


wire [27:0]  check;
checksum_encoder encoder(.payload(encoded[27:4]), .out(check));

	always@(*) begin
		if(check == encoded) begin
			checksum_err = 1'b0;
			payload = encoded[27:4];
		end
		else begin
			checksum_err = 1'b1;
			//This value is arbitrary and not used but didnt want
			//to infer a latch
			payload = 28'b1;
			end
	end
endmodule





 
