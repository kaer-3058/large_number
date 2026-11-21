#loop
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #loop large_number.int
execute at @s run function large_number:particle/star_line/2/2
scoreboard players operation #loop large_number.int += #star_line.step.θ large_number.int
execute if score #loop large_number.int <= #loop.rule large_number.int run function large_number:particle/star_line/2/loop
