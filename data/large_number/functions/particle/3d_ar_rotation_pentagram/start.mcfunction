##三维空间任意方向的圆内五角星
#传入世界实体作为执行者
#执行朝向就是五角星的朝向，执行位置就是五角星的位置
#半径：#3d.pentagram.r int
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_pentagram/start
#半径3：scoreboard players set #3d.pentagram.r int 3000

#出处：https://www.bilibili.com/read/cv26060186
#感谢小豆

#获得原点的绝对坐标
tp @s ~ ~ ~ 0.0 0.0
execute store result score #tempx0 int run data get entity @s Pos[0] 1000
execute store result score #tempy0 int run data get entity @s Pos[1] 1000
execute store result score #tempz0 int run data get entity @s Pos[2] 1000

#获得局部坐标基向量
execute positioned 0.0 0.0 0.0 run function large_number:particle/3d_ar_rotation_pentagram/get_ijk

#如果不想瞬间画图，就把这里的递归改成高频
scoreboard players set #loop int 3600
execute if score #loop int matches 1.. rotated 0.0 0.0 positioned 0.0 0.0 0.0 run function large_number:particle/3d_ar_rotation_pentagram/loop

execute in minecraft:overworld run tp @s 0.0 0.0 0.0
