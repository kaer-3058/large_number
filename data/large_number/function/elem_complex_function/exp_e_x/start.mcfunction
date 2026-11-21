##复变函数 - 指数函数 - e^x

#输入：data modify storage large_number:math exp_e^x.input set value {x:3.177,i:-5.22}
#实部输入范围为区间：(-709, 709.7828)，虚部输入范围为：|x|<2147483647

#function large_number:elem_complex_function/exp_e_x/start

data modify storage large_number:math store_comp_exp_e^x_inp set from storage large_number:math exp_e^x.input

#把输入值转化为标准格式的复数
data modify storage large_number:math temp_comp_exp_e^x_inp set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math temp_comp_exp_e^x_inp merge from storage large_number:math exp_e^x.input
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math temp_comp_exp_e^x_inp.x set from storage large_number:math exp_e^x.input

#e^a
data modify storage large_number:math exp_e^x.input set from storage large_number:math temp_comp_exp_e^x_inp.x
function large_number:exp_e.x/start

#cos(b), sin(b)
data modify storage large_number:math sin_cos_high_precision.input set from storage large_number:math temp_comp_exp_e^x_inp.i
function large_number:math_trifs/sin_cos_high_precision/large_range_start

#结果的实部
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sin_cos_high_precision.cos
data modify storage large_number:math float_multiply.input2 set from storage large_number:math exp_e^x.output
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_comp_exp_e^x_out set value {x:0d,i:0d}
data modify storage large_number:math temp_comp_exp_e^x_out.x set from storage large_number:math float_multiply.output

#虚部
data modify storage large_number:math float_multiply.input1 set from storage large_number:math sin_cos_high_precision.sin
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_comp_exp_e^x_out.i set from storage large_number:math float_multiply.output

data modify storage large_number:math exp_e^x.input set from storage large_number:math store_comp_exp_e^x_inp
data modify storage large_number:math exp_e^x.output set from storage large_number:math temp_comp_exp_e^x_out
