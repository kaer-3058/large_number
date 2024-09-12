execute store result score #natural_num.factorial.input int run data get storage large_number:math _expressionss2
scoreboard players remove #natural_num.factorial.input int 1
function large_number:gamma_function/fundamental_factorial/start
execute if score #natural_num.factorial.input int matches 0..12 store result storage large_number:math _expressionss3 double 1 run data get storage large_number:math natural_num_factorial
execute if score #natural_num.factorial.input int matches 13.. run data modify storage large_number:math _expressionss3 set from storage large_number:math natural_num_factorial