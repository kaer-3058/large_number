scoreboard players operation temp1 ntre_system = @s ntre_output

scoreboard players operation @s ntre_output /= NUM256 ntre_system
scoreboard players operation @s ntre_output %= NUM16777216 ntre_system
scoreboard players operation temp1 ntre_system *= NUM16777216 ntre_system

scoreboard players operation @s ntre_output += temp1 ntre_system
