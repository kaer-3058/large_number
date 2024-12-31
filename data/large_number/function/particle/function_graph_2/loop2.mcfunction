execute store result storage large_number:math expression_evaluation_variables."ｘ" double .001 run scoreboard players get #function_graph_2_Pos.loop1 int

#解析逆波兰式
data modify storage large_number:math temp_expression_s1 set value []
data modify storage large_number:math temp_expression_s2 set from storage large_number:math expression_evaluation.rev_polish_notation
execute if data storage large_number:math temp_expression_s2[0] run function large_number:expression_evaluation_scientific/ope_of_float/loop1
data modify storage large_number:math temp1 set from storage large_number:math temp_expression_s1[0]
function large_number:particle/function_graph_2/macro1 with storage large_number:math

execute store result storage large_number:math temp_xy[0] double .001 run scoreboard players get #function_graph_2_Pos.loop1 int
data modify storage large_number:math function_graph_2_Pos append from storage large_number:math temp_xy

scoreboard players operation #function_graph_2_Pos.loop1 int += #function_graph_2.step int
execute unless score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int run function large_number:particle/function_graph_2/loop2
