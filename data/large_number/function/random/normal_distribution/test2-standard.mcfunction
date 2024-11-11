##标准正态分布随机数
#范围：[-6,6]

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp0 int run data get storage large_number:math random_number_0_1 1000000000

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp1 int run data get storage large_number:math random_number_0_1 1000000000
scoreboard players operation #temp0 int += #temp1 int

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp1 int run data get storage large_number:math random_number_0_1 1000000000
scoreboard players operation #temp0 int += #temp1 int

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp1 int run data get storage large_number:math random_number_0_1 1000000000
scoreboard players operation #temp0 int += #temp1 int

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp1 int run data get storage large_number:math random_number_0_1 1000000000
scoreboard players operation #temp0 int += #temp1 int

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp1 int run data get storage large_number:math random_number_0_1 1000000000
scoreboard players operation #temp0 int += #temp1 int

execute store result score #temp1 int run random value 0..1000000000
scoreboard players operation #temp0 int += #temp1 int
execute store result score #temp1 int run random value 0..1000000000
scoreboard players operation #temp0 int += #temp1 int
execute store result score #temp1 int run random value 0..1000000000
scoreboard players operation #temp0 int += #temp1 int
execute store result score #temp1 int run random value 0..1000000000
scoreboard players operation #temp0 int += #temp1 int
execute store result score #temp1 int run random value 0..1000000000
scoreboard players operation #temp0 int += #temp1 int
execute store result score #temp1 int run random value 0..1000000000
scoreboard players operation #temp0 int += #temp1 int

execute store result storage large_number:math random_as_standard_normal_distribution double .000000001 run scoreboard players remove #temp0 int 600000000
