##高精度正切

#查表+三角函数和角公式
#在x较小时，cos(x)≈1，sin(x)≈x

#需要载入数据库：function large_number:math_trifs/sin_cos_high_precision/database

#输入[float]：data modify storage large_number:math tan_high_precision.input set value 83.4496f

execute store result score #sstempm int run data get storage large_number:math tan_high_precision.input
execute if score #sstempm int matches ..16777215 run function large_number:math_trifs/tan_high_precision/if.1
execute if score #sstempm int matches 16777216.. run function large_number:math_trifs/sin_cos_high_precision/if.2
execute if score #sstempm int matches -16777215.. run function large_number:math_trifs/tan_high_precision/if.1
execute if score #sstempm int matches ..-16777216 run function large_number:math_trifs/sin_cos_high_precision/if.2

#输入值拆成三个部分
execute store result storage large_number:math s1 int 1 run scoreboard players operation #sstempx int /= 1000000 const
scoreboard players operation #sstempy int %= 1000000 const
execute store result storage large_number:math s2 int 1 run scoreboard players operation #sstempy int /= 10000 const
execute store result storage large_number:math sstempz int 174532.92519943295769236907 run scoreboard players operation #sstempz int %= 10000 const

#宏索引法查表
execute store result score #sin_inte int run function large_number:math_trifs/sin_cos_high_precision/macro1 with storage large_number:math
execute store result score #sin_deci_12 int run function large_number:math_trifs/sin_cos_high_precision/macro2 with storage large_number:math
execute store result score #cos_inte int run function large_number:math_trifs/sin_cos_high_precision/macro3 with storage large_number:math
execute store result score #cos_deci_12 int run function large_number:math_trifs/sin_cos_high_precision/macro4 with storage large_number:math


#sin 前两部分
execute store result storage large_number:math temp1 int 1 run scoreboard players get #sin_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #cos_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #float_int0 int run data get storage large_number:math int_mult2_out .000000001

execute store result storage large_number:math temp1 int 1 run scoreboard players get #cos_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #sin_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp_cosa_sinb int run data get storage large_number:math int_mult2_out .00000000001

scoreboard players operation #float_int0 int += #temp_cosa_sinb int

#cos 前两部分
execute store result storage large_number:math temp1 int 1 run scoreboard players get #cos_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #cos_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #Divisor_float_int0 int run data get storage large_number:math int_mult2_out .000000001

execute store result storage large_number:math temp1 int 1 run scoreboard players get #sin_inte int
execute store result storage large_number:math temp2 int 1 run scoreboard players get #sin_deci_12 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp_sina_sinb int run data get storage large_number:math int_mult2_out .00000000001

scoreboard players operation #Divisor_float_int0 int -= #temp_sina_sinb int


# 总
execute store result storage large_number:math temp1 int 1 run scoreboard players get #Divisor_float_int0 int
data modify storage large_number:math temp2 set from storage large_number:math sstempz
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp1 int run data get storage large_number:math int_mult2_out .0000000000001

execute store result storage large_number:math temp1 int 1 run scoreboard players get #float_int0 int
function large_number:int_mul2/macro1 with storage large_number:math
execute store result score #temp2 int run data get storage large_number:math int_mult2_out .0000000000001

scoreboard players operation #float_int0 int += #temp1 int
scoreboard players operation #Divisor_float_int0 int -= #temp2 int


##整数除法 - 8位有效数字

#被除数：scoreboard players set #float_int0 int 7458
#除数：scoreboard players set #Divisor_float_int0 int 617

#载入被除数
scoreboard players set #float_sign int 1
execute if score #float_int0 int matches ..-1 run scoreboard players set #float_sign int -1
execute if score #float_int0 int matches -2147483648 run scoreboard players set #float_int0 int 2147483647
execute if score #float_int0 int matches ..-1 run scoreboard players operation #float_int0 int *= -1 const

scoreboard players set #float_exp int 0
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
execute if score #Divisor_float_int0 int matches -2147483648 run scoreboard players set #Divisor_float_int0 int 2147483647
execute if score #Divisor_float_int0 int matches ..-1 run scoreboard players operation #Divisor_float_int0 int *= -1 const

scoreboard players set #Divisor_float_exp int 0
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
execute if score #temp1 int matches 10000000..99999999 run scoreboard players add #Divisor_float_exp int 8
execute if score #temp1 int matches 100000000..999999999 run scoreboard players operation #Divisor_float_int0 int /= 10 const
execute if score #temp1 int matches 100000000..999999999 run scoreboard players add #Divisor_float_exp int 9
execute if score #temp1 int matches 1000000000..2147483647 run scoreboard players operation #Divisor_float_int0 int /= 100 const
execute if score #temp1 int matches 1000000000..2147483647 run scoreboard players add #Divisor_float_exp int 10

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
function large_number:math_trifs/tan_high_precision/macro1 with storage large_number:math
