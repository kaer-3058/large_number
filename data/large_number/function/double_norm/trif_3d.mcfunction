##三维范数 - 三角函数法

#data modify storage large_number:math double_norm_3d.x set value 2715.202
#data modify storage large_number:math double_norm_3d.y set value 5013.733
#data modify storage large_number:math double_norm_3d.z set value 4105.28802

#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:double_norm/trif_3d

data modify storage large_number:math temp_double_norm_2d_x set from storage large_number:math double_norm_3d.x
data modify storage large_number:math temp_double_norm_2d_y set from storage large_number:math double_norm_3d.y

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_double_norm_2d_x
data modify storage large_number:math temp2 set from storage large_number:math temp_double_norm_2d_y
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp1 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp2 set from storage large_number:math temp_double_norm_2d_y
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp_double_norm_2d_y set from storage large_number:math temp_double_norm_2d_x
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp_double_norm_2d_x set from storage large_number:math temp2

data modify storage large_number:math buffer_all_xyz[0] set from storage large_number:math temp_double_norm_2d_y
data modify storage large_number:math buffer_all_xyz[2] set from storage large_number:math temp_double_norm_2d_x
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s ^1.0 ^ ^ ~ ~

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_double_norm_2d_x
data modify storage large_number:math float_division.input2 set from entity @s Pos[0]
function large_number:division/float/start

data modify storage large_number:math temp_double_norm_2d_x set from storage large_number:math float_division.output
data modify storage large_number:math temp_double_norm_2d_y set from storage large_number:math double_norm_3d.z

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_double_norm_2d_x
data modify storage large_number:math temp2 set from storage large_number:math temp_double_norm_2d_y
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math temp1 set string storage large_number:math temp1 0 1
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp2 set from storage large_number:math temp_double_norm_2d_y
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp_double_norm_2d_y set from storage large_number:math temp_double_norm_2d_x
execute if data storage large_number:math {temp1:"-"} run data modify storage large_number:math temp_double_norm_2d_x set from storage large_number:math temp2


data modify storage large_number:math buffer_all_xyz[2] set from storage large_number:math temp_double_norm_2d_x
data modify storage large_number:math buffer_all_xyz[0] set from storage large_number:math temp_double_norm_2d_y
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s ^1.0 ^ ^ ~ ~

data modify storage large_number:math float_division.input1 set from storage large_number:math temp_double_norm_2d_x
data modify storage large_number:math float_division.input2 set from entity @s Pos[0]
function large_number:division/float/start
data modify storage large_number:math double_norm_3d.output set from storage large_number:math float_division.output

tp @s .0 .0 .0 .0 .0
