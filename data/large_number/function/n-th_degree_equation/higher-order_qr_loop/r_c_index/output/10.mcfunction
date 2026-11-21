data modify storage large_number:math temp_balance_input[0][9] set from storage large_number:math c_list[0]
data modify storage large_number:math temp_balance_input[1][9] set from storage large_number:math c_list[1]
data modify storage large_number:math temp_balance_input[2][9] set from storage large_number:math c_list[2]
data modify storage large_number:math temp_balance_input[3][9] set from storage large_number:math c_list[3]
data modify storage large_number:math temp_balance_input[4][9] set from storage large_number:math c_list[4]
data modify storage large_number:math temp_balance_input[5][9] set from storage large_number:math c_list[5]
data modify storage large_number:math temp_balance_input[6][9] set from storage large_number:math c_list[6]
data modify storage large_number:math temp_balance_input[7][9] set from storage large_number:math c_list[7]
data modify storage large_number:math temp_balance_input[8][9] set from storage large_number:math c_list[8]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[9][9]
data modify storage large_number:math temp_balance_input[9] set value [0d,0d,0d,0d,0d,0d,0d,0d]
data modify storage large_number:math temp_balance_input[9] append from storage large_number:math r_list[]
data modify storage large_number:math temp_balance_input[9] append from storage large_number:math temp1

#更新对角矩阵
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_balance_D[9]
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_balance_D[9] set from storage large_number:math float_multiply.output
