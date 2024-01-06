##自然对数-ln(x)  对任意整数x
#初始数据库、二分穷举、函数宏查库、十进制浮点除法、递归试除、函数宏拼数字

execute if score #ln(x) int matches 1..59874 run function large_number:ln/ln_inte/1..59874
execute if score #ln(x) int matches 59875..2147483647 run function large_number:ln/ln_inte/59875..2147483647

execute if score #ln(x) int matches 1..10000 store result storage math temp int 1.0 run scoreboard players get #ln(x) int
execute if score #ln(x) int matches 1..10000 run function large_number:ln/1..10000 with storage math
execute if score #ln(x) int matches 10001.. run function large_number:ln/10001..


execute store result storage math temp1 int 1.0 run scoreboard players get #ln(x).integer int
execute store result storage math temp2 int 1.0 run scoreboard players get #ln(x).dicimal int
function large_number:ln/craft with storage math

#data get storage math ln_output
