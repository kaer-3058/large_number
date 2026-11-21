data modify storage large_number:math temp_balance_input[0][8] set from storage large_number:math c_list[0]
data modify storage large_number:math temp_balance_input[1][8] set from storage large_number:math c_list[1]
data modify storage large_number:math temp_balance_input[2][8] set from storage large_number:math c_list[2]
data modify storage large_number:math temp_balance_input[3][8] set from storage large_number:math c_list[3]
data modify storage large_number:math temp_balance_input[4][8] set from storage large_number:math c_list[4]
data modify storage large_number:math temp_balance_input[5][8] set from storage large_number:math c_list[5]
data modify storage large_number:math temp_balance_input[6][8] set from storage large_number:math c_list[6]
data modify storage large_number:math temp_balance_input[7][8] set from storage large_number:math c_list[7]
data modify storage large_number:math temp_balance_input[9][8] set from storage large_number:math c_list[8]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[8][8]
data modify storage large_number:math temp_balance_input[8] set value [0d,0d,0d,0d,0d,0d,0d]
data modify storage large_number:math temp_balance_input[8] append from storage large_number:math r_list[]
data modify storage large_number:math temp_balance_input[8] insert 8 from storage large_number:math temp1
