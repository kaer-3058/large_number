#借助实体旋转角，把输入值钳制在[0,360)区间
data modify entity b09e-44-fded-6-efa5ffffef64 Rotation[0] set from storage large_number:math tan_high_precision.input
execute store result score #sstempx large_number.int run data get entity b09e-44-fded-6-efa5ffffef64 Rotation[0] 1000000
execute store result score #sstempz large_number.int store result score #sstempy large_number.int run scoreboard players operation #sstempx large_number.int %= 360000000 const