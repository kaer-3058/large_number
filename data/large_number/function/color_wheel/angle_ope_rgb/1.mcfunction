scoreboard players set #color_wheel.output.R int 255
scoreboard players set #color_wheel.output.B int 0
scoreboard players operation #color_wheel.output.G int = #color_wheel.angle.input int
scoreboard players operation #color_wheel.output.G int *= 17 const
scoreboard players operation #color_wheel.output.G int /= 40000 const
