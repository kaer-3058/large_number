execute unless score #function_graph_2_Pos.loop2 int > #function_graph_2.y_max int run function large_number:particle/function_graph_2/different_steps1/loop1


execute unless score #large_number.all_tellraw_set int matches 1 if score #function_graph_2_Pos.loop2 int > #function_graph_2.y_max int run tellraw @a {"translate":"large_number.function_graph_2.diff_end","fallback":"\u00A77\u00A7o二元函数图像绘制完成"}
execute if score #function_graph_2_Pos.loop2 int > #function_graph_2.y_max int run scoreboard players set #function_graph_2_Pos.tick_start int 3
