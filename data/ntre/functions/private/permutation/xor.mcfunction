scoreboard players operation temp1 ntre_system = @s ntre_output
scoreboard players operation temp2 ntre_system = @s ntre_output
scoreboard players operation temp2 ntre_system /= NUM262144 ntre_system
scoreboard players operation temp2 ntre_system %= NUM16384 ntre_system


scoreboard players operation @s ntre_output = temp1 ntre_system
scoreboard players operation @s ntre_output += temp2 ntre_system
scoreboard players operation temp1 ntre_system *= NUM262144 ntre_system
scoreboard players operation temp2 ntre_system *= NUM262144 ntre_system

execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 16384
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 8192
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 4096
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 2048
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 1024
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 512
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 256
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 128
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 64
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 32
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 16
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 8
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 4
scoreboard players operation temp1 ntre_system *= NUM2 ntre_system
scoreboard players operation temp2 ntre_system *= NUM2 ntre_system
execute if score temp1 ntre_system matches ..-1 if score temp2 ntre_system matches ..-1 run scoreboard players remove @s ntre_output 2