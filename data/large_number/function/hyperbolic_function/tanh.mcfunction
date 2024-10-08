##双曲正切

#data modify storage large_number:math hyperbolic_function.input set value 1.21088

#-2x
function large_number:hyperbolic_function/if.tanh/macro1 with storage large_number:math hyperbolic_function

#e^-2x
function large_number:exp_e.x/start

#(e^-2x)+1
function large_number:hyperbolic_function/if.tanh/macro2 with storage large_number:math exp_e^x
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math float_reciprocal.input set from storage large_number:math temp1

#2/((e^-2x)+1)
function large_number:hyperbolic_function/float_reciprocal

#2/((e^-2x)+1)-1
function large_number:hyperbolic_function/if.tanh/macro3 with storage large_number:math float_reciprocal
execute as @e[type=minecraft:item] if items entity @s container.0 minecraft:stone[minecraft:custom_data={"large_number:loot_spawn":1b}] run function large_number:curve_length/univariate_function/float_subtra
data modify storage large_number:math hyperbolic_function.output set from storage large_number:math temp1
