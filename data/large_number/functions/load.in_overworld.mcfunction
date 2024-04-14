#标记强加载区块
forceload add 0 0 -1 -1

forceload add -29999982 22022220
#setblock -29999982 -64 22022223 minecraft:bedrock
#setblock -29999982 -64 22022222 minecraft:oak_wall_sign


#世界实体 UUID：b09e-44-fded-6-efa5ffffef64
summon minecraft:marker 0.0 0.0 0.0 {UUID:[I;45214,4521453,454565,-4252],CustomName:'{"text":"large_number.world_entity"}'}

#利用矩阵进行计算的展示实体 UUID: 28529-0-3d00-0-2c4200ee8401
summon minecraft:block_display 0.0 0.0 0.0 {UUID:[I;165161,15616,11330,15631361]}
execute as 28529-0-3d00-0-2c4200ee8401 run function large_number:loga.b_double/nan

#用于attribute计算的盔甲架 3faf-0-3d00-0-61900f4241f
summon minecraft:armor_stand -29999982 -63 22022223 {UUID:[I;16303,15616,1561,16000031],Invulnerable:1b,NoGravity:1b}

#解析头颅的base64编码需要的方块
setblock -29999983 -60 22022222 minecraft:stone
setblock -29999984 -60 22022222 minecraft:stone
setblock -29999984 -59 22022222 minecraft:stone
setblock -29999983 -60 22022222 minecraft:observer[facing=east]
setblock -29999984 -60 22022222 minecraft:command_block[facing=up]{Command:'execute if score #cb_run_func:"timestamp/cb_start" int matches 1 if data block -29999982 -60 22022222 SkullOwner.Properties.textures[0].Value run function large_number:timestamp/cb_start',UpdateLastExecution:1b,TrackOutput:1b,CustomName:'{"text":"large_number.timestamp"}'}
setblock -29999984 -59 22022222 minecraft:chain_command_block[facing=up]{Command:'scoreboard players set #cb_run_func:"timestamp/cb_start" int 0',auto:1b,CustomName:'{"text":"large_number.timestamp"}'}
