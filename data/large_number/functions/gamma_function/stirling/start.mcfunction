##伽玛函数

#输入范围为区间：(-1, 170.6271]

execute store result score #gamma_function.stirling.temp1 int run data get storage large_number:math gamma_function.input 10000
execute if score #gamma_function.stirling.temp1 int matches 2216.. run function large_number:gamma_function/stirling/1
execute if score #gamma_function.stirling.temp1 int matches ..2215 run function large_number:gamma_function/stirling/2

execute if data storage large_number:math gamma_function{input:0.0} run data modify storage large_number:math gamma_function.output set value 1.0
execute if data storage large_number:math gamma_function{input:1.0} run data modify storage large_number:math gamma_function.output set value 1.0
execute if data storage large_number:math gamma_function{input:2.0} run data modify storage large_number:math gamma_function.output set value 2.0
