##粒子球
#传入世界实体作为执行者
#球的半径：storage large_number:math 3d_hsphere_pos_R
#点的数量：#3d.hsphere.points int [1,40000]
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_hsphere/start

#斐波那契网格
#若是从球面上取n个点，则是把球横着切成n层，让这些点沿着球面从球底爬到球顶，每爬一层就绕着这一层的圆心转0.618圈。

tp @s .0 -2.0 .0 .0 .0

data modify storage large_number:math 3d_hsphere_pos set value []

scoreboard players set #temp_any_fen int 40000
scoreboard players operation #temp_any_fen int /= #3d.hsphere.points int
execute if score #temp_any_fen int matches ..0 run scoreboard players set #temp_any_fen int 1
execute store result score #n int run scoreboard players operation #loop int = #temp_any_fen int

function large_number:particle/3d_hsphere/loop

tp @s .0 .0 .0 .0 .0
