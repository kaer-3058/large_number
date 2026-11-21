#ax
#store_parabola_expre_x.start large_number.int * #coef.a large_number.int
execute store result storage large_number:math stemp1 double 0.01 run scoreboard players operation #parabola_mathstep large_number.int += #parabola_expre_x.step_size large_number.int
data modify storage large_number:math parabola_expre_x append from storage large_number:math stemp1

###########################################
#整型对整型的大数相乘

execute store success score #input_-1 large_number.int if score #coef.a large_number.int matches ..-1
execute store success score #input.2_-1 large_number.int if score #store_parabola_expre_x.start large_number.int matches ..-1

scoreboard players operation #inp large_number.int = #coef.a large_number.int
scoreboard players operation #inp.2 large_number.int = #store_parabola_expre_x.start large_number.int
execute if score #inp large_number.int matches -2147483648 run scoreboard players set #inp large_number.int 2147483647
execute if score #inp large_number.int matches ..-1 run scoreboard players operation #inp large_number.int *= -1 const
execute if score #inp.2 large_number.int matches -2147483648 run scoreboard players set #inp.2 large_number.int 2147483647
execute if score #inp.2 large_number.int matches ..-1 run scoreboard players operation #inp.2 large_number.int *= -1 const

execute store result score #x large_number.int store result score #y large_number.int run scoreboard players operation #z large_number.int = #inp large_number.int
scoreboard players operation #z large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 100000000 const
scoreboard players operation #y large_number.int /= 10000 const
scoreboard players operation #x large_number.int /= 100000000 const

execute store result score #a large_number.int store result score #b large_number.int run scoreboard players operation #c large_number.int = #inp.2 large_number.int
execute store result score #1.1 large_number.int store result score #1.2 large_number.int store result score #1.3 large_number.int run scoreboard players operation #c large_number.int %= 10000 const
scoreboard players operation #b large_number.int %= 100000000 const
execute store result score #2.1 large_number.int store result score #2.2 large_number.int store result score #2.3 large_number.int run scoreboard players operation #b large_number.int /= 10000 const
execute store result score #3.1 large_number.int store result score #3.2 large_number.int store result score #3.3 large_number.int run scoreboard players operation #a large_number.int /= 100000000 const

execute store result score #5.4 large_number.int store result score #4.5 large_number.int run scoreboard players operation #1.3 large_number.int *= #z large_number.int
execute store result score #4.4 large_number.int run scoreboard players operation #1.2 large_number.int *= #y large_number.int
execute store result score #4.3 large_number.int run scoreboard players operation #1.1 large_number.int *= #x large_number.int
scoreboard players operation #2.3 large_number.int *= #z large_number.int
scoreboard players operation #2.2 large_number.int *= #y large_number.int
execute store result score #4.2 large_number.int run scoreboard players operation #2.1 large_number.int *= #x large_number.int
scoreboard players operation #3.3 large_number.int *= #z large_number.int
scoreboard players operation #3.2 large_number.int *= #y large_number.int
execute store result score #4.1 large_number.int run scoreboard players operation #3.1 large_number.int *= #x large_number.int
scoreboard players operation #4.4 large_number.int += #2.3 large_number.int
scoreboard players operation #4.3 large_number.int += #2.2 large_number.int
scoreboard players operation #4.3 large_number.int += #3.3 large_number.int
scoreboard players operation #4.2 large_number.int += #3.2 large_number.int
scoreboard players operation #5.4 large_number.int /= 10000 const
execute store result score #5.3 large_number.int run scoreboard players operation #4.4 large_number.int += #5.4 large_number.int
scoreboard players operation #5.3 large_number.int /= 10000 const
execute store result score #5.2 large_number.int run scoreboard players operation #4.3 large_number.int += #5.3 large_number.int
scoreboard players operation #5.2 large_number.int /= 10000 const
execute store result score #5.1 large_number.int run scoreboard players operation #4.2 large_number.int += #5.2 large_number.int
scoreboard players operation #5.1 large_number.int /= 10000 const
scoreboard players operation #4.1 large_number.int += #5.1 large_number.int

scoreboard players operation #4.1 large_number.int %= 10000 const
scoreboard players operation #4.2 large_number.int %= 10000 const
scoreboard players operation #4.3 large_number.int %= 10000 const
scoreboard players operation #4.4 large_number.int %= 10000 const
scoreboard players operation #4.5 large_number.int %= 10000 const

#调整符号
data modify storage large_number:math stemp10 set value ""
execute unless score #input_-1 large_number.int = #input.2_-1 large_number.int run data modify storage large_number:math stemp10 set value "-"

execute store result storage large_number:math stemp1 int 1.0 run scoreboard players add #4.1 large_number.int 10000
execute store result storage large_number:math stemp2 int 1.0 run scoreboard players add #4.2 large_number.int 10000
execute store result storage large_number:math stemp3 int 1.0 run scoreboard players add #4.3 large_number.int 10000
execute store result storage large_number:math stemp4 int 1.0 run scoreboard players add #4.4 large_number.int 10000
execute store result storage large_number:math stemp6 int 1.0 run scoreboard players add #4.5 large_number.int 10000

data modify storage large_number:math stemp1 set string storage large_number:math stemp1 1
data modify storage large_number:math stemp2 set string storage large_number:math stemp2 1
data modify storage large_number:math stemp3 set string storage large_number:math stemp3 1
data modify storage large_number:math stemp5 set string storage large_number:math stemp4 -1
data modify storage large_number:math stemp4 set string storage large_number:math stemp4 1 -1
data modify storage large_number:math stemp6 set string storage large_number:math stemp6 1
###########################################
function large_number:parabola/macro1 with storage large_number:math

#ax+b
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:parabola/macro2 with storage large_number:math

#(ax+b)*x
scoreboard players operation #temp large_number.int = #store_parabola_expre_x.start large_number.int
execute store result storage large_number:math q0 int 1 run scoreboard players get #temp large_number.int
function large_number:parabola/macro3 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #temp_expon large_number.int run function large_number:parabola/macro7 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #temp_expon large_number.int 2
function large_number:parabola/macro8 with storage large_number:math

#(ax+b)*x+c
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:parabola/macro4 with storage large_number:math

execute unless score #store_parabola_expre_y large_number.int matches ..2147483647 store result score #store_parabola_expre_y large_number.int run data get storage large_number:math parabola_expre_y[0] 100
execute store result score #temp2 large_number.int run data get storage large_number:math parabola_expre_y[-1] 100
execute store result storage large_number:math parabola_expre_y[-1] double 0.01 run scoreboard players operation #temp2 large_number.int -= #store_parabola_expre_y large_number.int

#判断是否继续递归
scoreboard players remove #store_parabola_expre_x.length large_number.int 1
execute if score #store_parabola_expre_x.length large_number.int matches 1.. run scoreboard players operation #store_parabola_expre_x.start large_number.int += #parabola_expre_x.step_size large_number.int
execute if score #store_parabola_expre_x.length large_number.int matches 1.. run function large_number:parabola/loop
