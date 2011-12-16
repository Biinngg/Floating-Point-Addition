module Shift_Right(clk, res, shift, mux, outp);
  input clk,res;
  input [31:0] mux;
  input [7:0] shift;
  reg [22:0] fra;
  output reg [22:0] outp;
  always @(posedge clk) begin
    fra = mux[22:0];
    outp = fra>>shift;
    if(!res)
      outp = 0;
    end
endmodule