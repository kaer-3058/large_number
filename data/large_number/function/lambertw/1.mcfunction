data modify storage large_number:math ln_double.input set from storage large_number:math lambertw.input
function large_number:ln_double/start
execute store result score #ln(x) int run scoreboard players operation #Divisor_float_int0 int = #ln_double.output int
function large_number:ln/start
execute store result score #float_int0 int run scoreboard players remove #ln(x).output int 92103

execute store result score #temp1 int run scoreboard players operation #temp_l1 int = #Divisor_float_int0 int
scoreboard players operation #temp_l2 int = #float_int0 int
execute store result storage large_number:math temp_ln1 double 0.0001 run scoreboard players operation #temp1 int -= #float_int0 int

##整数除法 - 8位有效数字

#载入被除数
scoreboard players set #float_exp int -4
scoreboard players operation #temp1 int = #float_int0 int
execute if score #temp1 int matches 1..9 run scoreboard players operation #float_int0 int *= 100000000 const
execute if score #temp1 int matches 1..9 run scoreboard players add #float_exp int 1
execute if score #temp1 int matches 10..99 run scoreboard players operation #float_int0 int *= 10000000 const
execute if score #temp1 int matches 10..99 run scoreboard players add #float_exp int 2
execute if score #temp1 int matches 100..999 run scoreboard players operation #float_int0 int *= 1000000 const
execute if score #temp1 int matches 100..999 run scoreboard players add #float_exp int 3
execute if score #temp1 int matches 1000..9999 run scoreboard players operation #float_int0 int *= 100000 const
execute if score #temp1 int matches 1000..9999 run scoreboard players add #float_exp int 4
execute if score #temp1 int matches 10000..99999 run scoreboard players operation #float_int0 int *= 10000 const
execute if score #temp1 int matches 10000..99999 run scoreboard players add #float_exp int 5
execute if score #temp1 int matches 100000..999999 run scoreboard players operation #float_int0 int *= 1000 const
execute if score #temp1 int matches 100000..999999 run scoreboard players add #float_exp int 6
execute if score #temp1 int matches 1000000..9999999 run scoreboard players operation #float_int0 int *= 100 const
execute if score #temp1 int matches 1000000..9999999 run scoreboard players add #float_exp int 7
execute if score #temp1 int matches 10000000..99999999 run scoreboard players operation #float_int0 int *= 10 const
execute if score #temp1 int matches 10000000..99999999 run scoreboard players add #float_exp int 8
execute if score #temp1 int matches 100000000..999999999 run scoreboard players add #float_exp int 9
execute if score #temp1 int matches 1000000000..2147483647 run scoreboard players operation #float_int0 int /= 10 const
execute if score #temp1 int matches 1000000000..2147483647 run scoreboard players add #float_exp int 10

#载入除数
scoreboard players set #Divisor_float_exp int -4
scoreboard players operation #temp1 int = #Divisor_float_int0 int
execute if score #temp1 int matches 1..9 run scoreboard players operation #Divisor_float_int0 int *= 10000000 const
execute if score #temp1 int matches 1..9 run scoreboard players add #Divisor_float_exp int 1
execute if score #temp1 int matches 10..99 run scoreboard players operation #Divisor_float_int0 int *= 1000000 const
execute if score #temp1 int matches 10..99 run scoreboard players add #Divisor_float_exp int 2
execute if score #temp1 int matches 100..999 run scoreboard players operation #Divisor_float_int0 int *= 100000 const
execute if score #temp1 int matches 100..999 run scoreboard players add #Divisor_float_exp int 3
execute if score #temp1 int matches 1000..9999 run scoreboard players operation #Divisor_float_int0 int *= 10000 const
execute if score #temp1 int matches 1000..9999 run scoreboard players add #Divisor_float_exp int 4
execute if score #temp1 int matches 10000..99999 run scoreboard players operation #Divisor_float_int0 int *= 1000 const
execute if score #temp1 int matches 10000..99999 run scoreboard players add #Divisor_float_exp int 5
execute if score #temp1 int matches 100000..999999 run scoreboard players operation #Divisor_float_int0 int *= 100 const
execute if score #temp1 int matches 100000..999999 run scoreboard players add #Divisor_float_exp int 6
execute if score #temp1 int matches 1000000..9999999 run scoreboard players operation #Divisor_float_int0 int *= 10 const
execute if score #temp1 int matches 1000000..9999999 run scoreboard players add #Divisor_float_exp int 7

