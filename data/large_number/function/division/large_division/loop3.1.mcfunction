#取出被减数的后最后两个数、减数的最后一个数，作减法后把差存结果列表里，把被减数的倒数第二个数存列表里。
#然后把被减数和减数都去掉一个数以继续递归，这就是递归减。
execute store result score #u1 int run data get storage large_number:math temp1[-2]
execute store result score #u2 int run data get storage large_number:math temp1[-1]
execute store result score #v2 int run data get storage large_number:math temp2[-1]

execute if score #u2 int < #v2 int run scoreboard players remove #u1 int 1
execute if score #u2 int < #v2 int run scoreboard players add #u2 int 10000
execute store result storage large_number:math stemp2 int 1 run scoreboard players operation #u2 int -= #v2 int
execute store result storage large_number:math stemp1 int 1 run scoreboard players get #u1 int
data remove storage large_number:math temp1[-1]
data remove storage large_number:math temp1[-1]
data modify storage large_number:math temp1 append from storage large_number:math stemp1
data modify storage large_number:math temp9 prepend from storage large_number:math stemp2
data remove storage large_number:math temp2[-1]
execute if data storage large_number:math temp1[-2] run function large_number:ope_pi/loop_subra/loop3.1
