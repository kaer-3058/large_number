#连乘

data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output
function large_number:float_mul.high_precision/start
#tellraw @a {"nbt":"float_multiply","storage": "large_number:math"}
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/recursion/input-1._2

scoreboard players add #gamma_function_recursion_n int 1
execute if score #gamma_function_recursion_n int < #gamma_function_recursion_a int run function large_number:gamma_function/recursion/loop1
