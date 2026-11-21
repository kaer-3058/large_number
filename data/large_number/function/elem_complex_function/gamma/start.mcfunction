##复变函数 - 伽玛函数

#data modify storage large_number:math gamma_function.input set value {x:2.0,i:5.1}
#实部输入范围为区间：[-170.3029156, 170.3029156]

#function large_number:elem_complex_function/gamma/start

data modify storage large_number:math stemp_gamma_function_inp set from storage large_number:math gamma_function.input
data modify storage large_number:math gamma_function.output set value {x:0d,i:0d}

#把输入值转化为标准格式的复数
data modify storage large_number:math stemp_gamma_function_inp set value {x:0d,i:0d}
execute store success score #temp1 large_number.int run data modify storage large_number:math stemp_gamma_function_inp merge from storage large_number:math gamma_function.input
execute if score #temp1 large_number.int matches 0 run data modify storage large_number:math stemp_gamma_function_inp.x set from storage large_number:math gamma_function.input

data modify storage large_number:math 1_expression_evaluation_test1_sign set value ""
data modify storage large_number:math 1_expression_evaluation_test1_sign set string storage large_number:math stemp_gamma_function_inp.x 0 1
execute unless data storage large_number:math {1_expression_evaluation_test1_sign:"-"} run function large_number:elem_complex_function/gamma/if/2
execute if data storage large_number:math {1_expression_evaluation_test1_sign:"-"} run function large_number:elem_complex_function/gamma/if/3
