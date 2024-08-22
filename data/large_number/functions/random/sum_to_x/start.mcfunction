##生成总和为n的a个随机数

#scoreboard players set #random.sum_to_x.a int 23
#scoreboard players set #random.sum_to_x.n int 286

scoreboard players operation #temp1 int = #random.sum_to_x.a int
scoreboard players remove #temp1 int 1
data modify storage large_number:math temp1 set value []
execute if score #temp1 int matches 1.. as b09e-44-fded-6-efa5ffffef64 run function large_number:random/sum_to_x/loop1
data modify storage large_number:math random_sum_to_x_out set from storage large_number:math temp1
execute if data storage large_number:math temp1[1] run function large_number:random/sum_to_x/loop2

execute store result score #temp1 int run data get storage large_number:math temp1[0]
scoreboard players operation #temp1 int *= -1 const
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #temp1 int += #random.sum_to_x.n int
data modify storage large_number:math random_sum_to_x_out append from storage large_number:math temp1
