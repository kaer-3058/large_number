execute store result entity @s Pos[0] double 0.001 run scoreboard players get #coef.c int
$execute at @s run tp ~$(temp1) ~ ~
data modify storage large_number:math parabola_expre_y append from entity @s Pos[0]
tp .0 .0 .0