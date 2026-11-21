##心形线

#公式：
#上半部分：√(r·|x|-x²)，下半部分：(r/2)·(arccos(1-|(2x)/r|)-π)

#半径 (10000倍输入)：scoreboard players set #heart-shaped_line.r large_number.int 50000
#上半段粒子密度 (单位为度，10000倍输入)：scoreboard players set #heart-shaped_line.t_d large_number.int 50000
#下半段粒子密度 (单位为格，10000倍输入)：scoreboard players set #heart-shaped_line.t large_number.int 1000

#出于计算arccos会损失一些精度导致图像断开，因此改进的算法是计算下半部分的反函数，计算y值的cos来推出x值，新算法的性能也更好了。
#下半段粒子密度公式：t2=(3.82019778902771*半径)/(2*粒子间隔)
#3.82019778902771这个数是用定积分推出来的

#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/heart-shaped_line/start

tp @s .0 .0 .0 90.0 .0
data modify storage large_number:math heart-shaped_line_Pos set value []

#上半段
scoreboard players operation #sstemp1 large_number.int = #heart-shaped_line.r large_number.int
execute store result storage large_number:math stemp1 double 0.0001 run scoreboard players operation #sstemp1 large_number.int /= 2 const
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #sstemp1 large_number.int *= -1 const
scoreboard players set #loop_d large_number.int -900000
function large_number:particle/heart-shaped_line/loop1
execute store result entity @s Pos[0] double 0.0001 run scoreboard players operation #sstemp1 large_number.int *= -1 const
scoreboard players set #loop_d large_number.int -900000
function large_number:particle/heart-shaped_line/loop1

#下半段
scoreboard players operation #r/2 large_number.int = #heart-shaped_line.r large_number.int
scoreboard players operation #r/2 large_number.int /= 2 const
scoreboard players set #loop large_number.int 1
data modify storage large_number:math sstemp0 set value [0d,0d]

#用间隔计算粒子密度
execute store result storage large_number:math temp1 int 3.82019778902771 run scoreboard players get #heart-shaped_line.r large_number.int
execute store result score #heart-shaped_line.t2 large_number.int run data get storage large_number:math temp1
scoreboard players operation #temp2 large_number.int = #heart-shaped_line.t large_number.int
scoreboard players operation #temp2 large_number.int *= 2 const
scoreboard players operation #heart-shaped_line.t2 large_number.int /= #temp2 large_number.int

function large_number:particle/heart-shaped_line/loop2


tp .0 .0 .0
