data modify storage large_number:math stemp1 set from storage large_number:math temp1[0]
data modify storage large_number:math stemp2 set from storage large_number:math temp2[0]
data modify storage large_number:math stemp3 set from storage large_number:math temp3[0].R
data modify storage large_number:math stemp4 set from storage large_number:math temp3[0].G
data modify storage large_number:math stemp5 set from storage large_number:math temp3[0].B
function large_number:particle/rainbow_circle/particle.macro1 with storage large_number:math

data remove storage large_number:math temp1[0]
data remove storage large_number:math temp2[0]
data remove storage large_number:math temp3[0]
execute if data storage large_number:math temp1[0] run function large_number:particle/rainbow_circle/particle_loop
