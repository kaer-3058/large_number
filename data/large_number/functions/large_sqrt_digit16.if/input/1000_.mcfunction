execute store result score #d1.1 int run data get storage math large_sqrt_digit16.input[0]
execute store result score #d1.2 int run data get storage math large_sqrt_digit16.input[1]
scoreboard players operation #d1.1 int *= 10000 const
execute store result score #1.0 int store result score #1.1 int store result score #d2.1 int run scoreboard players operation #d1.1 int += #d1.2 int
