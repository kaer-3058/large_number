scoreboard players operation #temp1 int = #start_r int
scoreboard players operation #temp1 int *= #equiangular_spiral.b int
execute if score #temp1 int matches -2147483648 run scoreboard players set #temp1 int 2147483647
execute if score #temp1 int matches ..-1 run scoreboard players operation #temp1 int *= -1 const
execute store result storage large_number:math ln_double.input double .000001 run scoreboard players get #temp1 int
function large_number:ln_double/start
function large_number:particle/equiangular_spiral/macro1 with storage large_number:math ln_double
function large_number:particle/equiangular_spiral/macro3 with storage large_number:math

#转化为字符串
data modify storage large_number:math temp1 set string storage large_number:math sstemp2 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute store result score #temp1 int run function large_number:particle/equiangular_spiral/macro2 with storage large_number:math
execute store result storage large_number:math temp2 int 1 run scoreboard players remove #temp1 int 10
execute store result storage large_number:math temp3 double 0.001 run scoreboard players get #start_r int
execute positioned .0 .0 .0 as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/equiangular_spiral/macro.float_multiply_out/0 with storage large_number:math

scoreboard players operation #start_r int += #equiangular_spiral.r_size int
scoreboard players remove #store_loops int 1
execute if score #store_loops int matches 1.. run function large_number:particle/equiangular_spiral/loop
