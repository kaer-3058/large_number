#对输入值第五位小数四舍五入后查表
execute store result score #temp1 int run data get storage large_number:math store_gamma_function_input2 10000
execute store result storage large_number:math temp1 int 1 run scoreboard players operation #temp1 int %= 10000 const
function large_number:gamma_function/recursion/macro1 with storage large_number:math
data modify storage large_number:math gamma_function.output set from storage large_number:math q0
