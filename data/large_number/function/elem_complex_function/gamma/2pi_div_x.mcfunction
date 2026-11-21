#data modify storage large_number:math stemp_gamma_function_inp set value {x:2.0,i:5.1}

#function large_number:elem_complex_function/gamma/2pi_div_x

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp.x
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_gamma_function_inp.x
function large_number:float_multiply/of_score/start
data modify storage large_number:math stemp_a2 set from storage large_number:math float_multiply.output

data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp.i
data modify storage large_number:math float_multiply.input2 set from storage large_number:math stemp_gamma_function_inp.i
function large_number:float_multiply/of_score/start

#浮点加法
data modify storage large_number:math temp1 set from storage large_number:math stemp_a2
data modify storage large_number:math temp2 set from storage large_number:math float_multiply.output
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

data modify storage large_number:math float_division.input2 set from storage large_number:math temp1

#实部
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp.x
function large_number:elem_complex_function/gamma/os_mul_2pi
data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.output
function large_number:division/float/start
data modify storage large_number:math temp_float_div_comple_out set value {x:0.0,i:0.0}
data modify storage large_number:math temp_float_div_comple_out.x set from storage large_number:math float_division.output

#虚部
data modify storage large_number:math float_multiply.input1 set from storage large_number:math stemp_gamma_function_inp.i
function large_number:elem_complex_function/gamma/os_mul_2pi
data modify storage large_number:math float_division.input1 set from storage large_number:math float_multiply.output
function large_number:division/float/start
function large_number:elem_complex_function/gamma/macro3 with storage large_number:math float_division
data modify storage large_number:math temp_float_div_comple_out.i set from storage large_number:math q0
