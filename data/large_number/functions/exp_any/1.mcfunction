#data modify storage large_number:math exp_any.input.base set value 5.0d
#data modify storage large_number:math exp_any.input.expon set value 7.0d

data modify storage large_number:math float_base_int_power.base set from storage large_number:math exp_any.input.base
data modify storage large_number:math float_base_int_power.expon set from storage large_number:math exp_any.input.expon
function large_number:float_base_int_power/fast_power/start
data modify storage large_number:math exp_any.output set from storage large_number:math float_base_int_power.output
