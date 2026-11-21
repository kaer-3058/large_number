data modify entity @s Pos[1] set from storage large_number:math temp1
execute at @s run tp ~ ~.0052 ~
data modify storage large_number:math temp_zeta_critical_line_c2 set from entity @s Pos[1]
tp .0 .0 .0
