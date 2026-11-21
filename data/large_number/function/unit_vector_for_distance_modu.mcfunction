##单位向量法测距离 - 输入两点差值的绝对值
#感谢小豆

#输入
#data modify storage large_number:math unit_vector_modu.input set value [0.0,0.0,0.0]

#执行
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:unit_vector_for_distance_modu

rotate @s .0 .0
execute store result storage large_number:math buffer_all_xyz[0] double .0001 store result score #distance large_number.int run data get storage large_number:math unit_vector_modu.input[0] 100
execute store result storage large_number:math buffer_all_xyz[1] double .0001 store result score #v.y large_number.int run data get storage large_number:math unit_vector_modu.input[1] 100
execute store result storage large_number:math buffer_all_xyz[2] double .0001 store result score #v.z large_number.int run data get storage large_number:math unit_vector_modu.input[2] 100

data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet run tp ^ ^ ^1
data modify storage large_number:math buffer_all_xyz set from entity @s Pos

execute store result score #i.x large_number.int run data get storage large_number:math buffer_all_xyz[0] 10000
execute store result score #i.y large_number.int run data get storage large_number:math buffer_all_xyz[1] 10000
execute store result score #i.z large_number.int run data get storage large_number:math buffer_all_xyz[2] 10000

scoreboard players operation #distance large_number.int += #v.y large_number.int
execute store result score #temp1 large_number.int run scoreboard players operation #distance large_number.int += #v.z large_number.int
scoreboard players operation #i.x large_number.int += #i.y large_number.int
scoreboard players operation #i.x large_number.int += #i.z large_number.int

#模除
scoreboard players operation #distance large_number.int /= #i.x large_number.int
scoreboard players operation #distance large_number.int *= 1000 const
scoreboard players operation #temp1 large_number.int %= #i.x large_number.int
scoreboard players operation #temp1 large_number.int *= 1000 const
scoreboard players operation #temp1 large_number.int /= #i.x large_number.int
scoreboard players operation #distance large_number.int += #temp1 large_number.int
#v.x large_number.int → #distance large_number.int
