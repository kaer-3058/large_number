##列表算法 - 抽牌

#列表长度不可超过2147483583
#输入：data modify storage large_number:math list_ope_random_index_once.input set value []
#把抽到的项从原列表移除：scoreboard players set #list_ope_random_index_once.del int 1

data remove storage large_number:math q0
data modify storage large_number:math s1 set from storage large_number:math list_ope_random_index_once.input
execute store result score #uniform_distribution.max int run data get storage large_number:math s1

#均匀分布
item modify block -29999984 -60 22022220 container.0 large_number:uniform_distribution
data modify storage large_number:math temp1 set from block -29999984 -60 22022220 RecordItem.components."minecraft:custom_model_data"

function large_number:list_operation/random_index_once/macro2 with storage large_number:math
data modify storage large_number:math list_ope_random_index_once.output set from storage large_number:math q0
execute if score #list_ope_random_index_once.del int matches 1 run function large_number:list_operation/random_index_once/macro3 with storage large_number:math
data modify storage large_number:math list_ope_random_index_once.input set from storage large_number:math s1
