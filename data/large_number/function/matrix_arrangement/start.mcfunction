##二维网格排列
#1000倍输入 行间隔：scoreboard players set #Matrix_arrangement.rsize large_number.int 3500
#1000倍输入 列间隔：scoreboard players set #Matrix_arrangement.csize large_number.int 3000
#1000倍输入 偶数列偏移：scoreboard players set #Matrix_arrangement.tab large_number.int 1000
#行数：scoreboard players set #Matrix_arrangement.Rows large_number.int 10
#列数：scoreboard players set #Matrix_arrangement.Columns large_number.int 8
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:matrix_arrangement/start
#一个使用函数宏访问坐标列表的范例：execute positioned x y z rotated x y run function large_number:matrix_arrangement/summon
#需要传入执行位置和执行朝向

data modify storage large_number:math matrix_arrangement_X set value []
data modify storage large_number:math matrix_arrangement_Z set value []
scoreboard players set #sstempm large_number.int 0
scoreboard players operation #sstempa large_number.int = #Matrix_arrangement.Rows large_number.int
scoreboard players operation #sstempb large_number.int = #Matrix_arrangement.Columns large_number.int
execute if score #sstempb large_number.int matches 1.. positioned .0 .0 .0 rotated 0.0 0.0 run function large_number:matrix_arrangement/loop2
tp @s .0 .0 .0
