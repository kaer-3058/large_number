##逆伽玛函数 - F.K.Amenyou公式

#data modify storage large_number:math inverse_gamma_function.input set value 21.0

#逆伽玛函数主要是用于，已知x的阶乘求x。
#伽玛函数的函数值与𝑥并不是单射关系，因此需要限制定义域。
#取Γ(𝑥)在𝑥≥0的部分，可以发现这一段函数存在一个极小值𝜆，𝜆≈0.8856031944109。
#定义一个常数𝜑，满足Γ(𝜑)=𝜆，𝜑≈1.4616321449684。
#在[𝜑,∞)区间内，Γ(𝑥)严格单调，所以在𝑥∈[𝜑,∞)时，Γ(𝑥)存在反函数。
#定义隐式𝑥=Γ(𝑦) (𝑦≥𝜆)，满足此关系式的点集就是正实数的逆伽玛函数。定义域为[𝜆,∞)。

#F.K.Amenyou公式：逆Γ(x) ~ [ln(x/√(2π))/W(ln(x/√(2π))/e)]+(1/2)+(1/30x)
#相关论文：https://ir.lib.uwo.ca/etd/5365/，https://www.ams.org/journals/proc/2012-140-04/S0002-9939-2011-11023-2/

#ln(x))
data modify storage large_number:math ln_high_precision.input set from storage large_number:math inverse_gamma_function.input
function large_number:ln_high_precision/start

#ln(x/√(2π))
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:inverse_gamma_function/entity_pos_1

#ln(x/√(2π))/e
data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.input1
data modify storage large_number:math float_multiply.input2 set value 0.36787944117144232159552377016
function large_number:float_mul.high_precision/start

#W(ln(x/√(2π))/e)
data modify storage large_number:math lambertw.input set from storage large_number:math float_multiply.output
data modify storage large_number:math lambertw.branch set value 0
function large_number:lambertw/start

#ln(x/√(2π))/W(ln(x/√(2π))/e)
data modify storage large_number:math float_division.input2 set from storage large_number:math lambertw.output
function large_number:division/float/start

#30x
function large_number:inverse_gamma_function/macro1 with storage large_number:math inverse_gamma_function

#1/30x
function large_number:division/float_reciprocal_8_dici/start

#[ln(x/√(2π))/W(ln(x/√(2π))/e)]+(1/2)+(1/30x)
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:inverse_gamma_function/entity_pos_2

