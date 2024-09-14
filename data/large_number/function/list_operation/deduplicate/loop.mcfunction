data modify storage large_number:math temp2 set from storage large_number:math temp1[0]
data remove storage large_number:math temp1[0]
execute store result score #temp1 int run data get storage large_number:math temp1
data modify storage large_number:math temp4 set from storage large_number:math temp1
execute store result score #temp2 int run data modify storage large_number:math temp4[] set from storage large_number:math temp2
scoreboard players operation #temp2 int *= -1 const
scoreboard players operation #temp2 int += #temp1 int
execute if score #temp2 int matches ..0 run data modify storage large_number:math temp3 append from storage large_number:math temp2
execute if data storage large_number:math temp1[0] run function large_number:list_operation/deduplicate/loop
