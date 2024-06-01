function ntre:private/lcg

scoreboard players operation @s ntre_output = @s ntre_state_high
scoreboard players operation @s ntre_output *= NUM32 ntre_system

scoreboard players operation temp1 ntre_system = @s ntre_state_low32
scoreboard players operation temp1 ntre_system /= NUM134217728 ntre_system
scoreboard players operation temp1 ntre_system %= NUM32 ntre_system
scoreboard players operation @s ntre_output += temp1 ntre_system

scoreboard players operation temp2 ntre_system = @s ntre_state_high
execute if score temp2 ntre_system matches ..-1 run function ntre:private/permutation/rr16
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp2 ntre_system matches ..-1 run function ntre:private/permutation/rr8
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp2 ntre_system matches ..-1 run function ntre:private/permutation/rr4
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp2 ntre_system matches ..-1 run function ntre:private/permutation/rr2
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp2 ntre_system matches ..-1 run function ntre:private/permutation/rr1

function ntre:private/permutation/xor
