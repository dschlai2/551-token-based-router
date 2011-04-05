/* Testbench for the TX/RX units combined */

`timescale 1ns/100ps

module txrx_t();

   /* inputs to TX/RX unit */
   reg [54:0] TX_Data;
   reg 	      TX_Data_Valid, Clk_S, Rst_n, RX_Ready;

   /* outputs from TX/RX */
   wire        TX_Ready, RX_Data_Valid;
   wire [54:0] RX_Data;

   /* connections */
   wire        S_Data;

   /* Error signals */
   wire        err_TX_Ready, err_S_Data, err_RX_Ready, err_RX_Data_Valid, err_RX_Data;
   wire        err_ANY;
        
   /* outputs from synth modules */
   wire        TX_Ready_s, RX_Data_Valid_s;
   wire [54:0] RX_Data_s;
   wire        S_Data_s;

   
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

   transmitter_synth tx_s (.TX_Data(TX_Data),
			   .TX_Data_Valid(TX_Data_Valid),
			   .Clk_S(Clk_S),
			   .Rst_n(Rst_n),
			   .TX_Ready(TX_Ready_s),
			   .S_Data(S_Data_s));

   receiver_synth rx_s (.RX_Ready(RX_Ready),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.S_Data(S_Data),
		.RX_Data_Valid(RX_Data_Valid_s),
		.RX_Data(RX_Data_s));


   /* Assign err signals to differences in each module */
   assign err_TX_Ready = TX_Ready != TX_Ready_s;
   assign err_S_Data = S_Data != S_Data_s;
   assign err_RX_Data_Valid = RX_Data_Valid != RX_Data_Valid_s;
   assign err_RX_Data = RX_Data != RX_Data_s;
   assign err_ANY = err_TX_Ready|err_S_Data|err_RX_Ready|err_S_Data|err_RX_Data_Valid|err_RX_Data;
   
   /* clock */
   always @(Clk_S) #10 Clk_S <= ~Clk_S;


   initial begin

      /*
       $monitor("%t::\tctr: %d TX_Rdy:%b\t RX_Dta:%h\t RX_dv:%b\t S_Data: %b\t",
	       $time, rx.rx_side.counter, TX_Ready, RX_Data, RX_Data_Valid, S_Data); 
       */

      $monitor("%b %b %b %b %b %b", err_TX_Ready, err_RX_Ready, err_S_Data, err_RX_Data_Valid, err_RX_Data, err_ANY);

      Clk_S = 0;
      TX_Data = 55'd3;
      TX_Data_Valid = 1;
      RX_Ready = 0;

      
      /* Testing Rst_n */
      //$display("Lowering Rst_N");
      #1 Rst_n = 0;
      
      if (TX_Ready != 0) $display ("*** TX_Ready did not go to 0");
      if (S_Data != 0) $display ("*** S_Data did not go to 0");
      if (RX_Data_Valid != 0) $display ("*** RX_Data_Valid did not go to 0");
      #100;
      Rst_n = 1;
      #50;
      

      /* Lowering TX_Data_Valid */
      $display("Lowering TX_Data_Valid.");
      TX_Data_Valid = 0;
      #1000;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1");
      #7000;


      /* Raising TX_Data_Valid */
      $display("Raising TX_Data_Valid.");
      TX_Data_Valid = 1;
      #9000;
      TX_Data_Valid = 0;
      if (TX_Ready != 0) $display("*** TX_Ready did not go to 0 on transmit.");

      
      /* DATA IS IN TRANSMISSION */
      #3000;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1 after transmit.");
      if (RX_Data != TX_Data) $display("*** RX_Data does not match TX_Data.");

      /* Raising RX_Ready */
      RX_Ready = 1;
      #2000;
      if (RX_Data_Valid != 1) $display("*** RX_Data_Valid did not go to 1 after transmit.");
      $display ("TX_Data: %h\t RX_Data: %h",TX_Data, RX_Data);




      
      /* Sending a second packet */
      TX_Data = 55'b101101110_1110001110_101101110_1110001110_101101110_11101;
      RX_Ready = 0;

      #1000;
      /* Raising TX_Data_Valid */
      $display("Raising TX_Data_Valid.");
      TX_Data_Valid = 1;
      #9;
      TX_Data_Valid = 0;
      if (TX_Ready != 0) $display("*** TX_Ready did not go to 0 on transmit.");

      
      /* DATA IS IN TRANSMISSION */
      #6000;
      if (TX_Ready != 1) $display("*** TX_Ready did not go to 1 after transmit.");
      if (RX_Data != TX_Data) $display("*** RX_Data does not match TX_Data.");

      /* Raising RX_Ready */
      RX_Ready = 1;
      #200;
      if (RX_Data_Valid != 1) $display("*** RX_Data_Valid did not go to 1 after transmit.");
      $display ("TX_Data: %h\t RX_Data: %h",TX_Data, RX_Data);

      #2000;



      
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
      #600;

      $display ("Resetting during transmission.");
      Rst_n = 0;
      #200;
      

      if (TX_Ready != 0) $display ("*** TX_Ready did not go to 0");
      if (S_Data != 0) $display ("*** S_Data did not go to 0");
      if (RX_Data_Valid != 0) $display ("*** RX_Data_Valid did not go to 0");
      #100;
      Rst_n = 1;
      #50;
      $stop;
   end // initial begin
endmodule // txrx_t

      
      
      
      
      
      
      
      