##列表算法 - 抽牌

#输入：data modify storage large_number:math sstemp2 set value []
#把抽到的项从原列表移除：scoreboard players set #list_ope_random_index_once.del int 1

execute store result score #temp1 int run data get storage large_number:math sstemp2
execute store result score #uniform_distribution.max int run scoreboard players remove #temp1 int 1

#均匀分布
item modify block -29999984 -60 22022220 container.0 large_number:uniform_distribution
data modify storage large_number:math temp1 set from block -29999984 -60 22022220 RecordItem.components."minecraft:custom_model_data"

function large_number:random/hypergeometric_distribution/macro1 with storage large_number:math
data modify storage large_number:math sstemp4 append from storage large_number:math sstemp3

scoreboard players remove #store_hypergeometric_distribution.times int 1
execute if score #store_hypergeometric_distribution.times int matches 1.. run function large_number:random/hypergeometric_distribution/loop3
