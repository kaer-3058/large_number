#double10进制位移

#data modify storage large_number:math double_displacement.input set value 72.33
#data modify storage large_number:math double_displacement.shift set value 5

data modify storage large_number:math temp1 set string storage large_number:math double_displacement.input 0 -1

data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1

execute store success score #is_XXEXX int if data storage large_number:math temp2[{a:"E"}]
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation

execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math
execute store result score #temp1 int run data get storage large_number:math double_displacement.shift
execute store result storage large_number:math temp_expon int 1 run scoreboard players operation #_exp int += #temp1 int
function large_number:double_displacement/macro1 with storage large_number:math
data modify storage large_number:math double_displacement.output set from storage large_number:math s0
