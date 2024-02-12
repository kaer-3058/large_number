#局部坐标转相对坐标，^1.0 ^ ^
tp @s ^1.0 ^ ^
data modify storage math temp1 set from entity @s Pos
execute store result score #x int run data get storage math temp1[0] 1000
execute store result score #y int run data get storage math temp1[1] 1000
execute store result score #z int run data get storage math temp1[2] 1000
execute store result storage math temp1[0] double 0.0000033333333 run scoreboard players operation #x int *= #3d.pentagram.r int
execute store result storage math temp1[1] double 0.0000033333333 run scoreboard players operation #y int *= #3d.pentagram.r int
execute store result storage math temp1[2] double 0.0000033333333 run scoreboard players operation #z int *= #3d.pentagram.r int

#tp @s ^1.0 ^ ^
data modify entity @s Pos set from storage math temp1
execute store result score #tempi0 int run data get entity @s Pos[0] 1000
execute store result score #tempi2 int run data get entity @s Pos[2] 1000

#局部坐标转相对坐标，^ ^1.0 ^
tp @s ^ ^1.0 ^
data modify storage math temp1 set from entity @s Pos
execute store result score #x int run data get storage math temp1[0] 1000
execute store result score #y int run data get storage math temp1[1] 1000
execute store result score #z int run data get storage math temp1[2] 1000
execute store result storage math temp1[0] double 0.0000033333333 run scoreboard players operation #x int *= #3d.pentagram.r int
execute store result storage math temp1[1] double 0.0000033333333 run scoreboard players operation #y int *= #3d.pentagram.r int
execute store result storage math temp1[2] double 0.0000033333333 run scoreboard players operation #z int *= #3d.pentagram.r int

#tp @s ^ ^1.0 ^
data modify entity @s Pos set from storage math temp1
execute store result score #tempj0 int run data get entity @s Pos[0] 1000
execute store result score #tempj1 int run data get entity @s Pos[1] 1000
execute store result score #tempj2 int run data get entity @s Pos[2] 1000
