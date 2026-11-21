##实数域黎曼zeta函数

#data modify storage large_number:math zeta_function.input set value 2.0

#function large_number:riemann_zeta_function/start

data modify storage large_number:math store_zeta_function_inp set from storage large_number:math zeta_function.input

#支持的值域判断
execute store result score #zeta_function_input_inte_test0 large_number.int run data get storage large_number:math store_zeta_function_inp
execute if score #zeta_function_input_inte_test0 large_number.int matches -20000000..19999999 run function large_number:riemann_zeta_function/ope
execute if score #zeta_function_input_inte_test0 large_number.int matches 20000000.. run data modify storage large_number:math zeta_function.output set value 1d
execute if score #zeta_function_input_inte_test0 large_number.int matches ..-20000001 run data modify storage large_number:math zeta_function.output set value 0d
