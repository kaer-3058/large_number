##浮点除法 - 8位有效数字

#载入除数
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

#载入被除数
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math temp1
function large_number:float_nbt_to_score/start
scoreboard players operation #float_int0 int *= 10 const
scoreboard players operation #store_float_int0 int = #float_int0 int
scoreboard players operation #store_float_exp int = #float_exp int

#计算结果前后4位精度
scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #float_int1 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int
scoreboard players operation #float_int1 int %= #sstempd int
scoreboard players operation #float_int1 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #float_int0 int
scoreboard players operation #float_int1 int -= #sstemp2 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #sstemp1 int = #float_int1 int
scoreboard players operation #float_int1 int /= #sstempd int
scoreboard players operation #float_int1 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int1 int += #sstemp1 int
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int1 int

#对齐小数点
execute if score #float_int0 int matches 100000000.. run scoreboard players add #float_exp int 1

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp int -= #Divisor_float_exp int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 int
function large_number:division/float/macro2 with storage large_number:math
data modify storage large_number:math q1 set from storage large_number:math q0

#execute if score #Divisor_float_int0 int matches 0 run data modify storage large_number:math float_division.output set value 1.79769313486231580793728971405E308d

#第二次除法

scoreboard players operation #Divisor_float_int0 int *= 6 const
execute if score #Divisor_float_int0 int matches 100000000.. run scoreboard players add #Divisor_float_exp int 1
execute if score #Divisor_float_int0 int matches 100000000.. run scoreboard players operation #Divisor_float_int0 int /= 10 const
scoreboard players operation #sstempd int = #Divisor_float_int0 int

scoreboard players operation #float_int0 int = #store_float_int0 int
scoreboard players operation #float_exp int = #store_float_exp int

#计算结果前后4位精度
scoreboard players operation #sstemp0 int = #sstempd int
scoreboard players operation #sstempd int /= 25 const
scoreboard players operation #sstemp0 int %= 25 const
scoreboard players operation #sstemp1 int = #float_int0 int
scoreboard players operation #float_int0 int /= #sstempd int
scoreboard players operation #float_int0 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #float_int1 int = #sstemp1 int
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int0 int += #sstemp1 int
scoreboard players operation #float_int1 int %= #sstempd int
scoreboard players operation #float_int1 int *= 25 const
scoreboard players operation #sstemp2 int = #sstemp0 int
scoreboard players operation #sstemp2 int *= #float_int0 int
scoreboard players operation #float_int1 int -= #sstemp2 int
scoreboard players operation #float_int1 int *= 10 const
scoreboard players operation #sstemp1 int = #float_int1 int
scoreboard players operation #float_int1 int /= #sstempd int
scoreboard players operation #float_int1 int *= 40 const
scoreboard players operation #sstemp1 int %= #sstempd int
scoreboard players operation #sstemp1 int *= 40 const
scoreboard players operation #sstemp1 int /= #sstempd int
scoreboard players operation #float_int1 int += #sstemp1 int
scoreboard players operation #float_int0 int *= 10000 const
scoreboard players operation #float_int0 int += #float_int1 int

#对齐小数点
execute if score #float_int0 int matches 100000000.. run scoreboard players add #float_exp int 1

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp int -= #Divisor_float_exp int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 int
function large_number:division/float/macro2 with storage large_number:math
data modify storage large_number:math temp_h_div_6 set from storage large_number:math q0
