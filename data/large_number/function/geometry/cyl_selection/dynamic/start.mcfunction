##动态参数的圆柱选区

#data modify storage large_number:math cyl_selection.command set value "effect give @s glowing 1 0 true"
#data modify storage large_number:math cyl_selection.distance set value 3.0

#执行：execute at @a as b09e-44-fded-6-efa5ffffef64 run function large_number:geometry/cyl_selection/dynamic/start

tp ~ .0 ~
execute as @e at @s positioned ~ .0 ~ run function large_number:geometry/cyl_selection/dynamic/2
tp .0 .0 .0
