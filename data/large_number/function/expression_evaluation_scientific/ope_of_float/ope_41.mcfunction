#sinh(x)

data modify storage large_number:math hyperbolic_function.input set from storage large_number:math _expressionss2
scoreboard players set #temp_exp_out_so_large large_number.int 0
function large_number:hyperbolic_function/sinh
data modify storage large_number:math _expressionss3 set from storage large_number:math hyperbolic_function.output

#指数运算溢出
execute if score #temp_exp_out_so_large large_number.int matches 1 run scoreboard players set #temp_expression_evaluation_error large_number.int 1101
