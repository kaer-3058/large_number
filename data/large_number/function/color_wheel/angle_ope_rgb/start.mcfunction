##色环 - 根据角度输出RGB值

#scoreboard players set #color_wheel.angle.input int 131500

execute if score #color_wheel.angle.input int matches 0..600000 run function large_number:color_wheel/angle_ope_rgb/1
execute if score #color_wheel.angle.input int matches 600001..1200000 run function large_number:color_wheel/angle_ope_rgb/2
execute if score #color_wheel.angle.input int matches 1200001..1800000 run function large_number:color_wheel/angle_ope_rgb/3
execute if score #color_wheel.angle.input int matches 1800001..2400000 run function large_number:color_wheel/angle_ope_rgb/4
execute if score #color_wheel.angle.input int matches 2400001..3000000 run function large_number:color_wheel/angle_ope_rgb/5
execute if score #color_wheel.angle.input int matches 3000001..3600000 run function large_number:color_wheel/angle_ope_rgb/6
