data modify storage large_number:math float_multiply.input1 set from storage large_number:math list_ope_const_inp[0]

#乘法
function large_number:float_mul.high_precision/start
data modify storage large_number:math list_ope_const_out append from storage large_number:math float_multiply.output

data remove storage large_number:math list_ope_const_inp[0]
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:polynomial_value/r/list_multiply_const/loop1
