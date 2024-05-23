execute store result score #temp1 int run data get storage large_number:math temp1[0]
execute store result score #temp2 int run data get storage large_number:math temp1[1]
data remove storage large_number:math temp1[0]
execute store result storage large_number:math temp1[0] int 1 run scoreboard players operation #temp1 int += #temp2 int
execute if data storage large_number:math temp1[1] run function large_number:random/sum_to_x/loop2
