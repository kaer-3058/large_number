##偏匀分布随机数

#区间下限[int]：data modify storage large_number:math skewed_distribution.min set value 2
#区间上限[int]：data modify storage large_number:math skewed_distribution.max set value 20
#偏峰指标[double]：data modify storage large_number:math skewed_distribution.p set value 0.61
#当p=1时，结果为均匀分布
#当p>1时，p越大结果越靠近区间上限
#当0<p<1时，p越小结果越靠近区间下限

#[0,1]区间的随机数
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:random/number_0_1/pcg
execute store result score #temp1 int run data get storage large_number:math random_number_0_1 1000000000

scoreboard players operation #temp1 int *= -1 const
execute store result storage large_number:math exp_any.input.base double .000000001 run scoreboard players add #temp1 int 1000000000
data modify storage large_number:math exp_any.input.expon set from storage large_number:math skewed_distribution.p
function large_number:exp_any/2
execute store result score #temp1 int run data get storage large_number:math exp_any.output 1000000000
scoreboard players operation #temp1 int *= -1 const
execute store result storage large_number:math exp_any.input.base double .000000001 run scoreboard players add #temp1 int 1000000000
function large_number:exp_any/n_root

data modify storage large_number:math q0 set from storage large_number:math exp_any.output
execute store result storage large_number:math q3 int 1 store result score #temp1 int run data get storage large_number:math skewed_distribution.min
execute store result score #temp2 int run data get storage large_number:math skewed_distribution.max
execute store result storage large_number:math q1 int 1 run scoreboard players operation #temp2 int -= #temp1 int
function large_number:random/skewed_distribution/macro1 with storage large_number:math

function large_number:random/skewed_distribution/macro2 with storage large_number:math
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/as_entity_1

data modify storage large_number:math skewed_distribution.output set from storage large_number:math sstemp05

