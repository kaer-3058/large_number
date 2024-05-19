data remove storage large_number:math temp_particle
execute if block ~ ~ ~ minecraft:white_concrete run data modify storage large_number:math temp_particle set value ".867 .882 .886 .4"
execute if block ~ ~ ~ minecraft:orange_concrete run data modify storage large_number:math temp_particle set value ".91 .455 .0 .4"
execute if block ~ ~ ~ minecraft:magenta_concrete run data modify storage large_number:math temp_particle set value ".502 .067 .443 .4"
execute if block ~ ~ ~ minecraft:light_blue_concrete run data modify storage large_number:math temp_particle set value ".09 .459 .8 .4"
execute if block ~ ~ ~ minecraft:yellow_concrete run data modify storage large_number:math temp_particle set value ".945 .631 .043 .4"
execute if block ~ ~ ~ minecraft:lime_concrete run data modify storage large_number:math temp_particle set value ".239 .675 .067 .4"
execute if block ~ ~ ~ minecraft:pink_concrete run data modify storage large_number:math temp_particle set value ".761 .388 .561 .4"
execute if block ~ ~ ~ minecraft:gray_concrete run data modify storage large_number:math temp_particle set value ".18 .184 .216 .4"
execute if block ~ ~ ~ minecraft:light_gray_concrete run data modify storage large_number:math temp_particle set value ".404 .408 .384 .4"
execute if block ~ ~ ~ minecraft:cyan_concrete run data modify storage large_number:math temp_particle set value ".035 .341 .451 .4"
execute if block ~ ~ ~ minecraft:purple_concrete run data modify storage large_number:math temp_particle set value ".322 .051 .557 .4"
execute if block ~ ~ ~ minecraft:blue_concrete run data modify storage large_number:math temp_particle set value ".122 .094 .522 .4"
execute if block ~ ~ ~ minecraft:brown_concrete run data modify storage large_number:math temp_particle set value ".353 .184 .071 .4"
execute if block ~ ~ ~ minecraft:green_concrete run data modify storage large_number:math temp_particle set value ".235 .325 .078 .4"
execute if block ~ ~ ~ minecraft:red_concrete run data modify storage large_number:math temp_particle set value ".49 .086 .086 .4"
execute if block ~ ~ ~ minecraft:black_concrete run data modify storage large_number:math temp_particle set value ".004 .004 .02 .4"

execute store result storage large_number:math sstemp0 int 1 run scoreboard players add #sstemp0 int 1
execute if data storage large_number:math temp_particle run function large_number:particle/holographic_projection/set with storage large_number:math
execute if data storage large_number:math temp_particle run function large_number:particle/holographic_projection/set.test.0 with storage large_number:math

#添加可解析方块：
#在本函数第18行开始添加如下格式的命令：
#execute if block ~ ~ ~ <方块ID|方块标签>[方块状态]{数据标签} run data modify storage large_number:math temp_particle set value "<dust粒子的四个特殊参数>"
