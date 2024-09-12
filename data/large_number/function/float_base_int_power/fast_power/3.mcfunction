data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_convert_deci[0].c
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_convert_deci[1].c
function large_number:float_mul.high_precision/start
data modify storage large_number:math temp_convert_deci[0].c set from storage large_number:math float_multiply.output
data remove storage large_number:math temp_convert_deci[1]
execute if data storage large_number:math temp_convert_deci[1] run function large_number:float_base_int_power/fast_power/3
