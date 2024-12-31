##显示

#显示模式：scoreboard players set #function_graph_1.particle.mode int 1
#1是自变量为x，2是自变量为y

data modify storage large_number:math temp1 set from storage large_number:math function_graph_1_Pos
execute if data storage large_number:math temp1[0] run function large_number:particle/function_graph_1/particle_loop
