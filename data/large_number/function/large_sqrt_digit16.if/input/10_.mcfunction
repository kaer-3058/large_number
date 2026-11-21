execute store result score #d1.1 large_number.int run data get storage large_number:math large_sqrt_digit16.input[0]
execute store result score #d1.2 large_number.int run data get storage large_number:math large_sqrt_digit16.input[1]
execute store result score #d1.3 large_number.int run data get storage large_number:math large_sqrt_digit16.input[2]
scoreboard players operation #d1.3 large_number.int /= 100 const
scoreboard players operation #d1.1 large_number.int *= 10000 const
scoreboard players operation #d1.1 large_number.int += #d1.2 large_number.int
scoreboard players operation #d1.1 large_number.int *= 100 const
execute store result score #1.0 large_number.int store result score #1.1 large_number.int store result score #d2.1 large_number.int run scoreboard players operation #d1.1 large_number.int += #d1.3 large_number.int
