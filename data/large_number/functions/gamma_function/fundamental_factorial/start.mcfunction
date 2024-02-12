##自然数的阶乘

#输入：scoreboard players set #natural_num.factorial.input int 12
#输入范围为区间：[0,170]

scoreboard players operation #stemp1 int = #natural_num.factorial.input int

execute store result storage math temp1 double 1 run scoreboard players get #stemp1 int
scoreboard players remove #stemp1 int 1
execute if score #natural_num.factorial.input int matches 3.. run function large_number:gamma_function/fundamental_factorial/loop
data modify storage math natural_num_factorial set from storage math temp1
execute if score #natural_num.factorial.input int matches 1..2 store result storage math natural_num_factorial double 1 run scoreboard players get #natural_num.factorial.input int
execute if score #natural_num.factorial.input int matches 0 run data modify storage math natural_num_factorial set value 1.0d
