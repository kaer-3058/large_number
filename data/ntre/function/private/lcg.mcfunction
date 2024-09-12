scoreboard players operation temp2 ntre_system = @s ntre_state_low16
scoreboard players operation @s ntre_state_low16 *= MULTIPLIER_LOW16 ntre_system
scoreboard players operation @s ntre_state_low16 += INCREMENT_LOW16 ntre_system
scoreboard players operation temp1 ntre_system = @s ntre_state_low16
scoreboard players operation @s ntre_state_low16 %= NUM65536 ntre_system
scoreboard players operation temp1 ntre_system /= NUM65536 ntre_system
scoreboard players operation temp1 ntre_system %= NUM65536 ntre_system

scoreboard players operation temp2 ntre_system *= MULTIPLIER_MID16 ntre_system
scoreboard players operation temp2 ntre_system += temp1 ntre_system
scoreboard players operation temp1 ntre_system = @s ntre_state_mid16
scoreboard players operation @s ntre_state_mid16 *= MULTIPLIER_LOW16 ntre_system
scoreboard players operation @s ntre_state_mid16 += INCREMENT_MID16 ntre_system
scoreboard players operation @s ntre_state_mid16 += temp2 ntre_system
scoreboard players operation temp2 ntre_system = @s ntre_state_mid16
scoreboard players operation @s ntre_state_mid16 %= NUM65536 ntre_system
scoreboard players operation temp2 ntre_system /= NUM65536 ntre_system
scoreboard players operation temp2 ntre_system %= NUM65536 ntre_system

scoreboard players operation @s ntre_state_high *= MULTIPLIER_LOW32 ntre_system
scoreboard players operation @s ntre_state_high += INCREMENT_HIGH ntre_system
scoreboard players operation @s ntre_state_high += temp2 ntre_system
scoreboard players operation temp2 ntre_system = @s ntre_state_low32
scoreboard players operation temp2 ntre_system *= MULTIPLIER_HIGH ntre_system
scoreboard players operation @s ntre_state_high += temp2 ntre_system
scoreboard players operation temp1 ntre_system *= MULTIPLIER_MID16 ntre_system
scoreboard players operation @s ntre_state_high += temp1 ntre_system

scoreboard players operation @s ntre_state_low32 = @s ntre_state_mid16
scoreboard players operation @s ntre_state_low32 *= NUM65536 ntre_system
scoreboard players operation @s ntre_state_low32 += @s ntre_state_low16
