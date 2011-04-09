module six_bit_checker(input [5:0] in, output reg error);

integer i;
reg [3:0] count;

always@(*) begin
	for(i = 0; i < 6; i = i + 1) begin
		count = count + in[i];
	end
	error = !count[0];
end
endmodule

