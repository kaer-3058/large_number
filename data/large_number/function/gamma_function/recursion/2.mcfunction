##伽玛函数 - 递推公式
#输入范围为区间: [-10.0, 170.6025]

#输入：data modify storage large_number:math gamma_function.input set value 73.2074d

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/recursion/input_add_1
execute store result score #gamma_function_input_inte_test2 int run data get storage large_number:math store_gamma_function_input 10000
execute if score #gamma_function_input_inte_test2 int matches 10001.. run function large_number:gamma_function/recursion/2.1
execute if score #gamma_function_input_inte_test2 int matches ..-1 run function large_number:gamma_function/recursion/2.2
execute if score #gamma_function_input_inte_test2 int matches 0..10000 run function large_number:gamma_function/recursion/2.3
