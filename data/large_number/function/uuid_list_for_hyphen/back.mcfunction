##UUID带连字符的16进制转为数组 - 算术法

#输入：data modify storage large_number:math uuid_hyphen_back_list.input set value "d91095bb-9a9d-4d4f-b16b-2d36136699b6"
#必须输入完整的32位UUID，每一段前面的0不能省
#输出：data get storage large_number:math uuid_hyphen_back_list.output

data modify storage large_number:math temp2 set from storage large_number:math uuid_hyphen_back_list.input
data modify storage large_number:math temp1 set value [{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0}]
data modify storage large_number:math temp1[0].a set string storage large_number:math temp2 0 1
data modify storage large_number:math temp1[1].a set string storage large_number:math temp2 1 2
data modify storage large_number:math temp1[2].a set string storage large_number:math temp2 2 3
data modify storage large_number:math temp1[3].a set string storage large_number:math temp2 3 4
data modify storage large_number:math temp1[4].a set string storage large_number:math temp2 4 5
data modify storage large_number:math temp1[5].a set string storage large_number:math temp2 5 6
data modify storage large_number:math temp1[6].a set string storage large_number:math temp2 6 7
data modify storage large_number:math temp1[7].a set string storage large_number:math temp2 7 8
data modify storage large_number:math temp1[8].a set string storage large_number:math temp2 9 10
data modify storage large_number:math temp1[9].a set string storage large_number:math temp2 10 11
data modify storage large_number:math temp1[10].a set string storage large_number:math temp2 11 12
data modify storage large_number:math temp1[11].a set string storage large_number:math temp2 12 13
data modify storage large_number:math temp1[12].a set string storage large_number:math temp2 14 15
data modify storage large_number:math temp1[13].a set string storage large_number:math temp2 15 16
data modify storage large_number:math temp1[14].a set string storage large_number:math temp2 16 17
data modify storage large_number:math temp1[15].a set string storage large_number:math temp2 17 18
data modify storage large_number:math temp1[16].a set string storage large_number:math temp2 19 20
data modify storage large_number:math temp1[17].a set string storage large_number:math temp2 20 21
data modify storage large_number:math temp1[18].a set string storage large_number:math temp2 21 22
data modify storage large_number:math temp1[19].a set string storage large_number:math temp2 22 23
data modify storage large_number:math temp1[20].a set string storage large_number:math temp2 24 25
data modify storage large_number:math temp1[21].a set string storage large_number:math temp2 25 26
data modify storage large_number:math temp1[22].a set string storage large_number:math temp2 26 27
data modify storage large_number:math temp1[23].a set string storage large_number:math temp2 27 28
data modify storage large_number:math temp1[24].a set string storage large_number:math temp2 28 29
data modify storage large_number:math temp1[25].a set string storage large_number:math temp2 29 30
data modify storage large_number:math temp1[26].a set string storage large_number:math temp2 30 31
data modify storage large_number:math temp1[27].a set string storage large_number:math temp2 31 32
data modify storage large_number:math temp1[28].a set string storage large_number:math temp2 32 33
data modify storage large_number:math temp1[29].a set string storage large_number:math temp2 33 34
data modify storage large_number:math temp1[30].a set string storage large_number:math temp2 34 35
data modify storage large_number:math temp1[31].a set string storage large_number:math temp2 35 36

data modify storage large_number:math temp1[{a:"0"}].a set value 0
data modify storage large_number:math temp1[{a:"1"}].a set value 1
data modify storage large_number:math temp1[{a:"2"}].a set value 2
data modify storage large_number:math temp1[{a:"3"}].a set value 3
data modify storage large_number:math temp1[{a:"4"}].a set value 4
data modify storage large_number:math temp1[{a:"5"}].a set value 5
data modify storage large_number:math temp1[{a:"6"}].a set value 6
data modify storage large_number:math temp1[{a:"7"}].a set value 7
data modify storage large_number:math temp1[{a:"8"}].a set value 8
data modify storage large_number:math temp1[{a:"9"}].a set value 9
data modify storage large_number:math temp1[{a:"a"}].a set value 10
data modify storage large_number:math temp1[{a:"b"}].a set value 11
data modify storage large_number:math temp1[{a:"c"}].a set value 12
data modify storage large_number:math temp1[{a:"d"}].a set value 13
data modify storage large_number:math temp1[{a:"e"}].a set value 14
data modify storage large_number:math temp1[{a:"f"}].a set value 15

