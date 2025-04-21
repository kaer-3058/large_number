execute store result storage large_number:math expression_evaluation_variables."ｘ" double .001 run scoreboard players get #implicit_Pos.loop1 int

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:particle/implicit/macro1 with storage large_number:math

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #implicit_Pos.loop1 int

execute if score #implicit.accuracy.1ex int matches -10..-8 run function large_number:particle/implicit/accuracy/-10..-8
execute if score #implicit.accuracy.1ex int matches -7..-4 run function large_number:particle/implicit/accuracy/-7..-4
execute if score #implicit.accuracy.1ex int matches -3..0 run function large_number:particle/implicit/accuracy/-3..0
execute if score #implicit.accuracy.1ex int matches 1..4 run function large_number:particle/implicit/accuracy/1..4

execute if score #sstempu int matches -5..4 run data modify storage large_number:math implicit_Pos append from storage large_number:math temp_xy

scoreboard players add #temp_implicit.loops int 1
scoreboard players operation #implicit_Pos.loop1 int += #implicit.step int
execute unless score #implicit_Pos.loop1 int > #implicit.x_max int if score #temp_implicit.loops int < #implicit.loops int run function large_number:particle/implicit/loop2
