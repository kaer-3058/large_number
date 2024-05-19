##浮点除法 - 12位有效数字 - double型取倒数

data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1

#载入除数
scoreboard players set #Divisor_float_sign int 1
data modify storage large_number:math temp1 set string storage large_number:math float_reciprocal.input 0 -1
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run scoreboard players set #Divisor_float_sign int -1
execute if data storage large_number:math {temp2:"-"} run data modify storage large_number:math temp1 set string storage large_number:math temp1 1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
function large_number:division/float/macro1 with storage large_number:math
scoreboard players operation #Divisor_float_exp int = #_exp int
execute store result score #Divisor_float_int0 int run data get storage large_number:math temp1
scoreboard players operation #temp1 int = #Divisor_float_int0 int
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp2 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 4
data modify storage large_number:math stemp2 set string storage large_number:math temp1 0 3
scoreboard players set #leading_zero int 0
execute if score #temp1 int matches 0 run scoreboard players set #leading_zero int 1
execute if score #temp1 int matches 0 if data storage large_number:math {stemp2:"0.0"} run scoreboard players set #leading_zero int 2
execute if score #temp1 int matches 0 if data storage large_number:math {stemp1:"0.00"} run scoreboard players set #leading_zero int 3
execute if score #leading_zero int matches 3 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 10000000000
execute if score #leading_zero int matches 3 run scoreboard players remove #Divisor_float_exp int 2
execute if score #leading_zero int matches 2 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 1000000000
execute if score #leading_zero int matches 2 run scoreboard players remove #Divisor_float_exp int 1
execute if score #leading_zero int matches 1 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 100000000
execute if score #temp1 int matches 1..9 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 10000000
execute if score #temp1 int matches 1..9 run scoreboard players add #Divisor_float_exp int 1
execute if score #temp1 int matches 10..99 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 1000000
execute if score #temp1 int matches 10..99 run scoreboard players add #Divisor_float_exp int 2
execute if score #temp1 int matches 100..999 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 100000
execute if score #temp1 int matches 100..999 run scoreboard players add #Divisor_float_exp int 3
execute if score #temp1 int matches 1000..9999 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 10000
execute if score #temp1 int matches 1000..9999 run scoreboard players add #Divisor_float_exp int 4
execute if score #temp1 int matches 10000..99999 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 1000
execute if score #temp1 int matches 10000..99999 run scoreboard players add #Divisor_float_exp int 5
execute if score #temp1 int matches 100000..999999 store result score #Divisor_float_int0 int run data get storage large_number:math temp1 100
execute if score #temp1 int matches 100000..999999 run scoreboard players add #Divisor_float_exp int 6
execute if score #temp1 int matches 1000000.. store result score #Divisor_float_int0 int run data get storage large_number:math temp1 10
execute if score #temp1 int matches 1000000.. run scoreboard players add #Divisor_float_exp int 7

scoreboard players set #float_int0 int 100000000
scoreboard players set #float_sign int 1
scoreboard players set #float_exp int 1

scoreboard players operation #float_int1 int = #float_int0 int
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
execute if score #float_int0 int matches 100000000.. run scoreboard players operation #float_int0 int /= 10 const

scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int %= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const

scoreboard players operation #stemp1 int = #float_int1 int
scoreboard players operation #float_int1 int /= #Divisor_float_int0 int
scoreboard players operation #stemp1 int %= #Divisor_float_int0 int
scoreboard players operation #stemp1 int *= 10 const
scoreboard players operation #stemp2 int = #stemp1 int
scoreboard players operation #stemp1 int /= #Divisor_float_int0 int
scoreboard players operation #stemp2 int %= #Divisor_float_int0 int
scoreboard players operation #stemp2 int *= 10 const
scoreboard players operation #stemp3 int = #stemp2 int
scoreboard players operation #stemp2 int /= #Divisor_float_int0 int
scoreboard players operation #stemp3 int %= #Divisor_float_int0 int
scoreboard players operation #stemp3 int *= 10 const
scoreboard players operation #stemp3 int /= #Divisor_float_int0 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int += #stemp1 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int += #stemp2 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #float_int1 int += #stemp3 int

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp int -= #Divisor_float_exp int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 int
execute store result storage large_number:math temp4 int 1 run scoreboard players add #float_int1 int 10000
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:division/float_reciprocal/macro with storage large_number:math


data modify storage large_number:math exp_e^x.output set from storage large_number:math float_reciprocal.output
