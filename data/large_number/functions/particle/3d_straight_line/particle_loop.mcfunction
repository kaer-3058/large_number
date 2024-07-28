data modify storage large_number:math stemp1 set from storage large_number:math temp1[0]
function large_number:particle/3d_straight_line/particle.macro1 with storage large_number:math

data remove storage large_number:math temp1[0]
execute if data storage large_number:math temp1[0] run function large_number:particle/3d_straight_line/particle_loop
