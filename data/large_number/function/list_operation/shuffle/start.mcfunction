##列表算法 - 洗牌
#输入：data modify storage large_number:math list_ope_shuffle.input set value []
#清理marker：kill @e[type=minecraft:marker,tag=large_number.list_operation]
#测试数量：execute if entity @e[type=minecraft:marker,tag=large_number.list_operation]

data modify storage large_number:math temp1 set from storage large_number:math list_ope_shuffle.input
data modify storage large_number:math temp2 set value []

execute store result score #list_length int run data get storage large_number:math temp1
execute store result score #marker_number int if entity @e[type=minecraft:marker]
scoreboard players operation #temp1 int = #list_length int
scoreboard players operation #temp1 int -= #marker_number int

execute if score #temp1 int matches 1.. run function large_number:list_operation/shuffle/loop

execute as @e[type=minecraft:marker] run function large_number:list_operation/shuffle/default_sort.marker
execute as @e[type=minecraft:marker,sort=random] if data entity @s data.list_ope_shuffle run data modify storage large_number:math temp2 append from entity @s data.list_ope_shuffle

data modify storage large_number:math list_ope_shuffle.output set from storage large_number:math temp2
