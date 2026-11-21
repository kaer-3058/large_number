#相对坐标转局部坐标(放大一万倍输出)
#需要传入世界实体、执行朝向和xyz
#感谢小豆

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:uvw/xyztouvw

execute positioned .0 .0 .0 run tp @s ^1 ^ ^
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #u large_number.int run data get storage large_number:math temp1[0] 10000
execute store result score #i.y large_number.int run data get storage large_number:math temp1[1] 10000
execute store result score #i.z large_number.int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #u large_number.int *= #x large_number.int
scoreboard players operation #i.y large_number.int *= #y large_number.int
scoreboard players operation #i.z large_number.int *= #z large_number.int

execute positioned .0 .0 .0 run tp @s ^ ^1 ^
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #v large_number.int run data get storage large_number:math temp1[0] 10000
execute store result score #j.y large_number.int run data get storage large_number:math temp1[1] 10000
execute store result score #j.z large_number.int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #v large_number.int *= #x large_number.int
scoreboard players operation #j.y large_number.int *= #y large_number.int
scoreboard players operation #j.z large_number.int *= #z large_number.int

execute positioned .0 .0 .0 run tp @s ^ ^ ^1
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #w large_number.int run data get storage large_number:math temp1[0] 10000
execute store result score #k.y large_number.int run data get storage large_number:math temp1[1] 10000
execute store result score #k.z large_number.int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #w large_number.int *= #x large_number.int
scoreboard players operation #k.y large_number.int *= #y large_number.int
scoreboard players operation #k.z large_number.int *= #z large_number.int

scoreboard players operation #u large_number.int += #i.y large_number.int
scoreboard players operation #u large_number.int += #i.z large_number.int
scoreboard players operation #v large_number.int += #j.y large_number.int
scoreboard players operation #v large_number.int += #j.z large_number.int
scoreboard players operation #w large_number.int += #k.y large_number.int
scoreboard players operation #w large_number.int += #k.z large_number.int
