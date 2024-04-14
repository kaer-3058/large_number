data remove storage math temp_particle
execute if block ~ ~ ~ minecraft:white_concrete run data modify storage math temp_particle set value "0.867 0.882 0.886"
execute if block ~ ~ ~ minecraft:orange_concrete run data modify storage math temp_particle set value "0.91 0.455 0"
execute if block ~ ~ ~ minecraft:magenta_concrete run data modify storage math temp_particle set value "0.502 0.067 0.443"
execute if block ~ ~ ~ minecraft:light_blue_concrete run data modify storage math temp_particle set value "0.09 0.459 0.8"
execute if block ~ ~ ~ minecraft:yellow_concrete run data modify storage math temp_particle set value "0.945 0.631 0.043"
execute if block ~ ~ ~ minecraft:lime_concrete run data modify storage math temp_particle set value "0.239 0.675 0.067"
execute if block ~ ~ ~ minecraft:pink_concrete run data modify storage math temp_particle set value "0.761 0.388 0.561"
execute if block ~ ~ ~ minecraft:gray_concrete run data modify storage math temp_particle set value "0.18 0.184 0.216"
execute if block ~ ~ ~ minecraft:light_gray_concrete run data modify storage math temp_particle set value "0.404 0.408 0.384"
execute if block ~ ~ ~ minecraft:cyan_concrete run data modify storage math temp_particle set value "0.035 0.341 0.451"
execute if block ~ ~ ~ minecraft:purple_concrete run data modify storage math temp_particle set value "0.322 0.051 0.557"
execute if block ~ ~ ~ minecraft:blue_concrete run data modify storage math temp_particle set value "0.122 0.094 0.522"
execute if block ~ ~ ~ minecraft:brown_concrete run data modify storage math temp_particle set value "0.353 0.184 0.071"
execute if block ~ ~ ~ minecraft:green_concrete run data modify storage math temp_particle set value "0.235 0.325 0.078"
execute if block ~ ~ ~ minecraft:red_concrete run data modify storage math temp_particle set value "0.49 0.086 0.086"
execute if block ~ ~ ~ minecraft:black_concrete run data modify storage math temp_particle set value "0.004 0.004 0.02"

execute store result storage math sstemp0 int 1 run scoreboard players add #sstemp0 int 1
execute if data storage math temp_particle run function large_number:particle/holographic_projection/set with storage math
execute if data storage math temp_particle run function large_number:particle/holographic_projection/set.test.0 with storage math

#添加可解析方块：
#在本函数第18行开始添加如下格式的命令：
#execute if block ~ ~ ~ <方块ID|方块标签>[方块状态]{数据标签} run data modify storage math temp_particle set value "<dust粒子的颜色>"
#粒子颜色格式是三个用空格隔开的数。例如纯黑就是"0 0 0"
#方块状态和数据标签都是可选的

