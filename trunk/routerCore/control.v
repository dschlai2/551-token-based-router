module control_logic(Clk_R, Rst_n, rx_has_data, address, bad_decode, type, packet_to_node_valid, 
			Core_Load_Ack, Packet_From_Node_Valid, buffer_select, 
			tx_data_select, rc_ready, tx_ready, rc_has_data);

	parameter[2:0] TOKEN 3'b111;
	parameter[2:0] ACK 3'b000;
	parameter[2:0] NACK 3'b011;
	parameter[2:0] DATA_C 3'b010;
	parameter[2:0] DATA_3 3'b001;
	
	parameter[3:0] OUR_ADDRESS 4'b0001;

	parameter CHECK_IF_MASTER 	4'b0000;
	parameter SEND_TOKEN		4'b0001;
	parameter CHECK_NODE 		4'b0010;
	parameter ENCODE 		4'b0011;
	parameter SEND_TX 		4'b0100;
	parameter LISTEN_WITH_TOKEN 	4'b0101;
	parameter LISTEN_NO_TOKEN 	4'b0110;
	parameter FORWARD		4'b0111;
	parameter CHECK_ADDRESS		4'b1000;
	parameter DECODE		4'b1001;
	parameter SEND_NODE		4'b1010;

	input rx_has_data, bad_decode, Packet_From_Node_Valid, tx_ready, clk, rst;
	input [3:0] address;
	input [2:0] type;

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

	always@(*)begin
		if(rx_has_data)begin
			case(type)
				TOKEN: begin 
					token = 1'b1;
					ack = 1'b0;
					nack = 1'b0;
					check = 1'b0;
					three = 1'b0;
				end
				ACK: begin			
					token = 1'b0;
					ack = 1'b1;
					nack = 1'b0;
					check = 1'b0;
					three = 1'b0;
				end
				NACK: begin
					token = 1'b0;
					ack = 1'b0;
					nack = 1'b1;
					check = 1'b0;
					three = 1'b0;
				end
				DATA_C: begin
					token = 1'b0;
					ack = 1'b0;
					nack = 1'b0;
					check = 1'b1;
					three = 1'b0;
				end
				DATA_3: begin
					token = 1'b0;
					ack = 1'b0;
					nack = 1'b0;
					check = 1'b0;
					three = 1'b1;
				end
				default: begin
					token = 1'b0;
					ack = 1'b0;
					nack = 1'b0;
					check = 1'b0;
					three = 1'b0; 	 
				end
		end
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
				if(rx_has_data)
					if(nack)
				
				else
					next_state = LISTEN_WITH_T0KEN
				
				
				

