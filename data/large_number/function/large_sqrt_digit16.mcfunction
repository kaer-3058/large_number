##京级大数开方，保留整数
# 1京=10^16  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭

#原理：高精度猜测法。只开一半，然后用估值公式求小数

#输入
#data modify storage large_number:math large_sqrt_digit16.input set value [I;0,0,0,0]

execute store result score #digit1.1 large_number.int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #digit1.2 large_number.int run data get storage large_number:math large_sqrt_digit16.input[1]

execute if score #digit1.1 large_number.int matches 1.. run function large_number:large_sqrt_digit16.if/input/all1_
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 1000.. run function large_number:large_sqrt_digit16.if/input/0_1000_
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 10..999 run function large_number:large_sqrt_digit16.if/input/0_10_

execute store result score #t1 large_number.int store result score #t2 large_number.int store result score #t3 large_number.int store result score #t4 large_number.int run scoreboard players operation #d2.1 large_number.int = #d1.1 large_number.int
scoreboard players operation #d2.1 large_number.int /= 32768 const
execute unless score #d1.1 large_number.int matches 0 run scoreboard players add #d2.1 large_number.int 2456
scoreboard players operation #t1 large_number.int /= #d2.1 large_number.int
scoreboard players operation #d2.1 large_number.int += #t1 large_number.int
scoreboard players operation #d2.1 large_number.int /= 2 const
scoreboard players operation #t2 large_number.int /= #d2.1 large_number.int
scoreboard players operation #d2.1 large_number.int += #t2 large_number.int
scoreboard players operation #d2.1 large_number.int /= 2 const
scoreboard players operation #t3 large_number.int /= #d2.1 large_number.int
scoreboard players operation #d2.1 large_number.int += #t3 large_number.int
scoreboard players operation #d2.1 large_number.int /= 2 const
scoreboard players operation #t4 large_number.int /= #d2.1 large_number.int
execute if score #d2.1 large_number.int > #t4 large_number.int run scoreboard players remove #d2.1 large_number.int 1

execute store result score #6.1 large_number.int run scoreboard players operation #7.1 large_number.int = #d2.1 large_number.int

#估值公式
scoreboard players operation #6.1 large_number.int *= #6.1 large_number.int
scoreboard players operation #d1.1 large_number.int -= #6.1 large_number.int
scoreboard players operation #d1.1 large_number.int *= 10000 const
scoreboard players operation #7.1 large_number.int *= 2 const
scoreboard players add #7.1 large_number.int 1
execute store result score #d3.1 large_number.int run scoreboard players operation #d1.1 large_number.int /= #7.1 large_number.int

#调整最后一位
execute if score #digit1.1 large_number.int matches 1000.. if score #large_sqrt16.test16 large_number.int matches 1 run function large_number:large_sqrt_digit16.if/test16/if

#输出
scoreboard players operation #d2.1 large_number.int *= 10000 const
scoreboard players operation #d2.1 large_number.int += #d3.1 large_number.int
execute if score #digit1.1 large_number.int matches 1000.. store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players get #d2.1 large_number.int
execute if score #digit1.1 large_number.int matches 10..999 store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players operation #d2.1 large_number.int /= 10 const
execute if score #digit1.1 large_number.int matches 1..9 store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players operation #d2.1 large_number.int /= 100 const
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 1000.. store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players operation #d2.1 large_number.int /= 100 const
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 10..999 store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players operation #d2.1 large_number.int /= 1000 const
