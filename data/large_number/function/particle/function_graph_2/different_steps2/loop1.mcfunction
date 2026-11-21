execute store result storage large_number:math expression_evaluation_variables."ｙ" double .001 run scoreboard players get #function_graph_2_Pos.loop2 large_number.int

execute store result storage large_number:math temp_xy[2] double .001 run scoreboard players get #function_graph_2_Pos.loop2 large_number.int
scoreboard players operation #function_graph_2_Pos.loop1 large_number.int = #function_graph_2.x_min large_number.int
execute unless score #function_graph_2_Pos.loop1 large_number.int > #function_graph_2.x_max large_number.int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 large_number.int 3
execute if score #function_graph_2_Pos.loop1 large_number.int > #function_graph_2.x_max large_number.int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 large_number.int 2

scoreboard players operation #function_graph_2_Pos.loop2 large_number.int += #function_graph_2.step large_number.int
