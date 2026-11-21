##京级大数开方 - 估值法取小数
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

#估值算法
scoreboard players operation #6.1 large_number.int *= #6.1 large_number.int
scoreboard players operation #d1.1 large_number.int -= #6.1 large_number.int
scoreboard players operation #d1.1 large_number.int *= 10000 const
scoreboard players operation #7.1 large_number.int *= 2 const
scoreboard players add #7.1 large_number.int 1
execute store result score #d3.1 large_number.int run scoreboard players operation #d1.1 large_number.int /= #7.1 large_number.int

#调整最后一位
execute if score #digit1.1 large_number.int matches 1000.. run function large_number:large_sqrt_digit16.if/test16/if

#根号整数部分
scoreboard players operation #d2.1 large_number.int *= 10000 const
scoreboard players operation #d2.1 large_number.int += #d3.1 large_number.int
execute if score #digit1.1 large_number.int matches 1000.. store result score #large_sqrt_digit16.output large_number.int run scoreboard players get #d2.1 large_number.int
execute if score #digit1.1 large_number.int matches 10..999 store result score #large_sqrt_digit16.output large_number.int run scoreboard players operation #d2.1 large_number.int /= 10 const
execute if score #digit1.1 large_number.int matches 1..9 store result score #large_sqrt_digit16.output large_number.int run scoreboard players operation #d2.1 large_number.int /= 100 const
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 1000.. store result score #large_sqrt_digit16.output large_number.int run scoreboard players operation #d2.1 large_number.int /= 100 const
execute if score #digit1.1 large_number.int matches 0 if score #digit1.2 large_number.int matches 10..999 store result score #large_sqrt_digit16.output large_number.int run scoreboard players operation #d2.1 large_number.int /= 1000 const
execute store result storage large_number:math large_sqrt_digit16.output int 1 run scoreboard players get #large_sqrt_digit16.output large_number.int


##利用估值算法求小数

#不超过八位的大数的平方
execute store result score #y large_number.int run scoreboard players operation #x large_number.int = #large_sqrt_digit16.output large_number.int
execute store result score #1.2 large_number.int run scoreboard players operation #x large_number.int /= 10000 const
execute store result score #1.3 large_number.int run scoreboard players operation #y large_number.int %= 10000 const

execute store result score #4.4 large_number.int run scoreboard players operation #1.3 large_number.int *= #y large_number.int
scoreboard players operation #1.2 large_number.int *= #y large_number.int
scoreboard players operation #y large_number.int *= #x large_number.int
scoreboard players operation #x large_number.int *= #x large_number.int
scoreboard players operation #y large_number.int += #1.2 large_number.int
scoreboard players operation #4.4 large_number.int /= 10000 const
execute store result score #4.3 large_number.int run scoreboard players operation #y large_number.int += #4.4 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #x large_number.int += #4.3 large_number.int
scoreboard players operation #4.2 large_number.int /= 10000 const
scoreboard players operation #x large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 10000 const
scoreboard players operation #1.3 large_number.int %= 10000 const

execute store result score #digit1.1 large_number.int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #digit1.2 large_number.int run data get storage large_number:math large_sqrt_digit16.input[1]
execute store result score #digit1.3 large_number.int run data get storage large_number:math large_sqrt_digit16.input[2]
execute store result score #digit1.4 large_number.int run data get storage large_number:math large_sqrt_digit16.input[3]

#减法
execute if score #digit1.4 large_number.int < #1.3 large_number.int run scoreboard players remove #digit1.3 large_number.int 1
execute if score #digit1.4 large_number.int < #1.3 large_number.int run scoreboard players add #digit1.4 large_number.int 10000
scoreboard players operation #digit1.4 large_number.int -= #1.3 large_number.int

execute if score #digit1.3 large_number.int < #y large_number.int run scoreboard players remove #digit1.2 large_number.int 1
execute if score #digit1.3 large_number.int < #y large_number.int run scoreboard players add #digit1.3 large_number.int 10000
scoreboard players operation #digit1.3 large_number.int -= #y large_number.int

execute if score #digit1.2 large_number.int < #x large_number.int run scoreboard players remove #digit1.1 large_number.int 1
execute if score #digit1.2 large_number.int < #x large_number.int run scoreboard players add #digit1.2 large_number.int 10000
scoreboard players operation #digit1.2 large_number.int -= #x large_number.int

#估值算法的分母
scoreboard players operation #digit1.2 large_number.int *= 10000 const
scoreboard players operation #digit1.2 large_number.int += #digit1.3 large_number.int
scoreboard players operation #digit1.2 large_number.int *= 10000 const
execute store result score #int_+decimal.input1 large_number.int run scoreboard players operation #digit1.2 large_number.int += #digit1.4 large_number.int

#估值算法的分子
scoreboard players operation #int_+decimal.input2 large_number.int = #large_sqrt_digit16.output large_number.int
scoreboard players operation #int_+decimal.input2 large_number.int *= 2 const
scoreboard players add #int_+decimal.input2 large_number.int 1

#除法
function large_number:division/int_12decimal/start
data modify storage large_number:math large_sqrt_digit16.output_decimal set from storage large_number:math int_more_decimal_out

#整合
execute store result storage large_number:math temp1 double 1 run scoreboard players get #large_sqrt_digit16.output large_number.int
data modify storage large_number:math temp2 set from storage large_number:math int_more_decimal_out

#浮点加法
execute store result score #temp_test.float_add_sub_a2 large_number.int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 large_number.int run data get storage large_number:math temp2
scoreboard players operation #temp_test.float_add_sub_a large_number.int = #temp_test.float_add_sub_a2 large_number.int
scoreboard players operation #temp_test.float_add_sub_b large_number.int = #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub_a large_number.int matches ..-1 store result score #temp_test.float_add_sub_a large_number.int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b large_number.int matches ..-1 store result score #temp_test.float_add_sub_b large_number.int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 0
execute if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub_b large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
scoreboard players operation #temp_test.float_add_sub_a2 large_number.int += #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 run function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math large_sqrt_digit16.output_with_decimal set from storage large_number:math temp1
