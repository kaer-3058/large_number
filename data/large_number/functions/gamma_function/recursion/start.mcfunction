data modify storage math sstemps set string storage math gamma_function.input -3 -1
execute store success score #is_inte int if data storage math {sstemps:".0"}
execute if score #is_inte int matches 0 run function large_number:gamma_function/recursion/un_inte
execute if score #is_inte int matches 1 run function large_number:gamma_function/recursion/is_inte