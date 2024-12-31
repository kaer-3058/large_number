#借助实体旋转角，把输入值钳制在[0,360)区间
data modify entity b09e-44-fded-6-efa5ffffef64 Rotation[0] set from storage large_number:math sin_cos_high_precision.input
execute store result score #sstempx int run data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0] 1000000
execute store result score #sstempz int store result score #sstempy int run scoreboard players operation #sstempx int %= 360000000 const