##帕斯卡分布

#目标成功次数[int]：data modify storage large_number:math pascal_distribution.r set value 15
#单次试验成功概率[float]：data modify storage large_number:math pascal_distribution.p set value 0.2f
#最大测试次数[int]：data modify storage large_number:math pascal_distribution.max set value 50

#执行：function large_number:random/pascal_distribution/start

data modify storage large_number:math geometric_distribution_chance set from storage large_number:math pascal_distribution.p
scoreboard players set #loop int 0
scoreboard players set #loop2 int 0
execute store result score #sstempu int run data get storage large_number:math pascal_distribution.max
execute store result score #sstempv int run data get storage large_number:math pascal_distribution.r

function large_number:random/pascal_distribution/loop
execute store result storage large_number:math pascal_distribution.output int 1 run scoreboard players get #loop int
