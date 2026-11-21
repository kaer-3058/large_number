data modify storage large_number:math complex_operation.z1 set from storage large_number:math list_ope_const_inp[0]
data modify storage large_number:math complex_operation.z2 set from storage large_number:math list_ope_const_inp_2[0]

#乘法
function large_number:complex_operation/multiplication
data modify storage large_number:math list_ope_const_out append from storage large_number:math complex_operation.output

data remove storage large_number:math list_ope_const_inp[0]
data remove storage large_number:math list_ope_const_inp_2[0]
scoreboard players remove #sstemprr1 large_number.int 1
execute if score #sstemprr1 large_number.int matches 1.. run function large_number:polynomial_value/c/list_mul_list_bijective_mapping/loop1
