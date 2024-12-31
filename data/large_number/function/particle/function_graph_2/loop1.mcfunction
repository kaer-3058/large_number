execute store result storage large_number:math expression_evaluation_variables."ｙ" double .001 run scoreboard players get #function_graph_2_Pos.loop2 int

execute store result storage large_number:math temp_xy[2] double .001 run scoreboard players get #function_graph_2_Pos.loop2 int
scoreboard players operation #function_graph_2_Pos.loop1 int = #function_graph_2.x_min int
execute unless score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int run function large_number:particle/function_graph_2/loop2

scoreboard players operation #function_graph_2_Pos.loop2 int += #function_graph_2.step int
execute unless score #function_graph_2_Pos.loop2 int > #function_graph_2.y_max int run function large_number:particle/function_graph_2/loop1
