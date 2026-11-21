execute store result score #gamma_function.stirling.temp1 large_number.int run data get storage large_number:math gamma_function.input 10000
execute if score #gamma_function.stirling.temp1 large_number.int matches 2216.. run function large_number:gamma_function/stirling/1
execute if score #gamma_function.stirling.temp1 large_number.int matches ..2215 run function large_number:gamma_function/stirling/2
