#局部坐标转相对坐标(放大一万倍输出)
#需要传入世界实体、执行朝向和uvw
#感谢小豆

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:uvw/uvwtoxyz

execute positioned .0 .0 .0 run tp @s ^1 ^ ^
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #x large_number.int run data get storage large_number:math temp1[0] 10000
execute store result score #y large_number.int run data get storage large_number:math temp1[1] 10000
execute store result score #z large_number.int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #x large_number.int *= #u large_number.int
scoreboard players operation #y large_number.int *= #u large_number.int
scoreboard players operation #z large_number.int *= #u large_number.int

execute positioned .0 .0 .0 run tp @s ^ ^1 ^
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #j.x large_number.int run data get storage large_number:math temp1[0] 10000
execute store result score #j.y large_number.int run data get storage large_number:math temp1[1] 10000
execute store result score #j.z large_number.int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #j.x large_number.int *= #v large_number.int
scoreboard players operation #j.y large_number.int *= #v large_number.int
scoreboard players operation #j.z large_number.int *= #v large_number.int

execute positioned .0 .0 .0 run tp @s ^ ^ ^1
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #k.x large_number.int run data get storage large_number:math temp1[0] 10000
execute store result score #k.y large_number.int run data get storage large_number:math temp1[1] 10000
execute store result score #k.z large_number.int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #k.x large_number.int *= #w large_number.int
scoreboard players operation #k.y large_number.int *= #w large_number.int
scoreboard players operation #k.z large_number.int *= #w large_number.int

scoreboard players operation #x large_number.int += #j.x large_number.int
scoreboard players operation #x large_number.int += #k.x large_number.int
scoreboard players operation #y large_number.int += #j.y large_number.int
scoreboard players operation #y large_number.int += #k.y large_number.int
scoreboard players operation #z large_number.int += #j.z large_number.int
scoreboard players operation #z large_number.int += #k.z large_number.int
