##三维范数 - 单位向量法

#data modify storage large_number:math double_norm_3d.x set value 2715.202
#data modify storage large_number:math double_norm_3d.y set value 5013.733
#data modify storage large_number:math double_norm_3d.z set value 4105.28802

#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/unit_vector_3d

data modify storage large_number:math buffer_all_xyz[0] set from storage large_number:math double_norm_3d.x
data modify storage large_number:math buffer_all_xyz[1] set from storage large_number:math double_norm_3d.y
data modify storage large_number:math buffer_all_xyz[2] set from storage large_number:math double_norm_3d.z
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet run tp @s ^ ^ ^1 ~ ~
data modify storage large_number:math buffer_all_xyz set from entity @s Pos

data modify storage large_number:math temp1 set from storage large_number:math buffer_all_xyz[0]
data modify storage large_number:math temp2 set from storage large_number:math buffer_all_xyz[1]
data modify storage large_number:math temp3 set from storage large_number:math buffer_all_xyz[2]
function large_number:double_norm/macro2 with storage large_number:math
data modify storage large_number:math float_division.input2 set from entity @s Pos[1]

data modify storage large_number:math float_add_subtra.input1 set from storage large_number:math double_norm_3d.x
data modify storage large_number:math float_add_subtra.input2 set from storage large_number:math double_norm_3d.y
scoreboard players set #float_add_subtra_ope_mode int 1
function large_number:float_add_subtra/start
data modify storage large_number:math float_add_subtra.input1 set from storage large_number:math float_add_subtra.output
data modify storage large_number:math float_add_subtra.input2 set from storage large_number:math double_norm_3d.z
function large_number:float_add_subtra/start

data modify storage large_number:math float_division.input1 set from storage large_number:math float_add_subtra.output
function large_number:division/float_12dicimal/start
data modify storage large_number:math double_norm_3d.output set from storage large_number:math float_division.output

tp @s .0 .0 .0 .0 .0
