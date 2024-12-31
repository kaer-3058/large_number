execute store result storage large_number:math expression_evaluation_variables."ｙ" double .001 run scoreboard players get #function_graph_2_Pos.loop2 int

execute store result storage large_number:math temp_xy[2] double .001 run scoreboard players get #function_graph_2_Pos.loop2 int
scoreboard players operation #function_graph_2_Pos.loop1 int = #function_graph_2.x_min int
execute unless score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 int 3
execute if score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 int 2

scoreboard players operation #function_graph_2_Pos.loop2 int += #function_graph_2.step int
