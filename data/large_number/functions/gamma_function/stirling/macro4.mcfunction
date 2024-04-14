$tp @s 0.0 $(temp1) 0.0
execute at @s run tp @s ~ ~1.0 ~
data modify storage math temp_1+m/x set from entity @s Pos[1]
tp @s 0.0 0.0 0.0