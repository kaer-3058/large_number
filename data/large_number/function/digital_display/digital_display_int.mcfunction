##int数位显示

#scoreboard players set #digital_display_int.input large_number.int 2147483647

data modify storage large_number:math digital_display_int set value []

execute store result storage large_number:math stemp4 int 1 run scoreboard players get #digital_display_int.input large_number.int
data modify storage large_number:math stemp4 set string storage large_number:math stemp4
execute store result score #length large_number.int run data get storage large_number:math stemp4
execute if score #digital_display_int.input large_number.int matches ..-1 run scoreboard players remove #length large_number.int 1

data modify storage large_number:math stemp1 set value ""
data modify storage large_number:math stemp2 set value ""
data modify storage large_number:math stemp3 set value ""

execute if score #length large_number.int matches 4.. run data modify storage large_number:math stemp3 set string storage large_number:math stemp4 0 -3
execute if score #length large_number.int matches 4.. run data modify storage large_number:math stemp4 set string storage large_number:math stemp4 -3

execute if score #length large_number.int matches 7.. run data modify storage large_number:math stemp2 set string storage large_number:math stemp3 0 -3
execute if score #length large_number.int matches 7.. run data modify storage large_number:math stemp3 set string storage large_number:math stemp3 -3

execute if score #length large_number.int matches 10 run data modify storage large_number:math stemp1 set string storage large_number:math stemp2 0 -3
execute if score #length large_number.int matches 10 run data modify storage large_number:math stemp2 set string storage large_number:math stemp2 -3

execute unless data storage large_number:math {stemp1:""} run data modify storage large_number:math digital_display_int append from storage large_number:math stemp1
execute unless data storage large_number:math {stemp2:""} run data modify storage large_number:math digital_display_int append from storage large_number:math stemp2
execute unless data storage large_number:math {stemp3:""} run data modify storage large_number:math digital_display_int append from storage large_number:math stemp3
data modify storage large_number:math digital_display_int append from storage large_number:math stemp4

#tellraw @a {"nbt":"digital_display_int[]","storage":"large_number:math","separator":","}
