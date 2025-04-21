#高精度逆伽玛函数

scoreboard players set #expression_evaluation_test2 int 2

data modify storage large_number:math inverse_gamma_function.input set from storage large_number:math _expressionss2
execute store result storage large_number:math newton.s_method.loops int 1 run data get storage large_number:math _expressionss1
scoreboard players set #large_number.all_tellraw_set int 1
function large_number:inverse_gamma_function/high_precision
scoreboard players set #large_number.all_tellraw_set int 0
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:expression_evaluation_scientific/ope_of_float/ope_8/as_entity_4
