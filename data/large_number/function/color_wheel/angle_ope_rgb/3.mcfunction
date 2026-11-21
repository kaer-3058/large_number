scoreboard players set #color_wheel.output.G large_number.int 255
scoreboard players set #color_wheel.output.R large_number.int 0
scoreboard players operation #color_wheel.output.B large_number.int = #color_wheel.angle.input large_number.int
scoreboard players operation #color_wheel.output.B large_number.int *= 17 const
scoreboard players operation #color_wheel.output.B large_number.int /= 4 const
scoreboard players remove #color_wheel.output.B large_number.int 5100000
scoreboard players operation #color_wheel.output.B large_number.int /= 10000 const
