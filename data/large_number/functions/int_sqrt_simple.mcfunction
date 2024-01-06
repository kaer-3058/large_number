execute store result score #1.0 int store result score #1.1 int run scoreboard players operation output.sqrt int = input.sqrt int
execute if score input.sqrt int matches 1..329475 run function large_number:simple_int_sqrt_range/0
execute if score input.sqrt int matches 329476..18688328 run function large_number:simple_int_sqrt_range/1
execute if score input.sqrt int matches 18688329..533609999 run function large_number:simple_int_sqrt_range/2
execute if score input.sqrt int matches 533610000.. run function large_number:simple_int_sqrt_range/3
scoreboard players operation #1.0 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.0 int
scoreboard players operation output.sqrt int /= 2 const
scoreboard players operation #1.1 int /= output.sqrt int
scoreboard players operation output.sqrt int += #1.1 int
scoreboard players operation output.sqrt int /= 2 const

#感谢伊桑
