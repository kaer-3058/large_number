#此算法来源于小豆数学库
#math:qrot/facing/_2tostoxyzw
#转换函数：输入执行朝向，转换为四元数四分量xyzw
#需要传入世界实体为执行者
#execute as b09e-44-fded-6-efa5ffffef64 run function large_number:quaternion/facing/2tostoxyzw

tp @s .0 .0 .0 ~ ~
execute store result entity @s Rotation[0] float -.0001 run data get entity @s Rotation[0] 5000
execute at @s rotated ~ .0 run tp @s ^ ^ ^1.0
execute store result score #sstemp_c1 large_number.int run data get entity @s Pos[2] 10000
execute store result score #sstemp_s1 large_number.int run data get entity @s Pos[0] 10000

execute store result entity @s Rotation[0] float -.0001 run data get entity @s Rotation[1] 5000
execute at @s rotated ~ .0 positioned .0 .0 .0 run tp @s ^ ^ ^1.0
execute store result score #qrot_w large_number.int run data get entity @s Pos[2] 10000
execute store result score #qrot_z large_number.int run data get entity @s Pos[0] 10000

scoreboard players operation #qrot_x large_number.int = #qrot_z large_number.int
scoreboard players operation #qrot_y large_number.int = #qrot_w large_number.int
execute store result storage large_number:math xyzw[0] float .00000001 run scoreboard players operation #qrot_x large_number.int *= #sstemp_c1 large_number.int
execute store result storage large_number:math xyzw[1] float -.00000001 run scoreboard players operation #qrot_y large_number.int *= #sstemp_s1 large_number.int
execute store result storage large_number:math xyzw[2] float .00000001 run scoreboard players operation #qrot_z large_number.int *= #sstemp_s1 large_number.int
execute store result storage large_number:math xyzw[3] float .00000001 run scoreboard players operation #qrot_w large_number.int *= #sstemp_c1 large_number.int

scoreboard players operation #qrot_x large_number.int /= 10000 const
scoreboard players operation #qrot_y large_number.int /= -10000 const
scoreboard players operation #qrot_z large_number.int /= 10000 const
scoreboard players operation #qrot_w large_number.int /= 10000 const

#记实体的偏航角为a，俯仰角为b，则：
#qrot_x=-sin(-b/2)*cos(-a/2)
#qrot_y=cos(-b/2)*sin(-a/2)
#qrot_z=sin(-b/2)*sin(-a/2)
#qrot_w=cos(-b/2)*cos(-a/2)
