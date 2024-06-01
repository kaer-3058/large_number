scoreboard players operation @s ntre_state_high = @s ntre_seed_high
scoreboard players operation @s ntre_state_low32 = @s ntre_seed_low32
scoreboard players operation @s ntre_state_low16 = @s ntre_seed_low32
scoreboard players operation @s ntre_state_mid16 = @s ntre_seed_low32

scoreboard players operation @s ntre_state_low16 %= NUM65536 ntre_system
scoreboard players operation @s ntre_state_mid16 /= NUM65536 ntre_system
scoreboard players operation @s ntre_state_mid16 %= NUM65536 ntre_system
