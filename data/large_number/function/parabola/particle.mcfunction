##显示抛物线，可调整模式
#scoreboard players set #parabola_expr_particl_mode int 1

data modify storage large_number:math temp1 set from storage large_number:math parabola_expre_x
data modify storage large_number:math temp2 set from storage large_number:math parabola_expre_y

execute if data storage large_number:math temp1[0] if data storage large_number:math temp2[0] run function large_number:parabola/particle.loop
