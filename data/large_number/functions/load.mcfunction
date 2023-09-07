scoreboard objectives add const dummy
scoreboard objectives add int dummy

#常量
scoreboard players set -1 const -1
scoreboard players set 0 const 0
scoreboard players set 1 const 1
scoreboard players set 2 const 2
scoreboard players set 3 const 3
scoreboard players set 4 const 4
scoreboard players set 5 const 5
scoreboard players set 6 const 6
scoreboard players set 7 const 7
scoreboard players set 8 const 8
scoreboard players set 9 const 9
scoreboard players set 10 const 10
scoreboard players set 100 const 100
scoreboard players set 1000 const 1000
scoreboard players set 10000 const 10000
scoreboard players set 100000 const 100000
scoreboard players set 1000000 const 1000000
scoreboard players set 10000000 const 10000000
scoreboard players set 100000000 const 100000000
scoreboard players set 1000000000 const 1000000000

scoreboard players set 20 const 20
scoreboard players set 119 const 119
scoreboard players set 4214 const 4214
scoreboard players set 50436 const 50436
scoreboard players set 62831 const 62831
scoreboard players set -62831 const 62831
scoreboard players set 5000 const 5000
scoreboard players set 25 const 25
scoreboard players set 40 const 40

scoreboard players set 45 const 45
scoreboard players set 405 const 405
scoreboard players set 1625 const 1625

#根号10
scoreboard players set 3162 const 3162
scoreboard players set 2776 const 2776


#标记强加载区块
execute in minecraft:overworld run forceload add 0 0 -1 -1

execute in minecraft:overworld run forceload add -29999982 22022220
#setblock -29999982 -64 22022223 minecraft:bedrock
#setblock -29999982 -64 22022222 minecraft:oak_wall_sign


#世界实体 UUID：b09e-44-fded-6-efa5ffffef64
execute in minecraft:overworld run summon minecraft:marker 0.0 0.0 0.0 {UUID:[I;45214,4521453,454565,-4252]}
