scoreboard players operation #d3.1 int /= 100 const
scoreboard players operation #4.1 int = #d2.1 int
execute store result storage math large_sqrt_digit16.output2[0] int 1.0 run scoreboard players operation #d2.1 int /= 100 const
scoreboard players operation #4.1 int %= 100 const
scoreboard players operation #4.1 int *= 100 const
execute store result storage math large_sqrt_digit16.output2[1] int 1.0 run scoreboard players operation #4.1 int += #d3.1 int
