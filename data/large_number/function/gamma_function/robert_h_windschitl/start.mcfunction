##伽玛函数

#输入范围为区间：(-1, 170.6271]

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math gamma_function.input
execute store success score #1.expression_evaluation_test1 int run data modify storage large_number:math temp1 set from storage large_number:math gamma_function.input
execute if score #1.expression_evaluation_test1 int matches 0 run function large_number:gamma_function/robert_h_windschitl/if/1
execute if score #1.expression_evaluation_test1 int matches 1 run function large_number:gamma_function/robert_h_windschitl/if/2

execute if data storage large_number:math gamma_function{input:-0.5} run data modify storage large_number:math gamma_function.output set value 1.772453850905516027298167483341145
