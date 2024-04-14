execute store result score #digit1.3 int run scoreboard players get #vast_3d_verctor.x^2_2 int
execute store result score #digit1.4 int run scoreboard players get #vast_3d_verctor.x^2_3 int

#不超过八位的大数的平方
execute store result score #1.3 int run scoreboard players operation #y int = #d3.1 int
execute store result score #1.2 int run scoreboard players operation #x int = #d2.1 int

execute store result score #4.4 int run scoreboard players operation #1.3 int *= #y int
scoreboard players operation #1.2 int *= #y int
scoreboard players operation #y int *= #x int
scoreboard players operation #x int *= #x int
scoreboard players operation #y int += #1.2 int
scoreboard players operation #4.4 int /= 10000 const
execute store result score #4.3 int run scoreboard players operation #y int += #4.4 int
scoreboard players operation #4.3 int /= 10000 const
execute store result score #4.2 int run scoreboard players operation #x int += #4.3 int
execute store result score #1.0 int run scoreboard players operation #4.2 int /= 10000 const
scoreboard players operation #1.3 int %= 10000 const
scoreboard players operation #y int %= 10000 const
scoreboard players operation #x int %= 10000 const
#1.0 #x #y #1.3

#对比   大于原数为1，小于原数为-1，等于原数为0
scoreboard players set #is_> int 0
execute if score #1.0 int > #digit1.1 int run scoreboard players set #is_> int 1
execute unless score #1.0 int < #digit1.1 int if score #x int > #digit1.2 int run scoreboard players set #is_> int 1
execute unless score #1.0 int < #digit1.1 int unless score #x int < #digit1.2 int if score #y int > #digit1.3 int run scoreboard players set #is_> int 1
execute unless score #1.0 int < #digit1.1 int unless score #x int < #digit1.2 int unless score #y int < #digit1.3 int if score #1.3 int > #digit1.4 int run scoreboard players set #is_> int 1

execute if score #1.0 int < #digit1.1 int run scoreboard players set #is_> int -1
execute unless score #1.0 int > #digit1.1 int if score #x int < #digit1.2 int run scoreboard players set #is_> int -1
execute unless score #1.0 int > #digit1.1 int unless score #x int > #digit1.2 int if score #y int < #digit1.3 int run scoreboard players set #is_> int -1
execute unless score #1.0 int > #digit1.1 int unless score #x int > #digit1.2 int unless score #y int > #digit1.3 int if score #1.3 int < #digit1.4 int run scoreboard players set #is_> int -1

execute if score #is_> int matches 1 run function large_number:large_sqrt_digit16.if/test16/if_greater_than
execute if score #is_> int matches -1 run function large_number:large_sqrt_digit16.if/test16/if_less_than

execute if score #is_> int matches -1 if score #is_>.test16 int matches 1 run scoreboard players remove #d3.1 int 1