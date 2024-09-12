data remove storage large_number:math temp_particle
execute if block ~ ~ ~ minecraft:white_concrete run data modify storage large_number:math temp_particle set value "{color:[.867f,.882f,.886f],scale:.4}"
execute if block ~ ~ ~ minecraft:orange_concrete run data modify storage large_number:math temp_particle set value "{color:[.91f,.455f,.0f],scale:.4}"
execute if block ~ ~ ~ minecraft:magenta_concrete run data modify storage large_number:math temp_particle set value "{color:[.502f,.067f,.443f],scale:.4}"
execute if block ~ ~ ~ minecraft:light_blue_concrete run data modify storage large_number:math temp_particle set value "{color:[.09f,.459f,.8f],scale:.4}"
execute if block ~ ~ ~ minecraft:yellow_concrete run data modify storage large_number:math temp_particle set value "{color:[.945f,.631f,.043f],scale:.4}"
execute if block ~ ~ ~ minecraft:lime_concrete run data modify storage large_number:math temp_particle set value "{color:[.239f,.675f,.067f],scale:.4}"
execute if block ~ ~ ~ minecraft:pink_concrete run data modify storage large_number:math temp_particle set value "{color:[.761f,.388f,.561f],scale:.4}"
execute if block ~ ~ ~ minecraft:gray_concrete run data modify storage large_number:math temp_particle set value "{color:[.18f,.184f,.216f],scale:.4}"
execute if block ~ ~ ~ minecraft:light_gray_concrete run data modify storage large_number:math temp_particle set value "{color:[.404f,.408f,.384f],scale:.4}"
execute if block ~ ~ ~ minecraft:cyan_concrete run data modify storage large_number:math temp_particle set value "{color:[.035f,.341f,.451f],scale:.4}"
execute if block ~ ~ ~ minecraft:purple_concrete run data modify storage large_number:math temp_particle set value "{color:[.322f,.051f,.557f],scale:.4}"
execute if block ~ ~ ~ minecraft:blue_concrete run data modify storage large_number:math temp_particle set value "{color:[.122f,.094f,.522f],scale:.4}"
execute if block ~ ~ ~ minecraft:brown_concrete run data modify storage large_number:math temp_particle set value "{color:[.353f,.184f,.071f],scale:.4}"
execute if block ~ ~ ~ minecraft:green_concrete run data modify storage large_number:math temp_particle set value "{color:[.235f,.325f,.078f],scale:.4}"
execute if block ~ ~ ~ minecraft:red_concrete run data modify storage large_number:math temp_particle set value "{color:[.49f,.086f,.086f],scale:.4}"
execute if block ~ ~ ~ minecraft:black_concrete run data modify storage large_number:math temp_particle set value "{color:[.004f,.004f,.02f],scale:.4}"

execute store result storage large_number:math sstemp0 int 1 run scoreboard players add #sstemp0 int 1
execute if data storage large_number:math temp_particle run function large_number:particle/holographic_projection/set with storage large_number:math
execute if data storage large_number:math temp_particle run function large_number:particle/holographic_projection/set.test.0 with storage large_number:math
scoreboard players set #temp1 int 0
execute if data storage large_number:math {s1:".0"} run scoreboard players set #temp1 int 1
execute if data storage large_number:math {s2:".0"} run scoreboard players set #temp1 int 1
execute if data storage large_number:math {s3:".0"} run scoreboard players set #temp1 int 1
execute if score #temp1 int matches 1 run function large_number:particle/holographic_projection/set.test.0.2 with storage large_number:math

#添加可解析方块：
#在本函数第18行开始添加如下格式的命令：
#execute if block ~ ~ ~ <方块ID|方块标签>[方块状态]{数据标签} run data modify storage large_number:math temp_particle set value "<dust粒子的四个特殊参数>"
