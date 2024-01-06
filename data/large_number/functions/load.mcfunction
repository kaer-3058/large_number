##load

scoreboard objectives add const dummy
scoreboard objectives add int dummy
scoreboard objectives add if dummy
scoreboard objectives add ln_const dummy

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
scoreboard players set -62831 const -62831
scoreboard players set 5000 const 5000
scoreboard players set 25 const 25
scoreboard players set 40 const 40
scoreboard players set 4750 const 4750
scoreboard players set 24703 const 24703
scoreboard players set 79249 const 79249

scoreboard players set 45 const 45
scoreboard players set 405 const 405
scoreboard players set 1625 const 1625
scoreboard players set 60 const 60
scoreboard players set 24 const 24
scoreboard players set 3600 const 3600
scoreboard players set 400 const 400

#sqrt(10)
scoreboard players set 3162 const 3162
scoreboard players set 2776 const 2776


#标记强加载区块
execute in minecraft:overworld run forceload add 0 0 -1 -2

execute in minecraft:overworld run forceload add -29999982 22022220
#setblock -29999982 -64 22022223 minecraft:bedrock
#setblock -29999982 -64 22022222 minecraft:oak_wall_sign


#世界实体 UUID：b09e-44-fded-6-efa5ffffef64
execute in minecraft:overworld run summon minecraft:marker 0.0 0.0 0.0 {UUID:[I;45214,4521453,454565,-4252]}

#利用矩阵进行计算的展示实体 UUID: 28529-0-3d00-0-2c4200ee8401
execute in minecraft:overworld run summon minecraft:block_display 0.0 0.0 0.0 {UUID:[I;165161,15616,11330,15631361]}

#盔甲架 3faf-0-3d00-0-61900f4241f
execute in minecraft:overworld run summon minecraft:armor_stand -29999982 -63 22022223 {UUID:[I;16303,15616,1561,16000031],Invulnerable:1b,NoGravity:1b}

#解析头颅的base64编码需要的方块
execute in minecraft:overworld run setblock -29999983 -60 22022222 minecraft:air
execute in minecraft:overworld run setblock -29999984 -60 22022222 minecraft:air
execute in minecraft:overworld run setblock -29999984 -59 22022222 minecraft:air
execute in minecraft:overworld run setblock -29999983 -60 22022222 minecraft:observer[facing=east]
execute in minecraft:overworld run setblock -29999984 -60 22022222 minecraft:command_block[facing=up]{Command:'execute if score #cb_run_func:"timestamp/cb_start" int matches 1 if data block -29999982 -60 22022222 SkullOwner.Properties.textures[0].Value run function large_number:timestamp/cb_start',UpdateLastExecution:1b,TrackOutput:1b,CustomName:'{"text":"large_number.timestamp"}'}
execute in minecraft:overworld run setblock -29999984 -59 22022222 minecraft:chain_command_block[facing=up]{Command:'scoreboard players set #cb_run_func:"timestamp/cb_start" int 0',auto:1b,CustomName:'{"text":"large_number.timestamp"}'}


##函数初始化

#单位向量法缓冲区
data modify storage math temp_vec_modulus set value [0.0d,0.0d,0.0d]
