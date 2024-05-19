##单位向量法测距离 - 输入两点差值的绝对值
#感谢小豆

#输入
#data modify storage large_number:math unit_vector_modu.input set value [0.0,0.0,0.0]

#执行
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:unit_vector_for_distance_modu

#输入值范围：100x+100y+100z ≤2147483

execute store result storage large_number:math buffer_all_xyz[0] double 0.0001 store result score #v.x int run data get storage large_number:math unit_vector_modu.input[0] 100.0
execute store result storage large_number:math buffer_all_xyz[1] double 0.0001 store result score #v.y int run data get storage large_number:math unit_vector_modu.input[1] 100.0
execute store result storage large_number:math buffer_all_xyz[2] double 0.0001 store result score #v.z int run data get storage large_number:math unit_vector_modu.input[2] 100.0

data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute in minecraft:overworld positioned .0 .0 .0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage large_number:math buffer_all_xyz set from entity @s Pos

execute store result score #i.x int run data get storage large_number:math buffer_all_xyz[0] 10000.0
execute store result score #i.y int run data get storage large_number:math buffer_all_xyz[1] 10000.0
execute store result score #i.z int run data get storage large_number:math buffer_all_xyz[2] 10000.0

scoreboard players operation #v.x int += #v.y int
execute store result score #temp1 int run scoreboard players operation #v.x int += #v.z int
scoreboard players operation #i.x int += #i.y int
scoreboard players operation #i.x int += #i.z int

#模除
scoreboard players operation #v.x int /= #i.x int
scoreboard players operation #v.x int *= 1000 const
scoreboard players operation #temp1 int %= #i.x int
scoreboard players operation #temp1 int *= 1000 const
scoreboard players operation #temp1 int /= #i.x int
execute store result score #distance int run scoreboard players operation #v.x int += #temp1 int
