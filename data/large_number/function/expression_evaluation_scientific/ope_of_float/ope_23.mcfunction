#定义域报错
data modify storage large_number:math stemp1 set string storage large_number:math _expressionss2 0 1
execute store result storage large_number:math temp1 double 1 run data get storage large_number:math _expressionss2
execute store success score #expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math _expressionss2
execute if data storage large_number:math {stemp1:"-"} if score #expression_evaluation_test1 large_number.int matches 0 run scoreboard players set #temp_expression_evaluation_error large_number.int 1011
execute if data storage large_number:math {_expressionss2:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1011

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#Digamma函数

data modify storage large_number:math digamma_function.input set from storage large_number:math _expressionss2
function large_number:digamma_function/start
data modify storage large_number:math _expressionss3 set from storage large_number:math digamma_function.output
