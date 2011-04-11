module control_logic(Clk_R, Rst_n, rx_has_data, address, bad_decode, data_type, packet_to_node_valid, 
			Core_Load_Ack, Packet_From_Node_Valid, buffer_select, 
			tx_data_select, rc_ready, tx_ready, rc_has_data);

   parameter[2:0] TOKEN 3'b111;
   parameter[2:0] ACK 3'b000;
   parameter[2:0] NACK 3'b011;
   parameter[2:0] DATA_C 3'b010;
   parameter[2:0] DATA_3 3'b001;
   
   parameter[3:0] OUR_ADDRESS 4'b0001;

   parameter ERR_STATE          4'd0;   
   parameter CHECK_IF_MASTER 	4'd1;
   parameter SEND_TOKEN		4'd2;
   parameter CHECK_NODE 	4'd3;
   parameter ENCODE 		4'd4;
   parameter SEND_TX 		4'd5;
   parameter LISTEN_WITH_TOKEN 	4'd6;
   parameter LISTEN_NO_TOKEN 	4'd7;
   parameter FORWARD		4'd8;
   parameter CHECK_ADDRESS      4'd9;
   parameter SEND_NODE		4'd10;
   
   input rx_has_data, bad_decode, Packet_From_Node_Valid, tx_ready, clk, rst;
   input [3:0] address;
   input [2:0] data_type;
   
	output rc_ready, Packet_To_Node_Valid, Core_Load_Ack, buffer_select, rc_has_data;
	output [1:0] tx_data_select;

	reg [3:0] state, next_state;
	wire token, ack, nack, check, three;

	always@(posedge Clk_R negedge Rst_n)begin
		if(!Rst_N)
			state <= CHECK_IF_MASTER;
		else
			state <= next_state;
	end

  
			
   // Next state logic
   always@(*)begin
      case(state)
	CHECK_IF_MASTER: begin
	   if(OUR_ADDRESS == 4'b0000)
	     next_state = CHECK_NODE;
	   else
	     next_state = LISTEN_NO_TOKEN;
	end
	CHECK_NODE: begin
	   if(Packet_From_Node_Valid)
	     next_state = ENCODE;
	   else begin
	      if(tx_ready)
		next_state = SEND_TOKEN;
	      else
		next_state = CHECK_NODE;
	   end
	end
	SEND_TOKEN:
	  next_state = LISTEN_NO_TOKEN;
	ENCODE: begin
	   if(tx_ready)
	     next_state = SEND_TX;
	   else
	     next_state = ENCODE;
	end
	
	SEND_TX:
	  next_state = LISTEN_WITH_TOKEN;
	
	LISTEN_WITH_TOKEN:
	  if(rx_has_data) begin
	     if(data_type == nack) 
	       next_state = ENCODE;
	     else 
	       next_state = CHECK_NODE;
	  end
	  else
	    next_state = LISTEN_WITH_T0KEN;

	LISTEN_NO_TOKEN:
	  if (~rx_has_data)
	    next_state = LISTEN_NO_TOKEN;
	  else
	    next_state = CHECK_ADDRESS;

	CHECK_ADDRESS:
	  if (data_type == TOKEN)
	    next_state = CHECK_NODE;
	  else if (data_type == ACK | data_type == NACK)
	    next_state = FORWARD;
	  else if (address != OUR_ADDRESS)
	    next_state = FORWARD;
	  else
	    next_state = SEND_NODE;

	FORWARD:
	  next_state = LISTEN_NO_TOKEN;

	SEND_NODE:
	  next_state = LISTEN_NO_TOKEN;

	default:
	  next_state = ERR_STATE;
      endcase // case (state)
   end // always@ (*)
   
	
			 
			 
			 


   