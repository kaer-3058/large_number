execute store result score #digit1.3 large_number.int run data get storage large_number:math large_sqrt_digit16.input[2]
execute store result score #digit1.4 large_number.int run data get storage large_number:math large_sqrt_digit16.input[3]

#不超过八位的大数的平方
execute store result score #1.3 large_number.int run scoreboard players operation #y large_number.int = #d3.1 large_number.int
execute store result score #1.2 large_number.int run scoreboard players operation #x large_number.int = #d2.1 large_number.int

execute store result score #4.4 large_number.int run scoreboard players operation #1.3 large_number.int *= #y large_number.int
scoreboard players operation #1.2 large_number.int *= #y large_number.int
scoreboard players operation #y large_number.int *= #x large_number.int
scoreboard players operation #x large_number.int *= #x large_number.int
scoreboard players operation #y large_number.int += #1.2 large_number.int
scoreboard players operation #4.4 large_number.int /= 10000 const
execute store result score #4.3 large_number.int run scoreboard players operation #y large_number.int += #4.4 large_number.int
scoreboard players operation #4.3 large_number.int /= 10000 const
execute store result score #4.2 large_number.int run scoreboard players operation #x large_number.int += #4.3 large_number.int
execute store result score #1.0 large_number.int run scoreboard players operation #4.2 large_number.int /= 10000 const
scoreboard players operation #1.3 large_number.int %= 10000 const
scoreboard players operation #y large_number.int %= 10000 const
scoreboard players operation #x large_number.int %= 10000 const
#1.0 #x #y #1.3

#对比   大于原数为1，小于原数为-1，等于原数为0
scoreboard players set #is_> large_number.int 0
execute if score #1.0 large_number.int > #digit1.1 large_number.int run scoreboard players set #is_> large_number.int 1
execute unless score #1.0 large_number.int < #digit1.1 large_number.int if score #x large_number.int > #digit1.2 large_number.int run scoreboard players set #is_> large_number.int 1
execute unless score #1.0 large_number.int < #digit1.1 large_number.int unless score #x large_number.int < #digit1.2 large_number.int if score #y large_number.int > #digit1.3 large_number.int run scoreboard players set #is_> large_number.int 1
execute unless score #1.0 large_number.int < #digit1.1 large_number.int unless score #x large_number.int < #digit1.2 large_number.int unless score #y large_number.int < #digit1.3 large_number.int if score #1.3 large_number.int > #digit1.4 large_number.int run scoreboard players set #is_> large_number.int 1

execute if score #1.0 large_number.int < #digit1.1 large_number.int run scoreboard players set #is_> large_number.int -1
execute unless score #1.0 large_number.int > #digit1.1 large_number.int if score #x large_number.int < #digit1.2 large_number.int run scoreboard players set #is_> large_number.int -1
execute unless score #1.0 large_number.int > #digit1.1 large_number.int unless score #x large_number.int > #digit1.2 large_number.int if score #y large_number.int < #digit1.3 large_number.int run scoreboard players set #is_> large_number.int -1
execute unless score #1.0 large_number.int > #digit1.1 large_number.int unless score #x large_number.int > #digit1.2 large_number.int unless score #y large_number.int > #digit1.3 large_number.int if score #1.3 large_number.int < #digit1.4 large_number.int run scoreboard players set #is_> large_number.int -1

execute if score #is_> large_number.int matches 1 run function large_number:large_sqrt_digit16.if/test16/if_greater_than
execute if score #is_> large_number.int matches -1 run function large_number:large_sqrt_digit16.if/test16/if_less_than

execute if score #is_> large_number.int matches -1 if score #is_>.test16 large_number.int matches 1 run scoreboard players remove #d3.1 large_number.int 1
