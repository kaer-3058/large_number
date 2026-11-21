data modify entity @s Pos[1] set from storage large_number:math temp_log_x_div_e_exp_x
execute at @s run function large_number:gamma_function/stirling_of_large_number/macro1 with storage large_number:math round_double
data modify storage large_number:math float_multiply.input1 set from entity @s Pos[1]
