##动态参数的圆锥体选区
#感谢：ethan

#data modify storage large_number:math conical_selection_area.distance set value 10.0
#data modify storage large_number:math conical_selection_area.command set value "effect give @s glowing 1 0 true"
#data modify storage large_number:math conical_selection_area.angle set value 15.2

execute positioned .0 .0 .0 as b09e-44-fded-6-efa5ffffef64 run function large_number:geometry/conical_selection_area/1
function large_number:geometry/conical_selection_area/macro1 with storage large_number:math conical_selection_area
