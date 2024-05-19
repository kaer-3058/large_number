#此算法来源于小豆数学库
#math:qrot/facing/_2tostoxyzw
#转换函数：输入执行朝向，转换为四元数四分量xyzw
#需要传入世界实体为执行者
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/facing/2tostoxyzw

tp @s 0.0 0.0 0.0 ~ ~
execute store result entity @s Rotation[0] float -0.0001 run data get entity @s Rotation[0] 5000
execute at @s rotated ~ 0.0 run tp @s ^ ^ ^1.0
execute store result score #sstemp_c1 int run data get entity @s Pos[2] 10000
execute store result score #sstemp_s1 int run data get entity @s Pos[0] 10000

execute store result entity @s Rotation[0] float -0.0001 run data get entity @s Rotation[1] 5000
execute at @s rotated ~ 0.0 positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
execute store result score #qrot_w int run data get entity @s Pos[2] 10000
execute store result score #qrot_z int run data get entity @s Pos[0] 10000

scoreboard players operation #qrot_x int = #qrot_z int
scoreboard players operation #qrot_y int = #qrot_w int
execute store result storage large_number:math xyzw[0] float 0.00000001 run scoreboard players operation #qrot_x int *= #sstemp_c1 int
execute store result storage large_number:math xyzw[1] float -0.00000001 run scoreboard players operation #qrot_y int *= #sstemp_s1 int
execute store result storage large_number:math xyzw[2] float 0.00000001 run scoreboard players operation #qrot_z int *= #sstemp_s1 int
execute store result storage large_number:math xyzw[3] float 0.00000001 run scoreboard players operation #qrot_w int *= #sstemp_c1 int

scoreboard players operation #qrot_x int /= 10000 const
scoreboard players operation #qrot_y int /= -10000 const
scoreboard players operation #qrot_z int /= 10000 const
scoreboard players operation #qrot_w int /= 10000 const
