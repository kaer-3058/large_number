##正态分布随机数 - 连续型

#输入均值：data modify storage large_number:math random_normal_distribution.mean set value 4.2
#输入方差：data modify storage large_number:math random_normal_distribution.variance set value 2.0
#输入限制：只能取最多四位小数，范围：|x|≤214748.3647

#function large_number:random/normal_distribution/test2/start

#输出：data get storage large_number:math random_normal_distribution.output

#取标准差
execute store result score #input.sqrt large_number.int run data get storage large_number:math random_normal_distribution.variance 10000
function large_number:int_sqrt

#生成标准正态分布随机数
execute store result score #a large_number.int run random value 0..100000000
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result score #temp1 large_number.int run random value 0..100000000
scoreboard players operation #a large_number.int += #temp1 large_number.int
execute store result storage large_number:math temp1 double .00000000000001 run scoreboard players remove #a large_number.int 600000000

#测试用
#execute store result storage large_number:math temp9 double .00000001 run scoreboard players get #a large_number.int
#tellraw @a {storage:"large_number:math",nbt:"temp9"}
#tellraw @a {score:{name:"output.sqrt",objective:"large_number.int"}}
#tellraw @a {storage:"large_number:math",nbt:"random_normal_distribution.mean"}

#乘上标准差
execute store result storage large_number:math temp2 int 1 run scoreboard players get #output.sqrt large_number.int
function large_number:random/normal_distribution/test2/macro1 with storage large_number:math

#加上均值
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/normal_distribution/test2/as_entity_1
