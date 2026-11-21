data modify storage large_number:math temp_balance_input[0][1] set from storage large_number:math c_list[0]
data modify storage large_number:math temp_balance_input[2][1] set from storage large_number:math c_list[1]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[1][1]
data modify storage large_number:math temp_balance_input[1] set from storage large_number:math r_list
data modify storage large_number:math temp_balance_input[1] insert 1 from storage large_number:math temp1
