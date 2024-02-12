execute in minecraft:overworld run function large_number:exp_e.x/macro8.input_is- with storage math
execute in minecraft:overworld run data modify storage math temp1 set from entity 28529-0-3d00-0-2c4200ee8401 transformation.scale[0]

data modify storage math temp1 set string storage math temp1 0 -1

#判断是否为科学计数法
data modify storage math temp2 set value [{a:0},{a:0},{a:0},{a:0}]
data modify storage math temp2[0].a set string storage math temp1 -5 -4
data modify storage math temp2[1].a set string storage math temp1 -4 -3
data modify storage math temp2[2].a set string storage math temp1 -3 -2
data modify storage math temp2[3].a set string storage math temp1 -2 -1
execute store success score #is_XXEXX int if data storage math temp2[{a:"E"}]

#如果为科学计数法则拆出指数位
data modify storage math temp_expon set value "0"
execute if score #is_XXEXX int matches 1 run function large_number:double_sqrt.if/the_scientific_notation
data modify storage math store_expon_3 set from storage math temp_expon
function large_number:exp_e.x/macro9.input_is-
execute store result storage math temp9 int -1 run scoreboard players operation #store_expon_1 int += #store_expon_3 int
