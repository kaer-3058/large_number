data modify storage large_number:math temp_balance_input[0][5] set from storage large_number:math c_list[0]
data modify storage large_number:math temp_balance_input[1][5] set from storage large_number:math c_list[1]
data modify storage large_number:math temp_balance_input[2][5] set from storage large_number:math c_list[2]
data modify storage large_number:math temp_balance_input[3][5] set from storage large_number:math c_list[3]
data modify storage large_number:math temp_balance_input[4][5] set from storage large_number:math c_list[4]
data modify storage large_number:math temp_balance_input[6][5] set from storage large_number:math c_list[5]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[5][5]
data modify storage large_number:math temp_balance_input[5] set value [0d,0d,0d,0d]
data modify storage large_number:math temp_balance_input[5] append from storage large_number:math r_list[]
data modify storage large_number:math temp_balance_input[5] insert 5 from storage large_number:math temp1
