##Digamma函数

#公式：ψ(x)~ln(x)-1/(2x)

#data modify storage large_number:math digamma_function.input set value 788.233
#输入范围：x>0

#ln(x)
data modify storage large_number:math ln_double.input set from storage large_number:math digamma_function.input
function large_number:ln_double/start

#2x
function large_number:digamma_function/macro1 with storage large_number:math digamma_function

#1/(2x)
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1
function large_number:division/float_reciprocal/start

#ln(x)+1/(2x)
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:inverse_gamma_function/digamma/as_entity1

#-1/(13x^2)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math digamma_function.input
function large_number:float_mul.high_precision/squ/start
function large_number:inverse_gamma_function/digamma/macro3 with storage large_number:math float_multiply
function large_number:division/float_reciprocal_8_dici/start

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math digamma_function.output
data modify storage large_number:math temp2 set from storage large_number:math float_reciprocal.output
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_add_subtra/macro1 with storage large_number:math
data modify storage large_number:math temp3 set value ""
execute unless data storage large_number:math {stemp1:"-"} run data modify storage large_number:math temp3 set value "-"
execute store result score #temp_test.float_add_sub_a2 int store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1
execute store result score #temp_test.float_add_sub_b2 int store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2
execute if score #temp_test.float_add_sub_a int matches ..-1 store result score #temp_test.float_add_sub_a int run data get storage large_number:math temp1 -1
execute if score #temp_test.float_add_sub_b int matches ..-1 store result score #temp_test.float_add_sub_b int run data get storage large_number:math temp2 -1
scoreboard players set #temp_test.float_add_sub.number_is_large int 0
execute if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub_b int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
scoreboard players operation #temp_test.float_add_sub_a2 int -= #temp_test.float_add_sub_b2 int
execute if score #temp_test.float_add_sub.number_is_large int matches 0 if score #temp_test.float_add_sub_a int matches 20000000.. run scoreboard players set #temp_test.float_add_sub.number_is_large int 1
execute if score #temp_test.float_add_sub.number_is_large int matches 0 as b09e-44-fded-6-efa5ffffef64 run function large_number:fourier_series_numerical/ope/macro3.6 with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 run function large_number:float_add_subtra/macro2.ope with storage large_number:math
execute if score #temp_test.float_add_sub.number_is_large int matches 1 as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra


data modify storage large_number:math digamma_function.output set from storage large_number:math temp1
