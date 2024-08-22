##三维空间任意方向的五角星 - 摆线法绘制
#传入世界实体作为执行者
#执行朝向就是五角星的朝向，执行位置就是五角星的位置
#半径(10000倍输入)：#3d.pentagram_epi.r int
#摆线转速(10000倍输入)：#3d.pentagram_epi.speed int
#五角星的横滚角(10000倍输入)：#3d.pentagram_epi.roll.θ int
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_pentagram/epicycloid/start
#出处：https://www.bilibili.com/read/readlist/rl651851

tp @s .0 .0 .0 .0 .0
execute store result entity @s Rotation[0] float .001 run scoreboard players operation #Store_θ int = #3d.pentagram_epi.roll.θ int

#计算圆心和圆周的半径
scoreboard players operation #temp_center_r int = #3d.pentagram_epi.r int
execute store result score #temp_circu_r int run scoreboard players operation #temp_center_r int /= 3 const
scoreboard players operation #temp_center_r int *= 2 const

#计算圆心和圆周的转速
scoreboard players operation #3d.pentagram_epi_circu.speed int = #3d.pentagram_epi.speed int
execute store result storage large_number:math temp2 int 1.5 run scoreboard players get #3d.pentagram_epi.speed int
execute store result score #3d.pentagram_epi_circu.speed int run data get storage large_number:math temp2

#根据转速来设定递归次数
scoreboard players set #temp_max_loop int 7200000
scoreboard players operation #temp_max_loop int /= #3d.pentagram_epi.speed int

scoreboard players set #temp1 int 0
scoreboard players set #loops int 0
data modify storage large_number:math 3d_ar_rotation_pentagram_pos set value []
execute if score #loops int <= #temp_max_loop int positioned .0 .0 .0 rotated as @s run function large_number:particle/3d_ar_rotation_pentagram/epicycloid/loop

tp @s .0 .0 .0 .0 .0
