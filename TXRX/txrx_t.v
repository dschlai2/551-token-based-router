/* Testbench for the TX/RX units combined */

module txrx_t();

   /* inputs to TX/RX unit */
   reg [54:0] TX_Data;
   reg 	      TX_Data_Valid, Clk_S, Reset_n, RX_Ready;

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

      $monitor("%t::\tTX_Rdy:%b\t RX_Dta:%h\t RX_dv:%b",
	       $time, TX_Ready, RX_Data, RX_Data_Valid);

      Clk_S = 0;
      TX_Data = 55'h abcd;
      TX_Data_Valid = 1;
      RX_Ready = 0;

      
      /* Testing Rst_n */
      $display("% Lowering Rst_N");
      #0 Rst_n = 0;
      
      if (TX_Ready != 0) $display ("*** TX_Ready did not go to 0");
      if (S_Data != 0) $display ("*** S_Data did not go to 0");
      if (RX_Data_Valid != 0) $display ("*** RX_Data_Valid did not go to 0");
      #10;

      /* Lowering TX_Data_Valid */
      $display("& Lowering TX_Data_Valid.");
      TX_Data_Valid = 0;
      #5;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1");
      #7;


      /* Raising TX_Data_Valid */
      $display("% Raising TX_Data_Valid.");
      TX_Data_Valid = 1;
      #9;
      TX_Data_Valid = 0;
      if (TX_Ready != 0) $display("*** TX_Ready did not go to 0 on transmit.");

      
      /* DATA IS IN TRANSMISSION */
      #120;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1 after transmit.");
      if (RX_Data_Valid != 1) $display("*** RX_Data_Valid did not go to 1 after transmit.");
      if (RX_Data != TX_Data) $display("*** RX_Data does not match TX_Data.");

      $stop;
   end // initial begin
endmodule // txrx_t

      
      
      
      
      
      
      
      