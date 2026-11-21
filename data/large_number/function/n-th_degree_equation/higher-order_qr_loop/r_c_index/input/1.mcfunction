data modify storage large_number:math c_list append from storage large_number:math temp_balance_input[1][0]
data modify storage large_number:math r_list set from storage large_number:math temp_balance_input[0]
data remove storage large_number:math r_list[0]