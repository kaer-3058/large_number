#missile:explode
#此时已命中目标

execute at @s positioned over world_surface run summon creeper ~ ~ ~ {Fuse:0s,ExplosionRadius:4b}
data modify block 272 70 -30 auto set value 0b
kill @s


# @e[type=minecraft:falling_block,tag=test233]

#执行：
#scoreboard players set #dt int 65
#setblock 274 70 -30 minecraft:redstone_block

#summon marker 276.49 70.20 -28.54 {Tags:["test233"]}
#execute as @e[tag=test233] positioned 282.45 70.00 -61.56 run function large_number:parabola/fire/shoot
#data modify block 272 70 -30 auto set value 1b


#summon minecraft:villager 276.33 70.00 -25.39 {NoAI:1b,Tags:["test6"]}
#execute as @e[tag=test233] positioned 287.50 75.00 -60.37 rotated as @n[tag=test6] run function large_number:parabola/fire/degree_to_dt

#tp @e[tag=test6] 276.33 70.00 -25.39 -180 -70
#setblock 274 70 -30 minecraft:redstone_block
