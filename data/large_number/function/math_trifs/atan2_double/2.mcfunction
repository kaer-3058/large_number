#计算平面向量的方向角。
#给出两个值，计算该坐标下的反正切值
#公式：atan2d(y,x)
#data modify storage large_number:math atan2_double.y set value 1.0
#data modify storage large_number:math atan2_double.x set value 1.0
#可以是double或float

#计算：
#execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start with storage large_number:math atan2_double

#输出(角度制)：
#storage large_number:math atan2_double.output

execute rotated ~ .0 run tp @s .0 .0 .0 ~ ~
execute store result score #atan2d int run data get entity @s Rotation[0] -10000
data modify storage large_number:math tx set string storage large_number:math atan2_double.x 0 1
data modify storage large_number:math ty set string storage large_number:math atan2_double.y 0 1
execute unless data storage large_number:math {tx:"-"} unless data storage large_number:math {ty:"-"} unless score #atan2d int matches 0..900000 run scoreboard players add #atan2d int 3600000
execute if data storage large_number:math {tx:"-"} unless data storage large_number:math {ty:"-"} unless score #atan2d int matches 900000..1800000 run scoreboard players add #atan2d int 3600000
execute if data storage large_number:math {tx:"-"} if data storage large_number:math {ty:"-"} unless score #atan2d int matches -1800000..-900000 run scoreboard players remove #atan2d int 3600000
execute unless data storage large_number:math {tx:"-"} if data storage large_number:math {ty:"-"} unless score #atan2d int matches -900000..0 run scoreboard players remove #atan2d int 3600000
execute if score #atan2d int matches -1800000 run scoreboard players set #atan2d int 1800000
execute store result storage large_number:math atan2_double.output double .0001 run scoreboard players get #atan2d int
