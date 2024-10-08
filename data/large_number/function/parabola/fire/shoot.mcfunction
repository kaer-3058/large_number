#missile:shoot
#输入执行者，执行位置，运动时间dt，使执行者在dt刻后命中执行位置
#算法来源：https://www.bilibili.com/read/cv14512834

#获得坐标
execute store result score @s x run data get entity @s Pos[0] 10000
execute store result score @s y run data get entity @s Pos[1] 10000
execute store result score @s z run data get entity @s Pos[2] 10000

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:parabola/fire/as_entity

scoreboard players operation @s vx = #1.1 int
scoreboard players operation @s vy = #1.2 int
scoreboard players operation @s vz = #1.3 int

#计算初速度
scoreboard players operation @s vx -= @s x
execute store result storage large_number:math buffer_all_xyz[0] double .0001 run scoreboard players operation @s vx /= #dt int

scoreboard players operation @s vy -= @s y
scoreboard players operation @s vy /= #dt int
scoreboard players operation #temp int = #dt int
scoreboard players operation #temp int *= #g/2 const
execute store result storage large_number:math buffer_all_xyz[1] double .0001 run scoreboard players operation @s vy += #temp int

scoreboard players operation @s vz -= @s z
execute store result storage large_number:math buffer_all_xyz[2] double .0001 run scoreboard players operation @s vz /= #dt int

#储存运动时间
scoreboard players operation @s int = #dt int

#标记为发射完成实体
tag @s add missile_shot

#计算抛射角
execute as b09e-44-fded-6-efa5ffffef64 run function large_number:parabola/fire/launch_angle