data modify storage large_number:math temp3 set value []
data modify storage large_number:math temp3 append from storage large_number:math temp1[].a
execute store result storage large_number:math temp_uu1 long 268435456 run data get storage large_number:math temp3[0]
execute store result storage large_number:math temp_uu2 long 268435456 run data get storage large_number:math temp3[8]
execute store result storage large_number:math temp_uu3 long 268435456 run data get storage large_number:math temp3[16]
execute store result storage large_number:math temp_uu4 long 268435456 run data get storage large_number:math temp3[24]

execute store result score #uuid_list.1 int run data get storage large_number:math temp3[1] 16777216
execute store result score #temp2 int run data get storage large_number:math temp3[2] 1048576
execute store result score #temp3 int run data get storage large_number:math temp3[3] 65536
execute store result score #temp4 int run data get storage large_number:math temp3[4] 4096
execute store result score #temp5 int run data get storage large_number:math temp3[5] 256
execute store result score #temp6 int run data get storage large_number:math temp3[6] 16
execute store result score #temp7 int run data get storage large_number:math temp3[7]
scoreboard players operation #uuid_list.1 int += #temp2 int
scoreboard players operation #uuid_list.1 int += #temp3 int
scoreboard players operation #uuid_list.1 int += #temp4 int
scoreboard players operation #uuid_list.1 int += #temp5 int
scoreboard players operation #uuid_list.1 int += #temp6 int
scoreboard players operation #uuid_list.1 int += #temp7 int

execute store result score #uuid_list.2 int run data get storage large_number:math temp3[9] 16777216
execute store result score #temp2 int run data get storage large_number:math temp3[10] 1048576
execute store result score #temp3 int run data get storage large_number:math temp3[11] 65536
execute store result score #temp4 int run data get storage large_number:math temp3[12] 4096
execute store result score #temp5 int run data get storage large_number:math temp3[13] 256
execute store result score #temp6 int run data get storage large_number:math temp3[14] 16
execute store result score #temp7 int run data get storage large_number:math temp3[15]
scoreboard players operation #uuid_list.2 int += #temp2 int
scoreboard players operation #uuid_list.2 int += #temp3 int
scoreboard players operation #uuid_list.2 int += #temp4 int
scoreboard players operation #uuid_list.2 int += #temp5 int
scoreboard players operation #uuid_list.2 int += #temp6 int
scoreboard players operation #uuid_list.2 int += #temp7 int

execute store result score #uuid_list.3 int run data get storage large_number:math temp3[17] 16777216
execute store result score #temp2 int run data get storage large_number:math temp3[18] 1048576
execute store result score #temp3 int run data get storage large_number:math temp3[19] 65536
execute store result score #temp4 int run data get storage large_number:math temp3[20] 4096
execute store result score #temp5 int run data get storage large_number:math temp3[21] 256
execute store result score #temp6 int run data get storage large_number:math temp3[22] 16
execute store result score #temp7 int run data get storage large_number:math temp3[23]
scoreboard players operation #uuid_list.3 int += #temp2 int
scoreboard players operation #uuid_list.3 int += #temp3 int
scoreboard players operation #uuid_list.3 int += #temp4 int
scoreboard players operation #uuid_list.3 int += #temp5 int
scoreboard players operation #uuid_list.3 int += #temp6 int
scoreboard players operation #uuid_list.3 int += #temp7 int

