#loop
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #loop int
execute at @s run function large_number:particle/star_line/2/2
scoreboard players operation #loop int += #star_line.step.θ int
execute if score #loop int <= #loop.rule int run function large_number:particle/star_line/2/loop
