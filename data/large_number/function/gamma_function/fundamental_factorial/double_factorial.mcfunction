##自然数的双阶乘

#这里的双阶乘是原始的无穷乘积形式定义的

#输入：scoreboard players set #natural_num.double_factorial.inp int 7
#输入范围为区间：[0,300]

execute if score #natural_num.double_factorial.inp int matches 0..1 run data modify storage large_number:math natural_num_double_factorial set value 1
execute if score #natural_num.double_factorial.inp int matches 2..3 store result storage large_number:math natural_num_double_factorial int 1 run scoreboard players get #natural_num.double_factorial.inp int
execute if score #natural_num.double_factorial.inp int matches 4..103 run function large_number:gamma_function/fundamental_factorial/2.13
execute if score #natural_num.double_factorial.inp int matches 104..203 run function large_number:gamma_function/fundamental_factorial/2.14
execute if score #natural_num.double_factorial.inp int matches 204..300 run function large_number:gamma_function/fundamental_factorial/2.15
