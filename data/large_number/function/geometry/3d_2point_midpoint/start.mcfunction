##快速取中点——三维两点的粗略中点

#data modify storage large_number:math 3d_2point_midpoint.p1 set value [7.0,2.0,5.4]
#data modify storage large_number:math 3d_2point_midpoint.p2 set value [-13.0,-8.3,2.6]
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:geometry/3d_2point_midpoint/start

data modify entity @s Pos set from storage large_number:math 3d_2point_midpoint.p1
execute at @s run function large_number:geometry/3d_2point_midpoint/2
tp .0 .0 .0
