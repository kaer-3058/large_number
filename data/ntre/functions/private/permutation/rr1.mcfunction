scoreboard players operation temp1 ntre_system = @s ntre_output

scoreboard players operation @s ntre_output /= NUM2 ntre_system
execute if score @s ntre_output matches ..-1 run scoreboard players operation @s ntre_output += SIGN ntre_system
scoreboard players operation temp1 ntre_system *= SIGN ntre_system

scoreboard players operation @s ntre_output += temp1 ntre_system
