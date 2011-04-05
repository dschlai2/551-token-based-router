module encoder_checksum(input [23:0] payload, output reg [27:0] out);

	integer i;
	reg [5:0] count;
	parameter load = 24;	
always@(*) begin
	count = 6'b0;
	for(i = 0; i < 24; i = i + 1) begin
		if(payload[i] == 1'b1) begin
			count = count + 1'b1;
		end
	end
	//mod 16 is just the lower 4 bits
	out = {payload, count[3:0]};
end

endmodule

