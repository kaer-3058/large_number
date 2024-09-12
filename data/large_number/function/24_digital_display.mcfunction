##数位显示-24位

#data modify storage large_number:math math_display set value [I;0,0,0,0,0,0]

#data modify storage large_number:math math_display set value [I;9999,9999,9999,9999,9999,9999]

#如输入的数位不足24位，则会自动向前补0

#取数
execute store result score #temp1 int run data get storage large_number:math math_display[-6]
execute store result score #temp2 int run data get storage large_number:math math_display[-5]
execute store result score #temp3 int run data get storage large_number:math math_display[-4]
execute store result score #temp4 int run data get storage large_number:math math_display[-3]
execute store result score #temp5 int run data get storage large_number:math math_display[-2]
execute store result score #temp6 int run data get storage large_number:math math_display[-1]

#测试是否为负数，并取模
scoreboard players set #is- int 0
execute store success score #is- int if score #temp1 int matches ..-1 run scoreboard players operation #temp1 int *= -1 const
execute store success score #is- int if score #temp2 int matches ..-1 run scoreboard players operation #temp2 int *= -1 const
execute store success score #is- int if score #temp3 int matches ..-1 run scoreboard players operation #temp3 int *= -1 const
execute store success score #is- int if score #temp4 int matches ..-1 run scoreboard players operation #temp4 int *= -1 const
execute store success score #is- int if score #temp5 int matches ..-1 run scoreboard players operation #temp5 int *= -1 const
execute store success score #is- int if score #temp6 int matches ..-1 run scoreboard players operation #temp6 int *= -1 const

#转千进制
scoreboard players operation #4.6 int = #temp6 int
scoreboard players operation #4.6 int /= 1000 const
scoreboard players operation #temp5 int *= 10 const
execute store result score #4.5 int run scoreboard players operation #temp5 int += #4.6 int
scoreboard players operation #4.5 int /= 1000 const
scoreboard players operation #temp4 int *= 100 const
execute store result score #4.4 int run scoreboard players operation #temp4 int += #4.5 int
scoreboard players operation #4.4 int /= 1000 const
scoreboard players operation #temp3 int *= 1000 const
execute store result score #4.3 int run scoreboard players operation #temp3 int += #4.4 int
scoreboard players operation #4.3 int /= 1000 const
scoreboard players operation #temp2 int *= 10000 const
execute store result score #4.2 int run scoreboard players operation #temp2 int += #4.3 int
scoreboard players operation #4.2 int /= 1000 const
scoreboard players operation #temp1 int *= 100000 const
execute store result score #4.1 int run scoreboard players operation #temp1 int += #4.2 int

execute store result score #4.0 int run scoreboard players operation #4.1 int /= 1000 const
scoreboard players operation #4.0 int /= 1000 const

scoreboard players operation #temp6 int %= 1000 const
scoreboard players operation #temp5 int %= 1000 const
scoreboard players operation #temp4 int %= 1000 const
scoreboard players operation #temp3 int %= 1000 const
scoreboard players operation #temp2 int %= 1000 const
scoreboard players operation #temp1 int %= 1000 const
scoreboard players operation #4.1 int %= 1000 const

#如果数组为负，则转为负数
data modify storage large_number:math buffer_digital_display_json_is- set value ""
execute if score #is- int matches 1 run data modify storage large_number:math buffer_digital_display_json_is- set value "-"

#补齐数位
execute store result storage large_number:math buffer_digital_display_list[0] int 1 run scoreboard players add #4.0 int 1000
execute store result storage large_number:math buffer_digital_display_list[1] int 1 run scoreboard players add #4.1 int 1000
execute store result storage large_number:math buffer_digital_display_list[2] int 1 run scoreboard players add #temp1 int 1000
execute store result storage large_number:math buffer_digital_display_list[3] int 1 run scoreboard players add #temp2 int 1000
execute store result storage large_number:math buffer_digital_display_list[4] int 1 run scoreboard players add #temp3 int 1000
execute store result storage large_number:math buffer_digital_display_list[5] int 1 run scoreboard players add #temp4 int 1000
execute store result storage large_number:math buffer_digital_display_list[6] int 1 run scoreboard players add #temp5 int 1000
execute store result storage large_number:math buffer_digital_display_list[7] int 1 run scoreboard players add #temp6 int 1000

#数字转字符串
data modify storage large_number:math buffer_digital_display_json[0] set string storage large_number:math buffer_digital_display_list[0] 1
data modify storage large_number:math buffer_digital_display_json[1] set string storage large_number:math buffer_digital_display_list[1] 1
data modify storage large_number:math buffer_digital_display_json[2] set string storage large_number:math buffer_digital_display_list[2] 1
data modify storage large_number:math buffer_digital_display_json[3] set string storage large_number:math buffer_digital_display_list[3] 1
data modify storage large_number:math buffer_digital_display_json[4] set string storage large_number:math buffer_digital_display_list[4] 1
data modify storage large_number:math buffer_digital_display_json[5] set string storage large_number:math buffer_digital_display_list[5] 1
data modify storage large_number:math buffer_digital_display_json[6] set string storage large_number:math buffer_digital_display_list[6] 1
data modify storage large_number:math buffer_digital_display_json[7] set string storage large_number:math buffer_digital_display_list[7] 1

#tellraw @a [{"nbt":"buffer_digital_display_json_is-","storage":"large_number:math"},{"nbt":"buffer_digital_display_json[]","storage":"large_number:math","separator":{"text":","}}]
