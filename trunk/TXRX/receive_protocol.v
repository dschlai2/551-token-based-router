module receive_protocol(input S_Data, clk, rst, output reg [54:0] packet, output reg ready);

reg [1:0] state, next_state;

reg [5:0] start_seq, counter , next_counter; 

parameter WAIT = 3'b001, READ = 3'b010 , DONE = 3'b100;

always@(posedge clk, negedge rst) begin

	if(!rst) begin
		state <= 3'b001;
		start_seq <= 6'b111111;
	end
	else
		state <= next_state;
		counter <= next_counter;
end

always@(state, start_seq) begin

	case(state) 

	WAIT: if(start_seq == 6'b011111) begin
		next_state = READ;
		next_counter = 6'd55;
		end
	      else
		next_state = WAIT;

	READ: if(counter == 0)
		next_state = DONE;
	      else begin
		next_state = READ;
		next_counter = counter - 1;
		packet[counter-1] = S_Data;
	     end

	DONE: next_state = WAIT;

	endcase
end
		
always@(state) begin

	if(state == DONE)
		ready = 1'b1;
	else
		ready = 1'b0;
end


//Shifts start sequence over by 1 and adds new input
   always@(posedge clk) begin 
      start_seq <= {start_seq[4:0],S_Data};
   end

endmodule
	

