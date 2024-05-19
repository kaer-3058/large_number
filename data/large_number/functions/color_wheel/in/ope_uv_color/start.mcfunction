##计算色相立方uv坐标
#scoreboard players set #color_cube.u int 3333
#scoreboard players set #color_cube.v int 6666

scoreboard players set #color_cube.R int 255
scoreboard players set #color_cube.G int 255
scoreboard players set #color_cube.B int 255

scoreboard players operation #color_cube.R int -= #color_cube.start.R int
scoreboard players operation #color_cube.G int -= #color_cube.start.G int
scoreboard players operation #color_cube.B int -= #color_cube.start.B int
scoreboard players operation #color_cube.R int *= #color_cube.u int
scoreboard players operation #color_cube.G int *= #color_cube.u int
scoreboard players operation #color_cube.B int *= #color_cube.u int
scoreboard players operation #temp1 int = #color_cube.start.R int
scoreboard players operation #temp2 int = #color_cube.start.G int
scoreboard players operation #temp3 int = #color_cube.start.B int
scoreboard players operation #temp1 int *= 10000 const
scoreboard players operation #temp2 int *= 10000 const
scoreboard players operation #temp3 int *= 10000 const
scoreboard players operation #color_cube.R int += #temp1 int
scoreboard players operation #color_cube.G int += #temp2 int
scoreboard players operation #color_cube.B int += #temp3 int

scoreboard players set #store_color_cube.v int 10000
execute store result storage large_number:math temp1 double 0.0001 run scoreboard players operation #store_color_cube.v int -= #color_cube.v int
function large_number:color_wheel/in/ope_uv_color/macro1 with storage large_number:math

execute store result score #color_cube.R int run data get storage large_number:math temp1 0.0001
execute store result score #color_cube.G int run data get storage large_number:math temp2 0.0001
execute store result score #color_cube.B int run data get storage large_number:math temp3 0.0001
