scoreboard players set #temp_function_graph_1.loops int 0
execute unless score #loop1 int > #function_graph_1.b int run function large_number:particle/function_graph_1/different_steps/loop1


execute if score #loop1 int > #function_graph_1.b int run tellraw @a {"translate":"large_number.function_graph_1.diff_end","fallback":"\u00A77\u00A7o一元函数图像绘制完成"}
execute if score #loop1 int > #function_graph_1.b int run scoreboard players set #function_graph_1.start int 3
