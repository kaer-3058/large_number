#标记强加载区块
forceload add 1 1 -1 -1

forceload add -29999982 22022220
setblock -29999982 -64 22022223 minecraft:bedrock
setblock -29999982 -64 22022222 minecraft:oak_wall_sign


#世界实体 UUID：b09e-44-fded-6-efa5ffffef64
execute unless entity b09e-44-fded-6-efa5ffffef64 run summon minecraft:marker .0 .0 .0 {UUID:[I;45214,4521453,454565,-4252],CustomName:'{"text":"large_number.world_entity"}'}
execute as b09e-44-fded-6-efa5ffffef64 run function ntre:randomize

#利用矩阵进行计算的方块展示实体 UUID: 28529-0-3d00-0-2c4200ee8401
summon minecraft:block_display .0 .0 .0 {UUID:[I;165161,15616,11330,15631361]}
data remove storage large_number:math temp1
data modify storage large_number:math temp1 set string storage large_number:math buffer_NaN 0 -1
execute unless data storage large_number:math {temp1:"NaN"} as 28529-0-3d00-0-2c4200ee8401 run function large_number:loga.b_double/nan

#物品展示实体 fffffb7c-0-198d-ffff-ff6400004881
summon minecraft:item_display .0 .0 .0 {UUID:[I;-1156,6541,-156,18561]}

#用于attribute计算的盔甲架 3faf-0-3d00-0-61900f4241f
summon minecraft:armor_stand -29999982 -63 22022223 {UUID:[I;16303,15616,1561,16000031],Invulnerable:1b,NoGravity:1b}

#用于暂存物品(单个)的唱片机
setblock -29999984 -60 22022220 minecraft:stone
setblock -29999984 -60 22022220 minecraft:jukebox{RecordItem:{id:"minecraft:stone",count:1}}

#解析头颅的base64编码需要的方块
setblock -29999983 -60 22022222 minecraft:stone
setblock -29999984 -60 22022222 minecraft:stone
setblock -29999983 -60 22022222 minecraft:observer[facing=east]
setblock -29999984 -60 22022222 minecraft:command_block[facing=up]{Command:'\
execute if score #cb_run_func:"timestamp/cb_start" int matches 1 if data block -29999982 -60 22022222 profile.properties[0].value run function large_number:timestamp/cb_start\
',UpdateLastExecution:1b,TrackOutput:1b,CustomName:'{"text":"large_number.timestamp"}'}

