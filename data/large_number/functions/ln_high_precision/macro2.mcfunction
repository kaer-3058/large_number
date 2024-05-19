$tp @s 0.0 $(high_precision_stemp1) 0.0
$execute at @s run tp @s ~ ~$(high_precision_stemp2) ~
$execute at @s run tp @s ~ ~-$(high_precision_stemp3) ~
$execute at @s run tp @s ~ ~$(high_precision_stemp4) ~
execute at @s run tp @s ~ ~0.00000280876223 ~
data modify storage large_number:math ln_high_precision.output set from entity @s Pos[1]
tp @s 0.0 0.0 0.0
