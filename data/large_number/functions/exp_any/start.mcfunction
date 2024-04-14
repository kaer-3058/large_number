##任意正数的幂
#公式：a^b = e^(b*ln(a))

#data modify storage math exp_any.input.base set value 5.0d
#data modify storage math exp_any.input.expon set value 7.0d

#ln(a)
data modify storage math ln_high_precision.input set from storage math exp_any.input.base
function large_number:ln_high_precision/start

#b*ln(a)
data modify storage math float_multiply.input1 set from storage math ln_high_precision.output
data modify storage math float_multiply.input2 set from storage math exp_any.input.expon
function large_number:float_mul.high_precision/start

#e^(b*ln(a))
data modify storage math exp_e^x.input set from storage math float_multiply.output
function large_number:exp_e.x/start
data modify storage math exp_any.output set from storage math exp_e^x.output
