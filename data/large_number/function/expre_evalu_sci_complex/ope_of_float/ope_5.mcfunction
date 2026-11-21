#乘方运算+指数函数

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math exp_any.input.base set from storage large_number:math _expressionss1
data modify storage large_number:math exp_any.input.expon set from storage large_number:math _expressionss2
scoreboard players set #temp_exp_out_so_large large_number.int 0
function large_number:elem_complex_function/exp_any/princ_start
data modify storage large_number:math _expressionss3 set from storage large_number:math exp_any.output

#指数运算溢出
execute if score #temp_exp_out_so_large large_number.int matches 1 run scoreboard players set #temp_expression_evaluation_error large_number.int 1101
