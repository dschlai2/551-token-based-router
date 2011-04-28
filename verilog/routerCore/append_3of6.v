module append_3of6(input A, B, C, output F, G, H);

assign A_n = !A;
assign B_n = !B;
assign C_n = !C;

assign F = A_n | C_n | B_n;
assign G = (B_n & C_n) | (A_n & B_n) | (A_n & C_n);
assign H = A_n & B_n & C_n;

endmodule

  
