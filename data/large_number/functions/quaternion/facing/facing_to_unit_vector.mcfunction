##执行朝向转单位向量

#需要传入世界实体为执行者
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/facing/facing_to_unit_vector

execute positioned .0 .0 .0 run tp ^ ^ ^1.0
data modify storage large_number:math buffer_all_xyz set from entity @s Pos
execute store result storage large_number:math unit_vector[0] float .000000001 run data get storage large_number:math buffer_all_xyz[0] 1000000000
execute store result storage large_number:math unit_vector[1] float .000000001 run data get storage large_number:math buffer_all_xyz[1] 1000000000
execute store result storage large_number:math unit_vector[2] float .000000001 run data get storage large_number:math buffer_all_xyz[2] 1000000000

#summon block_display ~ ~ ~ {block_state:{Name:"furnace"},Tags:["2333"]}
#data modify storage large_number:math temp1 set value {axis:[0f,0f,0f],angle:0f}
#data modify storage large_number:math temp1.axis set from storage large_number:math unit_vector
#data modify entity @e[type=block_display,tag=2333,limit=1] transformation.left_rotation set from storage large_number:math temp1
