
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
   reg [3:0] r_addr [NO_ROUTERS-1:0];
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
   r_addr[0] = 4'd0;
   r_addr[1] = 4'd1;
   r_addr[2] = 4'd8;

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
   
endmodule // one_router_tb

	      

	   