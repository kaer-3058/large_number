##一元函数在[a,b]的图像

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ。

#a (1000倍)：scoreboard players set #function_graph_1.a large_number.int -7000
#b (1000倍)：scoreboard players set #function_graph_1.b large_number.int 7000
#步长 (1000倍)：scoreboard players set #function_graph_1.step large_number.int 200
#[a,b]区间不应超出函数实际允许的输入值范围

#值域限制
#上限：scoreboard players set #function_graph_1.max_y large_number.int 15000
#下限：scoreboard players set #function_graph_1.min_y large_number.int -15000
#如果分数存在则有限制，没有则无限制，默认无限制

data modify storage large_number:math function_graph_1_Pos set value []
data modify storage large_number:math function_graph_1_polar_coordinates_r_Pos set value []
data modify storage large_number:math function_graph_1_polar_coordinates_theta_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0]
scoreboard players operation #loop1 large_number.int = #function_graph_1.a large_number.int
execute unless score #loop1 large_number.int > #function_graph_1.b large_number.int run function large_number:particle/function_graph_1/loop1


execute unless score #large_number.all_tellraw_set large_number.int matches 1 run tellraw @a {"translate":"large_number.function_graph_1.end","fallback":"\u00A77\u00A7o一元函数图像绘制完成"}
