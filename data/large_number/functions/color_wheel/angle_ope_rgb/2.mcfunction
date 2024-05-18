scoreboard players set #color_wheel.output.G int 255
scoreboard players set #color_wheel.output.B int 0
scoreboard players operation #color_wheel.output.R int = #color_wheel.angle.input int
scoreboard players operation #color_wheel.output.R int *= 17 const
scoreboard players operation #color_wheel.output.R int /= 4 const
scoreboard players operation #color_wheel.output.R int *= -1 const
scoreboard players add #color_wheel.output.R int 5100000
scoreboard players operation #color_wheel.output.R int /= 10000 const
