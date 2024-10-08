#此算法来自小豆数学库
#math:uvw/_tovec_macro
#局部坐标转换世界坐标
#输入执行坐标，执行高度(anchored eyes|feet)，执行朝向
#输入{<#u int>,<#v int>,<#w int>}
#输出{<#vec_x int>,<#vec_y int>,<#vec_z int>}
#需要以世界实体为执行者

execute store result storage large_number:math u double 0.0001 run scoreboard players get #u int
execute store result storage large_number:math v double 0.0001 run scoreboard players get #v int
execute store result storage large_number:math w double 0.0001 run scoreboard players get #w int
function large_number:uvw/xyz-uvw_macro1 with storage large_number:math
data modify storage large_number:math buffer_all_xyz set from entity @s Pos
execute store result score #vec_x int run data get storage large_number:math buffer_all_xyz[0] 10000
execute store result score #vec_y int run data get storage large_number:math buffer_all_xyz[1] 10000
execute store result score #vec_z int run data get storage large_number:math buffer_all_xyz[2] 10000
tp .0 .0 .0
