execute store result storage large_number:math temp1 double 1 run data get storage large_number:math store_zeta_function_inp
execute store success score #1.expression_evaluation_test1 large_number.int run data modify storage large_number:math temp1 set from storage large_number:math store_zeta_function_inp
execute store result score #temp1 large_number.int run data get storage large_number:math store_zeta_function_inp
execute unless score #temp1 large_number.int matches -20..30 run scoreboard players set #1.expression_evaluation_test1 large_number.int 1
execute if score #1.expression_evaluation_test1 large_number.int matches 0 run return run function large_number:riemann_zeta_function/inte_database
execute if score #1.expression_evaluation_test1 large_number.int matches 1 run function large_number:riemann_zeta_function/ope.next1
