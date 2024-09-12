scoreboard players set #color_wheel.output.R int 255
scoreboard players set #color_wheel.output.G int 0
scoreboard players operation #color_wheel.output.B int = #color_wheel.angle.input int
scoreboard players operation #color_wheel.output.B int *= 17 const
scoreboard players operation #color_wheel.output.B int /= 4 const
scoreboard players operation #color_wheel.output.B int *= -1 const
scoreboard players add #color_wheel.output.B int 15300000
scoreboard players operation #color_wheel.output.B int /= 10000 const
