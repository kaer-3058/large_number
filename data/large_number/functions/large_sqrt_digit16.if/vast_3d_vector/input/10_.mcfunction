execute store result score #d1.1 int run scoreboard players get #vast_3d_verctor.x^2_0 int
execute store result score #d1.2 int run scoreboard players get #vast_3d_verctor.x^2_1 int
execute store result score #d1.3 int run scoreboard players get #vast_3d_verctor.x^2_2 int
scoreboard players operation #d1.3 int /= 100 const
scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #d1.1 int += #d1.2 int
scoreboard players operation #d1.1 int *= 100 const
execute store result score #1.0 int store result score #1.1 int store result score #1.2 int store result score #1.3 int store result score #d2.1 int run scoreboard players operation #d1.1 int += #d1.3 int
