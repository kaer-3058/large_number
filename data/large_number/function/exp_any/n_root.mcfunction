##任意正数的幂 - 开n次根

#输入值范围：[0, 2147483647]

#data modify storage large_number:math exp_any.input.base set value 5.0d
#data modify storage large_number:math exp_any.input.expon set value 7.0d

#公式，a^(1/b) = e^(ln(a)/b)

#ln(a)
data modify storage large_number:math ln_high_precision.input set from storage large_number:math exp_any.input.base
function large_number:ln_high_precision/start

#ln(a)/b
data modify storage large_number:math float_division.input1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_division.input2 set from storage large_number:math exp_any.input.expon
function large_number:division/float_12dicimal/start

#e^(ln(a)/b)
data modify storage large_number:math exp_e^x.input set from storage large_number:math float_division.output
function large_number:exp_e.x/2
data modify storage large_number:math exp_any.output set from storage large_number:math exp_e^x.output
