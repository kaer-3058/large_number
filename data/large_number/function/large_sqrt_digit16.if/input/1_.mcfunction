execute store result score #d1.1 int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #d1.2 int run data get storage large_number:math large_sqrt_digit16.input[1]
execute store result score #d1.3 int run data get storage large_number:math large_sqrt_digit16.input[2]
scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #d1.1 int += #d1.2 int
scoreboard players operation #d1.1 int *= 10000 const
execute store result score #1.0 int store result score #1.1 int store result score #d2.1 int run scoreboard players operation #d1.1 int += #d1.3 int
