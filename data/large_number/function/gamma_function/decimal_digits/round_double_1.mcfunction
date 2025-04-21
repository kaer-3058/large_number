function large_number:round_double/macro1 with storage large_number:math round_double
data modify storage large_number:math q1 set string storage large_number:math q1 0 -1
function large_number:gamma_function/decimal_digits/macro6 with storage large_number:math
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:gamma_function/decimal_digits/float_subtra
