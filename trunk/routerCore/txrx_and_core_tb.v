// HOW TO USE: Change "data_packet_to_send" to whatever 55 bit packet you want to send.
// Not guaranteed to work.

module txrx_and_core_tb();

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
   //defparam rc.main_control.OUR_ADDRESS = 4'b0;

   // Master input output wires (From other cores)
   reg Clk_S, Clk_R, Rst_n;
   reg S_Data_in;
   reg [61:0] data_packet_to_send;
   wire S_Data_out;

   // Wires to and from "Processor Node"
   wire Core_Load_Ack, Packet_From_Node_Valid, Packet_To_Node_Valid;
   wire [23:0] Packet_To_Node;
   wire [28:0] Packet_From_Node;

   // Wires between modules
   wire TX_Data_Ready, TX_Data_Valid, RX_Data_Ready, RX_Data_Valid;
   wire [54:0] RX_Data, TX_Data;

   integer i;

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

   /* Generate TX / RX clock signal */
   always begin
      Clk_S = ~Clk_S;
      #2;
   end

   /* Generate Router Core clock signal */
   always begin
	Clk_R = ~Clk_R;
	#4;
   end

   

   initial begin
	// Send a NACK
	data_packet_to_send = 61'b01_1111_0111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_111;
   end

   initial begin
	Clk_S = 0;
	Clk_R = 0;
	$display("Resetting...");
	$monitor("%t: Clk_S: %b S_Data_in: %b  S_Data_out: %b RX_Data_Valid: %b", $time,Clk_S, S_Data_in, S_Data_out, RX.RX_Data_Valid); 
	Rst_n = 1'b0;
	#10;
	Rst_n = 1'b1;
	for(i = 0; i < 61; i = i + 1)begin
		S_Data_in = data_packet_to_send[60];
		data_packet_to_send = data_packet_to_send << 1;
		#2;
	end
	S_Data_in = 1'b0;
	#500;
	$stop;
   end // initial begin
endmodule // router_core_t


	       

	       
	       
