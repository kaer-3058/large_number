##显示

data modify storage large_number:math temp1 set from storage large_number:math 3d_ar_ellipse_pos

execute if data storage large_number:math temp1[0] run function large_number:particle/3d_ar_ellipse/particle_loop
