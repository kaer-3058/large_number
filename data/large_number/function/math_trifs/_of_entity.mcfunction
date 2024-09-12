#输入
#execute store result entity b09e-44-fded-6-efa5ffffef64 Rotation[0] float 0.0057295779513082320876798154814105 run data get storage large_number:math math_trifs.input 10000.0

#data modify entity b09e-44-fded-6-efa5ffffef64 Rotation[0] set value 17.65f

#三角函数-角度制 (都是10000倍)
execute as b09e-44-fded-6-efa5ffffef64 rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^ ^ ^-1.0 ~ ~

#sin
execute store result score #tan int store result score #sin int run data get entity b09e-44-fded-6-efa5ffffef64 Pos[0] 10000

#cos
execute store result score #cot int store result score #cos int run data get entity b09e-44-fded-6-efa5ffffef64 Pos[2] -10000

#tan
scoreboard players operation #tan int *= 10000 const
scoreboard players operation #tan int /= #cos int

#cot
scoreboard players operation #cot int *= 10000 const
scoreboard players operation #cot int /= #sin int

#sec
scoreboard players set #sec int 100000000
scoreboard players operation #sec int /= #cos int

#csc
scoreboard players set #csc int 100000000
scoreboard players operation #csc int /= #sin int
