##自然数的双阶乘

#这里的双阶乘是原始的无穷乘积形式定义的

#输入：scoreboard players set #natural_num.double_factorial.inp int 7
#输入范围为区间：[0,300]

scoreboard players operation #stemp1 int = #natural_num.double_factorial.inp int

execute store result storage math temp1 double 1 run scoreboard players get #stemp1 int
scoreboard players remove #stemp1 int 2
execute if score #natural_num.double_factorial.inp int matches 3.. run function large_number:gamma_function/fundamental_factorial/double_factorial.loop
data modify storage math natural_num_double_factorial set from storage math temp1
execute if score #natural_num.double_factorial.inp int matches 1..2 store result storage math natural_num_double_factorial double 1 run scoreboard players get #natural_num.double_factorial.inp int
execute if score #natural_num.double_factorial.inp int matches 0 run data modify storage math natural_num_double_factorial set value 1.0d
