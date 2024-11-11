data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math sstemp05
data modify storage large_number:math sstemps[0] set from storage large_number:math expression_evaluation_variables."ｘ"

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:curve_length/univariate_function/macro2 with storage large_number:math
data modify storage large_number:math sstempr append from storage large_number:math sstemps

function large_number:curve_length/univariate_function/macro3 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/as_entity_1

scoreboard players add #Store_expression_evaluation.definite_integral.loop int 1
execute unless score #Store_expression_evaluation.definite_integral.loop int > #expression_evaluation.definite_integral.dx_times int run function large_number:curve_length/univariate_function/loop1
