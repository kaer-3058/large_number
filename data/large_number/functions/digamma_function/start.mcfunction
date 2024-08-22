##Digamma函数

#公式：ψ(x)~ln(x)-1/(2x)

#data modify storage large_number:math digamma_function.input set value 788.233
#输入范围：x>0

#ln(x)
data modify storage large_number:math ln_double.input set from storage large_number:math digamma_function.input
function large_number:ln_double/start

#2x
function large_number:digamma_function/macro1 with storage large_number:math digamma_function

#1/(2x)
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1
function large_number:division/float_reciprocal/start

#ln(x)-1/(2x)
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:digamma_function/as_entity1

#特殊值
execute if data storage large_number:math digamma_function{input:1.0} run data modify storage large_number:math digamma_function.output set value -.57721566490153286060651209008240243104215933593992d

#1.20.4实体用命令设置的高度上限是19999999.9999999，下限是-20000000.0
