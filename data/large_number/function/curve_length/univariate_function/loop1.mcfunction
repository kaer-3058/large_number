data modify storage large_number:math expression_evaluation_variables."ｘ" set from storage large_number:math sstemp05
data modify storage large_number:math sstemps[0] set from storage large_number:math expression_evaluation_variables."ｘ"

#解析逆波兰式 - 实函数
function large_number:expression_evaluation_scientific/ope_no_tell
execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0
data modify storage large_number:math sstemps[1] set from storage large_number:math expression_evaluation.output

data modify storage large_number:math sstempr append from storage large_number:math sstemps

function large_number:curve_length/univariate_function/macro3 with storage large_number:math
execute as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/as_entity_1

scoreboard players add #Store_expression_evaluation.definite_integral.loop large_number.int 1
execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int > #expression_evaluation.definite_integral.dx_times large_number.int run function large_number:curve_length/univariate_function/loop1
