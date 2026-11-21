##二元函数在矩形范围内的图像

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ和ｙ。

#x_min (1000倍)：scoreboard players set #function_graph_2.x_min large_number.int -5000
#x_max (1000倍)：scoreboard players set #function_graph_2.x_max large_number.int 5000
#y_min (1000倍)：scoreboard players set #function_graph_2.y_min large_number.int -5000
#y_max (1000倍)：scoreboard players set #function_graph_2.y_max large_number.int 5000
#步长 (1000倍)：scoreboard players set #function_graph_2.step large_number.int 200
#矩形范围不应超出函数实际允许的输入值范围

#值域限制
#上限：scoreboard players set #function_graph_2.max_y large_number.int 15000
#下限：scoreboard players set #function_graph_2.min_y large_number.int -15000
#如果分数存在则有限制，没有则无限制，默认无限制


data modify storage large_number:math function_graph_2_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0,0.0]
scoreboard players operation #function_graph_2_Pos.loop1 large_number.int = #function_graph_2.x_min large_number.int
scoreboard players operation #function_graph_2_Pos.loop2 large_number.int = #function_graph_2.y_min large_number.int
execute unless score #function_graph_2_Pos.loop1 large_number.int > #function_graph_2.x_max large_number.int unless score #function_graph_2_Pos.loop2 large_number.int > #function_graph_2.y_max large_number.int run function large_number:particle/function_graph_2/loop1


execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.function_graph_2.end","fallback":"\u00A77\u00A7o二元函数图像绘制完成"}
