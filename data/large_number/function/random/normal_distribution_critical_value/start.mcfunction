##标准正态分布的临界值

#data modify storage large_number:math normal_distribution_critical_value.input set value 0.95
#输入范围：[0.1,0.999999]

execute store result storage large_number:math temp1 int 1 run data get storage large_number:math normal_distribution_critical_value.input 1000000000
function large_number:random/normal_distribution_critical_value/macro1 with storage large_number:math
execute store result score #ln(x) large_number.int run data get storage large_number:math q0 -.000000001
scoreboard players add #ln(x) large_number.int 1000000000
function large_number:ln/start
execute store result storage large_number:math temp1 int 680.272108843537414965 store result score #input.sqrt large_number.int run scoreboard players remove #ln(x).output large_number.int 207232

scoreboard players operation #input.sqrt large_number.int /= 2 const
scoreboard players add #input.sqrt large_number.int 43307
scoreboard players operation #input.sqrt large_number.int *= #input.sqrt large_number.int
scoreboard players operation #input.sqrt large_number.int /= 100 const

execute store result score #temp2 large_number.int run data get storage large_number:math temp1
scoreboard players operation #input.sqrt large_number.int -= #temp2 large_number.int
scoreboard players operation #input.sqrt large_number.int *= 4 const
function large_number:int_sqrt

scoreboard players operation #ln(x).output large_number.int *= 1000 const
scoreboard players add #ln(x).output large_number.int 86614935
execute store result score #input.sqrt large_number.int run scoreboard players operation #output.sqrt large_number.int -= #ln(x).output large_number.int
function large_number:int_sqrt_simple
execute store result storage large_number:math temp1 int 3.162277660168379331998 run scoreboard players get #output.sqrt large_number.int
execute store result storage large_number:math normal_distribution_critical_value.output double .0001 run data get storage large_number:math temp1
