##伽玛函数 - 大数阶乘

#输入范围为区间：[-170.3029156, 170.3029156]

#data modify storage large_number:math gamma_function.input set value 17.6022

#function large_number:gamma_function/s_robert_h_w_of_large_number/start

data modify storage large_number:math stemp_gamma_function_inp set from storage large_number:math gamma_function.input
data modify storage large_number:math gamma_function.output set value {mantissa:0.0,expon:0}

data modify storage large_number:math 1_expression_evaluation_test1_sign set value ""
data modify storage large_number:math 1_expression_evaluation_test1_sign set string storage large_number:math stemp_gamma_function_inp 0 1
execute store result score #gamma_function_input_inte_test6 large_number.int run data get storage large_number:math stemp_gamma_function_inp
execute unless data storage large_number:math {1_expression_evaluation_test1_sign:"-"} unless score #gamma_function_input_inte_test6 large_number.int matches 0 run function large_number:gamma_function/s_robert_h_w_of_large_number/if/2
execute unless data storage large_number:math {1_expression_evaluation_test1_sign:"-"} if score #gamma_function_input_inte_test6 large_number.int matches 0 run function large_number:gamma_function/s_robert_h_w_of_large_number/if/5
execute if data storage large_number:math {1_expression_evaluation_test1_sign:"-"} run function large_number:gamma_function/s_robert_h_w_of_large_number/if/3
