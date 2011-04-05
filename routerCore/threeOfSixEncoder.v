module encoder_3of6(input [23:0] payload, output [47:0] out);

//Instantiate all 8 appenders

append_3of6 append1(.A(payload[2]),.B(payload[1]),.C(payload[0]),.F(out[2]),.G(out[1]),.H(out[0]));
append_3of6 append2(.A(payload[5]),.B(payload[4]),.C(payload[3]),.F(out[8]),.G(out[7]),.H(out[6]));
append_3of6 append3(.A(payload[8]),.B(payload[7]),.C(payload[6]),.F(out[14]),.G(out[13]),.H(out[12]));
append_3of6 append4(.A(payload[11]),.B(payload[10]),.C(payload[9]),.F(out[20]),.G(out[19]),.H(out[18]));
append_3of6 append5(.A(payload[14]),.B(payload[13]),.C(payload[12]),.F(out[26]),.G(out[25]),.H(out[24]));
append_3of6 append6(.A(payload[17]),.B(payload[16]),.C(payload[15]),.F(out[32]),.G(out[31]),.H(out[30]));
append_3of6 append7(.A(payload[20]),.B(payload[19]),.C(payload[18]),.F(out[38]),.G(out[37]),.H(out[36]));
append_3of6 append8(.A(payload[23]),.B(payload[22]),.C(payload[21]),.F(out[44]),.G(out[43]),.H(out[42]));

assign out[5:3] = payload[2:0];
assign out[11:9] = payload[5:3];
assign out[17:15] = payload[8:6];
assign out[23:21] = payload[11:9];
assign out[29:27] = payload[14:12];
assign out[35:33] = payload[17:15];
assign out[41:39] = payload[20:18];
assign out[47:45] = payload[23:21];

endmodule


