##三阶行列式

data modify storage large_number:math temp_a set from storage large_number:math temp1[0][0]
data modify storage large_number:math temp_b set from storage large_number:math temp1[0][1]
data modify storage large_number:math temp_c set from storage large_number:math temp1[0][2]
data modify storage large_number:math temp_d set from storage large_number:math temp1[1][0]
data modify storage large_number:math temp_v set from storage large_number:math temp1[1][1]
data modify storage large_number:math temp_f set from storage large_number:math temp1[1][2]
data modify storage large_number:math temp_g set from storage large_number:math temp1[2][0]
data modify storage large_number:math temp_h set from storage large_number:math temp1[2][1]
data modify storage large_number:math temp_m set from storage large_number:math temp1[2][2]

function large_number:determinant/evaluate/3/macro1 with storage large_number:math
function large_number:determinant/evaluate/3/macro2 with storage large_number:math

function large_number:determinant/evaluate/3/macro3/1 with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run return run function large_number:determinant/evaluate/4/output
