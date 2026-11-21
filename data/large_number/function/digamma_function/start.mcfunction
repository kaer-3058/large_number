##Digamma函数

#公式：ψ(x)~ln(x)-1/(2x)-1/(12(x^2))

#data modify storage large_number:math digamma_function.input set value 788.233

#function large_number:digamma_function/start

#data get storage large_number:math digamma_function.output

data modify storage large_number:math temp_digamma_function_inp set from storage large_number:math digamma_function.input

execute store result score #digamma_function_input_test1 large_number.int run data get storage large_number:math temp_digamma_function_inp
execute if score #digamma_function_input_test1 large_number.int matches 0.. run function large_number:digamma_function/1
execute unless score #digamma_function_input_test1 large_number.int matches 0.. run function large_number:digamma_function/2

#特殊值
execute if data storage large_number:math digamma_function{input:1.0} run data modify storage large_number:math digamma_function.output set value -.57721566490153286060651209008240243104215933593992d
