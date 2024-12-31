data modify storage large_number:math stemp1 set from storage large_number:math temp1[0][0]
data modify storage large_number:math stemp2 set from storage large_number:math temp1[0][1]
data modify storage large_number:math stemp3 set from storage large_number:math temp1[0][2]
function large_number:particle/function_graph_2/particle.macro1 with storage large_number:math

data remove storage large_number:math temp1[0]
execute if data storage large_number:math temp1[0] run function large_number:particle/function_graph_2/particle_loop
