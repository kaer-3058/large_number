##任意正数的幂

#输入值范围：[0, 2147483647]

#data modify storage large_number:math exp_any.input.base set value 5.0d
#data modify storage large_number:math exp_any.input.expon set value 7.0d

#把指数拆为整数部分和小数部分，整数部分用快速幂，小数部分套公式，a^b = e^(b*ln(a))

execute store result storage large_number:math temp_expon_int double 1 run data get storage large_number:math exp_any.input.expon
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:exp_any/as_entity_1

data modify storage large_number:math float_base_int_power.base set from storage large_number:math exp_any.input.base
data modify storage large_number:math float_base_int_power.expon set from storage large_number:math temp_expon_int
function large_number:float_base_int_power/fast_power/start
data modify storage large_number:math temp_power_int set from storage large_number:math float_base_int_power.output

#ln(a)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math exp_any.input.base
function large_number:ln_high_precision/start

#b*ln(a)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_expon_dicimal
function large_number:float_mul.high_precision/start

#e^(b*ln(a))
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_multiply.output
function large_number:exp_e.x/start
data modify storage large_number:math float_multiply.input1 set from storage large_number:math exp_e^x.output

#两部分相乘
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_power_int
function large_number:float_mul.high_precision/start
data modify storage large_number:math exp_any.output set from storage large_number:math float_multiply.output
