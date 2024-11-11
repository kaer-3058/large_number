#递归减
scoreboard players set #sstempu int 0
function large_number:division/large_division/loop3
execute store result storage large_number:math stemp1 int 1 run scoreboard players get #sstempu int
data modify storage large_number:math sstempz append from storage large_number:math stemp1

#loop4 乘10
execute if score #loops int matches 1.. run function large_number:division/large_division/4
