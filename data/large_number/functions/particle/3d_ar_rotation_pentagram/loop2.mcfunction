#算术法改五角星的横滚角

#获得局部坐标
execute positioned ^ ^ ^1.0 rotated as @s run tp @s ~ ~ ~ ~0.2 0.0
execute at @s run tp @s ^ ^ ^2.0
data modify storage math temp1 set from entity @s Pos
execute store result score #tempu int run data get storage math temp1[0] 1000
execute store result score #tempv int run data get storage math temp1[2] 1000

#x
scoreboard players operation #temp0 int = #tempu int
scoreboard players operation #temp0 int *= #tempi0 int
execute store result storage math temp1 double 0.001 run scoreboard players operation #temp0 int /= 1000 const
scoreboard players operation #x int = #temp0 int

#y
scoreboard players operation #temp1 int = #tempv int
scoreboard players operation #temp1 int *= #tempj1 int
execute store result storage math temp2 double 0.001 run scoreboard players operation #temp1 int /= 1000 const
scoreboard players operation #y int = #temp1 int

data modify storage math store_pos set from entity @s Pos
data modify storage math store_rotate set from entity @s Rotation

##点的坐标转化为(r*sin(d),r*cos(d))的形式

#单位向量法测距
execute store result storage math buffer_all_xyz[0] double 0.0001 store result score #v.x int run data get storage math temp1 100.0
execute store result storage math buffer_all_xyz[1] double 0.0001 store result score #v.y int run data get storage math temp2 100.0
data modify storage math buffer_all_xyz[2] set value 0.0

data modify entity @s Pos set from storage math buffer_all_xyz
execute in minecraft:overworld positioned .0 .0 .0 facing entity @s feet run tp @s ^ ^ ^1.0
data modify storage math buffer_all_xyz set from entity @s Pos

execute store result score #i.x int run data get storage math buffer_all_xyz[0] 10000.0
execute store result score #i.y int run data get storage math buffer_all_xyz[1] 10000.0
execute store result score #i.z int run data get storage math buffer_all_xyz[2] 10000.0

execute store result score #temp1 int run scoreboard players operation #v.x int += #v.y int
scoreboard players operation #i.x int += #i.y int
scoreboard players operation #i.x int += #i.z int
execute if score #i.x int matches 0 run scoreboard players set #i.x int 1

scoreboard players operation #v.x int /= #i.x int
scoreboard players operation #v.x int *= 1000 const
scoreboard players operation #temp1 int %= #i.x int
scoreboard players operation #temp1 int *= 1000 const
scoreboard players operation #temp1 int /= #i.x int
execute store result score #r int run scoreboard players operation #v.x int += #temp1 int

#atan2d
execute store result storage math buffer_all_xyz[0] double -0.0001 run scoreboard players get #y int
execute store result storage math buffer_all_xyz[2] double 0.0001 run scoreboard players get #x int
data modify entity @s Pos set from storage math buffer_all_xyz
execute in minecraft:overworld positioned .0 .0 .0 facing entity @s feet rotated ~ .0 run tp @s .0 .0 .0 ~ ~
execute store result score #θ int run data get entity @s Rotation[0] 100

#sin cos
scoreboard players remove #θ int 1750
execute store result entity @s Rotation[0] float 0.01 run scoreboard players operation #θ int += #3d.pentagram.roll.θ int
execute rotated as @s rotated ~ 0.0 positioned .0 .0 .0 run tp @s ^1.0 ^ ^ ~ ~
execute store result score #sin int run data get entity @s Pos[2] 1000
execute store result score #cos int run data get entity @s Pos[0] 1000

execute store result storage math temp1 double 0.0001 run scoreboard players operation #sin int *= #r int
execute store result storage math temp2 double 0.0001 run scoreboard players operation #cos int *= #r int

scoreboard players add #sstemp2 int 1
scoreboard players operation #sstemp1 int = #sstemp2 int
scoreboard players operation #sstemp1 int %= #3d.pentagram.density int
execute if score #sstemp1 int matches 0 run data modify storage math 3d_ar_rotation_pentagram_posX append from storage math temp1
execute if score #sstemp1 int matches 0 run data modify storage math 3d_ar_rotation_pentagram_posY append from storage math temp2

data modify entity @s Pos set from storage math store_pos
data modify entity @s Rotation set from storage math store_rotate

#execute if score #loop int matches 1.. rotated ~-0.3 0.0 run function large_number:particle/3d_ar_rotation_pentagram/loop