execute store result score #uuid_list.4 int run data get storage large_number:math temp3[25] 16777216
execute store result score #temp2 int run data get storage large_number:math temp3[26] 1048576
execute store result score #temp3 int run data get storage large_number:math temp3[27] 65536
execute store result score #temp4 int run data get storage large_number:math temp3[28] 4096
execute store result score #temp5 int run data get storage large_number:math temp3[29] 256
execute store result score #temp6 int run data get storage large_number:math temp3[30] 16
execute store result score #temp7 int run data get storage large_number:math temp3[31]
scoreboard players operation #uuid_list.4 int += #temp2 int
scoreboard players operation #uuid_list.4 int += #temp3 int
scoreboard players operation #uuid_list.4 int += #temp4 int
scoreboard players operation #uuid_list.4 int += #temp5 int
scoreboard players operation #uuid_list.4 int += #temp6 int
scoreboard players operation #uuid_list.4 int += #temp7 int

data modify storage large_number:math temp2 set value 0
data modify storage large_number:math temp4 set value 0
data modify storage large_number:math temp6 set value 0
data modify storage large_number:math temp8 set value 0
data modify storage large_number:math temp2 set string storage large_number:math temp_uu1 -9 -1
data modify storage large_number:math temp_uu1 set string storage large_number:math temp_uu1 0 -9
data modify storage large_number:math temp4 set string storage large_number:math temp_uu2 -9 -1
data modify storage large_number:math temp_uu2 set string storage large_number:math temp_uu2 0 -9
data modify storage large_number:math temp6 set string storage large_number:math temp_uu3 -9 -1
data modify storage large_number:math temp_uu3 set string storage large_number:math temp_uu3 0 -9
data modify storage large_number:math temp8 set string storage large_number:math temp_uu4 -9 -1
data modify storage large_number:math temp_uu4 set string storage large_number:math temp_uu4 0 -9

execute store result score #temp1 int run function large_number:uuid_list_for_hyphen/back.macro1/1 with storage large_number:math
execute store result score #temp2 int run function large_number:uuid_list_for_hyphen/back.macro1/2 with storage large_number:math
execute store result score #temp3 int run function large_number:uuid_list_for_hyphen/back.macro1/3 with storage large_number:math
execute store result score #temp4 int run function large_number:uuid_list_for_hyphen/back.macro1/4 with storage large_number:math
execute store result score #temp5 int run function large_number:uuid_list_for_hyphen/back.macro1/5 with storage large_number:math
execute store result score #temp6 int run function large_number:uuid_list_for_hyphen/back.macro1/6 with storage large_number:math
execute store result score #temp7 int run function large_number:uuid_list_for_hyphen/back.macro1/7 with storage large_number:math
execute store result score #temp8 int run function large_number:uuid_list_for_hyphen/back.macro1/8 with storage large_number:math
scoreboard players operation #temp1 int *= 100000000 const
scoreboard players operation #temp1 int += #temp2 int
scoreboard players operation #temp3 int *= 100000000 const
scoreboard players operation #temp3 int += #temp4 int
scoreboard players operation #temp5 int *= 100000000 const
scoreboard players operation #temp5 int += #temp6 int
scoreboard players operation #temp7 int *= 100000000 const
scoreboard players operation #temp7 int += #temp8 int

data modify storage large_number:math uuid_hyphen_back_list.output set value [I;0,0,0,0]
execute store result storage large_number:math uuid_hyphen_back_list.output[0] int 1 run scoreboard players operation #uuid_list.1 int += #temp1 int
execute store result storage large_number:math uuid_hyphen_back_list.output[1] int 1 run scoreboard players operation #uuid_list.2 int += #temp3 int
execute store result storage large_number:math uuid_hyphen_back_list.output[2] int 1 run scoreboard players operation #uuid_list.3 int += #temp5 int
execute store result storage large_number:math uuid_hyphen_back_list.output[3] int 1 run scoreboard players operation #uuid_list.4 int += #temp7 int
