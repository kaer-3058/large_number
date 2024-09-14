##浮点乘法 - 中等精度-大数乘法

#data modify storage large_number:math float_multiply.input1 set value 62.71339703E12d
#data modify storage large_number:math float_multiply.input2 set value 2.0d

#载入数2
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_multiply.input2
function large_number:float_nbt_to_score/start
scoreboard players operation #Divisor_float_sign int = #float_sign int
scoreboard players operation #Divisor_float_exp int = #float_exp int
scoreboard players operation #Divisor_float_int0 int = #float_int0 int

#载入数1
data modify storage large_number:math float_nbt_to_score_input set from storage large_number:math float_multiply.input1
function large_number:float_nbt_to_score/start

#八位数乘八位数
execute store result score #y int run scoreboard players operation #x int = #float_int0 int
execute store result score #b int run scoreboard players operation #a int = #Divisor_float_int0 int
execute store result score #1 int run scoreboard players operation #x int /= 10000 const
execute store result score #2 int run scoreboard players operation #y int %= 10000 const
scoreboard players operation #a int /= 10000 const
scoreboard players operation #b int %= 10000 const
execute store result score #5.2 int run scoreboard players operation #2 int *= #b int
scoreboard players operation #1 int *= #b int
scoreboard players operation #y int *= #a int
scoreboard players operation #x int *= #a int
scoreboard players operation #y int += #1 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #y int += #5.2 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #m int run scoreboard players operation #x int += #5.2 int
scoreboard players operation #m int /= 10000 const
scoreboard players operation #x int %= 10000 const
scoreboard players operation #y int %= 10000 const
scoreboard players operation #2 int %= 10000 const

#int转字符串
execute store result storage large_number:math temp1 int 1 run scoreboard players add #m int 10000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #x int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #y int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #2 int 10000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1

#符号位
scoreboard players operation #float_sign int *= #Divisor_float_sign int

#指数
execute store result storage large_number:math stemp2 int 1 run scoreboard players operation #float_exp int += #Divisor_float_exp int

#最终输出
data modify storage large_number:math stemp1 set value ""
execute if score #float_sign int matches -1 run data modify storage large_number:math stemp1 set value "-"
function large_number:float_multiply/of_score/macro.output with storage large_number:math
data modify storage large_number:math float_multiply.output set from storage large_number:math t4
