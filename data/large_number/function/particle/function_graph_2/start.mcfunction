##二元函数在矩形范围内的图像

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ和ｙ。

#x_min (1000倍)：scoreboard players set #function_graph_2.x_min int -5000
#x_max (1000倍)：scoreboard players set #function_graph_2.x_max int 5000
#y_min (1000倍)：scoreboard players set #function_graph_2.y_min int -5000
#y_max (1000倍)：scoreboard players set #function_graph_2.y_max int 5000
#步长 (1000倍)：scoreboard players set #function_graph_2.step int 200
#矩形范围不应超出函数实际允许的输入值范围

data modify storage large_number:math function_graph_2_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0,0.0]
scoreboard players operation #function_graph_2_Pos.loop1 int = #function_graph_2.x_min int
scoreboard players operation #function_graph_2_Pos.loop2 int = #function_graph_2.y_min int
execute unless score #function_graph_2_Pos.loop1 int > #function_graph_2.x_max int unless score #function_graph_2_Pos.loop2 int > #function_graph_2.y_max int run function large_number:particle/function_graph_2/loop1


execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.function_graph_2.end","fallback":"\u00A77\u00A7o二元函数图像绘制完成"}
