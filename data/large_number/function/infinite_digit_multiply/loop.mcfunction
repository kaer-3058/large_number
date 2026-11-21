execute store result score #temp1 large_number.int run data get storage large_number:math temp1[-1]
execute store result score #stemp1 large_number.int run data get storage large_number:math temp2[-1]

execute store result score #temp2 large_number.int run scoreboard players operation #temp1 large_number.int *= #stemp1 large_number.int
scoreboard players operation #temp1 large_number.int /= 10000 const
scoreboard players operation #temp2 large_number.int %= 10000 const

execute store result score #sstemp1 large_number.int run data get storage large_number:math stemp1[0]
execute store result score #sstemp2 large_number.int run data get storage large_number:math stemp1[1]
data remove storage large_number:math stemp1[0]
data remove storage large_number:math stemp1[0]

scoreboard players operation #temp1 large_number.int += #sstemp1 large_number.int
execute store result score #5.4 large_number.int run scoreboard players operation #temp2 large_number.int += #sstemp2 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.4 large_number.int run scoreboard players operation #temp1 large_number.int += #5.4 large_number.int

execute store result storage large_number:math tempc int 1 run scoreboard players operation #temp2 large_number.int %= 10000 const
execute store result storage large_number:math tempb int 1 run scoreboard players operation #temp1 large_number.int %= 10000 const
execute store result storage large_number:math tempa int 1 run scoreboard players operation #5.4 large_number.int /= 10000 const

data modify storage large_number:math stemp1 prepend from storage large_number:math tempc
data modify storage large_number:math stemp1 prepend from storage large_number:math tempb
data modify storage large_number:math stemp1 prepend from storage large_number:math tempa

data remove storage large_number:math temp1[-1]
execute if data storage large_number:math temp1[0] run function large_number:infinite_digit_multiply/loop
