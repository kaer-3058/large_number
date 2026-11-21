##计算色相立方uv坐标
#scoreboard players set #color_cube.u large_number.int 3333
#scoreboard players set #color_cube.v large_number.int 6666

#公式：R=floor(((255-R)u+R)(1-v))

scoreboard players set #color_cube.R large_number.int 255
scoreboard players set #color_cube.G large_number.int 255
scoreboard players set #color_cube.B large_number.int 255

scoreboard players operation #color_cube.R large_number.int -= #color_wheel.output.R large_number.int
scoreboard players operation #color_cube.G large_number.int -= #color_wheel.output.G large_number.int
scoreboard players operation #color_cube.B large_number.int -= #color_wheel.output.B large_number.int
scoreboard players operation #color_cube.R large_number.int *= #color_cube.u large_number.int
scoreboard players operation #color_cube.G large_number.int *= #color_cube.u large_number.int
scoreboard players operation #color_cube.B large_number.int *= #color_cube.u large_number.int
scoreboard players operation #temp1 large_number.int = #color_wheel.output.R large_number.int
scoreboard players operation #temp2 large_number.int = #color_wheel.output.G large_number.int
scoreboard players operation #temp3 large_number.int = #color_wheel.output.B large_number.int
scoreboard players operation #temp1 large_number.int *= 10000 const
scoreboard players operation #temp2 large_number.int *= 10000 const
scoreboard players operation #temp3 large_number.int *= 10000 const
scoreboard players operation #color_cube.R large_number.int += #temp1 large_number.int
scoreboard players operation #color_cube.G large_number.int += #temp2 large_number.int
scoreboard players operation #color_cube.B large_number.int += #temp3 large_number.int

scoreboard players set #store_color_cube.v large_number.int 10000
execute store result storage large_number:math temp1 double 0.0001 run scoreboard players operation #store_color_cube.v large_number.int -= #color_cube.v large_number.int
function large_number:color_wheel/in/ope_uv_color/macro1 with storage large_number:math

execute store result score #color_cube.R large_number.int run data get storage large_number:math temp1 0.0001
execute store result score #color_cube.G large_number.int run data get storage large_number:math temp2 0.0001
execute store result score #color_cube.B large_number.int run data get storage large_number:math temp3 0.0001
