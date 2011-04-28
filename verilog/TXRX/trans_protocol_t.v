/* This module tests the transmission protocol module 
 used in the TX and RX units */

module trans_protocol_t ();

   reg [54:0] TX_Data;
   reg 	      start, rst, clk;
   wire       ready, S_Data;

   
   trans_protocol tb(.TX_Data(TX_Data),
		  .start(start),
		  .rst(rst),
		  .clk(clk),
		  .ready(ready),
		  .S_Data(S_Data));

   always @(clk) #1 clk <= ~clk;
   
   initial begin
      clk = 0;
      start = 0;

      #5;
      
      
      $monitor("%t::start:%b\t rst:%b\t: ready:%b\t S_Data:%b\t state:%d\t counter:%d pack:%b", 
	       $time,start,rst,ready,S_Data,tb.state,tb.counter,0);

      $display("Resetting module\n");
      rst <= 1;
      #10;
      rst <= 0;
      
      $display("Sending TOKEN: Expect 01_1111 _ 111 _ 000....");
      TX_Data <= 55'b111_xx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx;
      start <= 1;
      #3;
      start <= 0;
      #130;

      $display("Sending ACK: Expect 01_1111 _ 000 _ 000....");
      TX_Data <= 55'b000_xx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx;
      start <= 1;
      #3;
      start <= 0;
      #130;

      $display("Sending NACK: Expect 01_1111 _ 011 _ 00...");
      TX_Data <= 55'b011_xx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx_xxxxxxxxxx;
      start <= 1;
      #3;
      start <= 0;
      #130;

      $display("Sending DATA-C: Expect ss_010_011111..");
      TX_Data <= 55'b010_01_1111111111_0111111111_0111111111_0111111111_0111111111;
      start <= 1;
      #3;
      start <= 0;
      #130;

      $display("Sending DATA-3: Expect ss_001_0000.... 001");
      TX_Data <= 55'b001_00_0000000000_0000000000_0000000000_0000000000_0000000001;
      start <= 1;
      #3;
      start <= 0;
      #130;

      $stop;

   end // initial begin
endmodule // trans_protocol_t

      
      

      
	