#x^2
data modify storage large_number:math float_multiply.input1 set from storage large_number:math error_function.input
function large_number:float_mul.high_precision/squ/start

#ax^2
function large_number:error_function/macro1 with storage large_number:math float_multiply

#double10进制位移
data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -1
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp int 3
function large_number:gamma_function/stirling/macro1 with storage large_number:math

#(4/π+ax^2)/(1+ax^2)
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:error_function/as_entity_1
function large_number:division/float/start

#x^2*(4/π+ax^2)/(1+ax^2)
data modify storage large_number:math float_multiply.input1 set from storage large_number:math float_multiply.output
data modify storage large_number:math float_multiply.input2 set from storage large_number:math float_division.output
function large_number:float_mul.high_precision/start

#exp(-x^2*(4/π+ax^2)/(1+ax^2))
function large_number:error_function/macro2 with storage large_number:math float_multiply
function large_number:exp_e.x/start

#sqrt(1-exp(-x^2*(4/π+ax^2)/(1+ax^2)))
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 1.0 .0 run function large_number:error_function/as_entity_2
function large_number:double_sqrt

#如果输入值为负则输出也是负数
data modify storage large_number:math stempu set from storage large_number:math double_sqrt.output
data modify storage large_number:math stemp1 set string storage large_number:math error_function.input 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:error_function/macro4 with storage large_number:math

#输出
data modify storage large_number:math error_function.output set from storage large_number:math stempu
