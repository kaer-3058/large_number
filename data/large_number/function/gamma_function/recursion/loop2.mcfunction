#连乘

data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_multiply.output
function large_number:float_mul.high_precision/start
#tellraw @a {"nbt":"float_multiply","storage": "large_number:math"}
execute store result storage large_number:math float_multiply.input1 double .0001 run scoreboard players remove #temp_m+a large_number.int 10000

scoreboard players add #gamma_function_recursion_n large_number.int 1
execute if score #gamma_function_recursion_n large_number.int < #gamma_function_recursion_a large_number.int run function large_number:gamma_function/recursion/loop2
