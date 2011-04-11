/* Testbench for rx_handshake module 
 
 Instantiates a rx_handshake module and and receiver to verify functionality */

module rx_handshake_t();
   wire rx_has_data, RX_Data_Ready, RX_Data_Valid;
   reg 	rc_ready, clk, rst_n, Clk_S, S_Data;

   wire [54:0] RX_Data;
   
   receiver rxr (.RX_Ready(RX_Data_Ready),
		 .Clk_S(Clk_S),
		 .Rst_n(rst_n),
		 .S_Data(S_Data),
		 .RX_Data_Valid(RX_Data_Valid),
		 .RX_Data(RX_Data));

   rx_handshake rxh (.RX_Data_Ready(RX_Data_Ready),
		     .RX_Data_Valid(RX_Data_Valid),
		     .rc_ready(rc_ready),
		     .rx_has_data(rx_has_data),
		     .clk(clk),
		     .rst_n(rst_n));

   always begin
      clk = ~clk;
      #1;
   end

   always begin
      Clk_S = ~Clk_S;
      #1;
   end

   always @(rxh.state) begin
      case (rxh.state)
	0: $display ("rxh in rst.");
	1: $display ("rxh in wait.");
	2: $display ("rxh in transfer.");
	3: $display ("rxh in hold.");
      endcase // case (rxh.state)
   end
   
   initial begin
      $monitor ("%t: rc_ready:%b rx_has_data:%b  :: rx_dv:%b rx_dr: %b", $time, rc_ready,
		rx_has_data, RX_Data_Valid, RX_Data_Ready);

      S_Data = 1;
      clk = 0;
      Clk_S = 0;
      rst_n = 1'b0;
      rc_ready = 0;
      
      #10;

      /* Verify reset state values */
      if (rx_has_data != 0) $display ("rx_has_data does not reset to 0");
      if (RX_Data_Valid != 0) $display("RX_Data_Valid does not reset to 0");
      if (RX_Data_Ready != 0) $display("RX_Data_Ready does not reset to 0");
      
      #2;
      rst_n = 1; // turn off reset
      #50;

      /* Verify stable state values */
      if (RX_Data_Ready != 1) $display("RX_Data_Ready does not go to 1 after reset.");
      if (RX_Data_Valid != 0) $display("RX_Data_Valid went to 1 without receiving data.");
      if (rx_has_data != 0) $display("rx_has_data incorrectly says it has data.");


      /* Begin transmission */
      $display ("Sending good data");
      #2;
      S_Data = 0;
      #20;
      S_Data = 1;
      #1000;

      /* Verify the packet was received and is on the line */
      if (RX_Data_Valid != 1) $display("RX_Data_Valid is not 1 after receiving a good packet.");
      if (RX_Data_Ready != 1) $display("RX_Data_Ready is not 1 while waiting for first packet.");

      /* Receive packet */
      $display ("Raising rc_ready.");
      rc_ready = 1;
      #1;
      $display ("Dropping rc_ready.");
      rc_ready = 0;
      #20;

      /* After receiving a packet */
      if (rx_has_data != 0) $display ("rx_has_data did not return to 0 after rc accepted packet.");
      if (RX_Data_Ready != 1) $display ("RX_Data_Ready did not return to 1 after packet accepted.");
      if (RX_Data_Valid != 0) $display ("RX_Data_Valid is not 0, yet no new packets were sent.");

      $stop;
   end // initial begin
   
endmodule // rx_handshake_t

      
      
      
      
      
      
      