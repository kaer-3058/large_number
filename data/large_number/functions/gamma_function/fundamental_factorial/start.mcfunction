##自然数的阶乘

#输入：scoreboard players set #natural_num.factorial.input int 12
#输入范围为区间：[0,170]

execute if score #natural_num.factorial.input int matches 0..99 run function large_number:gamma_function/fundamental_factorial/1.8
execute if score #natural_num.factorial.input int matches 100..170 run function large_number:gamma_function/fundamental_factorial/1.9
