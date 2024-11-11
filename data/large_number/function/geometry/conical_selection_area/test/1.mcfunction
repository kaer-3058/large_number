#静态参数的圆锥体选区

execute positioned .0 .0 .0 run tp b09e-44-fded-6-efa5ffffef64 ^ ^ ^1
execute as @e[distance=..10] facing entity @s feet positioned .0 .0 .0 positioned ^ ^ ^1 run function large_number:geometry/conical_selection_area/test/2
