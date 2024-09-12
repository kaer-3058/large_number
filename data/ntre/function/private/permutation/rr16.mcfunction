scoreboard players operation temp1 ntre_system = @s ntre_output

scoreboard players operation @s ntre_output /= NUM65536 ntre_system
scoreboard players operation @s ntre_output %= NUM65536 ntre_system
scoreboard players operation temp1 ntre_system *= NUM65536 ntre_system

scoreboard players operation @s ntre_output += temp1 ntre_system
