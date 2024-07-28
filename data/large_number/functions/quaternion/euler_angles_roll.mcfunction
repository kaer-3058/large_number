##横滚角转四元数

#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/euler_angles_roll

#输入：data modify storage large_number:math euler_angles_roll set value 0.0
#输出：data get storage large_number:math xyzw

execute store result entity @s Rotation[0] float -.0001 run data get storage large_number:math euler_angles_roll 5000
execute rotated as @s rotated ~ .0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~

data modify storage large_number:math xyzw set value [0f,0f,0f,0f]
execute store result storage large_number:math xyzw[3] float .000000001 run data get entity @s Pos[0] 1000000000
execute store result storage large_number:math xyzw[2] float -.000000001 run data get entity @s Pos[2] 1000000000
