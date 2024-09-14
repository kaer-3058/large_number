##京级大数开方 - 估值法取小数
# 1京=10^16  万万为亿，万亿为兆，万兆为京，万京为垓，万垓为秭

#原理：高精度猜测法。只开一半，然后用估值公式求小数

#输入
#data modify storage large_number:math large_sqrt_digit16.input set value [I;0,0,0,0]

execute store result score #digit1.1 int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #digit1.2 int run data get storage large_number:math large_sqrt_digit16.input[1]

execute if score #digit1.1 int matches 1.. run function large_number:large_sqrt_digit16.if/input/all1_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 1000.. run function large_number:large_sqrt_digit16.if/input/0_1000_
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 10..999 run function large_number:large_sqrt_digit16.if/input/0_10_

execute store result score #t1 int store result score #t2 int store result score #t3 int store result score #t4 int run scoreboard players operation #d2.1 int = #d1.1 int
scoreboard players operation #d2.1 int /= 32768 const
execute unless score #d1.1 int matches 0 run scoreboard players add #d2.1 int 2456
scoreboard players operation #t1 int /= #d2.1 int
scoreboard players operation #d2.1 int += #t1 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #t2 int /= #d2.1 int
scoreboard players operation #d2.1 int += #t2 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #t3 int /= #d2.1 int
scoreboard players operation #d2.1 int += #t3 int
scoreboard players operation #d2.1 int /= 2 const
scoreboard players operation #t4 int /= #d2.1 int
execute if score #d2.1 int > #t4 int run scoreboard players remove #d2.1 int 1

execute store result score #6.1 int run scoreboard players operation #7.1 int = #d2.1 int

#估值算法
scoreboard players operation #6.1 int *= #6.1 int
scoreboard players operation #d1.1 int -= #6.1 int
scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #7.1 int *= 2 const
scoreboard players add #7.1 int 1
execute store result score #d3.1 int run scoreboard players operation #d1.1 int /= #7.1 int

#调整最后一位
execute if score #digit1.1 int matches 1000.. run function large_number:large_sqrt_digit16.if/test16/if

#根号整数部分
scoreboard players operation #d2.1 int *= 10000 const
scoreboard players operation #d2.1 int += #d3.1 int
execute if score #digit1.1 int matches 1000.. store result score #large_sqrt_digit16.output int run scoreboard players get #d2.1 int
execute if score #digit1.1 int matches 10..999 store result score #large_sqrt_digit16.output int run scoreboard players operation #d2.1 int /= 10 const
execute if score #digit1.1 int matches 1..9 store result score #large_sqrt_digit16.output int run scoreboard players operation #d2.1 int /= 100 const
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 1000.. store result score #large_sqrt_digit16.output int run scoreboard players operation #d2.1 int /= 100 const
execute if score #digit1.1 int matches 0 if score #digit1.2 int matches 10..999 store result score #large_sqrt_digit16.output int run scoreboard players operation #d2.1 int /= 1000 const
execute store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players get #large_sqrt_digit16.output int


##利用估值算法求小数

#不超过八位的大数的平方
execute store result score #y int run scoreboard players operation #x int = #large_sqrt_digit16.output int
execute store result score #1.2 int run scoreboard players operation #x int /= 10000 const
execute store result score #1.3 int run scoreboard players operation #y int %= 10000 const

execute store result score #4.4 int run scoreboard players operation #1.3 int *= #y int
scoreboard players operation #1.2 int *= #y int
scoreboard players operation #y int *= #x int
scoreboard players operation #x int *= #x int
scoreboard players operation #y int += #1.2 int
scoreboard players operation #4.4 int /= 10000 const
execute store result score #4.3 int run scoreboard players operation #y int += #4.4 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #x int += #4.3 int
scoreboard players operation #4.2 int /= 10000 const
scoreboard players operation #x int %= 10000 const
scoreboard players operation #y int %= 10000 const
scoreboard players operation #1.3 int %= 10000 const

execute store result score #digit1.1 int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #digit1.2 int run data get storage large_number:math large_sqrt_digit16.input[1]
execute store result score #digit1.3 int run data get storage large_number:math large_sqrt_digit16.input[2]
execute store result score #digit1.4 int run data get storage large_number:math large_sqrt_digit16.input[3]

#减法
execute if score #digit1.4 int < #1.3 int run scoreboard players remove #digit1.3 int 1
execute if score #digit1.4 int < #1.3 int run scoreboard players add #digit1.4 int 10000
scoreboard players operation #digit1.4 int -= #1.3 int

execute if score #digit1.3 int < #y int run scoreboard players remove #digit1.2 int 1
execute if score #digit1.3 int < #y int run scoreboard players add #digit1.3 int 10000
scoreboard players operation #digit1.3 int -= #y int

execute if score #digit1.2 int < #x int run scoreboard players remove #digit1.1 int 1
execute if score #digit1.2 int < #x int run scoreboard players add #digit1.2 int 10000
scoreboard players operation #digit1.2 int -= #x int

#估值算法的分母
scoreboard players operation #digit1.2 int *= 10000 const
scoreboard players operation #digit1.2 int += #digit1.3 int
scoreboard players operation #digit1.2 int *= 10000 const
execute store result score #int_+decimal.input1 int run scoreboard players operation #digit1.2 int += #digit1.4 int

#估值算法的分子
scoreboard players operation #int_+decimal.input2 int = #large_sqrt_digit16.output int
scoreboard players operation #int_+decimal.input2 int *= 2 const
scoreboard players add #int_+decimal.input2 int 1

#除法
function large_number:division/int_12decimal/start
data modify storage large_number:math large_sqrt_digit16.output_decimal set from storage large_number:math int_more_decimal_out

#整合
execute store result storage large_number:math float_add_subtra.input1 double 1 run scoreboard players get #large_sqrt_digit16.output int
data modify storage large_number:math float_add_subtra.input2 set from storage large_number:math int_more_decimal_out
scoreboard players set #float_add_subtra_ope_mode int 1
function large_number:float_add_subtra/start
data modify storage large_number:math large_sqrt_digit16.output_with_decimal set from storage large_number:math float_add_subtra.output
