//top file
module Floating_Point_Addition();
reg clk; //??????
reg reset; //??????
reg[9:0] x; //10 ??????????
reg[9:0] y;

//???????????????
wire[3:0] exp_diff; //????????????
wire mux_1_en; //???1 ????
wire mux_2_en; //???2 ????
wire mux_3_en; //???3 ????
wire[3:0] mux_1_output; //???1 ?????
wire[5:0] mux_2_output; //???2 ?????
wire[5:0] mux_3_output; //???3 ?????
wire[3:0] shift_right_bit; //????????????????
wire[5:0] shift_right_output; //?????????

wire[5:0] big_alu_result; //????????????
wire[3:0] shift_right_bits; //?????????????
wire[3:0] shift_left_bits; //?????????????
wire shift_right_en; //???????????????
wire shift_left_en; //???????????????
wire[5:0] mux_4_output; //???4 ?????
wire mux_4_en; //???4 ????
wire[5:0] shift_left_right_output; //??????????????????
wire[3:0] incre_bit; //??????????
wire[3:0] decre_bit; //??????????
wire incre_en; //????????????
wire decre_en; //????????????
wire mux_5_en; //???5 ????
wire[3:0] mux_5_output; //???5 ?????
wire[5:0] rounding_sig_result; //????????????
wire[3:0] rounding_exp_result; //????????????
wire[3:0] incre_decre_output; //??????????????
wire[9:0] rounding_output; //????
wire overflow; //?????

//?????????????????
Small_Alu
Small_Alu_instance(
//????
clk,
reset,
x,
y,
//????
exp_diff //????????????????
);

//???
Control
Control_instance(
clk,
reset,
exp_diff,
big_alu_result,
rounding_sig_result,
rounding_exp_result,
//????
shift_right_bits,

shift_left_bits,
shift_right_en,
shift_left_en,
shift_right_bit,
incre_bit,
decre_bit,
incre_en,
decre_en,
mux_1_en,
mux_2_en,
mux_3_en,
mux_4_en,
mux_5_en
);

//???1
Mux
Mux_1_instance(
clk,
reset,
x,
y,
mux_1_en,
mux_1_output
);

//???2
Mux
Mux_2_instance(
clk,
reset,
x,
y,
mux_2_en,
mux_2_output
);

//???3
Mux
Mux_3_instance(
clk,
reset,
x,
y,
mux_3_en,
mux_3_output
);

Shift_Right //????????????????
Shift_Right_instance(
clk,
reset,
shift_right_bit,
mux_2_output,
shift_right_output //??shift_right_bit??mux_2_output ????
);

//???????????
Big_Alu
Big_Alu_instance(
clk,
reset,
shift_right_output,
mux_3_output,
big_alu_result //mux_3_output ?shift_right_output ????????big_alu_result
);

//???4
Mux_4
Mux_4_instance(
clk,
reset,
mux_4_en,
big_alu_result,
rounding_sig_result,
mux_4_output
);

Shift_Left_Right //???????????
Shift_Left_Right_instance(
clk,
reset,
shift_left_bits,
shift_right_bits,
shift_left_en,
shift_right_en,
mux_4_output,
shift_left_right_output //??shift_right_bits ?shift_right_en?mux_4_output ???????shift_left_bits ?shift_left_en??mux_4_output ????
);

//???5
Mux_5
Mux_5_instance(
clk,
reset,
mux_5_en,
mux_1_output,
rounding_exp_result,
mux_5_output
);

Incre_Decre //???????????
Incre_Decre_instance(
clk,
reset,
incre_bit,
decre_bit,
incre_en,
decre_en,
mux_5_output,
incre_decre_output //??incre_bit ?incre_en??mux_5_output??????decre_bit ?decre_en??mux_5_output ???
);

//??????
Rounding
Rounding_instance(
clk,
reset,
shift_left_right_output,
incre_decre_output,
rounding_sig_result, //?????????????????Control ??
rounding_exp_result, //?????????????????Control ??
rounding_output, //????
overflow //????
);

endmodule