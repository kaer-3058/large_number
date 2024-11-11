data modify storage large_number:math sstempz append value 0

#loop2，乘10
data modify storage large_number:math temp1 set value []
data modify storage large_number:math temp2 set from storage large_number:math div_1
scoreboard players set #temp1 int 0
execute if data storage large_number:math div_1[0] run function large_number:division/large_division/loop2
data modify storage large_number:math div_1 set from storage large_number:math temp1

execute store result storage large_number:math stemp1 int 1 run scoreboard players get #temp1 int
execute if score #temp1 int matches 1.. run data modify storage large_number:math div_1 prepend from storage large_number:math stemp1
