module Shift_Left_Right(clk,res,shift_left_bits,shift_right_bits,
  shift_left_en,shift_right_en,mux_4_output,out);
  input clk,res,shift_left_en,shift_right_en;
  input [7:0] shift_left_bits,shift_right_bits;
  input [27:0] mux_4_output;
  output reg [27:0] out;
  
  always @(posedge clk) begin
    if(shift_right_en)
      out = mux_4_output >> shift_right_bits;
    else if(shift_left_en)
      out = mux_4_output << shift_left_bits;
    out[27] = mux_4_output[27];
  end
endmodule