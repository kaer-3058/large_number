##京级大数开方，保留整数
# 1京=10^16  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭

#原理：高精度猜测法。只开一半，然后用估值公式求小数

#输入
#data modify storage math large_sqrt_digit16.input set value [I;0,0,0,0]

execute store result score #digit1.1 int run data get storage math large_sqrt_digit16.input[0]
execute store result score #digit1.2 int run data get storage math large_sqrt_digit16.input[1]

execute if score #digit1.1 int matches 1.. run function large_number:large_sqrt_digit16.if/input/all1_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 1000.. run function large_number:large_sqrt_digit16.if/input/0_1000_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 10..999 run function large_number:large_sqrt_digit16.if/input/0_10_

execute if score #d1.1 int matches ..13924 run function large_number:simple_int_sqrt_range/large_sqrt_2/0
execute if score #d1.1 int matches 13925..16777216 run function large_number:simple_int_sqrt_range/large_sqrt_2/1
execute if score #d1.1 int matches 16777217.. run function large_number:simple_int_sqrt_range/large_sqrt_2/2
scoreboard players operation #1.0 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.0 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.1 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.1 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.2 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.2 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #1.3 int /= #d2.1 int
scoreboard players operation #d2.1 int += #1.3 int
execute store result score #yanzheng_2 int store result score #yanzheng_1 int run scoreboard players operation #d2.1 int /= 2 const

#验证结果
scoreboard players set #yanzheng_< int 0
scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int > #d1.1 int run scoreboard players remove #d2.1 int 1
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_1 int < #d1.1 int store success score #yanzheng_< int store result score #yanzheng_1 int run scoreboard players add #d2.1 int 1
execute if score #yanzheng_< int matches 1 run scoreboard players operation #yanzheng_1 int *= #yanzheng_1 int
execute unless score #yanzheng_2 int matches 46340 if score #yanzheng_< int matches 1 if score #yanzheng_1 int > #d1.1 int run scoreboard players remove #d2.1 int 1

execute store result score #6.1 int store result score #7.1 int run scoreboard players get #d2.1 int

#估值公式
scoreboard players operation #6.1 int *= #6.1 int
scoreboard players operation #d1.1 int -= #6.1 int
scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
execute store result score #d3.1 int run scoreboard players operation #d1.1 int /= #7.1 int

#调整最后一位
execute if score #digit1.1 int matches 1000.. if score #large_sqrt16.test16 int matches 1 run function large_number:large_sqrt_digit16.if/test16/if

#输出
data modify storage math large_sqrt_digit16.output2 set value [I;0,0]
execute if score #digit1.1 int matches 1000.. run function large_number:large_sqrt_digit16.if/output/1000_
execute if score #digit1.1 int matches 10..999 run function large_number:large_sqrt_digit16.if/output/10_
execute if score #digit1.1 int matches 1..9 run function large_number:large_sqrt_digit16.if/output/1_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 1000.. run function large_number:large_sqrt_digit16.if/output/0_1000_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 10..999 run function large_number:large_sqrt_digit16.if/output/0_10_
