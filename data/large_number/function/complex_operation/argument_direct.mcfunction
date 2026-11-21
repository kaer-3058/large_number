##复数信息 - 幅角

#z1=a+bi

#输入：data modify storage large_number:math complex_operation.z1 set value {x:1.0,i:2.0}

#输出弧度

#function large_number:complex_operation/argument_direct

data modify storage large_number:math temp_complex_ope_z1 set from storage large_number:math complex_operation.z1

data modify storage large_number:math atan2_double.y set from storage large_number:math temp_complex_ope_z1.i
data modify storage large_number:math atan2_double.x set from storage large_number:math temp_complex_ope_z1.x
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:math_trifs/atan2_double/start

execute store result storage large_number:math temp1 double 1745329.251994329576 run data get storage large_number:math atan2_double.output 1000000

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
execute store result storage large_number:math temp_expon int 1 run scoreboard players remove #_exp large_number.int 14
function large_number:gamma_function/stirling/macro1 with storage large_number:math

data modify storage large_number:math complex_operation.output set from storage large_number:math sstemp06
