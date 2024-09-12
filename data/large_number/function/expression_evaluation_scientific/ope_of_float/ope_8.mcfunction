#sin(x)

function large_number:expression_evaluation_scientific/ope_of_float/ope_8/macro2 with storage large_number:math
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]

#仅取前16位，如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 7
function large_number:sigmoid/macro4_f with storage large_number:math

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:expression_evaluation_scientific/ope_of_float/ope_8/as_entity_1
