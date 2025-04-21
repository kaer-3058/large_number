##二阶行列式

data modify storage large_number:math temp_a11 set from storage large_number:math temp1[0][0]
data modify storage large_number:math temp_a12 set from storage large_number:math temp1[0][1]
data modify storage large_number:math temp_a21 set from storage large_number:math temp1[1][0]
data modify storage large_number:math temp_a22 set from storage large_number:math temp1[1][1]

execute store result storage large_number:math temp_a21 int 1 run data get storage large_number:math temp_a21 -1
function large_number:determinant/evaluate/2/macro1 with storage large_number:math

function large_number:determinant/evaluate/2/macro2 with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run return run function large_number:determinant/evaluate/4/output
