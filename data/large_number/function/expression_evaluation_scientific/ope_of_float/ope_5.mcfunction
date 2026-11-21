#定义域报错
#底数为负且指数非整数
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math _expressionss2
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss2
data modify storage large_number:math temp1 set string storage large_number:math _expressionss1 0 1
execute if data storage large_number:math {temp1:"-"} if score #expression_evaluation_test1 large_number.int matches 1 run scoreboard players set #temp_expression_evaluation_error large_number.int 1002

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#乘方运算+指数函数

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math exp_any.input.base set from storage large_number:math _expressionss1
data modify storage large_number:math exp_any.input.expon set from storage large_number:math _expressionss2
scoreboard players set #temp_exp_out_so_large large_number.int 0
function large_number:exp_any/start
data modify storage large_number:math _expressionss3 set from storage large_number:math exp_any.output

#指数运算溢出
execute if score #temp_exp_out_so_large large_number.int matches 1 run scoreboard players set #temp_expression_evaluation_error large_number.int 1101
