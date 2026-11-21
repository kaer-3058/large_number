data modify storage large_number:math temp_balance_input[0][3] set from storage large_number:math c_list[0]
data modify storage large_number:math temp_balance_input[1][3] set from storage large_number:math c_list[1]
data modify storage large_number:math temp_balance_input[2][3] set from storage large_number:math c_list[2]
data modify storage large_number:math temp_balance_input[4][3] set from storage large_number:math c_list[3]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[3][3]
data modify storage large_number:math temp_balance_input[3] set value [0d,0d]
data modify storage large_number:math temp_balance_input[3] append from storage large_number:math r_list[]
data modify storage large_number:math temp_balance_input[3] insert 3 from storage large_number:math temp1

#更新对角矩阵
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_balance_D[3]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_balance_D[3] set from storage large_number:math float_multiply.output
