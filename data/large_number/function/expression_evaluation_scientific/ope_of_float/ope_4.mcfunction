#定义域报错
#除数为0
execute if data storage large_number:math {_expressionss2:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1001

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#浮点除法

scoreboard players set #expression_evaluation_test2 large_number.int 2

scoreboard players set #stempv large_number.int 0
execute if data storage large_number:math {_expressionss1:1.0} run function large_number:expression_evaluation_scientific/ope_of_float/ope_4.2
execute unless data storage large_number:math {_expressionss1:1.0} run function large_number:expression_evaluation_scientific/ope_of_float/ope_4.1

#报错，除法溢出
execute if score #stempv large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1106
