#相对坐标转局部坐标(放大一万倍输出)
#需要传入世界实体、执行朝向和xyz
#感谢小豆

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:uvw/xyztouvw

execute positioned 0.0 0.0 0.0 run tp @s ^1 ^ ^
data modify storage math temp1 set from entity @s Pos
execute store result score #u int run data get storage math temp1[0] 10000
execute store result score #i.y int run data get storage math temp1[1] 10000
execute store result score #i.z int run data get storage math temp1[2] 10000
scoreboard players operation #u int *= #x int
scoreboard players operation #i.y int *= #y int
scoreboard players operation #i.z int *= #z int

execute positioned 0.0 0.0 0.0 run tp @s ^ ^1 ^
data modify storage math temp1 set from entity @s Pos
execute store result score #v int run data get storage math temp1[0] 10000
execute store result score #j.y int run data get storage math temp1[1] 10000
execute store result score #j.z int run data get storage math temp1[2] 10000
scoreboard players operation #v int *= #x int
scoreboard players operation #j.y int *= #y int
scoreboard players operation #j.z int *= #z int

execute positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1
data modify storage math temp1 set from entity @s Pos
execute store result score #w int run data get storage math temp1[0] 10000
execute store result score #k.y int run data get storage math temp1[1] 10000
execute store result score #k.z int run data get storage math temp1[2] 10000
scoreboard players operation #w int *= #x int
scoreboard players operation #k.y int *= #y int
scoreboard players operation #k.z int *= #z int

scoreboard players operation #u int += #i.y int
scoreboard players operation #u int += #i.z int
scoreboard players operation #v int += #j.y int
scoreboard players operation #v int += #j.z int
scoreboard players operation #w int += #k.y int
scoreboard players operation #w int += #k.z int
