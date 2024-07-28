#此算法来自小豆数学库
#math:uvw/_vecto_macro
#世界坐标转换局部坐标
#输入执行坐标，执行高度(anchored eyes|feet)，执行朝向
#输入{<#vec_x int>,<#vec_y int>,<#vec_z int>}
#输出{<#u int>,<#v int>,<#w int>}
#需要以世界实体为执行者

tp @s ^ ^ ^ ~ ~
data modify storage large_number:math rotation set from entity @s Rotation
data modify storage large_number:math rotation append from storage large_number:math rotation[0]
data remove storage large_number:math rotation[0]
data modify entity @s Rotation set from storage large_number:math rotation

data modify storage large_number:math buffer_all_xyz set from entity @s Pos
execute store result score #sstempx int run data get storage large_number:math buffer_all_xyz[0] 10000
execute store result score #sstempy int run data get storage large_number:math buffer_all_xyz[1] 10000
execute store result score #sstempz int run data get storage large_number:math buffer_all_xyz[2] 10000
execute store result storage large_number:math v double -0.0001 run scoreboard players operation #sstempx int -= #vec_x int
execute store result storage large_number:math u double -0.0001 run scoreboard players operation #sstempy int -= #vec_y int
execute store result storage large_number:math w double 0.0001 run scoreboard players operation #sstempz int -= #vec_z int
execute at @s positioned .0 .0 .0 run function large_number:uvw/xyz-uvw_macro1 with storage large_number:math
data modify storage large_number:math buffer_all_xyz set from entity @s Pos

execute store result score #u int run data get storage large_number:math buffer_all_xyz[1] 10000
execute store result score #v int run data get storage large_number:math buffer_all_xyz[0] 10000
execute store result score #w int run data get storage large_number:math buffer_all_xyz[2] -10000
