// TX Unit Tenchbest

module transmitter_t ();
   reg [54:0] TX_Data;
   reg 	      TX_Data_Valid, clk, rst_n;
   wire       TX_Ready, S_Data;

   transmitter t (.TX_Data(TX_Data),
		  .TX_Data_Valid(TX_Data_Valid),
		  .Clk_S(clk),
		  .Rst_n(rst_n),
		  .TX_Ready(TX_Ready),
		  .S_Data(S_Data));

   
   always @(clk) #7 clk <= ~clk;

   initial begin

      /* Initialize values */
      rst_n = 1;
      TX_Data_Valid = 0;
      TX_Data = {3'b111,52'bx};
      clk = 0;

      
      $monitor("%t:: Inputs: TX_Data_Valid: %b\t rst_n: %b\t Outputs: TX_Ready: %b\t S_Data: %b \t state: %d TP.state: %d" ,
	       $time, TX_Data_Valid, rst_n, TX_Ready, S_Data, t.state, t.protocol.state);


      /* Test Reset */
      clk = 0;
      #5;
      $display("Resetting now.  ::Expect READY = 0.");
      rst_n = 0;
      #15;

      $display("Raising reset.  Data valid is low  ::Expect READY = 1.");
      rst_n = 1;
      #21;

      
      /* Test under normal conditions */
      $display("Raising TX_Data_Valid.  ::Expect READY = 0.");
      $display("\tS_Data should now reflect input vector: 111_xxx...xxx");
      TX_Data_Valid = 1;
      #8000;
      $display("Data should be transmitted now. Valid still high  ::Expect READY = 0.");
      #17;
      $display("Dropping Data_Valid.  ::Expect READY = 1.");
      TX_Data_Valid = 0;
      #31;


      /* Test reset during transmission */
      $display("Raising TX_Data_Valid.  ::Expect READY = 0.");
      TX_Data_Valid = 1;
      #30;
      $display("Resetting during transmission.  ::Expect READY = 0.");
      rst_n = 0;
      #40;
      rst_n = 1;
      $display("Dropping TX_Data_Valid.  ::Expect READY = 1.");
      TX_Data_Valid = 0;
      #100;
            
      $stop;
      
   end // initial begin
endmodule // transmitter_t




      
      

      
      
