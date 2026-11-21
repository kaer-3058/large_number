##贝塔函数

#data modify storage large_number:math beta_function.input set value [5.744,3.212]

#function large_number:beta_function/start

data modify storage large_number:math bf_store_gamma_inp set from storage large_number:math gamma_function.input

data modify storage large_number:math gamma_function.input set from storage large_number:math beta_function.input[0]
function large_number:gamma_function/s_robert_h_w_of_large_number/start
data modify storage large_number:math temp_gamma_a set from storage large_number:math gamma_function.output
data modify storage large_number:math gamma_function.input set from storage large_number:math beta_function.input[1]
function large_number:gamma_function/s_robert_h_w_of_large_number/start
data modify storage large_number:math temp_gamma_b set from storage large_number:math gamma_function.output

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math beta_function.input[0]
data modify storage large_number:math temp2 set from storage large_number:math beta_function.input[1]
execute store result score #temp_test.float_add_sub_a2 large_number.int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 large_number.int run data get storage large_number:math temp2
scoreboard players operation #temp_test.float_add_sub_a large_number.int = #temp_test.float_add_sub_a2 large_number.int
scoreboard players operation #temp_test.float_add_sub_b large_number.int = #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub_a large_number.int matches ..-1 store result score #temp_test.float_add_sub_a large_number.int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b large_number.int matches ..-1 store result score #temp_test.float_add_sub_b large_number.int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 0
execute if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub_b large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
scoreboard players operation #temp_test.float_add_sub_a2 large_number.int += #temp_test.float_add_sub_b2 large_number.int
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 if score #temp_test.float_add_sub_a large_number.int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large large_number.int 1
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.5 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 run function large_number:fourier_series_numerical/ope/macro3 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large large_number.int matches 1 as @e[type=minecraft:item,distance=.0..] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra

data modify storage large_number:math gamma_function.input set from storage large_number:math temp1
function large_number:gamma_function/s_robert_h_w_of_large_number/start
data modify storage large_number:math temp_gamma_a_b set from storage large_number:math gamma_function.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_gamma_a
execute if data storage large_number:math temp_gamma_a.mantissa run data modify storage large_number:math float_multiply.input1 set from storage large_number:math temp_gamma_a.mantissa
data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_gamma_b
execute if data storage large_number:math temp_gamma_b.mantissa run data modify storage large_number:math float_multiply.input2 set from storage large_number:math temp_gamma_b.mantissa
function large_number:float_mul.high_precision/start
data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_division.input2 set from storage large_number:math temp_gamma_a_b
execute if data storage large_number:math temp_gamma_a_b.mantissa run data modify storage large_number:math float_division.input2 set from storage large_number:math temp_gamma_a_b.mantissa
function large_number:division/float/start

data modify storage large_number:math temp1 set string storage large_number:math float_division.output 0 -1

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

scoreboard players set #temp_gamma_a_exp large_number.int 0
execute if data storage large_number:math temp_gamma_a.expon store result score #temp_gamma_a_exp large_number.int run data get storage large_number:math temp_gamma_a.expon
scoreboard players set #temp_gamma_b_exp large_number.int 0
execute if data storage large_number:math temp_gamma_b.expon store result score #temp_gamma_b_exp large_number.int run data get storage large_number:math temp_gamma_b.expon
scoreboard players set #temp_gamma_a_b_exp large_number.int 0
execute if data storage large_number:math temp_gamma_a_b.expon store result score #temp_gamma_a_b_exp large_number.int run data get storage large_number:math temp_gamma_a_b.expon

execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math
scoreboard players operation #_exp large_number.int += #temp_gamma_a_exp large_number.int
scoreboard players operation #_exp large_number.int += #temp_gamma_b_exp large_number.int
execute store result storage large_number:math temp_expon int 1 run scoreboard players operation #_exp large_number.int -= #temp_gamma_a_b_exp large_number.int
data modify storage large_number:math sstemp06 set value 0.0
function large_number:gamma_function/stirling/macro1 with storage large_number:math
data modify storage large_number:math beta_function.output set from storage large_number:math sstemp06
