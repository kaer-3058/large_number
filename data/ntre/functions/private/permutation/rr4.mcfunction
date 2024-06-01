scoreboard players operation temp1 ntre_system = @s ntre_output

scoreboard players operation @s ntre_output /= NUM16 ntre_system
scoreboard players operation @s ntre_output %= NUM268435456 ntre_system
scoreboard players operation temp1 ntre_system *= NUM268435456 ntre_system

scoreboard players operation @s ntre_output += temp1 ntre_system
