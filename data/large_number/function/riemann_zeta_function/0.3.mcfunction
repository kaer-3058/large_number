execute as b09e-44-fded-6-efa5ffffef64 run function large_number:riemann_zeta_function/as_entity_5
function large_number:riemann_zeta_function/macro2 with storage large_number:math

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX large_number.int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX large_number.int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp large_number.int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 3
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math float_division.input1 set from storage large_number:math sstemp06

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:riemann_zeta_function/as_entity_6
function large_number:float_mul.high_precision/squ/start
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:riemann_zeta_function/as_entity_7
function large_number:division/float/start
data modify storage large_number:math temp_zeta_function_t_03 set from storage large_number:math float_division.output
