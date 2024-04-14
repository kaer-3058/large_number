data modify storage math temp3 set from storage math temp1[0]
data modify storage math temp4 set from storage math temp2[0]
execute if score #parabola_expr_particl_mode int matches 1 run function large_number:parabola/macro5 with storage math
execute if score #parabola_expr_particl_mode int matches 2 run function large_number:parabola/macro6 with storage math

data remove storage math temp1[0]
data remove storage math temp2[0]
execute if data storage math temp1[0] run function large_number:parabola/particle.loop
