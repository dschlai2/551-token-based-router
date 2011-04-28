/* Testbench for the TX/RX units combined */

module txrx_t();

   /* inputs to TX/RX unit */
   reg [54:0] TX_Data;
   reg 	      TX_Data_Valid, Clk_S, Rst_n, RX_Ready;

   /* outputs from TX/RX */
   wire        TX_Ready, RX_Data_Valid;
   wire [54:0] RX_Data;

   /* connections */
   wire        S_Data;

   
   transmitter tx (.TX_Data(TX_Data),
	       .TX_Data_Valid(TX_Data_Valid),
	       .Clk_S(Clk_S),
	       .Rst_n(Rst_n),
	       .TX_Ready(TX_Ready),
	       .S_Data(S_Data));

   receiver rx (.RX_Ready(RX_Ready),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.S_Data(S_Data),
		.RX_Data_Valid(RX_Data_Valid),
		.RX_Data(RX_Data));

   /* clock */
   always @(Clk_S) #1 Clk_S <= ~Clk_S;


   initial begin

      $monitor("%t::\t TX_Rdy:%b\t RX_Dta:%h\t RX_dv:%b\t S_Data: %b\t",
	       $time, TX_Ready, RX_Data, RX_Data_Valid, S_Data);

      Clk_S = 0;
      TX_Data = 55'd 3;
      TX_Data_Valid = 1;
      RX_Ready = 0;

      
      /* Testing Rst_n */
      $display("Lowering Rst_N");
      #0 Rst_n = 0;
      
      if (TX_Ready != 0) $display ("*** TX_Ready did not go to 0");
      if (S_Data != 0) $display ("*** S_Data did not go to 0");
      if (RX_Data_Valid != 0) $display ("*** RX_Data_Valid did not go to 0");
      #10;
      Rst_n = 1;
      #5;
      

      /* Lowering TX_Data_Valid */
      $display("Lowering TX_Data_Valid.");
      TX_Data_Valid = 0;
      #10;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1");
      #7;


      /* Raising TX_Data_Valid */
      $display("Raising TX_Data_Valid.");
      TX_Data_Valid = 1;
      #9;
      TX_Data_Valid = 0;
      if (TX_Ready != 0) $display("*** TX_Ready did not go to 0 on transmit.");

      
      /* DATA IS IN TRANSMISSION */
      #300;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1 after transmit.");
      if (RX_Data != TX_Data) $display("*** RX_Data does not match TX_Data.");

      /* Raising RX_Ready */
      RX_Ready = 1;
      #20;
      if (RX_Data_Valid != 1) $display("*** RX_Data_Valid did not go to 1 after transmit.");
      $display ("TX_Data: %h\t RX_Data: %h",TX_Data, RX_Data);




      
      /* Sending a second packet */
      TX_Data = 55'b101101110_1110001110_101101110_1110001110_101101110_11101;
      RX_Ready = 0;

      #10;
      /* Raising TX_Data_Valid */
      $display("Raising TX_Data_Valid.");
      TX_Data_Valid = 1;
      #9;
      TX_Data_Valid = 0;
      if (TX_Ready != 0) $display("*** TX_Ready did not go to 0 on transmit.");

      
      /* DATA IS IN TRANSMISSION */
      #600;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1 after transmit.");
      if (RX_Data != TX_Data) $display("*** RX_Data does not match TX_Data.");

      /* Raising RX_Ready */
      RX_Ready = 1;
      #20;
      if (RX_Data_Valid != 1) $display("*** RX_Data_Valid did not go to 1 after transmit.");
      $display ("TX_Data: %h\t RX_Data: %h",TX_Data, RX_Data);

      #200;



      
      /* Sending a second packet */
      TX_Data = 55'b101101110_1110001110_101101110_1110001110_101101110_11101;
      RX_Ready = 0;

      #10;
      /* Raising TX_Data_Valid */
      $display("Raising TX_Data_Valid.");
      TX_Data_Valid = 1;
      #9;
      TX_Data_Valid = 1;
      if (TX_Ready != 0) $display("*** TX_Ready did not go to 0 on transmit.");

      
      /* DATA IS IN TRANSMISSION */
      #60;

      $display ("Resetting during transmission.");
      Rst_n = 0;
      #2;
      

      if (TX_Ready != 0) $display ("*** TX_Ready did not go to 0");
      if (S_Data != 0) $display ("*** S_Data did not go to 0");
      if (RX_Data_Valid != 0) $display ("*** RX_Data_Valid did not go to 0");
      #10;
      Rst_n = 1;
      #5;

      
      
      $stop;
   end // initial begin
endmodule // txrx_t

      
      
      
      
      
      
      
      