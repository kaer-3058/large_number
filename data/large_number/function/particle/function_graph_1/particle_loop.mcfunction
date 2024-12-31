data modify storage large_number:math stemp1 set from storage large_number:math temp1[0][0]
data modify storage large_number:math stemp2 set from storage large_number:math temp1[0][1]
execute if score #function_graph_1.particle.mode int matches 1 run function large_number:particle/function_graph_1/particle.macro1 with storage large_number:math
execute if score #function_graph_1.particle.mode int matches 2 run function large_number:particle/function_graph_1/particle.macro2 with storage large_number:math

data remove storage large_number:math temp1[0]
execute if data storage large_number:math temp1[0] run function large_number:particle/function_graph_1/particle_loop
