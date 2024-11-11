##Sigmoid函数 - 直接计算

#data modify storage large_number:math sigmoid.input set value 1.2

#-x
function large_number:sigmoid/direct_calculation/macro1 with storage large_number:math sigmoid

#e^-x
function large_number:exp_e.x/start

#(e^-x)+1
function large_number:hyperbolic_function/if.tanh/macro2 with storage large_number:math exp_e^x
execute in minecraft:overworld as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1

#1/((e^-x)+1)
function large_number:division/float_reciprocal_8_dici/start
data modify storage large_number:math sigmoid.output set from storage large_number:math float_reciprocal.output
