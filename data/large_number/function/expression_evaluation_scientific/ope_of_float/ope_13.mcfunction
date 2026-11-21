#定义域报错
#不能对负数开方
data modify storage large_number:math temp1 set string storage large_number:math _expressionss2 0 1
execute if data storage large_number:math {temp1:"-"} run scoreboard players set #temp_expression_evaluation_error large_number.int 1007

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#高精度浮点开方

data modify storage large_number:math double_sqrt.input set from storage large_number:math _expressionss2
scoreboard players set #New_double_sqrt.decimal_add large_number.int 1
function large_number:new_double_ope/double_sqrt
data modify storage large_number:math _expressionss3 set from storage large_number:math double_sqrt.output
