##计算色相立方
#scoreboard players set #color_wheel.angle.input int 131500

function large_number:color_wheel/angle_ope_rgb/start

data modify storage large_number:math color_wheel_color_cube_RGB set value {01:0.0,02:0.0,03:0.0,04:0.0,05:0.0,06:0.0,07:0.0,08:0.0,09:0.0,11:0.0,12:0.0,13:0.0,14:0.0,15:0.0,16:0.0,17:0.0,18:0.0,19:0.0,21:0.0,22:0.0,23:0.0,24:0.0,25:0.0,26:0.0,27:0.0,28:0.0,29:0.0,31:0.0,32:0.0,33:0.0,34:0.0,35:0.0,36:0.0,37:0.0,38:0.0,39:0.0,41:0.0,42:0.0,43:0.0,44:0.0,45:0.0,46:0.0,47:0.0,48:0.0,49:0.0,51:0.0,52:0.0,53:0.0,54:0.0,55:0.0,56:0.0,57:0.0,58:0.0,59:0.0,61:0.0,62:0.0,63:0.0,64:0.0,65:0.0,66:0.0,67:0.0,68:0.0,69:0.0,71:0.0,72:0.0,73:0.0,74:0.0,75:0.0,76:0.0,77:0.0,78:0.0,79:0.0,81:0.0,82:0.0,83:0.0,84:0.0,85:0.0,86:0.0,87:0.0,88:0.0,89:0.0,marker_rotate:0.0}
execute store result storage large_number:math color_wheel_color_cube_RGB.marker_rotate double -0.0001 run scoreboard players get #color_wheel.angle.input int

scoreboard players reset #color_wheel.color_cube.particle_mode int
execute if score #color_wheel.angle.input int matches 0..600000 run function large_number:color_wheel/in/1
execute if score #color_wheel.angle.input int matches 600001..1200000 run function large_number:color_wheel/in/2
execute if score #color_wheel.angle.input int matches 1200001..1800000 run function large_number:color_wheel/in/3
execute if score #color_wheel.angle.input int matches 1800001..2400000 run function large_number:color_wheel/in/4
execute if score #color_wheel.angle.input int matches 2400001..3000000 run function large_number:color_wheel/in/5
execute if score #color_wheel.angle.input int matches 3000001..3600000 run function large_number:color_wheel/in/6
