module buffer(new_value, buffer_select, clk, rst, out);
    
    input [54:0] new_value;
    input clk, rst, buffer_select;
    output reg [54:0] out;
    
    always@(posedge clk, posedge rst)begin
        // Reset
        if(rst)begin
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
