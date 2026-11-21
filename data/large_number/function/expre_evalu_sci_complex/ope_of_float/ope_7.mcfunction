#定义域报错
#真数不能为0，底数不能为0或1
execute if data storage large_number:math _expressionss2{x:.0,i:.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003
execute if data storage large_number:math _expressionss1{x:.0,i:.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003
execute if data storage large_number:math _expressionss1{x:1.0,i:.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1003

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0


#log.a(b)

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math ln_double.input set from storage large_number:math _expressionss2
function large_number:elem_complex_function/ln_high_precision/princ_start
data modify storage large_number:math store_log_expre_1 set from storage large_number:math ln_double.output
data modify storage large_number:math ln_double.input set from storage large_number:math _expressionss1
function large_number:elem_complex_function/ln_high_precision/princ_start
data modify storage large_number:math complex_operation.z1 set from storage large_number:math ln_double.output
data modify storage large_number:math complex_operation.z2 set from storage large_number:math store_log_expre_1
function large_number:complex_operation/division_direct
data modify storage large_number:math _expressionss3 set from storage large_number:math complex_operation.output
