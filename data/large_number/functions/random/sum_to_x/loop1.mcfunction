function ntre:next
execute store result storage large_number:math temp2 int 1 run scoreboard players get @s ntre_output
data modify storage large_number:math temp1 append from storage large_number:math temp2
scoreboard players remove #temp1 int 1
execute if score #temp1 int matches 1.. run function large_number:random/sum_to_x/loop1
