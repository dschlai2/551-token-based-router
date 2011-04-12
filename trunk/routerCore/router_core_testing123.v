
module router_core_testing123();
   reg [54:0] RX_Data;
   reg 	      Clk_R, Rst_n, RX_Data_Valid, TX_Data_Ready, Packet_From_Node_Valid;
   reg [28:0] Packet_From_Node;

   wire       Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid;
   wire [54:0] TX_Data;
   wire [23:0] Packet_To_Node;



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
      endcase // case (rc.control_logic.state)
   end // always @ (rc.control_logic.state)
      
   
   initial begin

      /* Monitor rc outputs */
      $monitor("%t: core_load_ack:%b packet_to_node_valid:%b rx_data_ready:%b tx_data_valid:%b TX_Data:%b Packet_To_Node:%b",
	       $time, Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid, TX_Data, Packet_To_Node);

      
      /* Initialize variables */
      RX_Data = 55'b0;
      Clk_R = 1'b0;
      Rst_n = 1'b0;
      RX_Data_Valid = 1'b0;
      TX_Data_Ready = 1'b0;
      Packet_From_Node_Valid = 1'b0;
      Packet_From_Node = 29'b0;
      
      #1;
      
      /* Test reset values */
      if (TX_Data_Valid != 1'b0) $display("TX_Data_Valid is not 0 on reset.");
      if (TX_Data_Ready != 1'b0) $display("Tx_Data_Ready is not 0 on reset.");
      if (RX_Data_Ready != 1'b0) $display("RX_Data_Ready is not 0 on reset.");
      if (Packet_To_Node_Valid != 1'b0) $display("Packet_To_Node_Valid is not 0 on reset.");
      if (Core_Load_Ack != 1'b0) $display("Core_Load_Ack is not 0 on reset.");

      /* Turn off reset */
      #1;
      Rst_n = 1'b1;
      #5;

      /* Router address is not 0, so we should be in check_node */
      if (rc.main_control.state != LISTEN_NO_TOKEN) $display("Did not enter Listen_to_token after reset as master.");

      /* RX_Data_Ready is 0, so we stay in this state */
      #5;
      if (rc.main_control.state != LISTEN_NO_TOKEN) $display("Did not stay in state Check_Node while RX_Data_Ready is low.");

      #1;

      if(rc.rHandshake.RX_Data_Ready != 1'b1) $display("Core should be ready for data but isnt");

      #1;

      /*Raise RX_DATA_Valid to signal packet coming in*/
	$display("Sending correctly encoded checksum packet to our address");
       RX_Data_Valid = 1'b1;
       force RX_Data = {3'b010,4'b0001,48'b0};
	#5;
	if(rc.rHandshake.RX_Data_Ready != 1'b0) $display("Core should not be ready for data at this point");
	RX_Data_Valid = 1'b0;	


	#45;
	$display("Sending correctly encoded checksum packet to another address");
        RX_Data_Valid = 1'b1;
        force RX_Data = {3'b010,4'b0000,48'b0};
	#5;
	if(rc.rHandshake.RX_Data_Ready != 1'b0) $display("Core should not be ready for data at this point");
	RX_Data_Valid = 1'b0;	



	#45;
	$display("Sending ack packet for another address");
        RX_Data_Valid = 1'b1;
        force RX_Data = {3'b000,4'b0000,48'b0};
	#5;
	if(rc.rHandshake.RX_Data_Ready != 1'b0) $display("Core should not be ready for data at this point");
	RX_Data_Valid = 1'b0;	


	#45;
	$display("Sending nack to another address");
        RX_Data_Valid = 1'b1;
        force RX_Data = {3'b011,4'b0000,48'b0};
	#5;
	if(rc.rHandshake.RX_Data_Ready != 1'b0) $display("Core should not be ready for data at this point");
	RX_Data_Valid = 1'b0;	


	#45;
	$display("Sending poorly coded checksum packet to our address");
        RX_Data_Valid = 1'b1;
        force RX_Data = {3'b010,4'b0001,48'h123456789abc};
	#5;
	if(rc.rHandshake.RX_Data_Ready != 1'b0) $display("Core should not be ready for data at this point");
	RX_Data_Valid = 1'b0;	
	#40;

	#45;
	$display("Sending token");
        RX_Data_Valid = 1'b1;
        force RX_Data = {3'b111,4'b0001,48'h123456789abc};
	#5;
	if(rc.rHandshake.RX_Data_Ready != 1'b0) $display("Core should not be ready for data at this point");
	RX_Data_Valid = 1'b0;	
	#40;
	
      $stop;


      
   end // initial begin
endmodule // router_core_t


	       

	       
	       
