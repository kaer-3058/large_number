##自然对数-ln(x)  对任意整数x
#初始数据库、二分穷举、函数宏查库、试除、函数宏拼数字

execute if score #ln(x) int matches 1..10000 store result storage large_number:math temp int 1.0 run scoreboard players get #ln(x) int
execute if score #ln(x) int matches 1..10000 store result score #ln(x).output int run function large_number:ln/1..10000 with storage large_number:math
execute if score #ln(x) int matches 10001.. run function large_number:ln/10001..

execute store result storage large_number:math ln_output double 0.0001 run scoreboard players get #ln(x).output int

#data get storage large_number:math ln_output
