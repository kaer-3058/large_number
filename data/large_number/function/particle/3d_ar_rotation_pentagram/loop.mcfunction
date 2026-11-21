#获得局部坐标
execute positioned ^ ^ ^1.0 rotated as @s run tp @s ~ ~ ~ ~.2 .0
execute at @s run tp @s ^ ^ ^2.0
data modify storage large_number:math temp1 set from entity @s Pos
execute store result score #tempu large_number.int run data get storage large_number:math temp1[0] 1000
execute store result score #tempv large_number.int run data get storage large_number:math temp1[2] 1000

#x
scoreboard players operation #temp0 large_number.int = #tempu large_number.int
scoreboard players operation #temp0 large_number.int *= #tempi0 large_number.int
execute store result storage large_number:math temp1[0] double .001 run scoreboard players operation #temp0 large_number.int /= 1000 const

#y
scoreboard players operation #temp1 large_number.int = #tempv large_number.int
scoreboard players operation #temp1 large_number.int *= #tempj1 large_number.int
execute store result storage large_number:math temp1[2] double .001 run scoreboard players operation #temp1 large_number.int /= 1000 const

scoreboard players add #sstemp2 large_number.int 1
scoreboard players operation #sstemp1 large_number.int = #sstemp2 large_number.int
scoreboard players operation #sstemp1 large_number.int %= #3d.pentagram.density large_number.int
execute if score #sstemp1 large_number.int matches 0 run data modify storage large_number:math 3d_ar_rotation_pentagram_pos append from storage large_number:math temp1
execute if score #sstemp1 large_number.int matches 0 run data remove storage large_number:math 3d_ar_rotation_pentagram_pos[-1][1]

execute if score #sstemp2 large_number.int matches ..3600 rotated ~-.3 .0 run function large_number:particle/3d_ar_rotation_pentagram/loop

