module checksum_encoder(input [23:0] payload, output reg [27:0] out);

	integer i;
	reg [5:0] count;
	parameter [5:0] load = 6'd24;	
always@(*) begin
	count = 6'b0;
	for(i = 0; i < load; i = i + 1) begin
		if(payload[i] == 1'b1) begin
			count = count + 1'b1;
		end
	end
	//mod 16 is just the lower 4 bits
	out = {payload, count[3:0]};
end

endmodule

