execute store result score #natural_num.factorial.input int run data get storage large_number:math gamma_function.input
function large_number:gamma_function/fundamental_factorial/start
execute if score #natural_num.factorial.input int matches 0..12 store result storage large_number:math gamma_function.output double 1 run data get storage large_number:math natural_num_factorial
execute if score #natural_num.factorial.input int matches 13.. run data modify storage large_number:math gamma_function.output set from storage large_number:math natural_num_factorial
