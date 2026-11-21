data modify storage large_number:math float_multiply.input1 set from storage large_number:math list_multiply_const_inp[0].x
data modify storage large_number:math templist_multiply_const_with_i_1 set value {x:0d}

#乘法，实部
function large_number:float_mul.high_precision/start
data modify storage large_number:math templist_multiply_const_with_i_1.x set from storage large_number:math float_multiply.output

#乘法，虚部
data modify storage large_number:math float_multiply.input1 set from storage large_number:math list_multiply_const_inp[0].i
execute if data storage large_number:math list_multiply_const_inp[0].i run function large_number:float_mul.high_precision/start
execute if data storage large_number:math list_multiply_const_inp[0].i run data modify storage large_number:math templist_multiply_const_with_i_1.i set from storage large_number:math float_multiply.output

data modify storage large_number:math list_multiply_const_out append from storage large_number:math templist_multiply_const_with_i_1

data remove storage large_number:math list_multiply_const_inp[0]
execute if data storage large_number:math list_multiply_const_inp[0] run function large_number:n-th_degree_equation/list_multiply_const_with_i/loop1
