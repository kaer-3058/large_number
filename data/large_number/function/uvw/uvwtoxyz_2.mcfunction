#此算法来自小豆数学库
#math:uvw/_tovec_macro
#局部坐标转换世界坐标
#输入执行坐标，执行高度(anchored eyes|feet)，执行朝向
#输入{<#u large_number.int>,<#v large_number.int>,<#w large_number.int>}
#输出{<#vec_x large_number.int>,<#vec_y large_number.int>,<#vec_z large_number.int>}
#需要以世界实体为执行者

execute store result storage large_number:math u double 0.0001 run scoreboard players get #u large_number.int
execute store result storage large_number:math v double 0.0001 run scoreboard players get #v large_number.int
execute store result storage large_number:math w double 0.0001 run scoreboard players get #w large_number.int
function large_number:uvw/xyz-uvw_macro1 with storage large_number:math
data modify storage large_number:math buffer_all_xyz set from entity @s Pos
execute store result score #vec_x large_number.int run data get storage large_number:math buffer_all_xyz[0] 10000
execute store result score #vec_y large_number.int run data get storage large_number:math buffer_all_xyz[1] 10000
execute store result score #vec_z large_number.int run data get storage large_number:math buffer_all_xyz[2] 10000
tp .0 .0 .0
