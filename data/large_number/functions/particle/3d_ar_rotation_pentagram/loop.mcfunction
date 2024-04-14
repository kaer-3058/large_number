#获得局部坐标
execute positioned ^ ^ ^1.0 rotated as @s run tp @s ~ ~ ~ ~0.2 0.0
execute at @s run tp @s ^ ^ ^2.0
data modify storage math temp1 set from entity @s Pos
execute store result score #tempu int run data get storage math temp1[0] 1000
execute store result score #tempv int run data get storage math temp1[2] 1000

#x
scoreboard players operation #temp0 int = #tempu int
scoreboard players operation #temp0 int *= #tempi0 int
execute store result storage math temp1 double 0.001 run scoreboard players operation #temp0 int /= 1000 const

#y
scoreboard players operation #temp1 int = #tempv int
scoreboard players operation #temp1 int *= #tempj1 int
execute store result storage math temp2 double 0.001 run scoreboard players operation #temp1 int /= 1000 const

scoreboard players add #sstemp2 int 1
scoreboard players operation #sstemp1 int = #sstemp2 int
scoreboard players operation #sstemp1 int %= #3d.pentagram.density int
execute if score #sstemp1 int matches 0 run data modify storage math 3d_ar_rotation_pentagram_posX append from storage math temp1
execute if score #sstemp1 int matches 0 run data modify storage math 3d_ar_rotation_pentagram_posY append from storage math temp2

#execute if score #loop int matches 1.. rotated ~-0.3 0.0 run function large_number:particle/3d_ar_rotation_pentagram/loop
