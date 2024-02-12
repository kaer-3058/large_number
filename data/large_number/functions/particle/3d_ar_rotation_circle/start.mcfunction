##三维空间任意方向的圆
#传入世界实体作为执行者
#执行朝向就是圆的朝向，执行位置就是圆的位置
#圆的半径：#3d.circle.r int
#圆与原点的距离：#3d.circle.d int
#粒子密度：#3d.circle.angle int
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_circle/start
#半径3：scoreboard players set #3d.circle.r int 3000
#距离1：scoreboard players set #3d.circle.d int 1000

#出处：https://www.bilibili.com/read/cv26060186
#感谢小豆

#获得原点的绝对坐标
tp @s ~ ~ ~ ~ ~
execute store result score #tempx0 int run data get entity @s Pos[0] 1000
execute store result score #tempy0 int run data get entity @s Pos[1] 1000
execute store result score #tempz0 int run data get entity @s Pos[2] 1000

#获得局部坐标基向量
execute positioned 0.0 0.0 0.0 run function large_number:particle/3d_ar_rotation_circle/get_ijk

#在前方<#3d.circle.d int>处画圆
scoreboard players operation #tempk0 int *= #3d.circle.d int
scoreboard players operation #tempk1 int *= #3d.circle.d int
scoreboard players operation #tempk2 int *= #3d.circle.d int
scoreboard players operation #tempk0 int /= 1000 const
scoreboard players operation #tempk1 int /= 1000 const
scoreboard players operation #tempk2 int /= 1000 const
scoreboard players operation #tempx0 int += #tempk0 int
scoreboard players operation #tempy0 int += #tempk1 int
scoreboard players operation #tempz0 int += #tempk2 int

#间隔1度描点(如果不想瞬间画圆，就把这里的递归改成高频)
execute unless score #3d.circle.angle int matches 1..360 run scoreboard players set #3d.circle.angle int 1
execute store result entity @s Rotation[0] float -1 run scoreboard players set #loop int 360
execute if score #loop int matches 1.. run function large_number:particle/3d_ar_rotation_circle/loop

execute in minecraft:overworld run tp @s 0.0 0.0 0.0
