module control_logic(Clk_R, Rst_n, rx_has_data, address, bad_decode, data_type, Packet_To_Node_Valid, 
			Core_Load_Ack, Packet_From_Node_Valid, buffer_select, 
			tx_data_select, rc_ready, tx_ready, rc_has_data);

   parameter[2:0] TOKEN =  3'b111;
   parameter[2:0] ACK =    3'b000;
   parameter[2:0] NACK =   3'b011;
   parameter[2:0] DATA_C = 3'b010;
   parameter[2:0] DATA_3 = 3'b001;
   
   parameter[3:0] OUR_ADDRESS = 4'b0001;

   /* tx_data_select values */
   parameter [2:0] tx_ACK = 3'd0;
   parameter [2:0] tx_NACK = 3'd1;
   parameter [2:0] tx_FORWARD = 3'd2;
   parameter [2:0] tx_TOKEN = 3'd3;
   parameter [2:0] tx_NEW = 3'd4;
   
   /* states */
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
   
   input rx_has_data, bad_decode, Packet_From_Node_Valid, tx_ready, Clk_R, Rst_n;
   input [3:0] address;
   input [2:0] data_type;
   
   output reg  rc_ready, Packet_To_Node_Valid, Core_Load_Ack, buffer_select, rc_has_data;
   output reg [2:0] tx_data_select;
   
   reg [3:0] 	state, next_state;
   
   always@(posedge Clk_R, negedge Rst_n)begin
      if(!Rst_n)
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
	SEND_TOKEN: begin
	  next_state = LISTEN_NO_TOKEN;
	end
	
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
	     if(data_type == NACK) 
	       next_state = ENCODE;
	     else 
	       next_state = CHECK_NODE;
	  end
	  else
	    next_state = LISTEN_WITH_TOKEN;

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
	  else if (bad_decode)
	    next_state = SEND_NACK;
	  else
	    next_state = SEND_NODE;

	SEND_NACK:
	  next_state = LISTEN_NO_TOKEN;
	
	FORWARD:
	  next_state = LISTEN_NO_TOKEN;

	SEND_NODE:
	  next_state = LISTEN_NO_TOKEN;

	default:
	  next_state = ERR_STATE;
      endcase // case (state)
   end // always@ (*)


   /* Output logic */

   always @(state) begin
      case (state)
	CHECK_IF_MASTER: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack= 1'b0;
	   buffer_select= 1'bx;
	   tx_data_select= 2'bx;
	   rc_has_data= 1'b0;
	end

	CHECK_NODE: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'b1;
	   tx_data_select = 2'bx;
	   rc_has_data = 1'b0;
	end

	ENCODE: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'b1;
	   tx_data_select = tx_NEW;
	   rc_has_data = 1'b1;
	end

	SEND_TX: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b1;
	   buffer_select = 1'b0;
	   tx_data_select = tx_NEW;
	   rc_has_data = 1'b1;
	end

	LISTEN_WITH_TOKEN: begin
	   rc_ready = 1'b1;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'b0;
	   tx_data_select = tx_NEW;
	   rc_has_data = 1'b0;
	end

	SEND_TOKEN: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'bx;
	   tx_data_select = tx_TOKEN;
	   rc_has_data = 1'b1;
	end

	LISTEN_NO_TOKEN: begin
	   rc_ready = 1'b1;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'bx;
	   tx_data_select = 3'bx;
	   rc_has_data = 1'b0;
	end

	CHECK_ADDRESS: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'bx;
	   tx_data_select = 3'bx;
	   rc_has_data = 1'b0;
	end

	FORWARD: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'bx;
	   tx_data_select = tx_FORWARD;
	   rc_has_data = 1'b1;
	end

	SEND_NACK: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b0;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'bx;
	   tx_data_select = tx_NACK;
	   rc_has_data = 1'b1;
	end

	SEND_NODE: begin
	   rc_ready = 1'b0;
	   Packet_To_Node_Valid = 1'b1;
	   Core_Load_Ack = 1'b0;
	   buffer_select = 1'bx;
	   tx_data_select = tx_ACK;
	   rc_has_data = 1'b1;
	end

	default: begin
	   rc_ready = 1'bx;
	   Packet_To_Node_Valid = 1'bx;
	   Core_Load_Ack = 1'bx;
	   buffer_select = 1'bx;
	   tx_data_select = tx_ACK;
	   rc_has_data = 1'bx;
	end
      endcase // case (state)
   end // always @ (state)
endmodule // control_logic

	   
	  
	
			 
			 
			 


   