scoreboard players operation #sstempd int = #Divisor_float_int0 int

scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #float_int2 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int
scoreboard players operation #float_int2 int %= #sstempd int
scoreboard players operation #float_int2 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #float_int0 int
scoreboard players operation #float_int2 int -= #sstemp2 int
scoreboard players operation #float_int2 int *= 10 const
scoreboard players operation #sstemp1 int = #float_int2 int
scoreboard players operation #float_int2 int /= #sstempd int
scoreboard players operation #float_int2 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int2 int += #sstemp1 int
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int2 int

#对齐小数点
execute if score #float_int0 int matches 100000000.. run scoreboard players add #float_exp int 1

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp int -= #Divisor_float_exp int

#最终输出
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 int
function large_number:lambertw/macro2 with storage large_number:math


#渐进展开式第三项

#不超过八位的大数的平方
execute store result score #x int run scoreboard players operation #y int = #temp_l1 int
execute store result score #1.3 int run scoreboard players operation #y int %= 10000 const
execute store result score #1.2 int run scoreboard players operation #x int /= 10000 const
scoreboard players operation #1.3 int *= #y int
scoreboard players operation #1.2 int *= #y int
scoreboard players operation #y int *= #x int
scoreboard players operation #x int *= #x int
scoreboard players operation #y int += #1.2 int
scoreboard players operation #1.3 int /= 10000 const
execute store result score #4.3 int run scoreboard players operation #y int += #1.3 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #Divisor_float_int0 int run scoreboard players operation #x int += #4.3 int
scoreboard players operation #Divisor_float_int0 int /= 10000 const
scoreboard players operation #x int %= 10000 const
scoreboard players operation #y int %= 10000 const

scoreboard players operation #y int /= 10 const
scoreboard players operation #x int *= 1000 const
scoreboard players operation #x int += #y int
scoreboard players operation #Divisor_float_int0 int *= 10000000 const
scoreboard players operation #Divisor_float_int0 int += #x int
scoreboard players operation #Divisor_float_int0 int *= 2 const

#不超过八位的大数的乘法

#   x y
#   a b
#------
#   1 2
# x y

execute store result score #float_int0 int run scoreboard players operation #y int = #temp_l2 int
execute store result score #a int store result score #b int run scoreboard players remove #temp_l2 int 20000
execute store result score #2 int run scoreboard players operation #y int %= 10000 const
execute store result score #1 int run scoreboard players operation #float_int0 int /= 10000 const
scoreboard players operation #b int %= 10000 const
scoreboard players operation #a int /= 10000 const

scoreboard players operation #2 int *= #b int
scoreboard players operation #1 int *= #b int
scoreboard players operation #y int *= #a int
scoreboard players operation #float_int0 int *= #a int
scoreboard players operation #y int += #1 int
scoreboard players operation #2 int /= 10000 const
execute store result score #4.5 int run scoreboard players operation #y int += #2 int
scoreboard players operation #4.5 int /= 10000 const
scoreboard players operation #float_int0 int += #4.5 int
scoreboard players operation #y int %= 10000 const

scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #y int


##整数除法 - 8位有效数字

#载入被除数
scoreboard players set #float_sign int 1
execute if score #float_int0 int matches ..-1 run scoreboard players set #float_sign int -1
execute if score #float_int0 int matches ..-1 run scoreboard players operation #float_int0 int *= -1 const

