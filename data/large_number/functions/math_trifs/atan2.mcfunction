#计算平面向量的方向角。
#给出两个值，计算该坐标下的反正切值
#输入：#y int  #x int
#公式：atan2d(y,x)

#计算：
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2

#输出(角度制)：
#data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0]

data modify storage math temp_atan2 set value [0.0d,0.0d,0.0d]
execute store result storage math temp_atan2[0] double -0.0001 run scoreboard players get #y int
execute store result storage math temp_atan2[2] double 0.0001 run scoreboard players get #x int
data modify entity @s Pos set from storage math temp_atan2
execute in minecraft:overworld positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~

#感谢：小豆
