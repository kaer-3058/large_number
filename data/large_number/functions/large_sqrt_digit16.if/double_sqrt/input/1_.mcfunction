scoreboard players operation #d1.1 int = #double_to_int.1 int
scoreboard players operation #d1.2 int = #double_to_int.5 int
scoreboard players operation #d1.3 int = #double_to_int.9 int

scoreboard players operation #d1.1 int *= 10000 const
scoreboard players operation #d1.1 int += #d1.2 int
scoreboard players operation #d1.1 int *= 10000 const
execute store result score #1.0 int store result score #1.1 int store result score #1.2 int store result score #1.3 int store result score #d2.1 int run scoreboard players operation #d1.1 int += #d1.3 int
