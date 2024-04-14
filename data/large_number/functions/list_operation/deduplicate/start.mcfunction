##列表算法 - 数组元素去重 (返回值法)

#输入：data modify storage math list_dedup.input set value []

data modify storage math temp1 set from storage math list_dedup.input
data modify storage math temp3 set value []
execute if data storage math temp1[0] run function large_number:list_operation/deduplicate/loop
data modify storage math list_dedup.output set from storage math temp3
