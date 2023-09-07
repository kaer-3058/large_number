scoreboard players operation #d3.1 int /= 1000 const
scoreboard players operation #4.1 int = #d2.1 int
execute store result storage math vast_3d_vector.output[0] int 1.0 run scoreboard players operation #d2.1 int /= 1000 const
scoreboard players operation #4.1 int %= 1000 const
scoreboard players operation #4.1 int *= 10 const
execute store result storage math vast_3d_vector.output[1] int 1.0 run scoreboard players operation #4.1 int += #d3.1 int
