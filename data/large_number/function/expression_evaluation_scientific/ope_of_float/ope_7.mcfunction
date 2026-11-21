#定义域报错
#真数必须是正数，底数不能为0或1
data modify storage large_number:math temp1 set string storage large_number:math _expressionss2 0 1
execute if data storage large_number:math {temp1:"-"} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003
execute if data storage large_number:math {_expressionss2:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003
execute if data storage large_number:math {_expressionss1:0.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003
execute if data storage large_number:math {_expressionss1:1.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#log.a(b)

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math ln_high_precision.input set from storage large_number:math _expressionss2
function large_number:ln_high_precision/start
data modify storage large_number:math store_log_expre_1 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math ln_high_precision.input set from storage large_number:math _expressionss1
function large_number:ln_high_precision/start
data modify storage large_number:math float_division.input2 set from storage large_number:math ln_high_precision.output
data modify storage large_number:math float_division.input1 set from storage large_number:math store_log_expre_1
function large_number:division/float/start
data modify storage large_number:math _expressionss3 set from storage large_number:math float_division.output
