##显示

data modify storage large_number:math temp1 set value []
data modify storage large_number:math temp1 append from storage large_number:math regular_polygon_Pos[][]
execute if data storage large_number:math temp1[0] run function large_number:particle/regular_polygon/particle_loop
