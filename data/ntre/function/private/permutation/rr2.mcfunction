scoreboard players operation temp1 ntre_system = @s ntre_output

scoreboard players operation @s ntre_output /= NUM4 ntre_system
scoreboard players operation @s ntre_output %= NUM1073741824 ntre_system
scoreboard players operation temp1 ntre_system *= NUM1073741824 ntre_system

scoreboard players operation @s ntre_output += temp1 ntre_system
