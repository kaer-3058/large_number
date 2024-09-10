#loop
scoreboard players operation #temp int = #Store_expression_evaluation.definite_integral.loop int
function large_number:definite_integral/riemann_integral/0_1/macro1 with storage large_number:math
data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math temp4

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/macro3 with storage large_number:math

scoreboard players add #Store_expression_evaluation.definite_integral.loop int 1
execute unless score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run function large_number:definite_integral/riemann_integral/0_1/loop

#execute unless score #Store_expression_evaluation.definite_integral.loop int matches 169.. run function large_number:definite_integral/riemann_integral/0_1/loop
