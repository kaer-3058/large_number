execute store result score #temp2 int run data get storage large_number:math div_1[-1]
scoreboard players operation #temp2 int *= 10 const
execute store result score #temp1 int run scoreboard players operation #temp2 int += #temp1 int
execute store result storage large_number:math stemp1 int 1 run scoreboard players operation #temp2 int %= 10000 const
scoreboard players operation #temp1 int /= 10000 const
data modify storage large_number:math temp1 prepend from storage large_number:math stemp1
data remove storage large_number:math div_1[-1]
execute if data storage large_number:math div_1[0] run function large_number:division/large_division/loop2
