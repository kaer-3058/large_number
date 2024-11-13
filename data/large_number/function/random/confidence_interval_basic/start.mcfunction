##根据概率、误差和置信水平估计试验次数

#应用环境：假设你希望估计事件发生的概率p，并且希望通过n次实验使估计的结果在实际概率p周围有一个误差范围ϵ，且置信水平达到α。

#输入概率[浮点数]：data modify storage large_number:math confidence_interval_of_p.p set value 0.5
#范围为(0,1)，如不了解，可输入0.5来最大化样本量
#输入置信水平[浮点数]：data modify storage large_number:math confidence_interval_of_p.α set value 0.95
#如要求95%是可信的，则输入0.95
#输入误差[浮点数]：data modify storage large_number:math confidence_interval_of_p.ϵ set value 0.05
#范围为(0,10)

#标准正态分布的临界值
data modify storage large_number:math normal_distribution_critical_value.input set from storage large_number:math confidence_interval_of_p.α
function large_number:random/normal_distribution_critical_value/start

execute store result storage large_number:math temp1 int -1 run data get storage large_number:math normal_distribution_critical_value.output -100000000
function large_number:random/normal_distribution_critical_value/macro1 with storage large_number:math

execute store result storage large_number:math temp1 int 1 store result score #temp2 int run data get storage large_number:math confidence_interval_of_p.p 1000000000
scoreboard players operation #temp2 int *= -1 const
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 int 1000000000
function large_number:int_mul2/macro1 with storage large_number:math

execute store result storage large_number:math temp1 int 1 run data get storage large_number:math q0 .00000001
execute store result storage large_number:math temp2 int 1 run data get storage large_number:math int_mult2_out .000000001
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #int_+decimal.input1 int run data get storage large_number:math int_mult2_out .0000000001

execute store result storage large_number:math temp1 int 1 run data get storage large_number:math confidence_interval_of_p.ϵ 100000000
function large_number:random/normal_distribution_critical_value/macro1 with storage large_number:math
execute store result score #int_+decimal.input2 int run data get storage large_number:math q0 .000000001
function large_number:division/int_8decimal/start
execute store result storage large_number:math confidence_interval_of_p.output int -1 run data get storage large_number:math int_more_decimal_out -1
