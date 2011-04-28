
module router_core_t();
   reg [54:0] RX_Data;
   reg 	      Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, Packet_From_Node_Valid;
   reg [28:0] Packet_From_Node;

   wire       Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid;
   wire [54:0] TX_Data;
   wire [23:0] Packet_To_Node;

   
   /* Types */
   parameter[2:0] TOKEN =  3'b111;
   parameter[2:0] ACK =    3'b000;
   parameter[2:0] NACK =   3'b011;
   parameter[2:0] DATA_C = 3'b010;
   parameter[2:0] DATA_3 = 3'b001;

   /* router core control logic states */
   parameter ERR_STATE =         4'd0;   
   parameter CHECK_IF_MASTER =	4'd1;
   parameter SEND_TOKEN	=	4'd2;
   parameter CHECK_NODE =	4'd3;
   parameter ENCODE =		4'd4;
   parameter SEND_TX =		4'd5;
   parameter LISTEN_WITH_TOKEN=	4'd6;
   parameter LISTEN_NO_TOKEN =	4'd7;
   parameter FORWARD =		4'd8;
   parameter CHECK_ADDRESS =    4'd9;
   parameter SEND_NODE	=	4'd10;
   parameter SEND_NACK  =       4'd11;
   
   /* Override router address */
   defparam rc.main_control.OUR_ADDRESS = 4'b0;
   
   router_core rc(.RX_Data(RX_Data),
		  .Clk_R(Clk_R),
		  .Rst_n(Rst_n),
		  .RX_Data_Valid(RX_Data_Valid),
		  .TX_Data_Ready(TX_Data_Ready),
		  .Packet_From_Node_Valid(Packet_From_Node_Valid),
		  .Packet_From_Node(Packet_From_Node),
		  .Core_Load_Ack(Core_Load_Ack),
		  .Packet_To_Node_Valid(Packet_To_Node_Valid),
		  .RX_Data_Ready(RX_Data_Ready),
		  .TX_Data_Valid(TX_Data_Valid),
		  .TX_Data(TX_Data),
		  .Packet_To_Node(Packet_To_Node));

   /* Generate clock signal */
   always begin
      Clk_R = ~Clk_R;
      #1;
   end

   /* Monitor state changes in rc */
   always @(rc.main_control.state) begin
      case (rc.main_control.state)
	ERR_STATE: $display("state:: err_state");
	CHECK_IF_MASTER: $display("state:: check_if_master");
	SEND_TOKEN: $display("state:: send_token");
	CHECK_NODE: $display("state:: check_node");
	ENCODE:$display("state:: encode");
	SEND_TX: $display("state:: send_tx");
	LISTEN_WITH_TOKEN: $display("state:: listen_with_token");
	LISTEN_NO_TOKEN: $display("state:: listen_no_token");
	FORWARD: $display("state:: forward");
	CHECK_ADDRESS: $display("state:: check_address");
	SEND_NODE: $display("state:: send_node");
	SEND_NACK: $display("state:: send_nack");
      endcase // case (rc.main_control.state)
   end // always @ (rc.main_control.state)
      
   
   initial begin

      /* Monitor rc outputs */
      $monitor("%t: core_load_ack:%b packet_to_node_valid:%b rx_data_ready:%b tx_data_valid:%b TX_Data:%h Packet_To_Node:%h",
	       $time, Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid, TX_Data, Packet_To_Node);


      ///* Testing reset as master, and entering send_token state *///
      
      /* Initialize variables */
      RX_Data = 55'b0;
      Clk_R = 1'b0;
      Rst_n = 1'b0;
      RX_Data_Valid = 1'b0;
      TX_Data_Ready = 1'b0;
      Packet_From_Node_Valid = 1'b0;
      Packet_From_Node = 29'b0;
      
      #2;
      
      /* Test reset values */
      if (TX_Data_Valid != 1'b0) $display("TX_Data_Valid is not 0 on reset.");
      if (TX_Data_Ready != 1'b0) $display("Tx_Data_Ready is not 0 on reset.");
      if (RX_Data_Ready != 1'b0) $display("RX_Data_Ready is not 0 on reset.");
      if (Packet_To_Node_Valid != 1'b0) $display("Packet_To_Node_Valid is not 0 on reset.");
      if (Core_Load_Ack != 1'b0) $display("Core_Load_Ack is not 0 on reset.");

      /* Turn off reset */
      #2;
      Rst_n = 1'b1;
      #2;

      /* Router address is 0, so we should be in check_node */
      if (rc.main_control.state != CHECK_NODE) $display("Did not enter Check_Node after reset as master.");

      /* Packet_From_Node_Valid is 0, but TX_Data_Ready is 0, so we stay in this state */
      #4;
      if (rc.main_control.state != CHECK_NODE) $display("Did not stay in state Check_Node while TX_Data_Ready is low.");

      #2;
      /* Raising TX_Data_Ready should allow state to enter send_token */
      TX_Data_Ready = 1'b1;
      #6;
      if (TX_Data != {TOKEN,52'b0}) $display ("Token not put on the TX_Data line.");
      if (rc.main_control.state != LISTEN_NO_TOKEN) $display("Did not enter listen_no_token after raising tx_data_ready.");

      #20;



      
      ///*  Testing packet sending from processing node   */// 
      RX_Data = 55'b0;
      Rst_n = 1'b0;
      RX_Data_Valid = 1'b0;
      TX_Data_Ready = 1'b0;
      Packet_From_Node_Valid = 1'b0;
      Packet_From_Node = 29'b0;


      #2;
      Rst_n = 1'b1; // turn off reset
      Packet_From_Node = 29'h123123;  // put a packet on the node line
      Packet_From_Node_Valid = 1'b1;  // we have a packet in the node
      #4; // 2 ticks for check, 2 for check_node

      /* Packet_From_Node_Valid is high, so we should transition into Encode */
      if (rc.main_control.state != ENCODE) $display("Did not move to encode when data was on processor node line.");

      #80;  // Waiting a long time for TX_Data_Ready should not cause change
      if (rc.main_control.state != ENCODE) $display("Did not stay in encode while waiting for tx unit.");
      #2;
      TX_Data_Ready = 1'b1; // ready to transfer packets
      #4;

      if (rc.main_control.state != SEND_TX) $display("Did not begin packet transmission after sending ready signal.");
      if (TX_Data_Valid != 1) $display ("TX_Data_Valid is not 1 even though data is ready for transmission.");

      #20;
      // TX_Data_Valid should stay high until we lower TX_Data_Ready
      TX_Data_Ready = 1'b0;
      #2;
      if (TX_Data_Valid != 0) $display ("TX_Data_Valid is not 0 after dropping TX_Data_Ready.");
      #2;      
      
      
      
      
      
      $stop;


      
   end // initial begin
endmodule // router_core_t


	       

	       
	       