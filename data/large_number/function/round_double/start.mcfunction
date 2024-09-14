##对浮点数向下取整

#data modify storage large_number:math round_double.input set value 38.6625
#向0取余：scoreboard players set #round_towards_zero int 1

data modify storage large_number:math temp1 set string storage large_number:math round_double.input 0 -1

#判断是否为科学计数法
data modify storage large_number:math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp2[0].a set string storage large_number:math temp1 -5 -4
data modify storage large_number:math temp2[1].a set string storage large_number:math temp1 -4 -3
data modify storage large_number:math temp2[2].a set string storage large_number:math temp1 -3 -2
data modify storage large_number:math temp2[3].a set string storage large_number:math temp1 -2 -1
execute store success score #is_XXEXX int run data get storage large_number:math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage large_number:math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
execute store result score #_exp int run function large_number:sigmoid/macro3 with storage large_number:math

execute if score #_exp int matches 16.. run data modify storage large_number:math round_double.output set from storage large_number:math round_double.input
execute if score #_exp int matches ..-16 run data modify storage large_number:math round_double.output set value 0.0
execute if score #_exp int matches -15..15 run function large_number:round_double/1
