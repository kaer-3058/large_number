#定义域报错
execute store result score #temp1 large_number.int run data get storage large_number:math _expressionss2 1000000000
execute if score #temp1 large_number.int matches ..885603193 run scoreboard players set #temp_expression_evaluation_error large_number.int 1008

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#逆伽玛函数

data modify storage large_number:math inverse_gamma_function.input set from storage large_number:math _expressionss2
function large_number:inverse_gamma_function/start
data modify storage large_number:math _expressionss3 set from storage large_number:math inverse_gamma_function.output
