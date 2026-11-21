##浮点除法 - 12位有效数字

#被除数：data modify storage large_number:math float_division.input1 set value 62.71339703E12d
#除数：data modify storage large_number:math float_division.input2 set value 2.0d

#载入除数
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_division.input2
function large_number:float_nbt_to_score/start
scoreboard players operation #Divisor_float_sign large_number.int = #float_sign large_number.int
scoreboard players operation #Divisor_float_exp large_number.int = #float_exp large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int = #float_int0 large_number.int

#载入被除数
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_division.input1
function large_number:float_nbt_to_score/start

scoreboard players operation #float_int0 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int = #float_int0 large_number.int
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

scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
execute unless score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int1 large_number.int %= #Divisor_float_int0 large_number.int
execute unless score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int1 large_number.int *= 10 const

execute if score #float_int0 large_number.int matches 100000000.. run scoreboard players operation #float_int0 large_number.int /= 10 const

scoreboard players operation #stemp1 large_number.int = #float_int1 large_number.int
scoreboard players operation #float_int1 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp1 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp1 large_number.int *= 10 const
scoreboard players operation #stemp2 large_number.int = #stemp1 large_number.int
scoreboard players operation #stemp1 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp2 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp2 large_number.int *= 10 const
scoreboard players operation #stemp3 large_number.int = #stemp2 large_number.int
scoreboard players operation #stemp2 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp3 large_number.int %= #Divisor_float_int0 large_number.int
scoreboard players operation #stemp3 large_number.int *= 10 const
scoreboard players operation #stemp3 large_number.int /= #Divisor_float_int0 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int += #stemp1 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int += #stemp2 large_number.int
scoreboard players operation #float_int1 large_number.int *= 10 const
scoreboard players operation #float_int1 large_number.int += #stemp3 large_number.int

#符号位
scoreboard players operation #float_sign large_number.int *= #Divisor_float_sign large_number.int

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign large_number.int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
execute store result storage large_number:math temp4 int 1 run scoreboard players add #float_int1 large_number.int 10000
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:division/float_12decimal/macro2 with storage large_number:math
data modify storage large_number:math float_division.output set from storage large_number:math q0
