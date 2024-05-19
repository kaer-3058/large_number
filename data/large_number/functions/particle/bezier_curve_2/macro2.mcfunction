data modify entity @s Pos set from storage large_number:math buffer_all_xyz
$execute at @s run tp ~$(sstemp12) ~$(sstemp22) ~$(sstemp32)
data modify storage large_number:math buffer_all_xyz set from entity @s Pos
tp .0 .0 .0