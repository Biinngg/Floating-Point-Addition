module Mux_4 (clk, res, en, big_alu_result, fra_result, out);
    input clk, res, en;
    input [27:0] big_alu_result, fra_result;
    output reg [27:0] out;
    
    always @(posedge clk) begin
      begin
      if(en)
        out = fra_result;
      else
        out = big_alu_result;
      end
      begin
      if(!res)
        out = 0;
      end
    end
endmodule