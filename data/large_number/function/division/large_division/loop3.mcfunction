#减法
data modify storage large_number:math temp1 set from storage large_number:math div_1
data modify storage large_number:math temp2 set from storage large_number:math div_2
data modify storage large_number:math temp9 set value []
execute if data storage large_number:math temp1[-2] run function large_number:division/large_division/loop3.1
execute if data storage large_number:math temp1[-1] run function large_number:division/large_division/loop3.2
data modify storage large_number:math div_1 set from storage large_number:math temp9

#去掉产生的前导0
execute store result score #temp1 int run data get storage large_number:math div_1[0]
execute if score #temp1 int matches 0 if data storage large_number:math div_1[1] run function large_number:division/large_division/del_leading_zeros

scoreboard players add #sstempu int 1

#loop1，比较大小
data modify storage large_number:math temp1 set from storage large_number:math div_1
data modify storage large_number:math temp2 set from storage large_number:math div_2

execute store result score #temp1 int run data get storage large_number:math temp1[0]
execute store result score #temp2 int run data get storage large_number:math temp2[0]
execute store result score #temp3 int run data get storage large_number:math temp1
execute store result score #temp4 int run data get storage large_number:math temp2
execute if score #temp3 int = #temp4 int if score #temp1 int = #temp2 int if data storage large_number:math temp1[0] run function large_number:division/large_division/loop1

scoreboard players set #is_< int 0
execute if score #temp3 int < #temp4 int run scoreboard players set #is_< int 1
execute if score #temp3 int >= #temp4 int run scoreboard players set #is_< int 0
execute if score #temp3 int = #temp4 int if score #temp1 int < #temp2 int run scoreboard players set #is_< int 1
execute if score #temp3 int = #temp4 int if score #temp1 int > #temp2 int run scoreboard players set #is_< int 0

#tellraw @a {"nbt":"div_1","storage": "large_number:math"}
#tellraw @a {"nbt":"div_2","storage": "large_number:math"}

execute if score #is_< int matches 0 run function large_number:division/large_division/loop3
