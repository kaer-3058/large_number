##星形线 - 四个圆夹缝定义

#半径：scoreboard players set #star_line.r int 50000
#粒子间距(单位：度)：scoreboard players set #star_line.step.θ int 25000
#横滚角：scoreboard players set #star_line.roll int 100000
#除了横滚角都必须是正数，皆放大一万倍输入

#计算：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/star_line/2/start

#此类星形线无法用P范数定义

execute store result storage large_number:math q0 double .0001 run scoreboard players get #star_line.r int
data modify storage large_number:math star_line_Pos set value []

tp @s .0 .0 .0 .0 .0
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #star_line.roll int
scoreboard players operation #loop int = #star_line.roll int
scoreboard players operation #loop.rule int = #star_line.roll int
scoreboard players add #loop.rule int 900000
execute at @s run function large_number:particle/star_line/2/macro1 with storage large_number:math
execute at @s run function large_number:particle/star_line/2/loop

tp .0 .0 .0
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #star_line.roll int
scoreboard players operation #loop int = #star_line.roll int
scoreboard players operation #loop.rule int = #star_line.roll int
scoreboard players remove #loop.rule int 900000
execute at @s run function large_number:particle/star_line/2/macro2 with storage large_number:math
execute at @s run function large_number:particle/star_line/2/loop2

scoreboard players operation #store_star_line.roll int = #star_line.roll int

tp .0 .0 .0
execute store result entity @s Rotation[0] float .0001 run scoreboard players add #store_star_line.roll int 1800000
scoreboard players operation #loop int = #store_star_line.roll int
scoreboard players operation #loop.rule int = #store_star_line.roll int
scoreboard players add #loop.rule int 900000
execute at @s run function large_number:particle/star_line/2/macro1 with storage large_number:math
execute at @s run function large_number:particle/star_line/2/loop

tp .0 .0 .0
execute store result entity @s Rotation[0] float .0001 run scoreboard players get #store_star_line.roll int
scoreboard players operation #loop int = #store_star_line.roll int
scoreboard players operation #loop.rule int = #store_star_line.roll int
scoreboard players remove #loop.rule int 900000
execute at @s run function large_number:particle/star_line/2/macro2 with storage large_number:math
execute at @s run function large_number:particle/star_line/2/loop2

tp .0 .0 .0
