##浮点除法 - 8位有效数字 - double型取倒数

data modify storage large_number:math float_reciprocal.input set from storage large_number:math float_base_int_power.output
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math float_base_int_power.output set from storage large_number:math float_reciprocal.output
