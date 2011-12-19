module Control(clk,res,exp_diff,big_alu_result,
  fra_result,shift_right_bits,
  shift_left_bits,shift_right_en,shift_left_en,shift_right_bit,
  incre_bit,decre_bit,incre_en,decre_en,mux_1_en,mux_2_en,mux_3_en,mux_4_en,mux_5_en);
  integer i;
  reg [7:0] n=0;
  input clk,res;
  input [8:0] exp_diff;
  input [27:0] big_alu_result,fra_result;
  output reg shift_right_en,shift_left_en,incre_en,decre_en;
  output reg mux_1_en,mux_2_en,mux_3_en,mux_4_en,mux_5_en;
  output reg [7:0] shift_right_bit,shift_right_bits;
  output reg [7:0] shift_left_bits,incre_bit,decre_bit;
  
  always @(posedge clk) begin
  n=0;
  //Enables
    if(exp_diff[8])
      fork
        mux_1_en = 1;
        mux_2_en = 0;
        mux_3_en = 1;
      join
    else
      fork
        mux_1_en = 0;
        mux_2_en = 1;
        mux_3_en = 0;
      join
    //shift_right module
    if(exp_diff[7:0]>25)
      shift_right_bit = 25;
    else
      shift_right_bit = exp_diff[7:0];
    shift_right_bit[7] = 1;//mark
    mux_5_en = 0;
    mux_4_en = 0;
    //the incre_decre and shift_left_right module
      if(big_alu_result[26]) // add and overflow.
        fork
        begin
          incre_en = 1;
          decre_en = 0;
          incre_bit = 1;
        end
        begin
          shift_right_en = 1;
          shift_left_en = 0;
          shift_right_bits = 1;
        end
        join
      else
        begin
          for(i=25;big_alu_result[i]==0;i=i-1)
            n=n+1;
          fork
            begin
              decre_en = 1;
              incre_en = 0;
              decre_bit = n;
            end
            begin
              shift_left_en = 1;
              shift_right_en = 0;
              shift_left_bits = n;
            end
          join
        end
    //Rounding module
    if(fra_result)
      begin
        mux_5_en = 1;
        mux_4_en = 1;
        fork
        begin
          incre_en = 1;
          decre_en = 0;
          incre_bit = 1;
        end
        begin
          shift_right_en = 1;
          shift_left_en = 0;
          shift_right_bits = 1;
        end
        join
      end
    //Reset
      if(!res)
        begin
          shift_right_en=0;
          shift_left_en=0;
          incre_en=0;
          decre_en=0;
        end
  end
endmodule