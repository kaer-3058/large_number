execute store result storage large_number:math expression_evaluation_variables."ｘ" double .001 run scoreboard players get #function_graph_2_Pos.loop1 large_number.int

#解析逆波兰式 - 实函数
function large_number:expression_evaluation_scientific/ope_no_tell
data modify storage large_number:math temp_xy[1] set from storage large_number:math expression_evaluation.output

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #function_graph_2_Pos.loop1 large_number.int
data modify storage large_number:math function_graph_2_Pos append from storage large_number:math temp_xy

scoreboard players add #temp_function_graph_2.loops large_number.int 1
scoreboard players operation #function_graph_2_Pos.loop1 large_number.int += #function_graph_2.step large_number.int
execute unless score #function_graph_2_Pos.loop1 large_number.int > #function_graph_2.x_max large_number.int if score #temp_function_graph_2.loops large_number.int < #function_graph_2.loops large_number.int run function large_number:particle/complex/abs/loop2
