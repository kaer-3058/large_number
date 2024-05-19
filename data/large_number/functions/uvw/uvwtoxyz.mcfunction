#局部坐标转相对坐标(放大一万倍输出)
#需要传入世界实体、执行朝向和uvw
#感谢小豆

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:uvw/uvwtoxyz

execute positioned 0.0 0.0 0.0 run tp @s ^1 ^ ^
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #x int run data get storage large_number:math temp1[0] 10000
execute store result score #y int run data get storage large_number:math temp1[1] 10000
execute store result score #z int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #x int *= #u int
scoreboard players operation #y int *= #u int
scoreboard players operation #z int *= #u int

execute positioned 0.0 0.0 0.0 run tp @s ^ ^1 ^
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #j.x int run data get storage large_number:math temp1[0] 10000
execute store result score #j.y int run data get storage large_number:math temp1[1] 10000
execute store result score #j.z int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #j.x int *= #v int
scoreboard players operation #j.y int *= #v int
scoreboard players operation #j.z int *= #v int

execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #k.x int run data get storage large_number:math temp1[0] 10000
execute store result score #k.y int run data get storage large_number:math temp1[1] 10000
execute store result score #k.z int run data get storage large_number:math temp1[2] 10000
scoreboard players operation #k.x int *= #w int
scoreboard players operation #k.y int *= #w int
scoreboard players operation #k.z int *= #w int

scoreboard players operation #x int += #j.x int
scoreboard players operation #x int += #k.x int
scoreboard players operation #y int += #j.y int
scoreboard players operation #y int += #k.y int
scoreboard players operation #z int += #j.z int
scoreboard players operation #z int += #k.z int
