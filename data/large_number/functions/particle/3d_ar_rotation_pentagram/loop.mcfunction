#获得局部坐标
execute positioned ^ ^ ^1.0 rotated as @s run tp @s ~ ~ ~ ~0.2 0.0
execute at @s run tp @s ^ ^ ^2.0
execute store result score #tempu int run data get entity @s Pos[0] 1000
execute store result score #tempv int run data get entity @s Pos[2] 1000

#x
scoreboard players operation #tempx int = #tempx0 int
scoreboard players operation #temp0 int = #tempu int
scoreboard players operation #temp0 int *= #tempi0 int
scoreboard players operation #temp0 int /= 1000 const
scoreboard players operation #tempx int += #temp0 int
scoreboard players operation #temp0 int = #tempv int
scoreboard players operation #temp0 int *= #tempj0 int
scoreboard players operation #temp0 int /= 1000 const
execute store result entity @s Pos[0] double 0.001 run scoreboard players operation #tempx int += #temp0 int

#y
scoreboard players operation #tempy int = #tempy0 int
scoreboard players operation #temp0 int = #tempv int
scoreboard players operation #temp0 int *= #tempj1 int
scoreboard players operation #temp0 int /= 1000 const
execute store result entity @s Pos[1] double 0.001 run scoreboard players operation #tempy int += #temp0 int

#z
scoreboard players operation #tempz int = #tempz0 int
scoreboard players operation #tempu int *= #tempi2 int
scoreboard players operation #tempu int /= 1000 const
scoreboard players operation #tempz int += #tempu int
scoreboard players operation #tempv int *= #tempj2 int
scoreboard players operation #tempv int /= 1000 const
execute store result entity @s Pos[2] double 0.001 run scoreboard players operation #tempz int += #tempv int

execute at @s run particle minecraft:end_rod ~ ~ ~ 0.0 0.0 0.0 0.0 1 force

#获得局部坐标
tp @s ^ ^ ^3.0
execute store result score #tempu int run data get entity @s Pos[0] 1000
execute store result score #tempv int run data get entity @s Pos[2] 1000

#x
scoreboard players operation #tempx int = #tempx0 int
scoreboard players operation #temp0 int = #tempu int
scoreboard players operation #temp0 int *= #tempi0 int
scoreboard players operation #temp0 int /= 1000 const
scoreboard players operation #tempx int += #temp0 int
scoreboard players operation #temp0 int = #tempv int
scoreboard players operation #temp0 int *= #tempj0 int
scoreboard players operation #temp0 int /= 1000 const
execute store result entity @s Pos[0] double 0.001 run scoreboard players operation #tempx int += #temp0 int

#y
scoreboard players operation #tempy int = #tempy0 int
scoreboard players operation #temp0 int = #tempv int
scoreboard players operation #temp0 int *= #tempj1 int
scoreboard players operation #temp0 int /= 1000 const
execute store result entity @s Pos[1] double 0.001 run scoreboard players operation #tempy int += #temp0 int

#z
scoreboard players operation #tempz int = #tempz0 int
scoreboard players operation #tempu int *= #tempi2 int
scoreboard players operation #tempu int /= 1000 const
scoreboard players operation #tempz int += #tempu int
scoreboard players operation #tempv int *= #tempj2 int
scoreboard players operation #tempv int /= 1000 const
execute store result entity @s Pos[2] double 0.001 run scoreboard players operation #tempz int += #tempv int

execute at @s run particle minecraft:end_rod ~ ~ ~ 0.0 0.0 0.0 0.0 1 force

scoreboard players remove #loop int 1
execute if score #loop int matches 1.. rotated ~-0.3 0.0 run function large_number:particle/3d_ar_rotation_pentagram/loop
