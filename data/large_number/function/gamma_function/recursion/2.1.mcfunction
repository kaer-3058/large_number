execute store result score #gamma_function_recursion_a int run data get storage large_number:math store_gamma_function_input

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/recursion/input-1
data modify storage large_number:math float_multiply.output set from storage large_number:math store_gamma_function_input
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/recursion/input-1
data modify storage large_number:math float_multiply.input1 set from storage large_number:math store_gamma_function_input

scoreboard players set #gamma_function_recursion_n int 1
execute if score #gamma_function_recursion_n int < #gamma_function_recursion_a int run function large_number:gamma_function/recursion/loop1


data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output

#查表
execute store result score #temp1 int run data get storage large_number:math store_gamma_function_input2 10000
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #temp1 int %= 10000 const
function large_number:gamma_function/recursion/macro1 with storage large_number:math
data modify storage large_number:math float_multiply.input1 set from storage large_number:math q0
function large_number:float_mul.high_precision/start
#tellraw @a {"nbt":"float_multiply","storage": "large_number:math"}
data modify storage large_number:math gamma_function.output set from storage large_number:math float_multiply.output
