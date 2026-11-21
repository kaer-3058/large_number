##伽玛函数

#输入范围为区间：[-170.3029156, 170.3029156]

#data modify storage large_number:math gamma_function.input set value 17.6022

#function large_number:gamma_function/robert_h_windschitl/start

data modify storage large_number:math stemp_gamma_function_inp set from storage large_number:math gamma_function.input

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math stemp_gamma_function_inp
execute store success score #1.expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math stemp_gamma_function_inp
execute if score #1.expression_evaluation_test1 large_number.int matches 0 run function large_number:gamma_function/robert_h_windschitl/if/1
data modify storage large_number:math 1_expression_evaluation_test1_sign set value ""
data modify storage large_number:math 1_expression_evaluation_test1_sign set string storage large_number:math stemp_gamma_function_inp 0 1
execute store result score #gamma_function_input_inte_test6 large_number.int run data get storage large_number:math stemp_gamma_function_inp
execute if score #1.expression_evaluation_test1 large_number.int matches 1 unless data storage large_number:math {1_expression_evaluation_test1_sign:"-"} unless score #gamma_function_input_inte_test6 large_number.int matches 0 run function large_number:gamma_function/robert_h_windschitl/if/2
execute if score #1.expression_evaluation_test1 large_number.int matches 1 if data storage large_number:math {1_expression_evaluation_test1_sign:"-"} unless score #gamma_function_input_inte_test6 large_number.int matches 0 run function large_number:gamma_function/robert_h_windschitl/if/3
execute if score #gamma_function_input_inte_test6 large_number.int matches 0 run function large_number:gamma_function/robert_h_windschitl/if/5
