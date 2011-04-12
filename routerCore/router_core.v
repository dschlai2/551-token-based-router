module router_core(input [54:0] RX_Data,
		input Clk_R, Rst_n,
		input RX_Data_Valid, TX_Data_Ready, Packet_From_Node_Valid,
		input [28:0] Packet_From_Node,
		output Core_Load_Ack, Packet_To_Node_Valid, RX_Data_Ready, TX_Data_Valid,
		output [54:0] TX_Data,
		output [23:0] Packet_To_Node);

parameter[54:0] TOKEN = {3'b111, 52'b0};
parameter[54:0] ACK = {3'b000, 52'b0};
parameter[54:0] NACK = {3'b011, 52'b0};

wire bad_decode, buffer_select, rx_has_data, rc_ready, tx_ready, rc_has_data;
wire[3:0] address;
wire[2:0] data_type, tx_data_select;
wire[54:0] enc_to_buf, buf_to_mux;

rx_handshake rHandshake(.rc_ready(rc_ready),
			.rx_has_data(rx_has_data),
			.RX_Data_Ready(RX_Data_Ready),
			.RX_Data_Valid(RX_Data_Valid),
			.clk(Clk_R),
			.rst_n(Rst_n));

tx_handshake tHandshake(.tx_ready(tx_ready),
			.rc_has_data(rc_has_data),
			.TX_Data_Valid(TX_Data_Valid),
			.TX_Data_Ready(TX_Data_Ready),
			.clk(Clk_R),
			.rst_n(Rst_n));

decode_logic dec_logic(.RX_Data(RX_Data),
			.addr(address),
			.Packet_To_Node(Packet_To_Node),
			.bad_decode(bad_decode),
			.type(data_type));

encode_logic enc_logic(.Packet_From_Node(Packet_From_Node),
			.packet(enc_to_buf));

buffer ever_versetile(.new_value(enc_to_buf),
			.buffer_select(buffer_select),
			.clk(Clk_R),
			.rst_n(Rst_n),
			.out(buf_to_mux));

control_logic main_control(.Clk_R(Clk_r),
			.Rst_n(Rst_n),
			.rx_has_data(rx_has_data),	
			.address(address),
			.bad_decode(bad_decode),
			.data_type(data_type),
			.Packet_To_Node_Valid(Packet_To_Node_Valid),
			.Core_Load_Ack(Core_Load_Ack),
			.Packet_From_Node_Valid(Packet_From_Node_Valid),
			.buffer_select(buffer_select),
			.tx_data_select(tx_data_select),
			.rc_ready(rc_ready),
			.tx_ready(tx_ready),
			.rc_has_data(rc_has_data));

master_mux masterMux(.buffer(buf_to_mux),
			.data(RX_Data),
			.token(TOKEN),
			.ack(ACK),
			.nack(NACK),
			.TX_data_select(tx_data_select),
			.out(TX_Data));

endmodule
