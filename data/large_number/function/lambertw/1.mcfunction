data modify storage large_number:math ln_double.input set from storage large_number:math lambertw.input
function large_number:ln_double/start
execute store result score #ln(x) large_number.int run scoreboard players operation #Divisor_float_int0 large_number.int = #ln_double.output large_number.int
function large_number:ln/start
execute store result score #float_int0 large_number.int run scoreboard players remove #ln(x).output large_number.int 92103

execute store result score #temp1 large_number.int run scoreboard players operation #temp_l1 large_number.int = #Divisor_float_int0 large_number.int
scoreboard players operation #temp_l2 large_number.int = #float_int0 large_number.int
execute store result storage large_number:math temp_ln1 double 0.0001 run scoreboard players operation #temp1 large_number.int -= #float_int0 large_number.int

##整数除法 - 8位有效数字

#载入被除数
scoreboard players set #float_exp large_number.int -4
scoreboard players operation #temp1 large_number.int = #float_int0 large_number.int
execute if score #temp1 large_number.int matches 1..9 run scoreboard players operation #float_int0 large_number.int *= 100000000 const
execute if score #temp1 large_number.int matches 1..9 run scoreboard players add #float_exp large_number.int 1
execute if score #temp1 large_number.int matches 10..99 run scoreboard players operation #float_int0 large_number.int *= 10000000 const
execute if score #temp1 large_number.int matches 10..99 run scoreboard players add #float_exp large_number.int 2
execute if score #temp1 large_number.int matches 100..999 run scoreboard players operation #float_int0 large_number.int *= 1000000 const
execute if score #temp1 large_number.int matches 100..999 run scoreboard players add #float_exp large_number.int 3
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players operation #float_int0 large_number.int *= 100000 const
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players add #float_exp large_number.int 4
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players operation #float_int0 large_number.int *= 10000 const
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players add #float_exp large_number.int 5
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players operation #float_int0 large_number.int *= 1000 const
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players add #float_exp large_number.int 6
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players operation #float_int0 large_number.int *= 100 const
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players add #float_exp large_number.int 7
execute if score #temp1 large_number.int matches 10000000..99999999 run scoreboard players operation #float_int0 large_number.int *= 10 const
execute if score #temp1 large_number.int matches 10000000..99999999 run scoreboard players add #float_exp large_number.int 8
execute if score #temp1 large_number.int matches 100000000..999999999 run scoreboard players add #float_exp large_number.int 9
execute if score #temp1 large_number.int matches 1000000000..2147483647 run scoreboard players operation #float_int0 large_number.int /= 10 const
execute if score #temp1 large_number.int matches 1000000000..2147483647 run scoreboard players add #float_exp large_number.int 10

#载入除数
scoreboard players set #Divisor_float_exp large_number.int -4
scoreboard players operation #temp1 large_number.int = #Divisor_float_int0 large_number.int
execute if score #temp1 large_number.int matches 1..9 run scoreboard players operation #Divisor_float_int0 large_number.int *= 10000000 const
execute if score #temp1 large_number.int matches 1..9 run scoreboard players add #Divisor_float_exp large_number.int 1
execute if score #temp1 large_number.int matches 10..99 run scoreboard players operation #Divisor_float_int0 large_number.int *= 1000000 const
execute if score #temp1 large_number.int matches 10..99 run scoreboard players add #Divisor_float_exp large_number.int 2
execute if score #temp1 large_number.int matches 100..999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 100000 const
execute if score #temp1 large_number.int matches 100..999 run scoreboard players add #Divisor_float_exp large_number.int 3
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 10000 const
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players add #Divisor_float_exp large_number.int 4
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 1000 const
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players add #Divisor_float_exp large_number.int 5
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 100 const
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players add #Divisor_float_exp large_number.int 6
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 10 const
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players add #Divisor_float_exp large_number.int 7

scoreboard players operation #sstempd large_number.int = #Divisor_float_int0 large_number.int

scoreboard players operation #sstemp0 large_number.int = #sstempd large_number.int
scoreboard players operation #sstempd large_number.int /= 25 const
scoreboard players operation #sstemp0 large_number.int %= 25 const
scoreboard players operation #sstemp1 large_number.int = #float_int0 large_number.int
scoreboard players operation #float_int0 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #float_int2 large_number.int = #sstemp1 large_number.int
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int2 large_number.int %= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int *= 25 const
scoreboard players operation #sstemp2 large_number.int = #sstemp0 large_number.int
scoreboard players operation #sstemp2 large_number.int *= #float_int0 large_number.int
scoreboard players operation #float_int2 large_number.int -= #sstemp2 large_number.int
scoreboard players operation #float_int2 large_number.int *= 10 const
scoreboard players operation #sstemp1 large_number.int = #float_int2 large_number.int
scoreboard players operation #float_int2 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int0 large_number.int *= 10000 const
scoreboard players operation #float_int0 large_number.int += #float_int2 large_number.int

