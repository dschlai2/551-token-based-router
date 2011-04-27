`timescale 1ns/1ps

module txrx_and_core_tb();

   /* router core control logic states */
   parameter ERR_STATE =        4'd0;   
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

   // Clockz
   reg Clk_S, Clk_R, Rst_n;

   // Wires to and from processor nodes
   wire [2:0] Core_Load_Ack, Packet_From_Node_Valid, Packet_To_Node_Valid;
   wire [23:0] Packet_To_Node0, Packet_To_Node1, Packet_To_Node2;
   wire [28:0] Packet_From_Node0, Packet_From_Node1, Packet_From_Node2;

   // Wires between modules
   wire s_data0_1, s_data1_2, s_data2_0;
   wire [2:0] TX_Data_Ready;
   wire [2:0] TX_Data_Valid;
   wire [2:0] RX_Data_Ready;
   wire [2:0] RX_Data_Valid;
   wire [54:0] RX_Data0, RX_Data1, RX_Data2;
   wire [54:0] TX_Data0, TX_Data1, TX_Data2;

   // Router Base 0
   router_core_synthed rc0(.RX_Data(RX_Data0),
		  .Clk_R(Clk_R),
		  .Rst_n(Rst_n),
		  .RX_Data_Valid(RX_Data_Valid[0]),
		  .TX_Data_Ready(TX_Data_Ready[0]),
		  .Packet_From_Node_Valid(Packet_From_Node_Valid[0]),
		  .Packet_From_Node(Packet_From_Node0),
		  .r_addr(4'b0000),
		  .Core_Load_Ack(Core_Load_Ack[0]),
		  .Packet_To_Node_Valid(Packet_To_Node_Valid[0]),
		  .RX_Data_Ready(RX_Data_Ready[0]),
		  .TX_Data_Valid(TX_Data_Valid[0]),
		  .TX_Data(TX_Data0),
		  .Packet_To_Node(Packet_To_Node0));

   transmitter_synthed TX0(.TX_Data(TX_Data0),
		.TX_Data_Valid(TX_Data_Valid[0]),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.TX_Ready(TX_Data_Ready[0]),
		.S_Data(s_data0_1));

   receiver_synthed RX0(.RX_Ready(RX_Data_Ready[0]),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.S_Data(s_data2_0),
		.RX_Data_Valid(RX_Data_Valid[0]),
		.RX_Data(RX_Data0));
   
   // Router Base 1
   router_core_synthed rc1(.RX_Data(RX_Data1),
		  .Clk_R(Clk_R),
		  .Rst_n(Rst_n),
		  .RX_Data_Valid(RX_Data_Valid[1]),
		  .TX_Data_Ready(TX_Data_Ready[1]),
		  .Packet_From_Node_Valid(Packet_From_Node_Valid[1]),
		  .Packet_From_Node(Packet_From_Node1),
		  .r_addr(4'b0001),
		  .Core_Load_Ack(Core_Load_Ack[1]),
		  .Packet_To_Node_Valid(Packet_To_Node_Valid[1]),
		  .RX_Data_Ready(RX_Data_Ready[1]),
		  .TX_Data_Valid(TX_Data_Valid[1]),
		  .TX_Data(TX_Data1),
		  .Packet_To_Node(Packet_To_Node1));

   transmitter_synthed TX1(.TX_Data(TX_Data1),
		.TX_Data_Valid(TX_Data_Valid[1]),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.TX_Ready(TX_Data_Ready[1]),
		.S_Data(s_data1_2));

   receiver_synthed RX1(.RX_Ready(RX_Data_Ready[1]),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.S_Data(s_data0_1),
		.RX_Data_Valid(RX_Data_Valid[1]),
		.RX_Data(RX_Data1));

   // Router Base 2
   router_core_synthed rc2(.RX_Data(RX_Data2),
		  .Clk_R(Clk_R),
		  .Rst_n(Rst_n),
		  .RX_Data_Valid(RX_Data_Valid[2]),
		  .TX_Data_Ready(TX_Data_Ready[2]),
		  .Packet_From_Node_Valid(Packet_From_Node_Valid[2]),
		  .Packet_From_Node(Packet_From_Node2),
		  .r_addr(4'b0010),
		  .Core_Load_Ack(Core_Load_Ack[2]),
		  .Packet_To_Node_Valid(Packet_To_Node_Valid[2]),
		  .RX_Data_Ready(RX_Data_Ready[2]),
		  .TX_Data_Valid(TX_Data_Valid[2]),
		  .TX_Data(TX_Data2),
		  .Packet_To_Node(Packet_To_Node2));

   transmitter_synthed TX2(.TX_Data(TX_Data2),
		.TX_Data_Valid(TX_Data_Valid[2]),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.TX_Ready(TX_Data_Ready[2]),
		.S_Data(s_data2_0));

   receiver_synthed RX2(.RX_Ready(RX_Data_Ready[2]),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.S_Data(s_data1_2),
		.RX_Data_Valid(RX_Data_Valid[2]),
		.RX_Data(RX_Data2));

   /* Generate TX / RX clock signal */
   always begin
      Clk_S = ~Clk_S;
      #0.375;
   end

   /* Generate Router Core clock signal */
   always begin
	Clk_R = ~Clk_R;
	#0.6875;
   end

   initial begin
	Clk_S = 0;
	Clk_R = 0;
	$display("Resetting all...");
	//$monitor("Time: %t - rc0 state: %d  rc1 state: %d rc2 state: %d \n\t\t TX_Data0 Packet: %h RX_Data1 Packet: %h RX_Packet_To_Node: %d rc1_datatype: %b", 
	//	$time, rc0.main_control.state, rc1.main_control.state, rc2.main_control.state, TX_Data0, RX1.RX_Data, Packet_To_Node1, rc1.main_control.data_type); 
	$monitor("Time: %t - TX_Data1 %d", $time, rc0.TX_Data);
	Rst_n = 1'b0;
	#10;
	Rst_n = 1'b1;
	force Packet_From_Node0 = {4'b0001, 1'b0, 24'd42};
	force Packet_From_Node_Valid[0] = 1'b1;
	#125;
	force Packet_From_Node0 = {4'b0001, 1'b0, 24'd100};
	#125;
	force Packet_From_Node_Valid[0] = 1'b0;
	force Packet_From_Node_Valid[1] = 1'b1;
	force Packet_From_Node1 = {4'b0000, 1'b0, 24'd69};
	#500;

	$stop;
   end // initial begin
endmodule // router_core_t


	       

	       
	       
