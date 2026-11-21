##Digamma函数

#公式：ψ(x)~ln(x)-1/(2x)-1/(12(x^2))
#x>0的部分

#data modify storage large_number:math digamma_function.input set value 788.233

#function large_number:digamma_function/start

#data get storage large_number:math digamma_function.output

data modify storage large_number:math temp_digamma_function_inp2 set from storage large_number:math temp_digamma_function_inp

#-x
function large_number:digamma_function/macro5 with storage large_number:math

#加1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:digamma_function/as_entity_2

#ln(x)
data modify storage large_number:math ln_double.input set from storage large_number:math temp_digamma_function_inp
function large_number:ln_double/start

#2x
function large_number:digamma_function/macro1 with storage large_number:math

#1/(2x)
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math temp_item_1 set from storage large_number:math float_reciprocal.output

#x^2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_digamma_function_inp
function large_number:float_mul.high_precision/squ/start

#12(x^2)
function large_number:digamma_function/macro3 with storage large_number:math float_multiply

#1/(12(x^2))
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1
function large_number:division/float_reciprocal_8_dici/start

#ln(x)-1/(2x)-1/(12(x^2))
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:digamma_function/as_entity1

#data modify storage large_number:math digamma_function.output set from storage large_number:math temp_digamma_function_out
function large_number:digamma_function/macro6 with storage large_number:math

##高精度余切

#查表+三角函数和角公式
#在x较小时，cos(x)≈1，sin(x)≈x

#输入[float]：data modify storage large_number:math tan_high_precision.input set value 83.4496f

#function large_number:math_trifs/tan_high_precision/start

execute store result score #sstempm large_number.int run data get storage large_number:math tan_high_precision.input
execute if score #sstempm large_number.int matches -16777215..16777215 run function large_number:math_trifs/tan_high_precision/if.1
execute unless score #sstempm large_number.int matches -16777215..16777215 run function large_number:math_trifs/sin_cos_high_precision/if.2

#输入值拆成三个部分
execute store result storage large_number:math s1 int 1 run scoreboard players operation #sstempx large_number.int /= 1000000 const
scoreboard players operation #sstempy large_number.int %= 1000000 const
execute store result storage large_number:math s2 int 1 run scoreboard players operation #sstempy large_number.int /= 10000 const

#宏索引法查表
function large_number:math_trifs/sin_cos_high_precision/macro1 with storage large_number:math

#sin 前两部分
function large_number:math_trifs/sin_cos_high_precision/macro2 with storage large_number:math
function large_number:math_trifs/sin_cos_high_precision/macro3 with storage large_number:math
execute store result storage large_number:math temp_sin_high_precision int 1 store result score #sin_high_precision large_number.int run data get storage large_number:math int_mul_1 .000000001
execute store result score #temp_cosa_sinb large_number.int run data get storage large_number:math int_mul_2 .00000000001
scoreboard players operation #sin_high_precision large_number.int += #temp_cosa_sinb large_number.int

#cos 前两部分
function large_number:math_trifs/sin_cos_high_precision/macro4 with storage large_number:math
function large_number:math_trifs/sin_cos_high_precision/macro7 with storage large_number:math
execute store result storage large_number:math temp_cos_high_precision int 1 store result score #cos_high_precision large_number.int run data get storage large_number:math int_mul_3 .000000001
execute store result score #temp_sina_sinb large_number.int run data get storage large_number:math int_mul_4 .00000000001
scoreboard players operation #cos_high_precision large_number.int -= #temp_sina_sinb large_number.int


# 总
execute store result storage large_number:math temp2 int 174532.92519943295769236907 run scoreboard players operation #sstempz large_number.int %= 10000 const
function large_number:math_trifs/sin_cos_high_precision/macro8 with storage large_number:math
execute store result score #temp1 large_number.int run data get storage large_number:math int_mult2_out .0000000000001
function large_number:math_trifs/sin_cos_high_precision/macro9 with storage large_number:math
execute store result score #temp2 large_number.int run data get storage large_number:math int_mult2_out .0000000000001


scoreboard players operation #sin_high_precision large_number.int += #temp1 large_number.int
scoreboard players operation #cos_high_precision large_number.int -= #temp2 large_number.int

scoreboard players operation #float_int0 large_number.int = #cos_high_precision large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int = #sin_high_precision large_number.int


##整数除法 - 8位有效数字

#被除数：scoreboard players set #float_int0 large_number.int 7458
#除数：scoreboard players set #Divisor_float_int0 large_number.int 617

#载入被除数
scoreboard players set #float_sign large_number.int 1
execute if score #float_int0 large_number.int matches ..-1 run scoreboard players set #float_sign large_number.int -1
execute if score #float_int0 large_number.int matches -2147483648 run scoreboard players set #float_int0 large_number.int 2147483647
execute if score #float_int0 large_number.int matches ..-1 run scoreboard players operation #float_int0 large_number.int *= -1 const

scoreboard players set #float_exp large_number.int 0
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

scoreboard players set #Divisor_float_exp large_number.int 0
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
execute if score #temp1 large_number.int matches 10000000..99999999 run scoreboard players add #Divisor_float_exp large_number.int 8
execute if score #temp1 large_number.int matches 100000000..999999999 run scoreboard players operation #Divisor_float_int0 large_number.int /= 10 const
execute if score #temp1 large_number.int matches 100000000..999999999 run scoreboard players add #Divisor_float_exp large_number.int 9
execute if score #temp1 large_number.int matches 1000000000..2147483647 run scoreboard players operation #Divisor_float_int0 large_number.int /= 100 const
execute if score #temp1 large_number.int matches 1000000000..2147483647 run scoreboard players add #Divisor_float_exp large_number.int 10

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
function large_number:math_trifs/tan_high_precision/macro1 with storage large_number:math
function large_number:digamma_function/os_mul_pi

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_digamma_function_out
data modify storage large_number:math temp2 set from storage large_number:math q0
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math digamma_function.output set from storage large_number:math temp1
