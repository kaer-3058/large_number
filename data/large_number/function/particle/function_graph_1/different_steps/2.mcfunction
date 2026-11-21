scoreboard players set #temp_function_graph_1.loops large_number.int 0
execute unless score #loop1 large_number.int > #function_graph_1.b large_number.int run function large_number:particle/function_graph_1/different_steps/loop1


execute unless score #large_number.all_tellraw_set large_number.int matches 1 if score #loop1 large_number.int > #function_graph_1.b large_number.int run tellraw @a {"translate":"large_number.function_graph_1.diff_end","fallback":"\u00A77\u00A7o一元函数图像绘制完成"}
execute if score #loop1 large_number.int > #function_graph_1.b large_number.int run scoreboard players set #function_graph_1.start large_number.int 3
