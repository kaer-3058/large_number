scoreboard players set #zeta_function_input_inte_test1 large_number.int 0
data modify storage large_number:math temp1 set string storage large_number:math store_zeta_function_inp 0 1
execute store success score #zeta_function_input_inte_test1 large_number.int if data storage large_number:math {temp1:"-"}

execute if score #zeta_function_input_inte_test1 large_number.int matches 0 run function large_number:riemann_zeta_function/0
execute if score #zeta_function_input_inte_test1 large_number.int matches 1 run function large_number:riemann_zeta_function/1
