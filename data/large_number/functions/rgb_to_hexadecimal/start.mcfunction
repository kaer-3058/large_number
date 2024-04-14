##颜色RGB转16进制

#scoreboard players set #rgb_to_hexadecimal.R int 16
#scoreboard players set #rgb_to_hexadecimal.G int 16
#scoreboard players set #rgb_to_hexadecimal.B int 16

scoreboard players operation #temp11 int = #rgb_to_hexadecimal.R int
scoreboard players operation #temp2 int = #rgb_to_hexadecimal.G int
scoreboard players operation #temp11 int *= 65536 const
scoreboard players operation #temp2 int *= 256 const
scoreboard players operation #temp11 int += #temp2 int
execute store result score #temp12 int run scoreboard players operation #temp11 int += #rgb_to_hexadecimal.B int

execute store result score #temp13 int run scoreboard players operation #temp12 int /= 16 const
execute store result score #temp14 int run scoreboard players operation #temp13 int /= 16 const
execute store result score #temp15 int run scoreboard players operation #temp14 int /= 16 const
execute store result score #temp16 int run scoreboard players operation #temp15 int /= 16 const
scoreboard players operation #temp16 int /= 16 const

data modify storage math temp1 set value [{a:0},{a:0},{a:0},{a:0},{a:0},{a:0}]
execute store result storage math temp1[0].a int 1 run scoreboard players operation #temp16 int %= 16 const
execute store result storage math temp1[1].a int 1 run scoreboard players operation #temp15 int %= 16 const
execute store result storage math temp1[2].a int 1 run scoreboard players operation #temp14 int %= 16 const
execute store result storage math temp1[3].a int 1 run scoreboard players operation #temp13 int %= 16 const
execute store result storage math temp1[4].a int 1 run scoreboard players operation #temp12 int %= 16 const
execute store result storage math temp1[5].a int 1 run scoreboard players operation #temp11 int %= 16 const

data modify storage math temp1[{a:10}].a set value "a"
data modify storage math temp1[{a:11}].a set value "b"
data modify storage math temp1[{a:12}].a set value "c"
data modify storage math temp1[{a:13}].a set value "d"
data modify storage math temp1[{a:14}].a set value "e"
data modify storage math temp1[{a:15}].a set value "f"

data modify storage math stemp0 set from storage math temp1[0].a
data modify storage math stemp1 set from storage math temp1[1].a
data modify storage math stemp2 set from storage math temp1[2].a
data modify storage math stemp3 set from storage math temp1[3].a
data modify storage math stemp4 set from storage math temp1[4].a
data modify storage math stemp5 set from storage math temp1[5].a

function large_number:rgb_to_hexadecimal/merge_string with storage math
