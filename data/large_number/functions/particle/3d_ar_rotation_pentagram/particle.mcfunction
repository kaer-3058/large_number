##显示

data modify storage math temp1 set from storage math 3d_ar_rotation_pentagram_posX
data modify storage math temp2 set from storage math 3d_ar_rotation_pentagram_posY

execute if data storage math temp1[0] if data storage math temp2[0] run function large_number:particle/3d_ar_rotation_circle/particle_loop
