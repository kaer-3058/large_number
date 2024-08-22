execute store result score #temp1 int run data get storage large_number:math temp_s2[-1].a
execute store result score #temp2 int run data get storage large_number:math temp_s1[-1]

scoreboard players operation #temp1 int *= #temp2 int
scoreboard players operation #conversion.any_to_10.output int += #temp1 int

data remove storage large_number:math temp_s2[-1]
data remove storage large_number:math temp_s1[-1]
execute if data storage large_number:math temp_s2[-1] run function large_number:number_base_conversion/loop2
