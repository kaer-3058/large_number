##数组除以整数

#data modify storage large_number:math list_div_int.list set value [0,0,0]
#data modify storage large_number:math list_div_int.int set value 2

#被除数必须为万进制int数组，被除数的数组元素和除数必须全都是正数

#原理：乘法分配律，分段除法，(a+b+c)/m = a/m+b/m+c/m

execute store result score #list_div_int.b large_number.int run data get storage large_number:math list_div_int.int

###############################################################
##整数除法 - 12位有效数字

execute store result score #float_int0 large_number.int run data get storage large_number:math list_div_int.list[-3]
execute store result score #temp1 large_number.int run data get storage large_number:math list_div_int.list[-2]
scoreboard players operation #float_int0 large_number.int *= 10000 const
scoreboard players operation #float_int0 large_number.int += #temp1 large_number.int
scoreboard players operation #Divisor_float_int0 large_number.int = #list_div_int.b large_number.int

#载入被除数
scoreboard players set #float_exp large_number.int 4
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

#载入除数
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

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
execute store result storage large_number:math temp4 int 1 run scoreboard players add #float_int1 large_number.int 10000
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:division/list_div_int/macro.craft1 with storage large_number:math
###############################################################
##整数除法 - 12位有效数字

execute store result score #float_int0 large_number.int run data get storage large_number:math list_div_int.list[-1]

#载入被除数
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

#指数
execute store result storage large_number:math temp3 int 1 run scoreboard players operation #float_exp large_number.int -= #Divisor_float_exp large_number.int

#最终输出
execute store result storage large_number:math temp2 int 1 run scoreboard players get #float_int0 large_number.int
execute store result storage large_number:math temp4 int 1 run scoreboard players add #float_int1 large_number.int 10000
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
function large_number:division/list_div_int/macro.craft3 with storage large_number:math
###############################################################

function large_number:division/list_div_int/addition with storage large_number:math
execute as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:division/list_div_int/output
