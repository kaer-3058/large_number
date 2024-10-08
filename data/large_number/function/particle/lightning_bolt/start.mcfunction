##模拟闪电

#端点间距 (放大千倍，正数)：scoreboard players set #lightning_bolt.length int 12000
#给定单段长度最大值 (放大百倍，必须为小于等于端点间距的正数)：scoreboard players set #lightning_bolt.a_segment int 40
#k值（放大一万倍）：scoreboard players set #lightning_bolt.k int 2367
#k值类似于波动倍率，能直接控制闪电波动的强度，范围是[0,0.5]。当k为0时闪电是一条直线段。

#参考自：https://www.bilibili.com/video/BV1BBtVeaEWv

#根据长度取两点
data modify storage large_number:math temp_lnb_points set value [[0d,0d,0d],[0d,0d,0d]]
execute store result storage large_number:math temp_lnb_points[1][2] double .001 run scoreboard players get #lightning_bolt.length int

#循环，初始化一些所需的变量
data modify storage large_number:math lightning_bolt_Pos set value []
data modify storage large_number:math s0 set value [0.0,0.0,0.0]
execute if data storage large_number:math temp_lnb_points[1] run function large_number:particle/lightning_bolt/loop
data modify storage large_number:math lightning_bolt_Pos append from storage large_number:math temp_lnb_points[0]
