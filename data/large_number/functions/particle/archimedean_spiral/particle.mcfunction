##显示

data modify storage large_number:math temp1 set from storage large_number:math archimedean_spiral_out_listX
data modify storage large_number:math temp2 set from storage large_number:math archimedean_spiral_out_listY

execute if data storage large_number:math temp1[0] if data storage large_number:math temp2[0] run function large_number:particle/archimedean_spiral/particle_loop
