##指数函数  e^x

#输入：data modify storage large_number:math exp_e^x.input set value 2.722d
#输出：data get storage large_number:math exp_e^x.output
#输入值必须为double型
#输入范围为区间：(-709, 709.7828)
#先取整数部分的e^x，再取前三位小数的e^x，三位小数以后的e^x用泰勒展开的前三项

#测试：正值，负值，很大的值，很小的值，0，整数值

data modify storage large_number:math store_exp_e_x_input set from storage large_number:math exp_e^x.input

data modify storage large_number:math temp1 set string storage large_number:math store_exp_e_x_input 0 1
execute store success score #temp__is- large_number.int if data storage large_number:math {temp1:"-"}
execute if score #temp__is- large_number.int matches 1 run function large_number:exp_e.x/macro4.input_for_absolute_value with storage large_number:math

#判断是否为科学计数法
data modify storage large_number:math temp1 set string storage large_number:math store_exp_e_x_input 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

execute store result storage large_number:math temp1 int 1 run data get storage large_number:math store_exp_e_x_input

#如果输入的值很小则强行展开
execute if score #is_XXEXX large_number.int matches 1 if data storage large_number:math {temp1:0} as b09e-44-fded-6-efa5ffffef64 run function large_number:exp_e.x/input_add_1

#查表，整数部分和前三位小数
function large_number:exp_e.x/macro1.e.x.inte with storage large_number:math
data modify storage large_number:math temp_e^x_inte set from storage large_number:math s0
execute store result score #stemp1 large_number.int run data get storage large_number:math store_exp_e_x_input 1000
execute store result storage large_number:math temp1 int 1 run scoreboard players add #stemp1 large_number.int 1000
data modify storage large_number:math temp1 set string storage large_number:math temp1 -3
execute store result storage large_number:math temp1 int 1 run function large_number:exp_e.x/macro7 with storage large_number:math
function large_number:exp_e.x/macro2.e.x.decimal.1-3 with storage large_number:math
data modify storage large_number:math temp_e^x_decimal_1-3 set from storage large_number:math s0

#取三位小数及以后的数
data modify storage large_number:math temp1 set value ""
data modify storage large_number:math temp_store_exp_e^x_input set string storage large_number:math store_exp_e_x_input 0 -1
execute store result score #temp1 large_number.int run data get storage large_number:math store_exp_e_x_input
execute if score #temp1 large_number.int matches ..-1 run data modify storage large_number:math temp_store_exp_e^x_input set string storage large_number:math temp_store_exp_e^x_input 1
execute if score #temp1 large_number.int matches ..-1 run scoreboard players operation #temp1 large_number.int *= -1 const
execute if score #temp1 large_number.int matches 0..9 run data modify storage large_number:math temp1 set string storage large_number:math temp_store_exp_e^x_input 5
execute if score #temp1 large_number.int matches 10..99 run data modify storage large_number:math temp1 set string storage large_number:math temp_store_exp_e^x_input 6
execute if score #temp1 large_number.int matches 100..999 run data modify storage large_number:math temp1 set string storage large_number:math temp_store_exp_e^x_input 7
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 13

#字符串数字取为记分板数字，靠前对齐
data modify storage large_number:math temp2 set value ""
execute store result score #1.1 large_number.int run scoreboard players set #1.3 large_number.int 0
execute store result score #temp1 large_number.int run data get storage large_number:math temp1
execute unless score #temp1 large_number.int matches 5.. run data modify storage large_number:math temp2 set from storage large_number:math temp1
execute unless score #temp1 large_number.int matches 5.. run data modify storage large_number:math temp1 set value 0
execute if score #temp1 large_number.int matches 5.. run data modify storage large_number:math temp2 set string storage large_number:math temp1 0 5
execute if score #temp1 large_number.int matches 5.. run data modify storage large_number:math temp1 set string storage large_number:math temp1 5
data modify storage large_number:math temp2 set string storage large_number:math temp2
data modify storage large_number:math temp1 set string storage large_number:math temp1
execute store result score #temp3 large_number.int run data get storage large_number:math temp2
execute store result score #temp4 large_number.int run data get storage large_number:math temp1
execute store result score #1.1 large_number.int run function large_number:exp_e.x/macro3.decimal4--_div2 with storage large_number:math
execute store result score #1.3 large_number.int run function large_number:exp_e.x/macro3.decimal4--_div3 with storage large_number:math
execute if score #temp3 large_number.int matches 1 run scoreboard players operation #1.1 large_number.int *= 10000 const
execute if score #temp3 large_number.int matches 2 run scoreboard players operation #1.1 large_number.int *= 1000 const
execute if score #temp3 large_number.int matches 3 run scoreboard players operation #1.1 large_number.int *= 100 const
execute if score #temp3 large_number.int matches 4 run scoreboard players operation #1.1 large_number.int *= 10 const
execute if score #temp4 large_number.int matches 1 run scoreboard players operation #1.3 large_number.int *= 10000000 const
execute if score #temp4 large_number.int matches 2 run scoreboard players operation #1.3 large_number.int *= 1000000 const
execute if score #temp4 large_number.int matches 3 run scoreboard players operation #1.3 large_number.int *= 100000 const
execute if score #temp4 large_number.int matches 4 run scoreboard players operation #1.3 large_number.int *= 10000 const
execute if score #temp4 large_number.int matches 5 run scoreboard players operation #1.3 large_number.int *= 1000 const
execute if score #temp4 large_number.int matches 6 run scoreboard players operation #1.3 large_number.int *= 100 const
execute if score #temp4 large_number.int matches 7 run scoreboard players operation #1.3 large_number.int *= 10 const
scoreboard players operation #1.2 large_number.int = #1.1 large_number.int
scoreboard players operation #1.4 large_number.int = #1.3 large_number.int
execute store result score #10.1 large_number.int store result score #sstemp1 large_number.int run scoreboard players operation #1.1 large_number.int /= 10000 const
execute store result score #10.2 large_number.int run scoreboard players operation #1.2 large_number.int %= 10000 const
execute store result score #10.3 large_number.int run scoreboard players operation #1.3 large_number.int /= 10000 const
execute store result score #10.4 large_number.int run scoreboard players operation #1.4 large_number.int %= 10000 const

