#(a+bi)^6 的二项式展开

#function large_number:elem_complex_function/gamma/x_6_expon/start

data modify storage large_number:math stemp_a_1 set from storage large_number:math stemp_gamma_function_inp.x

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_a_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a_2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_2
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_a_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a_3 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_3
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_a_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a_4 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_4
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_a_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a_5 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_5
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_a_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a_6 set from storage large_number:math float_multiply.output

data modify storage large_number:math stemp_b_1 set from storage large_number:math stemp_gamma_function_inp.i

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_b_1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_b_2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_b_2
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_b_3 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_b_3
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_b_4 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_b_4
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_b_5 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_b_5
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_1
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_b_6 set from storage large_number:math float_multiply.output

#实部

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_4
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_2
function large_number:float_multiply/of_score/start
function large_number:elem_complex_function/gamma/x_6_expon/macro1 with storage large_number:math float_multiply

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_2
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_4
function large_number:float_multiply/of_score/start
function large_number:elem_complex_function/gamma/x_6_expon/macro2 with storage large_number:math float_multiply

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math stemp_a_6
data modify storage large_number:math temp2 set from storage large_number:math temp_item_2
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

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math temp_item_3
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

#浮点减法
data modify storage large_number:math temp2 set from storage large_number:math stemp_b_6
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp_x_6_expon_out set value {x:0.0,i:0.0}
data modify storage large_number:math temp_x_6_expon_out.x set from storage large_number:math temp1

#虚部

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_5
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_1
function large_number:float_multiply/of_score/start
function large_number:elem_complex_function/gamma/x_6_expon/macro3 with storage large_number:math float_multiply

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_3
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_3
function large_number:float_multiply/of_score/start
function large_number:elem_complex_function/gamma/x_6_expon/macro4 with storage large_number:math float_multiply

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_a_1
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_b_5
function large_number:float_multiply/of_score/start
function large_number:elem_complex_function/gamma/x_6_expon/macro5 with storage large_number:math float_multiply

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math temp_item_1
data modify storage large_number:math temp2 set from storage large_number:math temp_item_2
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

#浮点加法
data modify storage large_number:math temp2 set from storage large_number:math temp_item_3
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

data modify storage large_number:math temp_x_6_expon_out.i set from storage large_number:math temp1
