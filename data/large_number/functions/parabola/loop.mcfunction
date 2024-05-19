#ax
#store_parabola_expre_x.start int * #coef.a int
execute store result storage large_number:math stemp1 double 0.01 run scoreboard players operation #parabola_mathstep int += #parabola_expre_x.step_size int
data modify storage large_number:math parabola_expre_x append from storage large_number:math stemp1

###########################################
#整型对整型的大数相乘

#scoreboard players set #coef.a int 2147483647
#scoreboard players set #store_parabola_expre_x.start int 2147483647

execute store success score #input_-1 int if score #coef.a int matches ..-1
execute store success score #input.2_-1 int if score #store_parabola_expre_x.start int matches ..-1

scoreboard players operation #inp int = #coef.a int
scoreboard players operation #inp.2 int = #store_parabola_expre_x.start int
execute if score #inp int matches ..-1 run scoreboard players operation #inp int *= -1 const
execute if score #inp.2 int matches ..-1 run scoreboard players operation #inp.2 int *= -1 const

execute store result score #x int store result score #y int run scoreboard players operation #z int = #inp int
scoreboard players operation #z int %= 10000 const
scoreboard players operation #y int %= 100000000 const
scoreboard players operation #y int /= 10000 const
scoreboard players operation #x int /= 100000000 const

execute store result score #a int store result score #b int run scoreboard players operation #c int = #inp.2 int
execute store result score #1.1 int store result score #1.2 int store result score #1.3 int run scoreboard players operation #c int %= 10000 const
scoreboard players operation #b int %= 100000000 const
execute store result score #2.1 int store result score #2.2 int store result score #2.3 int run scoreboard players operation #b int /= 10000 const
execute store result score #3.1 int store result score #3.2 int store result score #3.3 int run scoreboard players operation #a int /= 100000000 const

execute store result score #5.4 int store result score #4.5 int run scoreboard players operation #1.3 int *= #z int
execute store result score #4.4 int run scoreboard players operation #1.2 int *= #y int
execute store result score #4.3 int run scoreboard players operation #1.1 int *= #x int
scoreboard players operation #2.3 int *= #z int
scoreboard players operation #2.2 int *= #y int
execute store result score #4.2 int run scoreboard players operation #2.1 int *= #x int
scoreboard players operation #3.3 int *= #z int
scoreboard players operation #3.2 int *= #y int
execute store result score #4.1 int run scoreboard players operation #3.1 int *= #x int
scoreboard players operation #4.4 int += #2.3 int
scoreboard players operation #4.3 int += #2.2 int
scoreboard players operation #4.3 int += #3.3 int
scoreboard players operation #4.2 int += #3.2 int
scoreboard players operation #5.4 int /= 10000 const
execute store result score #5.3 int run scoreboard players operation #4.4 int += #5.4 int
scoreboard players operation #5.3 int /= 10000 const
execute store result score #5.2 int run scoreboard players operation #4.3 int += #5.3 int
scoreboard players operation #5.2 int /= 10000 const
execute store result score #5.1 int run scoreboard players operation #4.2 int += #5.2 int
scoreboard players operation #5.1 int /= 10000 const
scoreboard players operation #4.1 int += #5.1 int

scoreboard players operation #4.1 int %= 10000 const
scoreboard players operation #4.2 int %= 10000 const
scoreboard players operation #4.3 int %= 10000 const
scoreboard players operation #4.4 int %= 10000 const
scoreboard players operation #4.5 int %= 10000 const

#调整符号
data modify storage large_number:math stemp10 set value ""
execute unless score #input_-1 int = #input.2_-1 int run data modify storage large_number:math stemp10 set value "-"

execute store result storage large_number:math stemp1 int 1.0 run scoreboard players add #4.1 int 10000
execute store result storage large_number:math stemp2 int 1.0 run scoreboard players add #4.2 int 10000
execute store result storage large_number:math stemp3 int 1.0 run scoreboard players add #4.3 int 10000
execute store result storage large_number:math stemp4 int 1.0 run scoreboard players add #4.4 int 10000
execute store result storage large_number:math stemp6 int 1.0 run scoreboard players add #4.5 int 10000

data modify storage large_number:math stemp1 set string storage large_number:math stemp1 1
data modify storage large_number:math stemp2 set string storage large_number:math stemp2 1
data modify storage large_number:math stemp3 set string storage large_number:math stemp3 1
data modify storage large_number:math stemp5 set string storage large_number:math stemp4 -1
data modify storage large_number:math stemp4 set string storage large_number:math stemp4 1 -1
data modify storage large_number:math stemp6 set string storage large_number:math stemp6 1
###########################################
function large_number:parabola/macro1 with storage large_number:math

#ax+b
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:parabola/macro2 with storage large_number:math

#(ax+b)*x
function large_number:parabola/macro3 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1

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
function large_number:parabola/macro7 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #temp_expon int 2
function large_number:parabola/macro8 with storage large_number:math

#(ax+b)*x+c
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 run function large_number:parabola/macro4 with storage large_number:math

execute unless score #store_parabola_expre_y int matches ..2147483647 store result score #store_parabola_expre_y int run data get storage large_number:math parabola_expre_y[0] 100
execute store result score #temp2 int run data get storage large_number:math parabola_expre_y[-1] 100
execute store result storage large_number:math parabola_expre_y[-1] double 0.01 run scoreboard players operation #temp2 int -= #store_parabola_expre_y int

#判断是否继续递归
scoreboard players remove #store_parabola_expre_x.length int 1
execute if score #store_parabola_expre_x.length int matches 1.. run scoreboard players operation #store_parabola_expre_x.start int += #parabola_expre_x.step_size int
execute if score #store_parabola_expre_x.length int matches 1.. run function large_number:parabola/loop
