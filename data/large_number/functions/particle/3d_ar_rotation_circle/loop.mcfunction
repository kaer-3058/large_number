#三角函数
execute rotated as @s rotated ~ 0.0 positioned 0.0 0.0 0.0 run tp @s ^ ^ ^1.0
data modify storage math temp1 set from entity @s Pos
execute store result score #cos int run data get storage math temp1[2] 1000
execute store result score #sin int run data get storage math temp1[0] 1000
scoreboard players operation #cos int *= #3d.circle.r int
scoreboard players operation #sin int *= #3d.circle.r int

#x
execute store result storage math temp1 double 0.001 run scoreboard players operation #cos int /= 1000 const
data modify storage math 3d_ar_rotation_circle_posX append from storage math temp1

#y
execute store result storage math temp1 double 0.001 run scoreboard players operation #sin int /= 1000 const
data modify storage math 3d_ar_rotation_circle_posY append from storage math temp1

#递归
execute store result entity @s Rotation[0] float -0.1 run scoreboard players operation #loop int -= #3d.circle.angle int
execute if score #loop int matches 1.. run function large_number:particle/3d_ar_rotation_circle/loop
