##显示

data modify storage large_number:math temp1 set from storage large_number:math implicit_Pos
execute if data storage large_number:math temp1[0] run function large_number:particle/parametric_equation/particle_loop
