#loop
function large_number:definite_integral/riemann_integral/macro1 with storage large_number:math
data modify storage large_number:math sstempc set from storage large_number:math expression_evaluation.definite_integral.a
function large_number:definite_integral/riemann_integral/macro2 with storage large_number:math
execute as @e[type=minecraft:item] if data entity @s Item{id:"minecraft:stone"} if data entity @s Item.tag{large_number_loot_spawn1:1b} run function large_number:definite_integral/riemann_integral/as_entity_1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/macro3 with storage large_number:math

scoreboard players add #Store_expression_evaluation.definite_integral.loop int 1
execute unless score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int run function large_number:definite_integral/riemann_integral/loop

#execute unless score #Store_expression_evaluation.definite_integral.loop int matches 169.. run function large_number:definite_integral/riemann_integral/loop