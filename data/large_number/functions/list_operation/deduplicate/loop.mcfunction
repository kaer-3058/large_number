data modify storage math temp2 set from storage math temp1[0]
data remove storage math temp1[0]
execute store result score #temp1 int if data storage math temp1[]
data modify storage math temp4 set from storage math temp1
execute store result score #temp2 int run data modify storage math temp4[] set from storage math temp2
scoreboard players operation #temp2 int *= -1 const
scoreboard players operation #temp2 int += #temp1 int
execute if score #temp2 int matches ..0 run data modify storage math temp3 append from storage math temp2
execute if data storage math temp1[0] run function large_number:list_operation/deduplicate/loop
