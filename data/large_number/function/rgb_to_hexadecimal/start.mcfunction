##颜色RGB转16进制

#scoreboard players set #rgb_to_hexadecimal.R large_number.int 16
#scoreboard players set #rgb_to_hexadecimal.G large_number.int 16
#scoreboard players set #rgb_to_hexadecimal.B large_number.int 16

scoreboard players operation #temp11 large_number.int = #rgb_to_hexadecimal.R large_number.int
scoreboard players operation #temp2 large_number.int = #rgb_to_hexadecimal.G large_number.int
scoreboard players operation #temp11 large_number.int *= 65536 const
scoreboard players operation #temp2 large_number.int *= 256 const
scoreboard players operation #temp11 large_number.int += #temp2 large_number.int
execute store result score #temp12 large_number.int run scoreboard players operation #temp11 large_number.int += #rgb_to_hexadecimal.B large_number.int

execute store result score #temp13 large_number.int run scoreboard players operation #temp12 large_number.int /= 16 const
execute store result score #temp14 large_number.int run scoreboard players operation #temp13 large_number.int /= 16 const
execute store result score #temp15 large_number.int run scoreboard players operation #temp14 large_number.int /= 16 const
execute store result score #temp16 large_number.int run scoreboard players operation #temp15 large_number.int /= 16 const
scoreboard players operation #temp16 large_number.int /= 16 const

data modify storage large_number:math temp1 set value [{a:0},{a:0},{a:0},{a:0},{a:0},{a:0}]
execute store result storage large_number:math temp1[0].a int 1 run scoreboard players operation #temp16 large_number.int %= 16 const
execute store result storage large_number:math temp1[1].a int 1 run scoreboard players operation #temp15 large_number.int %= 16 const
execute store result storage large_number:math temp1[2].a int 1 run scoreboard players operation #temp14 large_number.int %= 16 const
execute store result storage large_number:math temp1[3].a int 1 run scoreboard players operation #temp13 large_number.int %= 16 const
execute store result storage large_number:math temp1[4].a int 1 run scoreboard players operation #temp12 large_number.int %= 16 const
execute store result storage large_number:math temp1[5].a int 1 run scoreboard players operation #temp11 large_number.int %= 16 const

data modify storage large_number:math temp1[{a:10}] set value {a:"a"}
data modify storage large_number:math temp1[{a:11}] set value {a:"b"}
data modify storage large_number:math temp1[{a:12}] set value {a:"c"}
data modify storage large_number:math temp1[{a:13}] set value {a:"d"}
data modify storage large_number:math temp1[{a:14}] set value {a:"e"}
data modify storage large_number:math temp1[{a:15}] set value {a:"f"}

data modify storage large_number:math stemp0 set from storage large_number:math temp1[0].a
data modify storage large_number:math stemp1 set from storage large_number:math temp1[1].a
data modify storage large_number:math stemp2 set from storage large_number:math temp1[2].a
data modify storage large_number:math stemp3 set from storage large_number:math temp1[3].a
data modify storage large_number:math stemp4 set from storage large_number:math temp1[4].a
data modify storage large_number:math stemp5 set from storage large_number:math temp1[5].a

function large_number:rgb_to_hexadecimal/merge_string with storage large_number:math
