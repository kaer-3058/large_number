execute store result storage large_number:math expression_evaluation_variables."ｘ" double .001 run scoreboard players get #implicit_Pos.loop1 large_number.int

#解析逆波兰式 - 实函数
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp1 set from storage large_number:math expression_evaluation.output

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #implicit_Pos.loop1 large_number.int

execute if score #implicit.accuracy.1ex large_number.int matches -10..-8 run function large_number:particle/implicit/accuracy/-10..-8
execute if score #implicit.accuracy.1ex large_number.int matches -7..-4 run function large_number:particle/implicit/accuracy/-7..-4
execute if score #implicit.accuracy.1ex large_number.int matches -3..0 run function large_number:particle/implicit/accuracy/-3..0
execute if score #implicit.accuracy.1ex large_number.int matches 1..4 run function large_number:particle/implicit/accuracy/1..4

execute if score #sstempu large_number.int matches -5..4 run data modify storage large_number:math implicit_Pos append from storage large_number:math temp_xy

scoreboard players add #temp_implicit.loops large_number.int 1
scoreboard players operation #implicit_Pos.loop1 large_number.int += #implicit.step large_number.int
execute unless score #implicit_Pos.loop1 large_number.int > #implicit.x_max large_number.int if score #temp_implicit.loops large_number.int < #implicit.loops large_number.int run function large_number:particle/implicit/loop2
