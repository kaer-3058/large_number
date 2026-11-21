data modify storage large_number:math complex_operation.z1 set from storage large_number:math list_ope_const_inp[0]

function large_number:complex_operation/modulus
data modify storage large_number:math list_ope_const_out append from storage large_number:math complex_operation.output

data remove storage large_number:math list_ope_const_inp[0]
execute if data storage large_number:math list_ope_const_inp[0] run function large_number:polynomial_value/c/list_modulus/loop1
