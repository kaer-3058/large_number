##逆伽玛函数

#输入范围为：x≥𝜆

#𝜑≈0.4616321449684，𝜆≈0.8856031944109

execute store result score #gamma_function.stirling.temp1 int run data get storage large_number:math inverse_gamma_function.input 100
execute if score #gamma_function.stirling.temp1 int matches 114.. run function large_number:inverse_gamma_function/1
execute if score #gamma_function.stirling.temp1 int matches ..113 run function large_number:inverse_gamma_function/2

execute if data storage large_number:math inverse_gamma_function{input:1.0} run data modify storage large_number:math inverse_gamma_function.output set value 1.0
execute if data storage large_number:math inverse_gamma_function{input:2.0} run data modify storage large_number:math inverse_gamma_function.output set value 2.0
execute if data storage large_number:math inverse_gamma_function{input:6.0} run data modify storage large_number:math inverse_gamma_function.output set value 3.0
execute if data storage large_number:math inverse_gamma_function{input:24.0} run data modify storage large_number:math inverse_gamma_function.output set value 4.0
execute if data storage large_number:math inverse_gamma_function{input:120.0} run data modify storage large_number:math inverse_gamma_function.output set value 5.0
execute if data storage large_number:math inverse_gamma_function{input:720.0} run data modify storage large_number:math inverse_gamma_function.output set value 6.0
execute if data storage large_number:math inverse_gamma_function{input:5040.0} run data modify storage large_number:math inverse_gamma_function.output set value 7.0
execute if data storage large_number:math inverse_gamma_function{input:40320.0} run data modify storage large_number:math inverse_gamma_function.output set value 8.0
execute if data storage large_number:math inverse_gamma_function{input:362880.0} run data modify storage large_number:math inverse_gamma_function.output set value 9.0
execute if data storage large_number:math inverse_gamma_function{input:3628800.0} run data modify storage large_number:math inverse_gamma_function.output set value 10.0
execute if data storage large_number:math inverse_gamma_function{input:39916800.0} run data modify storage large_number:math inverse_gamma_function.output set value 11.0
execute if data storage large_number:math inverse_gamma_function{input:479001600.0} run data modify storage large_number:math inverse_gamma_function.output set value 12.0
