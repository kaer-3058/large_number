#把数组形式的uuid转成16进制连字符串 - 算术法

#Ethan提供的快速算法

#输入：data modify storage large_number:math uuid_list_for_hyphen.input set value [I;0,0,0,1]
#计算：function large_number:uuid_list_for_hyphen/gc/start
#输出：data get storage large_number:math uuid_list_for_hyphen.output

data modify storage large_number:math temp set value {0:0,1:0,2:0,3:0,4:0,5:0,6:0,7:0,8:0,9:0,a:0,b:0,c:0,d:0,e:0,f:0}

execute store result score #temp0 large_number.int store result score #temp1 large_number.int run data get storage large_number:math uuid_list_for_hyphen.input[0]
execute store result storage large_number:math temp.0 int 1 run scoreboard players operation #temp0 large_number.int %= 256 const
execute store result score #temp2 large_number.int run scoreboard players operation #temp1 large_number.int /= 256 const
execute store result storage large_number:math temp.1 int 1 run scoreboard players operation #temp1 large_number.int %= 256 const
execute store result score #temp3 large_number.int run scoreboard players operation #temp2 large_number.int /= 256 const
execute store result storage large_number:math temp.2 int 1 run scoreboard players operation #temp2 large_number.int %= 256 const
scoreboard players operation #temp3 large_number.int /= 256 const
execute store result storage large_number:math temp.3 int 1 run scoreboard players operation #temp3 large_number.int %= 256 const

execute store result score #temp0 large_number.int store result score #temp1 large_number.int run data get storage large_number:math uuid_list_for_hyphen.input[1]
execute store result storage large_number:math temp.4 int 1 run scoreboard players operation #temp0 large_number.int %= 256 const
execute store result score #temp2 large_number.int run scoreboard players operation #temp1 large_number.int /= 256 const
execute store result storage large_number:math temp.5 int 1 run scoreboard players operation #temp1 large_number.int %= 256 const
execute store result score #temp3 large_number.int run scoreboard players operation #temp2 large_number.int /= 256 const
execute store result storage large_number:math temp.6 int 1 run scoreboard players operation #temp2 large_number.int %= 256 const
scoreboard players operation #temp3 large_number.int /= 256 const
execute store result storage large_number:math temp.7 int 1 run scoreboard players operation #temp3 large_number.int %= 256 const

execute store result score #temp0 large_number.int store result score #temp1 large_number.int run data get storage large_number:math uuid_list_for_hyphen.input[2]
execute store result storage large_number:math temp.8 int 1 run scoreboard players operation #temp0 large_number.int %= 256 const
execute store result score #temp2 large_number.int run scoreboard players operation #temp1 large_number.int /= 256 const
execute store result storage large_number:math temp.9 int 1 run scoreboard players operation #temp1 large_number.int %= 256 const
execute store result score #temp3 large_number.int run scoreboard players operation #temp2 large_number.int /= 256 const
execute store result storage large_number:math temp.a int 1 run scoreboard players operation #temp2 large_number.int %= 256 const
scoreboard players operation #temp3 large_number.int /= 256 const
execute store result storage large_number:math temp.b int 1 run scoreboard players operation #temp3 large_number.int %= 256 const

execute store result score #temp0 large_number.int store result score #temp1 large_number.int run data get storage large_number:math uuid_list_for_hyphen.input[3]
execute store result storage large_number:math temp.c int 1 run scoreboard players operation #temp0 large_number.int %= 256 const
execute store result score #temp2 large_number.int run scoreboard players operation #temp1 large_number.int /= 256 const
execute store result storage large_number:math temp.d int 1 run scoreboard players operation #temp1 large_number.int %= 256 const
execute store result score #temp3 large_number.int run scoreboard players operation #temp2 large_number.int /= 256 const
execute store result storage large_number:math temp.e int 1 run scoreboard players operation #temp2 large_number.int %= 256 const
scoreboard players operation #temp3 large_number.int /= 256 const
execute store result storage large_number:math temp.f int 1 run scoreboard players operation #temp3 large_number.int %= 256 const

function large_number:uuid_list_for_hyphen/gc/hex/get_hexes with storage large_number:math temp
function large_number:uuid_list_for_hyphen/gc/hex/contact_uuid with storage large_number:math temp
data modify storage large_number:math uuid_list_for_hyphen.output set from storage large_number:math q0
