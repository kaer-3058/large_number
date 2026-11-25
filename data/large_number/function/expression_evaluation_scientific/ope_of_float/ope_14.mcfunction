#定义域报错
#伽玛函数对负整数和零无定义
data modify storage large_number:math stemp1 set string storage large_number:math _expressionss2 0 1
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math _expressionss2
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss2
execute if data storage large_number:math {stemp1:"-"} if score #expression_evaluation_test1 large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1012
execute if data storage large_number:math {_expressionss2:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1012

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#整数阶乘+伽玛函数

data modify storage large_number:math gamma_function.input set from storage large_number:math _expressionss2
scoreboard players set #temp_exp_out_so_large large_number.int 0
function large_number:gamma_function/robert_h_windschitl/start
data modify storage large_number:math _expressionss3 set from storage large_number:math gamma_function.output

#伽玛函数运算溢出
execute if score #gamma_function_input_inte_test2 large_number.int matches 1706244.. run scoreboard players set #temp_expression_evaluation_error large_number.int 1102
execute if score #temp_exp_out_so_large large_number.int matches 1 run scoreboard players set #temp_expression_evaluation_error large_number.int 1102
