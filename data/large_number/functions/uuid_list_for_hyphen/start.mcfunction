##UUID数组转化为带连字符的16进制

#输入：data modify storage large_number:math uuid_list_for_hyphen.input set value [I;0,0,0,1]
#输出：data get storage large_number:math uuid_list_for_hyphen.output

execute store result score #temp2 int store result score #temp1 int run data get storage large_number:math uuid_list_for_hyphen.input[0]
execute store result score #temp12 int store result score #temp11 int run data get storage large_number:math uuid_list_for_hyphen.input[1]
execute store result score #temp22 int store result score #temp21 int run data get storage large_number:math uuid_list_for_hyphen.input[2]
execute store result score #temp32 int store result score #temp31 int run data get storage large_number:math uuid_list_for_hyphen.input[3]

#转16进制
execute store result score #temp3 int run scoreboard players operation #temp2 int /= 16 const
execute store result score #temp4 int run scoreboard players operation #temp3 int /= 16 const
execute store result score #temp5 int run scoreboard players operation #temp4 int /= 16 const
execute store result score #temp6 int run scoreboard players operation #temp5 int /= 16 const
execute store result score #temp7 int run scoreboard players operation #temp6 int /= 16 const
execute store result score #temp8 int run scoreboard players operation #temp7 int /= 16 const
scoreboard players operation #temp8 int /= 16 const

execute store result score #temp13 int run scoreboard players operation #temp12 int /= 16 const
execute store result score #temp14 int run scoreboard players operation #temp13 int /= 16 const
execute store result score #temp15 int run scoreboard players operation #temp14 int /= 16 const
execute store result score #temp16 int run scoreboard players operation #temp15 int /= 16 const
execute store result score #temp17 int run scoreboard players operation #temp16 int /= 16 const
execute store result score #temp18 int run scoreboard players operation #temp17 int /= 16 const
scoreboard players operation #temp18 int /= 16 const

execute store result score #temp23 int run scoreboard players operation #temp22 int /= 16 const
execute store result score #temp24 int run scoreboard players operation #temp23 int /= 16 const
execute store result score #temp25 int run scoreboard players operation #temp24 int /= 16 const
execute store result score #temp26 int run scoreboard players operation #temp25 int /= 16 const
execute store result score #temp27 int run scoreboard players operation #temp26 int /= 16 const
execute store result score #temp28 int run scoreboard players operation #temp27 int /= 16 const
scoreboard players operation #temp28 int /= 16 const

execute store result score #temp33 int run scoreboard players operation #temp32 int /= 16 const
execute store result score #temp34 int run scoreboard players operation #temp33 int /= 16 const
execute store result score #temp35 int run scoreboard players operation #temp34 int /= 16 const
execute store result score #temp36 int run scoreboard players operation #temp35 int /= 16 const
execute store result score #temp37 int run scoreboard players operation #temp36 int /= 16 const
execute store result score #temp38 int run scoreboard players operation #temp37 int /= 16 const
scoreboard players operation #temp38 int /= 16 const

data modify storage large_number:math temp1 set value [{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0},{a:0}]
execute store result storage large_number:math temp1[0].a int 1 run scoreboard players operation #temp8 int %= 16 const
execute store result storage large_number:math temp1[1].a int 1 run scoreboard players operation #temp7 int %= 16 const
execute store result storage large_number:math temp1[2].a int 1 run scoreboard players operation #temp6 int %= 16 const
execute store result storage large_number:math temp1[3].a int 1 run scoreboard players operation #temp5 int %= 16 const
execute store result storage large_number:math temp1[4].a int 1 run scoreboard players operation #temp4 int %= 16 const
execute store result storage large_number:math temp1[5].a int 1 run scoreboard players operation #temp3 int %= 16 const
execute store result storage large_number:math temp1[6].a int 1 run scoreboard players operation #temp2 int %= 16 const
execute store result storage large_number:math temp1[7].a int 1 run scoreboard players operation #temp1 int %= 16 const
execute store result storage large_number:math temp1[8].a int 1 run scoreboard players operation #temp18 int %= 16 const
execute store result storage large_number:math temp1[9].a int 1 run scoreboard players operation #temp17 int %= 16 const
execute store result storage large_number:math temp1[10].a int 1 run scoreboard players operation #temp16 int %= 16 const
execute store result storage large_number:math temp1[11].a int 1 run scoreboard players operation #temp15 int %= 16 const
execute store result storage large_number:math temp1[12].a int 1 run scoreboard players operation #temp14 int %= 16 const
execute store result storage large_number:math temp1[13].a int 1 run scoreboard players operation #temp13 int %= 16 const
execute store result storage large_number:math temp1[14].a int 1 run scoreboard players operation #temp12 int %= 16 const
execute store result storage large_number:math temp1[15].a int 1 run scoreboard players operation #temp11 int %= 16 const
execute store result storage large_number:math temp1[16].a int 1 run scoreboard players operation #temp28 int %= 16 const
execute store result storage large_number:math temp1[17].a int 1 run scoreboard players operation #temp27 int %= 16 const
execute store result storage large_number:math temp1[18].a int 1 run scoreboard players operation #temp26 int %= 16 const
execute store result storage large_number:math temp1[19].a int 1 run scoreboard players operation #temp25 int %= 16 const
execute store result storage large_number:math temp1[20].a int 1 run scoreboard players operation #temp24 int %= 16 const
execute store result storage large_number:math temp1[21].a int 1 run scoreboard players operation #temp23 int %= 16 const
execute store result storage large_number:math temp1[22].a int 1 run scoreboard players operation #temp22 int %= 16 const
execute store result storage large_number:math temp1[23].a int 1 run scoreboard players operation #temp21 int %= 16 const
execute store result storage large_number:math temp1[24].a int 1 run scoreboard players operation #temp38 int %= 16 const
execute store result storage large_number:math temp1[25].a int 1 run scoreboard players operation #temp37 int %= 16 const
execute store result storage large_number:math temp1[26].a int 1 run scoreboard players operation #temp36 int %= 16 const
execute store result storage large_number:math temp1[27].a int 1 run scoreboard players operation #temp35 int %= 16 const
execute store result storage large_number:math temp1[28].a int 1 run scoreboard players operation #temp34 int %= 16 const
execute store result storage large_number:math temp1[29].a int 1 run scoreboard players operation #temp33 int %= 16 const
execute store result storage large_number:math temp1[30].a int 1 run scoreboard players operation #temp32 int %= 16 const
execute store result storage large_number:math temp1[31].a int 1 run scoreboard players operation #temp31 int %= 16 const

