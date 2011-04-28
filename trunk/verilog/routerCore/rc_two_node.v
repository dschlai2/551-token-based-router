module rc_two_node();
   reg Clk_R1, Clk_R2, Clk_X1, Clk_X2;
   reg Rst_n;
   
   reg 	      Packet_From_Node_Valid1, Packet_From_Node_Valid2;
   reg [28:0] Packet_From_Node1, Packet_From_Node2;
   
   
   /* Connections */
   wire [23:0] Packet_To_Node1, Packet_To_Node2;   
   wire        TX_Data_Valid1, TX_Data_Valid2, TX_Data_Ready1, TX_Data_Ready2;
   wire [54:0] TX_Data1, TX_Data2;
   wire       RX_Data_Valid1, RX_Data_Valid2, RX_Data_Ready1, RX_Data_Ready2;
   wire [54:0] RX_Data1, RX_Data2;
   wire        Core_Load_Ack1, Core_Load_Ack2, Packet_To_Node_Valid1, Packet_To_Node_Valid2;
   

   wire       S_Data12, S_Data21;

   defparam rc1.main_control.OUR_ADDRESS = 4'b0;
   
   /* Module instantiations 1 */
   transmitter tx1 (.TX_Data(TX_Data1),
		    .TX_Data_Valid(TX_Data_Valid1),
		    .Clk_S(Clk_X1),
		    .Rst_n(Rst_n),
		    .TX_Ready(TX_Data_Ready1),
		    .S_Data(S_Data12));

   receiver    rx1 (.RX_Ready(RX_Data_Ready1),
		    .Clk_S(Clk_X2),
		    .Rst_n(Rst_n),
		    .S_Data(S_Data21),
		    .RX_Data_Valid(RX_Data_Valid1),
		    .RX_Data(RX_Data1));

   router_core rc1 (.RX_Data(RX_Data1),
		    .Clk_R(Clk_R1),
		    .Rst_n(Rst_n),
		    .RX_Data_Valid(RX_Data_Valid1),
		    .TX_Data_Ready(TX_Data_Ready1),
		    .Packet_From_Node_Valid(Packet_From_Node_Valid1),
		    .RX_Data_Ready(RX_Data_Ready1),
		    .TX_Data_Valid(TX_Data_Valid1),
		    .TX_Data(TX_Data1),
		    .Core_Load_Ack(Core_Load_Ack1),		    
		    .Packet_To_Node(Packet_To_Node1),
		    .Packet_From_Node(Packet_From_Node1),
		    .Packet_To_Node_Valid(Packet_To_Node_Valid1));
   
		   

   /* Module instantiations 2 */
   transmitter tx2 (.TX_Data(TX_Data2),
		    .TX_Data_Valid(TX_Data_Valid2),
		    .Clk_S(Clk_X2),
		    .S_Data(S_Data21),
		    .Rst_n(Rst_n),
		    .TX_Ready(TX_Data_Ready2));
   
   receiver    rx2 (.RX_Ready(RX_Data_Ready2),
		    .Clk_S(Clk_X1),
		    .Rst_n(Rst_n),
		    .S_Data(S_Data12),
		    .RX_Data_Valid(RX_Data_Valid2),
		    .RX_Data(RX_Data2));
   
   router_core rc2 (.RX_Data(RX_Data2),
		    .Clk_R(Clk_R2),
		    .Rst_n(Rst_n),
		    .RX_Data_Valid(RX_Data_Valid2),
		    .TX_Data_Ready(TX_Data_Ready2),
		    .Packet_From_Node_Valid(Packet_From_Node_Valid2),
		    .RX_Data_Ready(RX_Data_Ready2),
		    .TX_Data_Valid(TX_Data_Valid2),
		    .TX_Data(TX_Data2),
		    .Packet_To_Node(Packet_To_Node2),
		    .Packet_From_Node(Packet_From_Node2),
		    .Core_Load_Ack(Core_Load_Ack2),
		    .Packet_To_Node_Valid(Packet_To_Node_Valid2));
   

   always begin
      Clk_R1 = ~Clk_R1;
      Clk_R2 = ~Clk_R2;
      Clk_X1 = ~Clk_X1;
      Clk_X2 = ~Clk_X2;
      #1;
   end

   initial begin
     // $monitor("%t:%bRC1 State: %d   RC2 State: %d, TXi,RXj : %h,%h\t %h,%h\t S_Data12,21: %b %b",$time,Clk_R1, rc1.main_control.state, rc2.main_control.state,TX_Data1,RX_Data2,TX_Data2,RX_Data1, S_Data12, S_Data21);


      $monitor("%t S_Data:%b, Clk:%b Rst:%b RX_Data_Valid:%b, Good_Data:%b, state: %d", $time, rx2.S_Data, Clk_X1, rx2.Rst_n, RX_Data_Valid2, rx2.good_data, rx2.rx_side.state);
      
      Clk_R1 = 0;
      Clk_R2 = 0;
      Clk_X1 = 0;
      Clk_X2 = 0;

      Rst_n = 1'b0;
      #2;
      Rst_n = 1'b1;
      #2;
      

      #1000;
      $stop;
   end // initial begin
   
   
endmodule // router_core_t
