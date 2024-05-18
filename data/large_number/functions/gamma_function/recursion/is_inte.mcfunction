##自然数阶乘

execute store result score #natural_num.factorial.input int run data get storage large_number:math gamma_function.input
execute if score #natural_num.factorial.input int matches 0..99 run function large_number:gamma_function/fundamental_factorial/1.8
execute if score #natural_num.factorial.input int matches 100..170 run function large_number:gamma_function/fundamental_factorial/1.9
data modify storage large_number:math gamma_function.output set from storage large_number:math natural_num_factorial
