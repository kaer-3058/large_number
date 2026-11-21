##浮点乘法 - 中等精度-大数乘法

#data modify storage large_number:math float_multiply.input1 set value 62.71339703E12d
#data modify storage large_number:math float_multiply.input2 set value 2.0d

#载入数2
scoreboard players set #Divisor_float_exp large_number.int 1
scoreboard players set #Divisor_float_int0 large_number.int 31415926

#载入数1
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math tan_high_precision.output
function large_number:float_nbt_to_score/start

#八位数乘八位数
execute store result score #y large_number.int run scoreboard players operation #x large_number.int = #float_int0 large_number.int
execute store result score #b large_number.int run scoreboard players operation #a large_number.int = #Divisor_float_int0 large_number.int
execute store result score #1 large_number.int run scoreboard players operation #x large_number.int /= 10000 const
execute store result score #2 large_number.int run scoreboard players operation #y large_number.int %= 10000 const
scoreboard players operation #a large_number.int /= 10000 const
scoreboard players operation #b large_number.int %= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #2 large_number.int *= #b large_number.int
scoreboard players operation #1 large_number.int *= #b large_number.int
scoreboard players operation #y large_number.int *= #a large_number.int
scoreboard players operation #x large_number.int *= #a large_number.int
scoreboard players operation #y large_number.int += #1 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #y large_number.int += #5.2 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #m large_number.int run scoreboard players operation #x large_number.int += #5.2 large_number.int
scoreboard players operation #m large_number.int /= 10000 const
scoreboard players operation #x large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 10000 const
scoreboard players operation #2 large_number.int %= 10000 const

#int转字符串
execute store result storage large_number:math temp1 int 1 run scoreboard players add #m large_number.int 10000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #x large_number.int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #y large_number.int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #2 large_number.int 10000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

#指数
execute store result storage large_number:math stemp2 int 1 run scoreboard players operation #float_exp large_number.int += #Divisor_float_exp large_number.int

#最终输出
data modify storage large_number:math stemp1 set value ""
execute if score #float_sign large_number.int matches -1 run data modify storage large_number:math stemp1 set value "-"
function large_number:digamma_function/macro7 with storage large_number:math
