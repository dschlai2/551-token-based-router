module buffer(new_value, buffer_select, clk, rst_n, out);
    
    input [54:0] new_value;
    input clk, rst_n, buffer_select;
    output reg [54:0] out;
    
    always@(posedge clk, negedge rst_n)begin
        // Reset
        if(~rst_n)begin
           out <= 55'b0;
        end
        
        // Otherwise
        else begin
        if(buffer_select == 1'b1)
            out <= new_value;
        else
            out <= out;
        end // else
        
    end // Always
endmodule
