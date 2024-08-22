data modify storage large_number:math float_base_int_power.base set value 2.71828182845904523536028747135266249775724709369995d
data modify storage large_number:math float_base_int_power.expon set from storage large_number:math exp_e^x.input
function large_number:float_base_int_power/fast_power/start
data modify storage large_number:math exp_e^x.output set from storage large_number:math float_base_int_power.output
