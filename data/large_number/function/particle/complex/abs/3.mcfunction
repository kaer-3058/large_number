scoreboard players set #temp_function_graph_2.loops large_number.int 0
execute unless score #function_graph_2_Pos.loop1 large_number.int > #function_graph_2.x_max large_number.int run function large_number:particle/complex/abs/loop2
execute if score #function_graph_2_Pos.loop1 large_number.int > #function_graph_2.x_max large_number.int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 large_number.int 2
