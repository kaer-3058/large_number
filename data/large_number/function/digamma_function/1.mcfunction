##Digamma函数

#公式：ψ(x)~ln(x)-1/(2x)-1/(12(x^2))
#x>0的部分

#data modify storage large_number:math digamma_function.input set value 788.233

#function large_number:digamma_function/start

#data get storage large_number:math digamma_function.output

#ln(x)
data modify storage large_number:math ln_double.input set from storage large_number:math temp_digamma_function_inp
function large_number:ln_double/start

#2x
function large_number:digamma_function/macro1 with storage large_number:math

#1/(2x)
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math temp_item_1 set from storage large_number:math float_reciprocal.output

#x^2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_digamma_function_inp
function large_number:float_mul.high_precision/squ/start

#12(x^2)
function large_number:digamma_function/macro3 with storage large_number:math float_multiply

#1/(12(x^2))
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1
function large_number:division/float_reciprocal_8_dici/start

#ln(x)-1/(2x)-1/(12(x^2))
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:digamma_function/as_entity1

data modify storage large_number:math digamma_function.output set from storage large_number:math temp_digamma_function_out

#1.20.4实体用命令设置的高度上限是19999999.9999999，下限是-20000000.0
