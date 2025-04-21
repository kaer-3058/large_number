##double点列排序 - 冒泡排序法 - 正序

#输入[double点列]：data modify storage large_number:math sort_double_point2.input set value [[1.0,4.0],[2.0,2.5]]
#以点的第几个元素为排序基准：scoreboard players set #sort_double_point2.mode int 1
#取0~2

data modify storage large_number:math sort_double_point2.output set value []
data modify storage large_number:math stemp0 set from storage large_number:math sort_double_point2.input
data modify storage large_number:math stemp1 set value []

execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/double_point2_ascending_order/loop
data modify storage large_number:math sort_double_point2.output prepend from storage large_number:math stemp0[]