##泰勒公式，e^x在x=0处展开前三项：1+x+(x^2)/2 = x*(1+x/2)+1

#除法 /2
scoreboard players operation #1.1 large_number.int *= 10000 const
scoreboard players operation #1.1 large_number.int += #1.2 large_number.int
scoreboard players operation #1.1 large_number.int *= 10000 const
scoreboard players operation #1.1 large_number.int += #1.3 large_number.int
execute store result score #n large_number.int store result score #o large_number.int store result score #p large_number.int run scoreboard players operation #1.1 large_number.int /= 2 const
execute store result score #b large_number.int store result score #f large_number.int store result score #j large_number.int run scoreboard players operation #n large_number.int /= 100000000 const
scoreboard players operation #o large_number.int %= 100000000 const
execute store result score #c large_number.int store result score #g large_number.int store result score #k large_number.int run scoreboard players operation #o large_number.int /= 10000 const
execute store result score #d large_number.int store result score #h large_number.int store result score #l large_number.int run scoreboard players operation #p large_number.int %= 10000 const

#13位数乘法 #10 * #1

#    abcd
#   efgh
#  ijkl
# mnop

execute store result score #4.1 large_number.int run scoreboard players operation #d large_number.int *= #10.4 large_number.int
scoreboard players operation #c large_number.int *= #10.4 large_number.int
scoreboard players operation #b large_number.int *= #10.4 large_number.int
scoreboard players operation #h large_number.int *= #10.3 large_number.int
scoreboard players operation #g large_number.int *= #10.3 large_number.int
scoreboard players operation #f large_number.int *= #10.3 large_number.int
scoreboard players operation #l large_number.int *= #10.2 large_number.int
scoreboard players operation #k large_number.int *= #10.2 large_number.int
scoreboard players operation #j large_number.int *= #10.2 large_number.int
scoreboard players operation #p large_number.int *= #10.1 large_number.int
scoreboard players operation #o large_number.int *= #10.1 large_number.int
scoreboard players operation #n large_number.int *= #10.1 large_number.int

scoreboard players operation #h large_number.int += #c large_number.int
scoreboard players operation #l large_number.int += #g large_number.int
scoreboard players operation #l large_number.int += #b large_number.int
scoreboard players operation #p large_number.int += #k large_number.int
scoreboard players operation #p large_number.int += #f large_number.int
scoreboard players operation #p large_number.int += #10.4 large_number.int
scoreboard players operation #o large_number.int += #j large_number.int
scoreboard players operation #o large_number.int += #10.3 large_number.int
scoreboard players operation #n large_number.int += #10.2 large_number.int

scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #h large_number.int += #4.1 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #l large_number.int += #4.1 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #p large_number.int += #4.1 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #o large_number.int += #4.1 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #4.1 large_number.int run scoreboard players operation #n large_number.int += #4.1 large_number.int
scoreboard players operation #4.1 large_number.int /= 10000 const
execute store result score #taylor.remainder.2 large_number.int run scoreboard players operation #10.1 large_number.int += #4.1 large_number.int

