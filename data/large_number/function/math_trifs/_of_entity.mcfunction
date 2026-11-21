#输入
#execute store result entity b09e-44-fded-6-efa5ffffef64 Rotation[0] float 0.0057295779513082320876798154814105 run data get storage large_number:math math_trifs.input 10000.0

#data modify entity b09e-44-fded-6-efa5ffffef64 Rotation[0] set value 17.65f

#三角函数-角度制 (都是10000倍)
execute as b09e-44-fded-6-efa5ffffef64 rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^ ^ ^-1.0 ~ ~

#sin
execute store result score #tan large_number.int store result score #sin large_number.int run data get entity b09e-44-fded-6-efa5ffffef64 Pos[0] 10000

#cos
execute store result score #cot large_number.int store result score #cos large_number.int run data get entity b09e-44-fded-6-efa5ffffef64 Pos[2] -10000

#tan
scoreboard players operation #tan large_number.int *= 10000 const
scoreboard players operation #tan large_number.int /= #cos large_number.int

#cot
scoreboard players operation #cot large_number.int *= 10000 const
scoreboard players operation #cot large_number.int /= #sin large_number.int

#sec
scoreboard players set #sec large_number.int 100000000
scoreboard players operation #sec large_number.int /= #cos large_number.int

#csc
scoreboard players set #csc large_number.int 100000000
scoreboard players operation #csc large_number.int /= #sin large_number.int
