execute store result score #temp1 large_number.int run data get storage large_number:math temp_s2[-1].a
execute store result score #temp2 large_number.int run data get storage large_number:math temp_s1[-1]

scoreboard players operation #temp1 large_number.int *= #temp2 large_number.int
scoreboard players operation #conversion.any_to_10.output large_number.int += #temp1 large_number.int

data remove storage large_number:math temp_s2[-1]
data remove storage large_number:math temp_s1[-1]
execute if data storage large_number:math temp_s2[-1] run function large_number:number_base_conversion/loop2
