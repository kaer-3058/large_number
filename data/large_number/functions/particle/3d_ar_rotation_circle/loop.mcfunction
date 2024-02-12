#三角函数
execute rotated as @s rotated ~ 0.0 positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
execute store result score #cos int run data get entity @s Pos[2] 1000
execute store result score #sin int run data get entity @s Pos[0] 1000
scoreboard players operation #cos int *= #3d.circle.r int
scoreboard players operation #cos int /= 1000 const
scoreboard players operation #sin int *= #3d.circle.r int
scoreboard players operation #sin int /= 1000 const

#x
scoreboard players operation #tempx int = #tempi0 int
scoreboard players operation #tempx int *= #cos int
scoreboard players operation #tempx int /= 1000 const
scoreboard players operation #temp int = #tempj0 int
scoreboard players operation #temp int *= #sin int
scoreboard players operation #temp int /= 1000 const
scoreboard players operation #tempx int += #temp int
execute store result entity @s Pos[0] double 0.001 run scoreboard players operation #tempx int += #tempx0 int

#y
scoreboard players operation #tempy int = #tempj1 int
scoreboard players operation #tempy int *= #sin int
scoreboard players operation #tempy int /= 1000 const
execute store result entity @s Pos[1] double 0.001 run scoreboard players operation #tempy int += #tempy0 int

#z
scoreboard players operation #tempz int = #tempi2 int
scoreboard players operation #tempz int *= #cos int
scoreboard players operation #tempz int /= 1000 const
scoreboard players operation #temp int = #tempj2 int
scoreboard players operation #temp int *= #sin int
scoreboard players operation #temp int /= 1000 const
scoreboard players operation #tempz int += #temp int
execute store result entity @s Pos[2] double 0.001 run scoreboard players operation #tempz int += #tempz0 int

execute at @s run particle minecraft:end_rod ~ ~ ~ 0.0 0.0 0.0 0.0 1 force

#递归
execute store result entity @s Rotation[0] float -1 run scoreboard players operation #loop int -= #3d.circle.angle int
execute if score #loop int matches 1.. run function large_number:particle/3d_ar_rotation_circle/loop
