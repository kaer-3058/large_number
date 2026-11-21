##数组格式转化为nbt格式

#scoreboard players get #double_to_int.expon.1 large_number.int
#scoreboard players get #double_to_int.1 large_number.int
#scoreboard players get #double_to_int.5 large_number.int
#scoreboard players get #double_to_int.9 large_number.int
#scoreboard players get #double_to_int.13 large_number.int

#function large_number:float_base_int_power/fast_mul/to_nbt

scoreboard players operation #temp2 large_number.int = #double_to_int.5 large_number.int
scoreboard players operation #temp3 large_number.int = #double_to_int.9 large_number.int
scoreboard players operation #temp4 large_number.int = #double_to_int.13 large_number.int
execute store result storage large_number:math temp1 int 1 run scoreboard players get #double_to_int.1 large_number.int
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 large_number.int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #temp3 large_number.int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #temp4 large_number.int 10000
execute store result storage large_number:math stemp1 int 1 run scoreboard players get #double_to_int.expon.1 large_number.int
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

function large_number:float_base_int_power/fast_mul/to_nbt.macro with storage large_number:math
