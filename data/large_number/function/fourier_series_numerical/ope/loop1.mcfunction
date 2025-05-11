#循环

data modify storage large_number:math temp2 set from storage large_number:math fourier_series_numerical.x
execute store result storage large_number:math temp1 int 1 run scoreboard players add #fourier_series_numerical.ope.loops.n int 360
function large_number:fourier_series_numerical/ope/macro2 with storage large_number:math
data modify storage large_number:math float_division.input1 set from storage large_number:math q0
data modify storage large_number:math float_division.input2 set from storage large_number:math fourier_series_numerical.p
function large_number:division/float/start

data modify storage large_number:math temp1 set string storage large_number:math float_division.output 0 -1
function large_number:fourier_series_numerical/ope/macro4 with storage large_number:math
function large_number:math_trifs/sin_cos_high_precision/start


execute store result storage large_number:math sstemp2 int 1 run scoreboard players get #cos_high_precision int
data modify storage large_number:math sstemp1 set from storage large_number:math temp_a_list[0]
function large_number:fourier_series_numerical/ope/macro1 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math temp_fourier_series_u set from storage large_number:math sstemp06


execute store result storage large_number:math sstemp2 int 1 run scoreboard players get #sin_high_precision int
data modify storage large_number:math sstemp1 set from storage large_number:math temp_b_list[0]
function large_number:fourier_series_numerical/ope/macro1 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math temp_fourier_series_v set from storage large_number:math sstemp06


#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_fourier_series_u
data modify storage large_number:math temp2 set from storage large_number:math temp_fourier_series_v
execute store result score #temp_test.float_add_sub_a2 int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int run data get storage large_number:math temp2
scoreboard players operation #temp_test.float_add_sub_a int = #temp_test.float_add_sub_a2 int
scoreboard players operation #temp_test.float_add_sub_b int = #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int += #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data remove storage large_number:math temp_a_list[0]
data remove storage large_number:math temp_b_list[0]
scoreboard players remove #fourier_series_numerical.ope.loops int 1
execute if score #fourier_series_numerical.ope.loops int matches 1.. run function large_number:fourier_series_numerical/ope/loop1
