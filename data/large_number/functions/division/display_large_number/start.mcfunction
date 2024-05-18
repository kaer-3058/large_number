#输入四个整型数组
#data modify storage large_number:math display_div_large.input.dividend1 set value [I;0,0,0]
#data modify storage large_number:math display_div_large.input.dividend2 set value [I;0,0,0]
#data modify storage large_number:math display_div_large.input.dividend3 set value [I;0,0,0]
#data modify storage large_number:math display_div_large.input.divisor set value [I;0,0,0]

execute store result score #temp1 int run data get storage large_number:math display_div_large.input.dividend1[0]
execute store result score #temp2 int run data get storage large_number:math display_div_large.input.dividend1[1]
execute store result score #temp3 int run data get storage large_number:math display_div_large.input.dividend1[2]
execute store result score #temp4 int run data get storage large_number:math display_div_large.input.dividend2[0]
execute store result score #temp5 int run data get storage large_number:math display_div_large.input.dividend2[1]
execute store result score #temp6 int run data get storage large_number:math display_div_large.input.dividend2[2]
execute store result score #temp7 int run data get storage large_number:math display_div_large.input.dividend3[0]
execute store result score #temp8 int run data get storage large_number:math display_div_large.input.dividend3[1]
execute store result score #temp9 int run data get storage large_number:math display_div_large.input.dividend3[2]
execute store result score #temp10 int run data get storage large_number:math display_div_large.input.divisor[0]
execute store result score #temp11 int run data get storage large_number:math display_div_large.input.divisor[1]
execute store result score #temp12 int run data get storage large_number:math display_div_large.input.divisor[2]
execute store result storage large_number:math temp1 int 1 run scoreboard players add #temp1 int 10000
execute store result storage large_number:math temp2 int 1 run scoreboard players add #temp2 int 10000
execute store result storage large_number:math temp3 int 1 run scoreboard players add #temp3 int 10000
execute store result storage large_number:math temp4 int 1 run scoreboard players add #temp4 int 10000
execute store result storage large_number:math temp5 int 1 run scoreboard players add #temp5 int 10000
execute store result storage large_number:math temp6 int 1 run scoreboard players add #temp6 int 10000
execute store result storage large_number:math temp7 int 1 run scoreboard players add #temp7 int 10000
execute store result storage large_number:math temp8 int 1 run scoreboard players add #temp8 int 10000
execute store result storage large_number:math temp9 int 1 run scoreboard players add #temp9 int 10000
execute store result storage large_number:math temp10 int 1 run scoreboard players add #temp10 int 10000
execute store result storage large_number:math temp11 int 1 run scoreboard players add #temp11 int 10000
execute store result storage large_number:math temp12 int 1 run scoreboard players add #temp12 int 10000
data modify storage large_number:math temp1 set string storage large_number:math temp1 1
data modify storage large_number:math temp2 set string storage large_number:math temp2 1
data modify storage large_number:math temp3 set string storage large_number:math temp3 1
data modify storage large_number:math temp4 set string storage large_number:math temp4 1
data modify storage large_number:math temp5 set string storage large_number:math temp5 1
data modify storage large_number:math temp6 set string storage large_number:math temp6 1
data modify storage large_number:math temp7 set string storage large_number:math temp7 1
data modify storage large_number:math temp8 set string storage large_number:math temp8 1
data modify storage large_number:math temp9 set string storage large_number:math temp9 1
data modify storage large_number:math temp10 set string storage large_number:math temp10 1
data modify storage large_number:math temp11 set string storage large_number:math temp11 1
data modify storage large_number:math temp12 set string storage large_number:math temp12 1

function large_number:division/display_large_number/macro.1 with storage large_number:math

#data get entity 28529-0-3d00-0-2c4200ee8401 transformation.scale
