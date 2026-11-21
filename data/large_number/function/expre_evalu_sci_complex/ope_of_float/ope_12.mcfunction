#定义域报错
#真数不能为零
execute if data storage large_number:math _expressionss2{x:.0,i:.0} run scoreboard players set #temp_expression_evaluation_error large_number.int 1006

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0


#ln(x)

data modify storage large_number:math ln_double.input set from storage large_number:math _expressionss2
function large_number:elem_complex_function/ln_high_precision/princ_start
data modify storage large_number:math _expressionss3 set from storage large_number:math ln_double.output
