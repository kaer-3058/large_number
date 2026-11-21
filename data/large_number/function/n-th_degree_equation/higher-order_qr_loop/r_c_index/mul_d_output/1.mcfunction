data modify storage large_number:math temp_balance_input[1][0] set from storage large_number:math c_list[0]

data modify storage large_number:math temp1 set from storage large_number:math temp_balance_input[0][0]
data modify storage large_number:math temp_balance_input[0] set from storage large_number:math r_list
data modify storage large_number:math temp_balance_input[0] prepend from storage large_number:math temp1
