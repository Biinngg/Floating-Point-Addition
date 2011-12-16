module Mux_1 (
    input clk, reset, x, y, en,
    output reg out);
    
    initial @(posedge clk) begin
      begin
      if(en)
        out = y;
      else
        out = x;
      end
      begin
      if(reset)
        out = 0;
      end
    end
endmodule