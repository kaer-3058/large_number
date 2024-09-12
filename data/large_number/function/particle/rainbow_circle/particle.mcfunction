##显示

data modify storage large_number:math temp1 set from storage large_number:math 3d_ar_rotation_circle_posX
data modify storage large_number:math temp2 set from storage large_number:math 3d_ar_rotation_circle_posY
data modify storage large_number:math temp3 set from storage large_number:math rainbow_circle_color

execute if data storage large_number:math temp1[0] run function large_number:particle/rainbow_circle/particle_loop
