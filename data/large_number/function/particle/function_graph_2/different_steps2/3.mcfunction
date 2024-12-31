scoreboard players set #temp_function_graph_2.loops int 0
execute unless score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int run function large_number:particle/function_graph_2/different_steps2/loop2
execute if score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 int 2
