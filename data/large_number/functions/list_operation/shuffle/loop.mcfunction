summon minecraft:marker 0.0 0.0 0.0 {Tags:["large_number.list_operation"]}
scoreboard players remove #temp1 int 1
execute if score #temp1 int matches 1.. run function large_number:list_operation/shuffle/loop