##整数除法 - 4位有效数字

#被除数：scoreboard players set #int_+decimal.input1 large_number.int 7458
#除数：scoreboard players set #int_+decimal.input2 large_number.int 617

scoreboard players operation #float_int0 large_number.int = #int_+decimal.input1 large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int = #int_+decimal.input2 large_number.int

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

scoreboard players operation #sstempd large_number.int /= 25 const
scoreboard players operation #sstemp1 large_number.int = #float_int0 large_number.int
scoreboard players operation #float_int0 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int %= #sstempd large_number.int
scoreboard players operation #sstemp1 large_number.int *= 40 const
scoreboard players operation #sstemp1 large_number.int /= #sstempd large_number.int
scoreboard players operation #float_int0 large_number.int += #sstemp1 large_number.int

#对齐小数点
execute if score #float_int0 large_number.int matches 10000.. run scoreboard players add #float_exp large_number.int 1

#符号位
scoreboard players operation #float_sign large_number.int *= #Divisor_float_sign large_number.int

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
data modify storage large_number:math temp1 set value ""
execute if score #float_sign large_number.int matches -1 run data modify storage large_number:math temp1 set value "-"
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
function large_number:division/int_8decimal/macro1 with storage large_number:math
