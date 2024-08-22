data modify storage large_number:math sstemps set string storage large_number:math gamma_function.input -3 -1
execute store success score #is_inte int if data storage large_number:math {sstemps:".0"}
execute if score #is_inte int matches 0 run function large_number:gamma_function/recursion/un_inte
execute if score #is_inte int matches 1 run function large_number:gamma_function/recursion/is_inte

execute if data storage large_number:math gamma_function{input:0.0} run data modify storage large_number:math gamma_function.output set value 1.0
execute if data storage large_number:math gamma_function{input:1.0} run data modify storage large_number:math gamma_function.output set value 1.0
execute if data storage large_number:math gamma_function{input:2.0} run data modify storage large_number:math gamma_function.output set value 2.0
