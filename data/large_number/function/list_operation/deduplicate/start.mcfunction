##列表算法 - 数组元素去重 (暴力搜索)

#输入：data modify storage large_number:math list_dedup.input set value []

data modify storage large_number:math temp1 set from storage large_number:math list_dedup.input
data modify storage large_number:math temp3 set value []
execute if data storage large_number:math temp1[0] run function large_number:list_operation/deduplicate/loop
data modify storage large_number:math list_dedup.output set from storage large_number:math temp3
