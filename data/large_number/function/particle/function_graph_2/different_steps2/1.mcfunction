##二元函数在矩形范围内的图像

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ和ｙ。

#x_min (1000倍)：scoreboard players set #function_graph_2.x_min int -5000
#x_max (1000倍)：scoreboard players set #function_graph_2.x_max int 5000
#y_min (1000倍)：scoreboard players set #function_graph_2.y_min int -5000
#y_max (1000倍)：scoreboard players set #function_graph_2.y_max int 5000
#步长 (1000倍)：scoreboard players set #function_graph_2.step int 200
#矩形范围不应超出函数实际允许的输入值范围

#需要tick执行：function large_number:particle/function_graph_2/different_steps2/tick
#单tick递归次数(不可小于1)：scoreboard players set #function_graph_2.loops int 2
#tick开始的信号：scoreboard players set #function_graph_2_Pos.tick_start_deff2 int 1

#绘制完成会在聊天框有提示
#若在此期间执行粒子显示函数，会看到函数图像逐渐出现的动画


tellraw @a {"translate":"large_number.function_graph_2.diff_start","fallback":"\u00A77\u00A7o二元函数图像开始绘制"}

data modify storage large_number:math function_graph_2_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0,0.0]
scoreboard players operation #function_graph_2_Pos.loop1 int = #function_graph_2.x_min int
scoreboard players operation #function_graph_2_Pos.loop2 int = #function_graph_2.y_min int
scoreboard players set #function_graph_2_Pos.tick_start_deff2 int 2
