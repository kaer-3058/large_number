##粒子正n边形

#1000倍 图形的横滚角：scoreboard players set #regular_polygon.startθ int -90000
#图形的边数：scoreboard players set #regular_polygon.n int 5
#1000倍 图形的半径：scoreboard players set #regular_polygon.r int 7000
#1000倍 粒子的间隔：scoreboard players set #regular_polygon.size int 200
#传入世界实体

#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/regular_polygon/start

scoreboard players operation #loops int = #regular_polygon.n int
scoreboard players operation #loops_θ int = #regular_polygon.startθ int
data modify storage large_number:math regular_polygon_Pos set value []

#把圆心角分成n份以及计算多边形单个边长
scoreboard players set #temp_θ int 3600000
execute store result score #sstemp1 int run scoreboard players operation #temp_θ int /= #regular_polygon.n int
scoreboard players operation #sstemp1 int /= -2 const
scoreboard players operation #temp_θ int /= 10 const
execute store result entity @s Rotation[0] float .0001 run scoreboard players add #sstemp1 int 900000
execute rotated as @s rotated ~ .0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~

scoreboard players operation #sstemp3 int = #regular_polygon.r int
scoreboard players operation #sstemp3 int *= 2 const
data modify storage large_number:math temp1 set string entity @s Pos[0] 0 -1
function large_number:particle/regular_polygon/macro1 with storage large_number:math

#放大1000倍输出单个边长
execute store result score #regular_polygon.one_length int run data get storage large_number:math temp3

#计算多边形一个内角的一半
scoreboard players operation #temp_add_θ int = #regular_polygon.n int
scoreboard players remove #temp_add_θ int 2
scoreboard players operation #temp_add_θ int *= 90000 const
scoreboard players operation #temp_add_θ int /= #regular_polygon.n int

tp @s .0 .0 .0 .0 .0
execute store result storage large_number:math temp_r double .001 run scoreboard players get #regular_polygon.r int
execute store result storage large_number:math temp_size double .001 run scoreboard players get #regular_polygon.size int

execute if score #loops int matches 1.. run function large_number:particle/regular_polygon/loop

tp @s .0 .0 .0 .0 .0
