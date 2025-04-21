#m+a

#对输入值第五位小数四舍五入后查表
execute store result score #temp_m+a int run data get storage large_number:math store_gamma_function_input2 10000
scoreboard players operation #temp_m+a int %= 10000 const
scoreboard players operation #temp_m+a2 int = #temp_m+a int


execute store result score #gamma_function_recursion_a int run data get storage large_number:math store_gamma_function_input
scoreboard players operation #gamma_function_recursion_a int *= -1 const

execute store result storage large_number:math float_multiply.output double .0001 run scoreboard players remove #temp_m+a int 10000
execute store result storage large_number:math float_multiply.input1 double .0001 run scoreboard players remove #temp_m+a int 10000

scoreboard players set #gamma_function_recursion_n int 1
execute if score #gamma_function_recursion_n int < #gamma_function_recursion_a int run function large_number:gamma_function/recursion/loop2


data modify storage large_number:math float_division.input2 set from storage large_number:math float_multiply.output

#查表
execute store result storage large_number:math temp1 int 1 run scoreboard players get #temp_m+a2 int
function large_number:gamma_function/recursion/macro1 with storage large_number:math
data modify storage large_number:math float_division.input1 set from storage large_number:math q0
function large_number:division/float/start
#tellraw @a {"nbt":"float_division","storage": "large_number:math"}
data modify storage large_number:math gamma_function.output set from storage large_number:math float_division.output
