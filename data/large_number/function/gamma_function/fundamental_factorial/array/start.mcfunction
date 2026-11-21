##自然数的阶乘 - 输出为数组格式

#输入：scoreboard players set #natural_num.factorial.input large_number.int 12
#输入范围为区间：[0,170]

#function large_number:gamma_function/fundamental_factorial/array/start

execute store result storage large_number:math q0 int 1 run scoreboard players get #natural_num.factorial.input large_number.int
function large_number:gamma_function/fundamental_factorial/array/index with storage large_number:math
