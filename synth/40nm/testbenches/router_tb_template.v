`timescale 1ns/1ps


module router_tb_template();

   /* Number of routers to instantiate */
   parameter NO_ROUTERS = 3;
   
   /* Packet identifiers */
   parameter[2:0] TOKEN =  3'b111;
   parameter[2:0] ACK =    3'b000;
   parameter[2:0] NACK =   3'b011;
   parameter[2:0] DATA_C = 3'b010;
   parameter[2:0] DATA_3 = 3'b001;

   /* Global signals */
   reg Clk_S, Rst_n;

   /* Router inputs */
   reg [NO_ROUTERS-1:0] Clk_R, Packet_From_Node_Valid;
   wire [3:0] r_addr [NO_ROUTERS-1:0];
   reg [28:0] Packet_From_Node [NO_ROUTERS-1:0];
   wire [NO_ROUTERS-1:0] S_Data_in;
   
   /* Router outputs */
   wire [NO_ROUTERS-1:0]  Core_Load_Ack, Packet_To_Node_Valid, S_Data_out;
   wire [23:0] Packet_To_Node [NO_ROUTERS-1:0];

   /* For loop counters */
   integer    i,j,k;

   /* Assign connections */
   assign S_Data_in[0] = S_Data_out[2];
   assign S_Data_in[1] = S_Data_out[0];
   assign S_Data_in[2] = S_Data_out[1];

   /* Set addresses */
   assign r_addr[0] = 4'd0;
   assign r_addr[1] = 4'd1;
   assign r_addr[2] = 4'd2;

   /* Instantiate routers */
   router r0 (.Clk_S(Clk_S),
	      .Clk_R(Clk_R[0]),
	      .Rst_n(Rst_n),
	      .S_Data_in(S_Data_in[0]),
	      .Packet_From_Node_Valid(Packet_From_Node_Valid[0]),
	      .r_addr(r_addr[0]),
	      .Packet_From_Node(Packet_From_Node[0]),
	      .Core_Load_Ack(Core_Load_Ack[0]),
	      .Packet_To_Node_Valid(Packet_To_Node_Valid[0]),
	      .S_Data_out(S_Data_out[0]),
	      .Packet_To_Node (Packet_To_Node[0]));
   
   router r1 (.Clk_S (Clk_S),
	      .Clk_R (Clk_R [1]),
	      .Rst_n (Rst_n),
	      .S_Data_in (S_Data_in[1]),
	      .Packet_From_Node_Valid (Packet_From_Node_Valid[1]),
	      .r_addr (r_addr [1]),
	      .Packet_From_Node (Packet_From_Node[1]),
	      .Core_Load_Ack (Core_Load_Ack[1]),
	      .Packet_To_Node_Valid( Packet_To_Node_Valid[1]),
	      .S_Data_out (S_Data_out[1]),
	      .Packet_To_Node (Packet_To_Node[1]));
   
   router r2 (.Clk_S (Clk_S),
	      .Clk_R (Clk_R [2]),
	      .Rst_n (Rst_n),
	      .S_Data_in (S_Data_in[2]),
	      .Packet_From_Node_Valid (Packet_From_Node_Valid[2]),
	      .r_addr (r_addr [2]),
	      .Packet_From_Node (Packet_From_Node[2]),
	      .Core_Load_Ack (Core_Load_Ack[2]),
	      .Packet_To_Node_Valid( Packet_To_Node_Valid[2]),
	      .S_Data_out (S_Data_out[2]),
	      .Packet_To_Node (Packet_To_Node[2]));
   

   /* Send and receive tasks */
   task send;
      input [3:0] router;
      input       encode_type;
      input [3:0] address;
      input [23:0] data;

      begin
	 $display ("send: %d to %d.  Data: %d", router, address, data);
	 Packet_From_Node_Valid[router] = 1'b1;
	 Packet_From_Node[router] = { address, encode_type, data };

	 #2;
      end
   endtask // send
   
   task rcv;
      input [3:0] src;
      input [3:0] router;
      input [23:0] data;

      begin
	 while (Packet_To_Node_Valid[router] === 0) begin
	    #1;
	 end
	 $display ("rcv: %d to %d.  Data: %d", src, router, data);
	 //Packet_To_Node[router] === data;
	 Packet_From_Node_Valid[src] = 1'b0;
      end
   endtask // receive


   /* Clock Signals */
   always  begin
      Clk_S = ~Clk_S;
      #10;
   end
   always begin
      Clk_R[0] = ~Clk_R[0];
      #25;
   end
   always begin
      Clk_R[1] = ~Clk_R[1];
      #25;
   end
   always begin
      Clk_R[2] = ~Clk_R[2];
      #21;
   end


   
   /* Monitor Statements */
 /*always @(r0.RX_Data) $display("%t:Rc0.RX_Data: %h", $time, r0.RX_Data);
  always @(r1.RX_Data) $display("%t:Rc1.RX_Data: %h", $time, r1.RX_Data);
  always @(r2.RX_Data) $display("%t:Rc2.RX_Data: %h", $time, r2.RX_Data);
   
  always @(r0.TX_Data) $display("%t:Rc0.TX_Data: %h", $time, r0.TX_Data);
  always @(r1.TX_Data) $display("%t:Rc1.TX_Data: %h", $time, r1.TX_Data);
  always @(r2.TX_Data) $display("%t:Rc2.TX_Data: %h", $time, r2.TX_Data);   
   */


   initial begin


      /* Start Clocks */
      Clk_S = 1'b0;
      Clk_R = 1'b0;

      /* Reset Modules */
      Rst_n = 1'b0;
      #100;
      Rst_n = 1'b1;

      /* Display Router Stats */
      $display("Router info:");
      for (i = 0; i < NO_ROUTERS; i = i + 1) begin
	 $display ("Router %d has address: %d", i, r_addr[i]);
      end
      

      /* Begin Tests Here */
      $monitor("%t:: Data lines: 0:%d %b\t1: %d %b\t2:%d %b", $time,Packet_To_Node[0], Packet_To_Node_Valid[0],
	       Packet_To_Node[1], Packet_To_Node_Valid[1], Packet_To_Node[2], Packet_To_Node_Valid[2]);
      
      send(4'd0,1'b1,4'd2,24'd1234);
      send(4'd1,1'b0,4'd0,23'd80085);
      #5000;
      $display ("Lowering Packet From Node Valid - should send token.");
      Packet_From_Node_Valid[0] = 0;
      #10000;


      #5000;
      $display ("Lowering packet from node valid - every sends tokens now.");
      $monitor("%t:: %h %h %h", $time, r0.RX_Data, r1.RX_Data, r2.RX_Data);
      Packet_From_Node_Valid[1] = 0;
      Packet_From_Node_Valid[2] = 0;
      #100000;


      $display ("Sending a bunch of packets.  These should always have send/rcv pairs.");
      $monitor("%t:: Data lines: 0:%d %b\t1: %d %b\t2:%d %b", $time,Packet_To_Node[0], Packet_To_Node_Valid[0],
	       Packet_To_Node[1], Packet_To_Node_Valid[1], Packet_To_Node[2], Packet_To_Node_Valid[2]);

      $monitor("%t:: %b",$time, Packet_To_Node_Valid[1]);
      

      send(0,1,2,123);
      rcv(0,2,123);

      send(2,1,1,123);
      rcv(2,1,123);

      send(1,1,2,323);
      rcv(1,2,323);

      #50000;
      send(1,1,2,423);
      rcv(1,2,423);

      #100000;
      send(1,1,0,123);
      rcv(1,0,123);

      send(0,1,2,123);
      rcv(0,2,123);

      #50000;
      send(0,1,1,123);
      rcv(0,1,123);

      #5000;
      send(0,1,2,123);
      rcv(0,2,123);

      #10000;

      $display ("Sending malformed packets - expect bad packet on r0.TX_Data, else NACK");
      send(0,1,2,3948);
      force r1.rc.RX_Data[8:0] = 9'b0;

      $monitor ("%t: TX Data lines: %h, %h, %h",$time, r0.TX_Data, r1.TX_Data, r2.TX_Data);
      #50000;
      
      $stop;
      
   end

endmodule // one_router_tb





      
      
   
	      

	   