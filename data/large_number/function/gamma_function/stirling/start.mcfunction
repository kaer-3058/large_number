##伽玛函数

#输入范围为区间：(-1, 170.6271]

data modify storage large_number:math store_gamma_function_inp set from storage large_number:math gamma_function.input

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math store_gamma_function_inp
execute store success score #1.expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math store_gamma_function_inp
execute if score #1.expression_evaluation_test1 large_number.int matches 0 run function large_number:gamma_function/stirling/if/1
execute if score #1.expression_evaluation_test1 large_number.int matches 1 run function large_number:gamma_function/stirling/if/2
