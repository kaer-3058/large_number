#loop
scoreboard players operation #temp int = #Store_expression_evaluation.definite_integral.loop int
execute store result storage large_number:math sstempc int 1 run scoreboard players get #temp int
function large_number:definite_integral/riemann_integral/macro1 with storage large_number:math
data modify storage large_number:math sstempd set from storage large_number:math q1
data modify storage large_number:math sstempc set from storage large_number:math expression_evaluation.definite_integral.a
function large_number:definite_integral/riemann_integral/macro2 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:definite_integral/riemann_integral/as_entity_1

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:definite_integral/riemann_integral/macro3 with storage large_number:math

scoreboard players add #temp_definite_integral.loops int 1
scoreboard players add #Store_expression_evaluation.definite_integral.loop int 1
execute unless score #Store_expression_evaluation.definite_integral.loop int > #Store_expression_evaluation.definite_integral.dx_times int if score #temp_definite_integral.loops int < #definite_integral.loops int run function large_number:fourier_series_numerical/int_diff/loop

#execute unless score #Store_expression_evaluation.definite_integral.loop int matches 169.. run function large_number:definite_integral/riemann_integral/loop
