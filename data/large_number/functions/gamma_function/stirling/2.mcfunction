##(-1, 0.2216)区间的近似公式

#当x∈(-1, 0.2216)时，Γ(x+1) ~ 1/(x+1)+(25/49)x

#data modify storage large_number:math gamma_function.input set value 73.2074d

#x+1
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling/as_entity_2

#1/(x+1)
function large_number:division/float_reciprocal/start

#(25/49)x
function large_number:gamma_function/stirling/macro3 with storage large_number:math gamma_function

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 9
function large_number:gamma_function/stirling/macro1 with storage large_number:math

#1/(x+1)+(25/49)x
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:gamma_function/stirling/as_entity_3