#对齐小数点
execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players add #float_exp large_number.int 1

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
function large_number:lambertw/macro2 with storage large_number:math


#渐进展开式第三项

#不超过八位的大数的平方
execute store result score #x large_number.int run scoreboard players operation #y large_number.int = #temp_l1 large_number.int
execute store result score #1.3 large_number.int run scoreboard players operation #y large_number.int %= 10000 const
execute store result score #1.2 large_number.int run scoreboard players operation #x large_number.int /= 10000 const
scoreboard players operation #1.3 large_number.int *= #y large_number.int
scoreboard players operation #1.2 large_number.int *= #y large_number.int
scoreboard players operation #y large_number.int *= #x large_number.int
scoreboard players operation #x large_number.int *= #x large_number.int
scoreboard players operation #y large_number.int += #1.2 large_number.int
scoreboard players operation #1.3 large_number.int /= 10000 const
execute store result score #4.3 large_number.int run scoreboard players operation #y large_number.int += #1.3 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #Divisor_float_int0 large_number.int run scoreboard players operation #x large_number.int += #4.3 large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int /= 10000 const
scoreboard players operation #x large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 10000 const

scoreboard players operation #y large_number.int /= 10 const
scoreboard players operation #x large_number.int *= 1000 const
scoreboard players operation #x large_number.int += #y large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int *= 10000000 const
scoreboard players operation #Divisor_float_int0 large_number.int += #x large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int *= 2 const

#不超过八位的大数的乘法

#   x y
#   a b
#------
#   1 2
# x y

execute store result score #float_int0 large_number.int run scoreboard players operation #y large_number.int = #temp_l2 large_number.int
execute store result score #a large_number.int store result score #b large_number.int run scoreboard players remove #temp_l2 large_number.int 20000
execute store result score #2 large_number.int run scoreboard players operation #y large_number.int %= 10000 const
execute store result score #1 large_number.int run scoreboard players operation #float_int0 large_number.int /= 10000 const
scoreboard players operation #b large_number.int %= 10000 const
scoreboard players operation #a large_number.int /= 10000 const

scoreboard players operation #2 large_number.int *= #b large_number.int
scoreboard players operation #1 large_number.int *= #b large_number.int
scoreboard players operation #y large_number.int *= #a large_number.int
scoreboard players operation #float_int0 large_number.int *= #a large_number.int
scoreboard players operation #y large_number.int += #1 large_number.int
scoreboard players operation #2 large_number.int /= 10000 const
execute store result score #4.5 large_number.int run scoreboard players operation #y large_number.int += #2 large_number.int
scoreboard players operation #4.5 large_number.int /= 10000 const
scoreboard players operation #float_int0 large_number.int += #4.5 large_number.int
scoreboard players operation #y large_number.int %= 10000 const

scoreboard players operation #float_int0 large_number.int *= 10000 const
scoreboard players operation #float_int0 large_number.int += #y large_number.int


##整数除法 - 8位有效数字

#载入被除数
scoreboard players set #float_sign large_number.int 1
execute if score #float_int0 large_number.int matches ..-1 run scoreboard players set #float_sign large_number.int -1
execute if score #float_int0 large_number.int matches -2147483648 run scoreboard players set #float_int0 large_number.int 2147483647
execute if score #float_int0 large_number.int matches ..-1 run scoreboard players operation #float_int0 large_number.int *= -1 const

