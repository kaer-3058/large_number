#cos(x)
tp .0 .0 .0
execute store result entity @s Rotation[0] float 0.00001 run scoreboard players get #sun_altitude_angle.input int
execute at @s run tp ^ ^ ^1
execute store result score #sun_altitude_angle.input int run data get entity @s Pos[2] 100000
