##列表算法 - 抽牌

#输入：data modify storage math list_ope_random_index_once.input set value []
#把抽到的项从原列表移除：scoreboard players set #list_ope_random_index_once.del int 1

execute store result score #temp1 int if data storage math list_ope_random_index_once.input[]
execute store result storage math temp1 int 1 run scoreboard players remove #temp1 int 1
function large_number:list_operation/random_index_once/macro1 with storage math
function large_number:list_operation/random_index_once/macro2 with storage math
