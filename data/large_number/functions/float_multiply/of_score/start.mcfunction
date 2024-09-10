##浮点乘法 - 中等精度-大数乘法

#data modify storage large_number:math float_multiply.input1 set value 62.71339703E12d
#data modify storage large_number:math float_multiply.input2 set value 2.0d

#载入数1
scoreboard players set #float_sign int 1
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input1 0 -1
data modify storage large_number:math temp2 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp2:"-"} run scoreboard players set #float_sign int -1
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
execute store result score #_exp int run function large_number:division/float/macro1 with storage large_number:math
scoreboard players operation #float_exp int = #_exp int
execute store result score #float_int0 int run data get storage large_number:math temp1
scoreboard players operation #temp1 int = #float_int0 int
data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp2 set value ""
data modify storage large_number:math stemp1 set string storage large_number:math temp1 0 4
data modify storage large_number:math stemp2 set string storage large_number:math temp1 0 3
scoreboard players set #leading_zero int 0
execute if score #temp1 int matches 0 run scoreboard players set #leading_zero int 1
execute if score #temp1 int matches 0 if data storage large_number:math {stemp2:"0.0"} run scoreboard players set #leading_zero int 2
execute if score #temp1 int matches 0 if data storage large_number:math {stemp1:"0.00"} run scoreboard players set #leading_zero int 3
execute if score #leading_zero int matches 3 store result score #float_int0 int run data get storage large_number:math temp1 10000000000
execute if score #leading_zero int matches 3 run scoreboard players remove #float_exp int 2
execute if score #leading_zero int matches 2 store result score #float_int0 int run data get storage large_number:math temp1 1000000000
execute if score #leading_zero int matches 2 run scoreboard players remove #float_exp int 1
execute if score #leading_zero int matches 1 store result score #float_int0 int run data get storage large_number:math temp1 100000000
execute if score #temp1 int matches 1..9 store result score #float_int0 int run data get storage large_number:math temp1 10000000
execute if score #temp1 int matches 1..9 run scoreboard players add #float_exp int 1
execute if score #temp1 int matches 10..99 store result score #float_int0 int run data get storage large_number:math temp1 1000000
execute if score #temp1 int matches 10..99 run scoreboard players add #float_exp int 2
execute if score #temp1 int matches 100..999 store result score #float_int0 int run data get storage large_number:math temp1 100000
execute if score #temp1 int matches 100..999 run scoreboard players add #float_exp int 3
execute if score #temp1 int matches 1000..9999 store result score #float_int0 int run data get storage large_number:math temp1 10000
execute if score #temp1 int matches 1000..9999 run scoreboard players add #float_exp int 4
execute if score #temp1 int matches 10000..99999 store result score #float_int0 int run data get storage large_number:math temp1 1000
execute if score #temp1 int matches 10000..99999 run scoreboard players add #float_exp int 5
execute if score #temp1 int matches 100000..999999 store result score #float_int0 int run data get storage large_number:math temp1 100
execute if score #temp1 int matches 100000..999999 run scoreboard players add #float_exp int 6
execute if score #temp1 int matches 1000000.. store result score #float_int0 int run data get storage large_number:math temp1 10
execute if score #temp1 int matches 1000000.. run scoreboard players add #float_exp int 7

#载入数2
scoreboard players set #Divisor_float_sign int 1
data modify storage large_number:math temp1 set string storage large_number:math float_multiply.input2 0 -1
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

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:division/float/macro1 with storage large_number:math
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
