#loop1，比较大小
data modify storage large_number:math temp1 set from storage large_number:math div_1
data modify storage large_number:math temp2 set from storage large_number:math div_2

execute store result score #temp1 large_number.int run data get storage large_number:math temp1[0]
execute store result score #temp2 large_number.int run data get storage large_number:math temp2[0]
execute store result score #temp3 large_number.int run data get storage large_number:math temp1
execute store result score #temp4 large_number.int run data get storage large_number:math temp2
execute if score #temp3 large_number.int = #temp4 large_number.int if score #temp1 large_number.int = #temp2 large_number.int if data storage large_number:math temp1[0] run function large_number:division/large_division/loop1

scoreboard players set #is_< large_number.int 0
execute if score #temp3 large_number.int < #temp4 large_number.int run scoreboard players set #is_< large_number.int 1
execute if score #temp3 large_number.int >= #temp4 large_number.int run scoreboard players set #is_< large_number.int 0
execute if score #temp3 large_number.int = #temp4 large_number.int if score #temp1 large_number.int < #temp2 large_number.int run scoreboard players set #is_< large_number.int 1
execute if score #temp3 large_number.int = #temp4 large_number.int if score #temp1 large_number.int > #temp2 large_number.int run scoreboard players set #is_< large_number.int 0

scoreboard players remove #loops large_number.int 1

#loop2，乘10
#tellraw @a {"nbt":"div_1","storage": "large_number:math"}
#tellraw @a {"nbt":"div_2","storage": "large_number:math"}
execute if score #is_< large_number.int matches 1 run function large_number:division/large_division/2

#loop3 迭代法大数除法的核心——递归减
execute if score #is_< large_number.int matches 0 run function large_number:division/large_division/3

execute if score #loops large_number.int matches 1.. run function large_number:division/large_division/loop_all
