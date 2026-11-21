##标准正态分布随机数
#范围：[-6,6]

#data get storage large_number:math random_as_standard_normal_distribution

execute store result score #temp0 large_number.int run random value 0..100000000
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #temp0 large_number.int += #temp1 large_number.int

execute store result storage large_number:math random_as_standard_normal_distribution double .00000001 run scoreboard players remove #temp0 large_number.int 600000000
