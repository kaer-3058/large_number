##伽玛函数 - 递推公式

#仅取输入值的前四位小数

execute store result storage large_number:math store_gamma_function_input2 double .0001 run data get storage large_number:math gamma_function.input 10000
data modify storage large_number:math store_gamma_function_input set from storage large_number:math store_gamma_function_input2

#判断输入值是不是整数
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math store_gamma_function_input
execute store success score #gamma_function_input_inte_test1 int run data modify storage large_number:math temp1 set from storage large_number:math store_gamma_function_input
execute if score #gamma_function_input_inte_test1 int matches 0 run function large_number:gamma_function/recursion/1
execute if score #gamma_function_input_inte_test1 int matches 1 run function large_number:gamma_function/recursion/2
