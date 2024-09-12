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
execute store result storage large_number:math atan2_double.output float -.0000001 run data get entity @s Rotation[0] 10000000
