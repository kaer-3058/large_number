##对数伽玛函数

#data modify storage large_number:math ln_gamma_function.input set value 37.15

#function large_number:ln_gamma_function/start

data modify storage large_number:math ssstore_gamma_function_inp set from storage large_number:math gamma_function
data modify storage large_number:math gamma_function.input set from storage large_number:math ln_gamma_function.input
function large_number:gamma_function/s_robert_h_w_of_large_number/start

execute if data storage large_number:math gamma_function.output.mantissa run function large_number:ln_gamma_function/1
execute unless data storage large_number:math gamma_function.output.mantissa run function large_number:ln_gamma_function/2

data modify storage large_number:math gamma_function set from storage large_number:math ssstore_gamma_function_inp
