data modify storage large_number:math temp_balance_input[1][0] set from storage large_number:math c_list[0]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[0][0]
data modify storage large_number:math temp_balance_input[0] set from storage large_number:math r_list
data modify storage large_number:math temp_balance_input[0] prepend from storage large_number:math temp1

#更新对角矩阵
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_balance_D[0]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_balance_D[0] set from storage large_number:math float_multiply.output