#scoreboard players operation #d large_number.int %= 10000 const
#scoreboard players operation #h large_number.int %= 10000 const
#scoreboard players operation #l large_number.int %= 10000 const
execute store result score #taylor.remainder.5 large_number.int run scoreboard players operation #p large_number.int %= 10000 const
execute store result score #taylor.remainder.4 large_number.int run scoreboard players operation #o large_number.int %= 10000 const
execute store result score #taylor.remainder.3 large_number.int run scoreboard players operation #n large_number.int %= 10000 const
#scoreboard players set #taylor.remainder.1 large_number.int 1

##浮点相乘，整数*前三位小数*泰勒尾数

#execute store result storage large_number:math temp5 int 1 run scoreboard players add #taylor.remainder.2 large_number.int 10000
#execute store result storage large_number:math temp2 int 1 run scoreboard players add #taylor.remainder.3 large_number.int 10000
#execute store result storage large_number:math temp3 int 1 run scoreboard players add #taylor.remainder.4 large_number.int 10000
#execute store result storage large_number:math temp4 int 1 run scoreboard players add #taylor.remainder.5 large_number.int 10000

scoreboard players operation #taylor.remainder.5 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #taylor.remainder.4 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
execute store result score #float_mul.high_precision.input2.4 large_number.int run scoreboard players operation #taylor.remainder.5 large_number.int += #5.4 large_number.int
scoreboard players operation #taylor.remainder.4 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #taylor.remainder.3 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
execute store result score #float_mul.high_precision.input2.3 large_number.int run scoreboard players operation #taylor.remainder.4 large_number.int += #5.4 large_number.int
scoreboard players operation #taylor.remainder.3 large_number.int /= 10 const
scoreboard players operation #5.4 large_number.int = #taylor.remainder.2 large_number.int
scoreboard players operation #5.4 large_number.int %= 10 const
scoreboard players operation #5.4 large_number.int *= 1000 const
execute store result score #float_mul.high_precision.input2.2 large_number.int run scoreboard players operation #taylor.remainder.3 large_number.int += #5.4 large_number.int
scoreboard players operation #taylor.remainder.2 large_number.int /= 10 const
execute store result score #float_mul.high_precision.input2.1 large_number.int run scoreboard players add #taylor.remainder.2 large_number.int 1000
scoreboard players set #float_mul.high_precision.input2.expon large_number.int 1

#data get storage large_number:math temp_e^x_inte
#data get storage large_number:math temp_e^x_decimal_1-3
#data get storage large_number:math temp_taylor_remainder

##浮点乘法

execute store result score #double_to_int.1 large_number.int run data get storage large_number:math temp_e^x_inte.a
execute store result score #double_to_int.5 large_number.int run data get storage large_number:math temp_e^x_inte.b
execute store result score #double_to_int.9 large_number.int run data get storage large_number:math temp_e^x_inte.c
execute store result score #double_to_int.13 large_number.int run data get storage large_number:math temp_e^x_inte.d
execute store result score #double_to_int.expon.1 large_number.int run data get storage large_number:math temp_e^x_inte.e
function large_number:float_base_int_power/fast_mul/start

execute store result score #float_mul.high_precision.input2.1 large_number.int run data get storage large_number:math temp_e^x_decimal_1-3.a
execute store result score #float_mul.high_precision.input2.2 large_number.int run data get storage large_number:math temp_e^x_decimal_1-3.b
execute store result score #float_mul.high_precision.input2.3 large_number.int run data get storage large_number:math temp_e^x_decimal_1-3.c
execute store result score #float_mul.high_precision.input2.4 large_number.int run data get storage large_number:math temp_e^x_decimal_1-3.d
execute store result score #float_mul.high_precision.input2.expon large_number.int run data get storage large_number:math temp_e^x_decimal_1-3.e
function large_number:float_base_int_power/fast_mul/start
function large_number:float_base_int_power/fast_mul/to_nbt

execute if score #temp__is- large_number.int matches 0 run data modify storage large_number:math exp_e^x.output set from storage large_number:math q0
execute if score #temp__is- large_number.int matches 1 run function large_number:exp_e.x/input.is-

#特殊值
execute store result score #stemp1 large_number.int run data get storage large_number:math exp_e^x.input 10000
execute if score #stemp1 large_number.int matches 7097828.. run data modify storage large_number:math exp_e^x.output set value 1.797693134862315807E308d
execute if score #stemp1 large_number.int matches 7097828.. run scoreboard players set #temp_exp_out_so_large large_number.int 1
execute if score #stemp1 large_number.int matches ..-7090000 run data modify storage large_number:math exp_e^x.output set value 0.0d
execute if data storage large_number:math exp_e^x{input:1.0d} run data modify storage large_number:math exp_e^x.output set value 2.71828182845904523536028747135266249775724709369995d
execute if data storage large_number:math exp_e^x{input:0.0d} run data modify storage large_number:math exp_e^x.output set value 1.0d
