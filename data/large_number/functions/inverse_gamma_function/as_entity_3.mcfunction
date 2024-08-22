data modify entity @s Pos[1] set from storage large_number:math sstemp06
execute at @s run tp ~ ~-2.08932555 ~
execute store result score #y int store result score #sstemp1 int run data get entity @s Pos[1] 10000
tp .0 .0 .0
