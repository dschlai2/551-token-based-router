module router(Clk_S, Clk_R, Rst_n, S_Data_in, 
	      S_Data_out, r_addr, Packet_To_Node,
	      Packet_To_Node_Valid, Core_Load_Ack, 
	      Packet_From_Node_Valid, Packet_From_Node);

   input Clk_S, Clk_R, Rst_n, S_Data_in, Packet_From_Node_Valid;
   input [3:0] r_addr;
   input [28:0] Packet_From_Node;
   output Core_Load_Ack, Packet_To_Node_Valid, S_Data_out;
   output [23:0] Packet_To_Node;

   wire [54:0] RX_Data, TX_Data;




   wire        RX_Data_Valid, TX_Data_Ready, TX_Data_Valid, RX_Data_Ready;

   router_core rc(.RX_Data(RX_Data),
		  .Clk_R(Clk_R),
		  .Rst_n(Rst_n),
		  .RX_Data_Valid(RX_Data_Valid),
		  .r_addr(r_addr),
		  .TX_Data_Ready(TX_Data_Ready),
		  .Packet_From_Node_Valid(Packet_From_Node_Valid),
		  .Packet_From_Node(Packet_From_Node),
		  .Core_Load_Ack(Core_Load_Ack),
		  .Packet_To_Node_Valid(Packet_To_Node_Valid),
		  .RX_Data_Ready(RX_Data_Ready),
		  .TX_Data_Valid(TX_Data_Valid),
		  .TX_Data(TX_Data),
		  .Packet_To_Node(Packet_To_Node));

   transmitter TX(.TX_Data(TX_Data),
		.TX_Data_Valid(TX_Data_Valid),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.TX_Ready(TX_Data_Ready),
		.S_Data(S_Data_out));

   receiver RX(.RX_Ready(RX_Data_Ready),
		.Clk_S(Clk_S),
		.Rst_n(Rst_n),
		.S_Data(S_Data_in),
		.RX_Data_Valid(RX_Data_Valid),
		.RX_Data(RX_Data));
   
 endmodule
