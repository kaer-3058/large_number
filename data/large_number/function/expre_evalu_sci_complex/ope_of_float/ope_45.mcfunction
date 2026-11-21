#高精度逆伽玛函数

scoreboard players set #expression_evaluation_test2 large_number.int 2

data modify storage large_number:math inverse_gamma_function.input set from storage large_number:math _expressionss2
execute store result storage large_number:math newton.s_method.loops int 1 run data get storage large_number:math _expressionss1
scoreboard players operation #lib.temp_all_tellraw_set large_number.int = #large_number.all_tellraw_set large_number.int
scoreboard players set #large_number.all_tellraw_set large_number.int 1
function large_number:inverse_gamma_function/high_precision
scoreboard players operation #large_number.all_tellraw_set large_number.int = #lib.temp_all_tellraw_set large_number.int
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:expre_evalu_sci_complex/ope_of_float/ope_8/as_entity_4