scoreboard players set #float_exp large_number.int -4
scoreboard players operation #temp1 large_number.int = #float_int0 large_number.int
execute if score #temp1 large_number.int matches 1..9 run scoreboard players operation #float_int0 large_number.int *= 100000000 const
execute if score #temp1 large_number.int matches 1..9 run scoreboard players add #float_exp large_number.int 1
execute if score #temp1 large_number.int matches 10..99 run scoreboard players operation #float_int0 large_number.int *= 10000000 const
execute if score #temp1 large_number.int matches 10..99 run scoreboard players add #float_exp large_number.int 2
execute if score #temp1 large_number.int matches 100..999 run scoreboard players operation #float_int0 large_number.int *= 1000000 const
execute if score #temp1 large_number.int matches 100..999 run scoreboard players add #float_exp large_number.int 3
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players operation #float_int0 large_number.int *= 100000 const
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players add #float_exp large_number.int 4
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players operation #float_int0 large_number.int *= 10000 const
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players add #float_exp large_number.int 5
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players operation #float_int0 large_number.int *= 1000 const
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players add #float_exp large_number.int 6
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players operation #float_int0 large_number.int *= 100 const
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players add #float_exp large_number.int 7
execute if score #temp1 large_number.int matches 10000000..99999999 run scoreboard players operation #float_int0 large_number.int *= 10 const
execute if score #temp1 large_number.int matches 10000000..99999999 run scoreboard players add #float_exp large_number.int 8
execute if score #temp1 large_number.int matches 100000000..999999999 run scoreboard players add #float_exp large_number.int 9
execute if score #temp1 large_number.int matches 1000000000..2147483647 run scoreboard players operation #float_int0 large_number.int /= 10 const
execute if score #temp1 large_number.int matches 1000000000..2147483647 run scoreboard players add #float_exp large_number.int 10

#载入除数
scoreboard players set #Divisor_float_sign large_number.int 1
execute if score #Divisor_float_int0 large_number.int matches ..-1 run scoreboard players set #Divisor_float_sign large_number.int -1
execute if score #Divisor_float_int0 large_number.int matches -2147483648 run scoreboard players set #Divisor_float_int0 large_number.int 2147483647
execute if score #Divisor_float_int0 large_number.int matches ..-1 run scoreboard players operation #Divisor_float_int0 large_number.int *= -1 const

scoreboard players set #Divisor_float_exp large_number.int -3
scoreboard players operation #temp1 large_number.int = #Divisor_float_int0 large_number.int
execute if score #temp1 large_number.int matches 1..9 run scoreboard players operation #Divisor_float_int0 large_number.int *= 10000000 const
execute if score #temp1 large_number.int matches 1..9 run scoreboard players add #Divisor_float_exp large_number.int 1
execute if score #temp1 large_number.int matches 10..99 run scoreboard players operation #Divisor_float_int0 large_number.int *= 1000000 const
execute if score #temp1 large_number.int matches 10..99 run scoreboard players add #Divisor_float_exp large_number.int 2
execute if score #temp1 large_number.int matches 100..999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 100000 const
execute if score #temp1 large_number.int matches 100..999 run scoreboard players add #Divisor_float_exp large_number.int 3
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 10000 const
execute if score #temp1 large_number.int matches 1000..9999 run scoreboard players add #Divisor_float_exp large_number.int 4
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 1000 const
execute if score #temp1 large_number.int matches 10000..99999 run scoreboard players add #Divisor_float_exp large_number.int 5
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 100 const
execute if score #temp1 large_number.int matches 100000..999999 run scoreboard players add #Divisor_float_exp large_number.int 6
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players operation #Divisor_float_int0 large_number.int *= 10 const
execute if score #temp1 large_number.int matches 1000000..9999999 run scoreboard players add #Divisor_float_exp large_number.int 7

scoreboard players operation #sstempd large_number.int = #Divisor_float_int0 large_number.int

scoreboard players operation #sstemp0 large_number.int = #sstempd large_number.int
scoreboard players operation #sstempd large_number.int /= 25 const
scoreboard players operation #sstemp0 large_number.int %= 25 const
scoreboard players operation #sstemp1 large_number.int = #float_int0 large_number.int
scoreboard players operation #float_int0 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #float_int2 large_number.int = #sstemp1 large_number.int
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int2 large_number.int %= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int *= 25 const
scoreboard players operation #sstemp2 large_number.int = #sstemp0 large_number.int
scoreboard players operation #sstemp2 large_number.int *= #float_int0 large_number.int
scoreboard players operation #float_int2 large_number.int -= #sstemp2 large_number.int
scoreboard players operation #float_int2 large_number.int *= 10 const
scoreboard players operation #sstemp1 large_number.int = #float_int2 large_number.int
scoreboard players operation #float_int2 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int2 large_number.int += #sstemp1 large_number.int
scoreboard players operation #float_int0 large_number.int *= 10000 const
scoreboard players operation #float_int0 large_number.int += #float_int2 large_number.int

#对齐小数点
execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players add #float_exp large_number.int 1

#符号位
scoreboard players operation #float_sign large_number.int *= #Divisor_float_sign large_number.int

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign large_number.int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
function large_number:lambertw/macro3 with storage large_number:math


execute as b09e-44-fded-6-efa5ffffef64 run function large_number:lambertw/as_entity_3
