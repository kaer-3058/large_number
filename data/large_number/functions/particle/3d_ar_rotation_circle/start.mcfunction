##三维空间任意方向的圆
#传入世界实体作为执行者
#执行朝向就是圆的朝向，执行位置就是圆的位置
#圆的半径：#3d.circle.r int
#粒子密度：#3d.circle.angle int
#执行：execute as b09e-44-fded-6-efa5ffffef64 run function large_number:particle/3d_ar_rotation_circle/start
#半径3：scoreboard players set #3d.circle.r int 3000

tp @s 0.0 0.0 0.0 0.0 0.0

#间隔1度描点(如果不想瞬间画圆，就把这里的递归改成高频)
data modify storage math 3d_ar_rotation_circle_posX set value []
data modify storage math 3d_ar_rotation_circle_posY set value []
execute store result entity @s Rotation[0] float -0.1 run scoreboard players set #loop int 3600
execute if score #loop int matches 1.. run function large_number:particle/3d_ar_rotation_circle/loop

execute in minecraft:overworld run tp @s 0.0 0.0 0.0
