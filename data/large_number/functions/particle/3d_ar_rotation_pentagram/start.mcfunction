##三维空间任意方向的五角星
#传入世界实体作为执行者
#执行朝向就是五角星的朝向，执行位置就是五角星的位置
#半径：#3d.pentagram.r int
#粒子密度：#3d.pentagram.density int
#五角星的横滚角(1000倍输入)：#3d.pentagram.roll.θ int
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_pentagram/start
#半径3：scoreboard players set #3d.pentagram.r int 300
#粒子密度5：scoreboard players set #3d.pentagram.density int 5
#出处：https://www.bilibili.com/read/cv26060186
#感谢小豆

scoreboard players set #sstemp2 int 0

#初始姿态
tp @s .0 .0 .0 .0 .0

#通过改实体的初始旋转角来改五角星的横滚角
execute store result entity @s Rotation[0] float .001 run scoreboard players get #3d.pentagram.roll.θ int

#获得局部坐标基向量
execute store result storage large_number:math temp1 double .0033333333 run scoreboard players get #3d.pentagram.r int
execute store result score #tempi0 int run data get storage large_number:math temp1 1000

execute store result storage large_number:math temp1 double .0033333333 run scoreboard players get #3d.pentagram.r int
execute store result score #tempj1 int run data get storage large_number:math temp1 1000

#递归
data modify storage large_number:math 3d_ar_rotation_pentagram_posX set value []
data modify storage large_number:math 3d_ar_rotation_pentagram_posY set value []
execute rotated .0 .0 positioned .0 .0 .0 run function large_number:particle/3d_ar_rotation_pentagram/loop

execute in minecraft:overworld run tp @s .0 .0 .0
