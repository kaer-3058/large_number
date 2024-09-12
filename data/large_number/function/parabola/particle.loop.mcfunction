data modify storage large_number:math temp3 set from storage large_number:math temp1[0]
data modify storage large_number:math temp4 set from storage large_number:math temp2[0]
execute if score #parabola_expr_particl_mode int matches 1 run function large_number:parabola/macro5 with storage large_number:math
execute if score #parabola_expr_particl_mode int matches 2 run function large_number:parabola/macro6 with storage large_number:math

data remove storage large_number:math temp1[0]
data remove storage large_number:math temp2[0]
execute if data storage large_number:math temp1[0] run function large_number:parabola/particle.loop
