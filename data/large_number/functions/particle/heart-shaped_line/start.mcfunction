##心形线

#公式：
#上半部分：√(r·|x|-x²)，下半部分：(r/2)·(arccos(1-|(2x)/r|)-π)

#半径 (10000倍输入)：scoreboard players set #heart-shaped_line.r int 30000
#上半段粒子密度 (单位为度，100倍输入)：scoreboard players set #heart-shaped_line.t_d int 500
#下半段粒子密度 (单位为格，10000倍输入)：scoreboard players set #heart-shaped_line.t int 1000
#在心形线的断开处描点来把图像连起来 (描点次数)：scoreboard players set #heart-shaped_line.extra int 3
#修复图像的描点宽度：scoreboard players set #heart-shaped_line.t_x int 2000

#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/heart-shaped_line/start

tp @s .0 .0 .0 90.0 .0

data modify storage large_number:math heart-shaped_line_Pos set value []
scoreboard players operation #loop int = #heart-shaped_line.r int
scoreboard players operation #loop int *= -1 const

#上半段
scoreboard players operation #sstemp1 int = #heart-shaped_line.r int
execute store result storage large_number:math stemp1 double 0.0001 run scoreboard players operation #sstemp1 int /= 2 const
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #sstemp1 int *= -1 const
scoreboard players set #loop_d int 0
function large_number:particle/heart-shaped_line/loop1/1
execute at @s run tp @s ~ ~ ~ -90.0 .0
scoreboard players set #loop_d int 9000
scoreboard players operation #loop_d int += #heart-shaped_line.t_d int
function large_number:particle/heart-shaped_line/loop1/2
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #sstemp1 int += #heart-shaped_line.r int
execute at @s run tp @s ~ ~ ~ 90.0 .0
scoreboard players set #loop_d int 0
function large_number:particle/heart-shaped_line/loop1/1
execute at @s run tp @s ~ ~ ~ -90.0 .0
scoreboard players set #loop_d int 9000
scoreboard players operation #loop_d int += #heart-shaped_line.t_d int
function large_number:particle/heart-shaped_line/loop1/2

#下半段
scoreboard players operation #r/2 int = #heart-shaped_line.r int
scoreboard players operation #r/2 int /= 2 const
function large_number:particle/heart-shaped_line/loop2

#在断开处进行修复
scoreboard players operation #temp1 int = #heart-shaped_line.r int
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #temp1 int *= -1 const
scoreboard players set #temp1 int 0
scoreboard players operation #store_heart-shaped_line.extra int = #heart-shaped_line.extra int
execute if score #store_heart-shaped_line.extra int matches 1.. run function large_number:particle/heart-shaped_line/loop3

execute store result entity @s Pos[0] double 0.0001 run scoreboard players get #heart-shaped_line.r int
scoreboard players set #temp1 int 0
scoreboard players operation #store_heart-shaped_line.extra int = #heart-shaped_line.extra int
execute if score #store_heart-shaped_line.extra int matches 1.. run function large_number:particle/heart-shaped_line/loop3

tp @s .0 .0 .0 .0 .0
execute store result entity @s Pos[1] double 0.000314159265358979323846264 run scoreboard players operation #r/2 int *= -1 const
execute store result score #di.pos int run data get entity @s Pos[1] 10000
scoreboard players operation #store_heart-shaped_line.extra int = #heart-shaped_line.extra int
execute if score #store_heart-shaped_line.extra int matches 1.. run function large_number:particle/heart-shaped_line/loop4

execute in minecraft:overworld run tp @s .0 .0 .0 .0 .0
