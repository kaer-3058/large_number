##伽玛函数 - 递推公式

#输入：data modify storage large_number:math gamma_function.input set value 73.2074d

execute store result score #gamma_function_input_inte_test2 large_number.int run data get storage large_number:math store_gamma_function_input 10000
execute if score #gamma_function_input_inte_test2 large_number.int matches 10001.. run function large_number:gamma_function/recursion/2.1
execute if score #gamma_function_input_inte_test2 large_number.int matches ..-1 run function large_number:gamma_function/recursion/2.2
execute if score #gamma_function_input_inte_test2 large_number.int matches 0..10000 run function large_number:gamma_function/recursion/2.3
