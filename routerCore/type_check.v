module type_check(input [2:0] type, output token, ack, nack, check, three);

   assign token = type[2];
   assign ack = (~type[1]) & (~type[0]);
   assign nack = type[1] & type[0];
   assign check = type[1] & ~type[0];
   assign three = ~type[1] & type[0];

endmodule
