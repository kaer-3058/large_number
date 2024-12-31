##显示

data modify storage large_number:math temp1 set from storage large_number:math function_graph_2_Pos
execute if data storage large_number:math temp1[0] run function large_number:particle/function_graph_2/particle_loop
