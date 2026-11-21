##伽玛函数 - 递推公式

#仅取输入值的前四位小数

#function large_number:gamma_function/recursion/start

execute store result storage large_number:math store_gamma_function_input2 double .0001 run data get storage large_number:math gamma_function.input 10000
data modify storage large_number:math store_gamma_function_input set from storage large_number:math store_gamma_function_input2

#判断输入值是不是整数
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math store_gamma_function_input
execute store success score #gamma_function_input_inte_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math store_gamma_function_input
execute store result score #gamma_function_input_inte_test2 large_number.int run data get storage large_number:math gamma_function.input 10000
execute if score #gamma_function_input_inte_test1 large_number.int matches 0 run function large_number:gamma_function/recursion/1
execute if score #gamma_function_input_inte_test1 large_number.int matches 1 if score #gamma_function_input_inte_test2 large_number.int matches ..1706242 run function large_number:gamma_function/recursion/2

#execute if score #gamma_function_input_inte_test2 large_number.int matches 1706026.. run data modify storage large_number:math gamma_function.output set value 1.797693134856E308
execute if score #gamma_function_input_inte_test2 large_number.int matches 1706243.. run data modify storage large_number:math gamma_function.output set value 1.797693134856E308
