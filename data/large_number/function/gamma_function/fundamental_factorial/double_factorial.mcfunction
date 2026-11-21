##自然数的双阶乘

#这里的双阶乘是原始的无穷乘积形式定义的

#输入：scoreboard players set #natural_num.double_factorial.inp large_number.int 7
#输入范围为区间：[0,300]

#function large_number:gamma_function/fundamental_factorial/double_factorial

execute store result storage large_number:math q0 int 1 run scoreboard players get #natural_num.double_factorial.inp large_number.int
function large_number:gamma_function/fundamental_factorial/index_double with storage large_number:math
