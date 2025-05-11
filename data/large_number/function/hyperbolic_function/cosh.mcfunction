##双曲余弦函数

#data modify storage large_number:math hyperbolic_function.input set value 12.21088

#e^x
data modify storage large_number:math exp_e^x.input set from storage large_number:math hyperbolic_function.input
function large_number:exp_e.x/start
data modify storage large_number:math temp_store_exp set from storage large_number:math exp_e^x.output

#取相反数 -x
data modify storage large_number:math _expressionss2 set from storage large_number:math hyperbolic_function.input
function large_number:expression_evaluation_scientific/ope_of_float/ope_21 with storage large_number:math

#e^-x
data modify storage large_number:math exp_e^x.input set from storage large_number:math _expressionss3
function large_number:exp_e.x/start
data modify storage large_number:math temp_store_exp2 set from storage large_number:math exp_e^x.output

#浮点加法 (e^x)+(e^-x)
data modify storage large_number:math temp1 set from storage large_number:math temp_store_exp
data modify storage large_number:math temp2 set from storage large_number:math temp_store_exp2
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

#((e^x)+(e^-x))*5
function large_number:hyperbolic_function/macro1 with storage large_number:math

#double10进制位移 ((e^x)+(e^-x))*5/10
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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 1
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math hyperbolic_function.output set from storage large_number:math sstemp06