scoreboard players set #float_exp int -4
scoreboard players operation #temp1 int = #float_int0 int
execute if score #temp1 int matches 1..9 run scoreboard players operation #float_int0 int *= 100000000 const
execute if score #temp1 int matches 1..9 run scoreboard players add #float_exp int 1
execute if score #temp1 int matches 10..99 run scoreboard players operation #float_int0 int *= 10000000 const
execute if score #temp1 int matches 10..99 run scoreboard players add #float_exp int 2
execute if score #temp1 int matches 100..999 run scoreboard players operation #float_int0 int *= 1000000 const
execute if score #temp1 int matches 100..999 run scoreboard players add #float_exp int 3
execute if score #temp1 int matches 1000..9999 run scoreboard players operation #float_int0 int *= 100000 const
execute if score #temp1 int matches 1000..9999 run scoreboard players add #float_exp int 4
execute if score #temp1 int matches 10000..99999 run scoreboard players operation #float_int0 int *= 10000 const
execute if score #temp1 int matches 10000..99999 run scoreboard players add #float_exp int 5
execute if score #temp1 int matches 100000..999999 run scoreboard players operation #float_int0 int *= 1000 const
execute if score #temp1 int matches 100000..999999 run scoreboard players add #float_exp int 6
execute if score #temp1 int matches 1000000..9999999 run scoreboard players operation #float_int0 int *= 100 const
execute if score #temp1 int matches 1000000..9999999 run scoreboard players add #float_exp int 7
execute if score #temp1 int matches 10000000..99999999 run scoreboard players operation #float_int0 int *= 10 const
execute if score #temp1 int matches 10000000..99999999 run scoreboard players add #float_exp int 8
execute if score #temp1 int matches 100000000..999999999 run scoreboard players add #float_exp int 9
execute if score #temp1 int matches 1000000000..2147483647 run scoreboard players operation #float_int0 int /= 10 const
execute if score #temp1 int matches 1000000000..2147483647 run scoreboard players add #float_exp int 10

#载入除数
scoreboard players set #Divisor_float_sign int 1
execute if score #Divisor_float_int0 int matches ..-1 run scoreboard players set #Divisor_float_sign int -1
execute if score #Divisor_float_int0 int matches ..-1 run scoreboard players operation #Divisor_float_int0 int *= -1 const

scoreboard players set #Divisor_float_exp int -3
scoreboard players operation #temp1 int = #Divisor_float_int0 int
execute if score #temp1 int matches 1..9 run scoreboard players operation #Divisor_float_int0 int *= 10000000 const
execute if score #temp1 int matches 1..9 run scoreboard players add #Divisor_float_exp int 1
execute if score #temp1 int matches 10..99 run scoreboard players operation #Divisor_float_int0 int *= 1000000 const
execute if score #temp1 int matches 10..99 run scoreboard players add #Divisor_float_exp int 2
execute if score #temp1 int matches 100..999 run scoreboard players operation #Divisor_float_int0 int *= 100000 const
execute if score #temp1 int matches 100..999 run scoreboard players add #Divisor_float_exp int 3
execute if score #temp1 int matches 1000..9999 run scoreboard players operation #Divisor_float_int0 int *= 10000 const
execute if score #temp1 int matches 1000..9999 run scoreboard players add #Divisor_float_exp int 4
execute if score #temp1 int matches 10000..99999 run scoreboard players operation #Divisor_float_int0 int *= 1000 const
execute if score #temp1 int matches 10000..99999 run scoreboard players add #Divisor_float_exp int 5
execute if score #temp1 int matches 100000..999999 run scoreboard players operation #Divisor_float_int0 int *= 100 const
execute if score #temp1 int matches 100000..999999 run scoreboard players add #Divisor_float_exp int 6
execute if score #temp1 int matches 1000000..9999999 run scoreboard players operation #Divisor_float_int0 int *= 10 const
execute if score #temp1 int matches 1000000..9999999 run scoreboard players add #Divisor_float_exp int 7

scoreboard players operation #sstempd int = #Divisor_float_int0 int

scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #float_int2 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int
scoreboard players operation #float_int2 int %= #sstempd int
scoreboard players operation #float_int2 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #float_int0 int
scoreboard players operation #float_int2 int -= #sstemp2 int
scoreboard players operation #float_int2 int *= 10 const
scoreboard players operation #sstemp1 int = #float_int2 int
scoreboard players operation #float_int2 int /= #sstempd int
scoreboard players operation #float_int2 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int2 int += #sstemp1 int
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int2 int

#对齐小数点
execute if score #float_int0 int matches 100000000.. run scoreboard players add #float_exp int 1

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp int -= #Divisor_float_exp int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 int
function large_number:lambertw/macro3 with storage large_number:math


execute as b09e-44-fded-6-efa5ffffef64 run function large_number:lambertw/as_entity_3
