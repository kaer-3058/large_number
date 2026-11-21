#复数的缩放，不改变幅角
data modify storage large_number:math buffer_all_xyz[0] set from storage large_number:math temp_complex_ope_z1.i
data modify storage large_number:math buffer_all_xyz[2] set from storage large_number:math temp_complex_ope_z1.x
data modify entity @s Pos set from storage large_number:math buffer_all_xyz
#因为界定值是0.01，所以这里的随机范围是0.01~0.1
execute store result storage large_number:math temp1 double .0000000001 run random value 100000000..1000000000
execute positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run function large_number:n-th_degree_equation/newton.s_method/list_div_list_bijective_mapping/as_entity_2 with storage large_number:math

data modify storage large_number:math complex_operation.z2 set value {x:0d,i:0d}
data modify storage large_number:math complex_operation.z2.i set from storage large_number:math buffer_all_xyz[0]
data modify storage large_number:math complex_operation.z2.x set from storage large_number:math buffer_all_xyz[2]
