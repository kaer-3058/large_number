execute unless score #function_graph_2_Pos.loop2 large_number.int > #function_graph_2.y_max large_number.int run function large_number:particle/complex/abs/loop1


execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #function_graph_2_Pos.loop2 large_number.int > #function_graph_2.y_max large_number.int run tellraw @a {"translate":"large_number.function_graph_2.diff_end","fallback":"\u00A77\u00A7o二元函数图像绘制完成"}
execute if score #function_graph_2_Pos.loop2 large_number.int > #function_graph_2.y_max large_number.int run scoreboard players set #function_graph_2_Pos.tick_start_deff2 large_number.int 5
