#定义域报错
execute store result score #temp1 large_number.int run data get storage large_number:math _expressionss2 1000000000
execute if score #temp1 large_number.int matches ..885603193 run scoreboard players set #temp_expression_evaluation_error large_number.int 1008

execute if score #temp_expression_evaluation_error large_number.int matches 1.. run return 0

#高精度逆伽玛函数

data modify storage large_number:math inverse_gamma_function.input set from storage large_number:math _expressionss2
data modify storage large_number:math newton.s_method.loops set value 12
scoreboard players operation #lib.temp_all_tellraw_set large_number.int = #large_number.all_tellraw_set large_number.int
scoreboard players set #large_number.all_tellraw_set large_number.int 1
function large_number:inverse_gamma_function/high_precision
scoreboard players operation #large_number.all_tellraw_set large_number.int = #lib.temp_all_tellraw_set large_number.int
data modify storage large_number:math _expressionss3 set from storage large_number:math inverse_gamma_function.output
