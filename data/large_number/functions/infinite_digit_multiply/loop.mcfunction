execute store result score #temp1 int run data get storage large_number:math temp1[-1]
execute store result score #stemp1 int run data get storage large_number:math temp2[-1]

execute store result score #temp2 int run scoreboard players operation #temp1 int *= #stemp1 int
scoreboard players operation #temp1 int /= 10000 const
scoreboard players operation #temp2 int %= 10000 const

execute store result score #sstemp1 int run data get storage large_number:math stemp1[0]
execute store result score #sstemp2 int run data get storage large_number:math stemp1[1]
data remove storage large_number:math stemp1[0]
data remove storage large_number:math stemp1[0]

scoreboard players operation #temp1 int += #sstemp1 int
execute store result score #5.4 int run scoreboard players operation #temp2 int += #sstemp2 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.4 int run scoreboard players operation #temp1 int += #5.4 int

execute store result storage large_number:math tempc int 1 run scoreboard players operation #temp2 int %= 10000 const
execute store result storage large_number:math tempb int 1 run scoreboard players operation #temp1 int %= 10000 const
execute store result storage large_number:math tempa int 1 run scoreboard players operation #5.4 int /= 10000 const

data modify storage large_number:math stemp1 prepend from storage large_number:math tempc
data modify storage large_number:math stemp1 prepend from storage large_number:math tempb
data modify storage large_number:math stemp1 prepend from storage large_number:math tempa

data remove storage large_number:math temp1[-1]
execute if data storage large_number:math temp1[0] run function large_number:infinite_digit_multiply/loop
