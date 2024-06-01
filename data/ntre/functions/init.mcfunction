scoreboard objectives add ntre_system dummy "NTRE Internal Stuff"
scoreboard objectives add ntre_output dummy "NTRE Output"
scoreboard objectives add ntre_seed_low32 dummy "Low Bits of NTRE Seed"
scoreboard objectives add ntre_seed_high dummy "High Bits of NTRE Seed"
scoreboard objectives add ntre_state_low16 dummy
scoreboard objectives add ntre_state_mid16 dummy
scoreboard objectives add ntre_state_high dummy
scoreboard objectives add ntre_state_low32 dummy

# Constants
scoreboard players set NUM2 ntre_system 2
scoreboard players set NUM4 ntre_system 4
scoreboard players set NUM16 ntre_system 16
scoreboard players set NUM32 ntre_system 32
scoreboard players set NUM256 ntre_system 256
scoreboard players set NUM16384 ntre_system 16384
scoreboard players set NUM65536 ntre_system 65536
scoreboard players set NUM262144 ntre_system 262144
scoreboard players set NUM16777216 ntre_system 16777216
scoreboard players set NUM268435456 ntre_system 268435456
scoreboard players set NUM1073741824 ntre_system 1073741824
scoreboard players set SIGN ntre_system -2147483648

# Multiplier, 6364136223846793005
scoreboard players set MULTIPLIER_LOW16 ntre_system 32557
scoreboard players set MULTIPLIER_MID16 ntre_system 19605
scoreboard players set MULTIPLIER_HIGH ntre_system 1481765933
scoreboard players set MULTIPLIER_LOW32 ntre_system 1284865837

# Increment, 1442695040888963407
scoreboard players set INCREMENT_LOW16 ntre_system 33103
scoreboard players set INCREMENT_MID16 ntre_system 63335
scoreboard players set INCREMENT_HIGH ntre_system 335903614
scoreboard players set INCREMENT_LOW32 ntre_system -144211633
