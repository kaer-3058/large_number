#定义域报错
#真数只能是正数
data modify storage large_number:math temp1 set string storage large_number:math _expressionss2 0 1
execute if data storage large_number:math {temp1:"-"} run scoreboard players set #temp_expression_evaluation_error large_number.int 1006
execute if data storage large_number:math {_expressionss2:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1006

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#ln(x)

data modify storage large_number:math ln_high_precision.input set from storage large_number:math _expressionss2
function large_number:ln_high_precision/start
data modify storage large_number:math _expressionss3 set from storage large_number:math ln_high_precision.output
