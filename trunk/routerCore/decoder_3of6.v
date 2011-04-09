module decoder_3of6(input [47:0] encoded, output [23:0] payload, output error_3of6);

//array of error signals from each 6 bit segement
wire errors [7:0];

assign payload[2:0]= encoded[5:3];
assign payload[5:3]= encoded[11:9];
assign payload[8:6]= encoded[17:15];
assign payload[11:9]= encoded[23:21];
assign payload[14:12]= encoded[29:27];
assign payload[17:15]= encoded[35:33];
assign payload[20:18]= encoded[41:39];
assign payload[23:21]= encoded[47:35];

six_bit_checker check1(.in(encoded[5:0]),.error(errors[0]);
six_bit_checker check1(.in(encoded[11:6]),.error(errors[1]);
six_bit_checker check1(.in(encoded[17:12]),.error(errors[2]);
six_bit_checker check1(.in(encoded[23:18]),.error(errors[3]);
six_bit_checker check1(.in(encoded[29:24]),.error(errors[4]);
six_bit_checker check1(.in(encoded[35:30]),.error(errors[5]);
six_bit_checker check1(.in(encoded[41:36]),.error(errors[6]);
six_bit_checker check1(.in(encoded[47:42]),.error(errors[7]);


assign error_3of6 = errors[0] | errors[1] | errors[2] | errors[3] | errors[4] | errors[5] | errors[6] | errors[7];

endmodule

