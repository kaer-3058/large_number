#loop
scoreboard players operation #temp large_number.int = #Store_expression_evaluation.definite_integral.loop large_number.int
execute store result storage large_number:math sstempc int 1 run scoreboard players get #temp large_number.int
function large_number:definite_integral/riemann_integral/macro1 with storage large_number:math
data modify storage large_number:math sstempd set from storage large_number:math q1
data modify storage large_number:math sstempc set from storage large_number:math expression_evaluation.definite_integral.a
function large_number:definite_integral/riemann_integral/macro2 with storage large_number:math
execute as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:definite_integral/riemann_integral/as_entity_1

#解析逆波兰式 - 实函数
function large_number:definite_integral/int_expression_ope
data modify storage large_number:math sstempr set from storage large_number:math expression_evaluation.output

scoreboard players add #Store_expression_evaluation.definite_integral.loop large_number.int 1
execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int > #Store_expression_evaluation.definite_integral.dx_times large_number.int run function large_number:definite_integral/riemann_integral/loop

#execute unless score #Store_expression_evaluation.definite_integral.loop large_number.int matches 169.. run function large_number:definite_integral/riemann_integral/loop
