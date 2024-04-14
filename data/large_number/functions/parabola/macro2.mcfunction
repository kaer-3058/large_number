execute store result entity @s Pos[0] double 0.001 run scoreboard players get #coef.b int
$execute at @s run tp @s ~$(temp1) ~ ~
data modify storage math temp3 set from entity @s Pos[0]
tp @s 0.0 0.0 0.0