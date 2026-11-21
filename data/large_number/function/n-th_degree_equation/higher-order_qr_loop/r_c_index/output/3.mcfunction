data modify storage large_number:math temp_balance_input[0][2] set from storage large_number:math c_list[0]
data modify storage large_number:math temp_balance_input[1][2] set from storage large_number:math c_list[1]
data modify storage large_number:math temp_balance_input[3][2] set from storage large_number:math c_list[2]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[2][2]
data modify storage large_number:math temp_balance_input[2] set value [0d]
data modify storage large_number:math temp_balance_input[2] append from storage large_number:math r_list[]
data modify storage large_number:math temp_balance_input[2] insert 2 from storage large_number:math temp1

#更新对角矩阵
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_balance_D[2]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_balance_D[2] set from storage large_number:math float_multiply.output