data modify storage large_number:math temp1[{a:10}].a set value "a"
data modify storage large_number:math temp1[{a:11}].a set value "b"
data modify storage large_number:math temp1[{a:12}].a set value "c"
data modify storage large_number:math temp1[{a:13}].a set value "d"
data modify storage large_number:math temp1[{a:14}].a set value "e"
data modify storage large_number:math temp1[{a:15}].a set value "f"

#转存，合并字符串
data modify storage large_number:math stemp0 set from storage large_number:math temp1[0].a
data modify storage large_number:math stemp1 set from storage large_number:math temp1[1].a
data modify storage large_number:math stemp2 set from storage large_number:math temp1[2].a
data modify storage large_number:math stemp3 set from storage large_number:math temp1[3].a
data modify storage large_number:math stemp4 set from storage large_number:math temp1[4].a
data modify storage large_number:math stemp5 set from storage large_number:math temp1[5].a
data modify storage large_number:math stemp6 set from storage large_number:math temp1[6].a
data modify storage large_number:math stemp7 set from storage large_number:math temp1[7].a
data modify storage large_number:math stemp9 set from storage large_number:math temp1[8].a
data modify storage large_number:math stemp10 set from storage large_number:math temp1[9].a
data modify storage large_number:math stemp11 set from storage large_number:math temp1[10].a
data modify storage large_number:math stemp12 set from storage large_number:math temp1[11].a
data modify storage large_number:math stemp14 set from storage large_number:math temp1[12].a
data modify storage large_number:math stemp15 set from storage large_number:math temp1[13].a
data modify storage large_number:math stemp16 set from storage large_number:math temp1[14].a
data modify storage large_number:math stemp17 set from storage large_number:math temp1[15].a
data modify storage large_number:math stemp19 set from storage large_number:math temp1[16].a
data modify storage large_number:math stemp20 set from storage large_number:math temp1[17].a
data modify storage large_number:math stemp21 set from storage large_number:math temp1[18].a
data modify storage large_number:math stemp22 set from storage large_number:math temp1[19].a
data modify storage large_number:math stemp24 set from storage large_number:math temp1[20].a
data modify storage large_number:math stemp25 set from storage large_number:math temp1[21].a
data modify storage large_number:math stemp26 set from storage large_number:math temp1[22].a
data modify storage large_number:math stemp27 set from storage large_number:math temp1[23].a
data modify storage large_number:math stemp28 set from storage large_number:math temp1[24].a
data modify storage large_number:math stemp29 set from storage large_number:math temp1[25].a
data modify storage large_number:math stemp30 set from storage large_number:math temp1[26].a
data modify storage large_number:math stemp31 set from storage large_number:math temp1[27].a
data modify storage large_number:math stemp32 set from storage large_number:math temp1[28].a
data modify storage large_number:math stemp33 set from storage large_number:math temp1[29].a
data modify storage large_number:math stemp34 set from storage large_number:math temp1[30].a
data modify storage large_number:math stemp35 set from storage large_number:math temp1[31].a

function large_number:uuid_list_for_hyphen/macro.merge_string with storage large_number:math
