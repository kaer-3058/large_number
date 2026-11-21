#定义域报错

#输入值为负数，且指数取倒数后不是整数
data modify storage large_number:math float_reciprocal.input set from storage large_number:math _expressionss1
function large_number:division/float_reciprocal_8_dici/start

execute store result storage large_number:math temp1 double 1 run data get storage large_number:math float_reciprocal.output
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math float_reciprocal.output
data modify storage large_number:math temp1 set string storage large_number:math _expressionss2 0 1
execute if data storage large_number:math {temp1:"-"} if score #expression_evaluation_test1 large_number.int matches 1 run scoreboard players set #temp_expression_evaluation_error large_number.int 1002

#对负数开偶次根
execute store result score #temp3 large_number.int run data get storage large_number:math _expressionss1
scoreboard players operation #temp3 large_number.int %= 2 const
execute if data storage large_number:math {temp1:"-"} if score #temp3 large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1002

#指数为0
execute if data storage large_number:math {_expressionss1:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1002

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#开n次根

data modify storage large_number:math exp_any.input.base set from storage large_number:math _expressionss2
data modify storage large_number:math exp_any.input.expon set from storage large_number:math _expressionss1
function large_number:exp_any/n_root
data modify storage large_number:math _expressionss3 set from storage large_number:math exp_any.output

scoreboard players set #expression_evaluation_test2 large_number.int 2
