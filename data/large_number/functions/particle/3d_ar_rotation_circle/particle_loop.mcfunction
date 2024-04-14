data modify storage math stemp1 set from storage math temp1[0]
data modify storage math stemp2 set from storage math temp2[0]
function large_number:particle/3d_ar_rotation_circle/particle.macro1 with storage math

data remove storage math temp1[0]
data remove storage math temp2[0]
execute if data storage math temp1[0] run function large_number:particle/3d_ar_rotation_circle/particle_loop
