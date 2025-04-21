##矩形范围内二元函数零点截面图 (隐式方程F(x,y)=0的图像)

#前置算法：表达式求值 - 科学计算
#函数表达式直接取 "表达式求值 - 科学计算" 解析出来的逆波兰式，取变量为ｘ和ｙ。

#x_min (1000倍)：scoreboard players set #implicit.x_min int -5000
#x_max (1000倍)：scoreboard players set #implicit.x_max int 5000
#y_min (1000倍)：scoreboard players set #implicit.y_min int -5000
#y_max (1000倍)：scoreboard players set #implicit.y_max int 5000
#矩形范围不应超出函数实际允许的输入值范围

#步长 (1000倍)：scoreboard players set #implicit.step int 200
#精度：scoreboard players set #implicit.accuracy.1ex int -2
#以某种精度测试二元函数结果是否接近0。-1表示1E-1精度测试为0，-2表示1E-2精度，以此类推。范围是-10~4。

#需要tick执行：function large_number:particle/implicit/tick
#单tick绘制点数(不可小于1)：scoreboard players set #implicit.loops int 2
#tick开始的信号：scoreboard players set #implicit_Pos.tick_start_deff2 int 1

#绘制完成会在聊天框有提示
#若在此期间执行粒子显示函数，会看到函数图像逐渐出现的动画


execute unless score #large_number.all_tellraw_set int matches 1 run tellraw @a {"translate":"large_number.implicit.start","fallback":"\u00A77\u00A7o隐式方程图像开始绘制"}

data modify storage large_number:math implicit_Pos set value []

data modify storage large_number:math temp_xy set value [0.0,0.0]
scoreboard players operation #implicit_Pos.loop1 int = #implicit.x_min int
scoreboard players operation #implicit_Pos.loop2 int = #implicit.y_min int
scoreboard players set #implicit_Pos.tick_start_deff2 int 2
