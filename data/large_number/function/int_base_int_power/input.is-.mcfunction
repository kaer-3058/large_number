##浮点除法 - 8位有效数字 - double型取倒数

data modify storage large_number:math float_reciprocal.input set from storage large_number:math int_base_int_power_out
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math int_base_int_power_out set from storage large_number:math float_reciprocal.output
