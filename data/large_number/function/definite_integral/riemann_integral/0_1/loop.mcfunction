#loop
scoreboard players operation #temp large_number.int = #Store_expression_evaluation.definite_integral.loop large_number.int
function large_number:definite_integral/riemann_integral/0_1/macro1 with storage large_number:math
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp4

#解析逆波兰式 - 实函数
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math sstempr set from storage large_number:math expression_evaluation.output

scoreboard players add #Store_expression_evaluation.definite_integral.loop large_number.int 1
execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int run function large_number:definite_integral/riemann_integral/0_1/loop

#execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int matches 169.. run function large_number:definite_integral/riemann_integral/0_1/loop
