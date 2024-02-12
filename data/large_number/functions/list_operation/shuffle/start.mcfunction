##列表洗牌
#输入：data modify storage math list_ope_shuffle.input set value []
#清理marker：execute in minecraft:overworld run kill @e[type=minecraft:marker,tag=large_number.list_operation]
#测试数量：execute in minecraft:overworld if entity @e[type=minecraft:marker,tag=large_number.list_operation]

data modify storage math temp1 set from storage math list_ope_shuffle.input
data modify storage math temp2 set value []

execute store result score #list_length int if data storage math temp1[]
execute store result score #marker_number int if entity @e[type=minecraft:marker]
scoreboard players operation #temp1 int = #list_length int
scoreboard players operation #temp1 int -= #marker_number int

execute if score #temp1 int matches 1.. in minecraft:overworld run function large_number:list_operation/shuffle/loop

execute as @e[type=minecraft:marker] run function large_number:list_operation/shuffle/default_sort.marker
execute as @e[type=minecraft:marker,sort=random] if data entity @s data.list_ope_shuffle run data modify storage math temp2 append from entity @s data.list_ope_shuffle

data modify storage math list_ope_shuffle.output set from storage math temp2
