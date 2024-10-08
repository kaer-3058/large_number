##单位向量法测距离 - 输入两点差值的绝对值

data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage large_number:math buffer_all_xyz set from entity @s Pos
