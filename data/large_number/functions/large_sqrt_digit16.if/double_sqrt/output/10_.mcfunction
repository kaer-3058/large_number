scoreboard players operation #d3.1 int /= 10 const
scoreboard players operation #4.1 int = #d2.1 int
scoreboard players operation #d2.1 int /= 10 const
scoreboard players operation #4.1 int %= 10 const
scoreboard players operation #4.1 int *= 1000 const
execute store result score #d3.1 int run scoreboard players operation #4.1 int += #d3.1 int
