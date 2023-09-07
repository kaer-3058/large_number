#计算平面向量的方向角。
#给出两个值，计算该坐标下的反正切值
#输入：#y #x  输出：#atan2
#公式：atan2d(y,x)*10000
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:math_trifs/atan2

#输入值不宜超过：150000

data modify storage math temp_atan2 set value [0.0d,0.0d,0.0d]
execute store result storage math temp_atan2[0] double 0.0001 run scoreboard players get #y int
execute store result storage math temp_atan2[2] double 0.0001 run scoreboard players get #x int
data modify entity @s Pos set from storage math temp_atan2
execute in minecraft:overworld positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~
execute store result score #atan2 int run data get entity @s Rotation[0] -10000

#感谢：小豆