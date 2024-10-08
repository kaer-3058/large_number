##正态分布

#测试内容：
#一个随机数包含32个bit，不断左移取最高位
#比如我需要0到32的，直接生成一个int32的随机数，然后不断判断正负并x2，重复32次就是想要的结果了

#scoreboard players set #normal_distribution.input int 100

scoreboard players set #temp9 int 0
data modify storage large_number:math temp_random_list set value []
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/normal_distribution/test1/pcg_random
scoreboard players operation #temp1 int = #normal_distribution.input int
execute if score #temp1 int matches 1.. run function large_number:random/normal_distribution/test1/loop1

data modify storage large_number:math q1 set value []
data modify storage large_number:math q1 append from storage large_number:math temp_random_list[{a:1}]
execute store result score #normal_distribution.output int run data get storage large_number:math q1

#输出：#normal_distribution.output int
