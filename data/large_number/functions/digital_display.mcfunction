##数位显示

#data modify storage math math_display set value [I;0,0,0,0,0,0]

#data modify storage math math_display set value [I;9999,9999,9999,9999,9999,9999]

#取数
execute store result score #temp1 int run data get storage math math_display[-6]
execute store result score #temp2 int run data get storage math math_display[-5]
execute store result score #temp3 int run data get storage math math_display[-4]
execute store result score #temp4 int run data get storage math math_display[-3]
execute store result score #temp5 int run data get storage math math_display[-2]
execute store result score #temp6 int run data get storage math math_display[-1]

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

#补齐数位
data modify storage math math_display_json set value ["","","","","","","",""]
data modify storage math temp1 set value [0,0,0,0,0,0,0,0]
execute store result storage math temp1[0] int 1 run scoreboard players add #4.0 int 1000
execute store result storage math temp1[1] int 1 run scoreboard players add #4.1 int 1000
execute store result storage math temp1[2] int 1 run scoreboard players add #temp1 int 1000
execute store result storage math temp1[3] int 1 run scoreboard players add #temp2 int 1000
execute store result storage math temp1[4] int 1 run scoreboard players add #temp3 int 1000
execute store result storage math temp1[5] int 1 run scoreboard players add #temp4 int 1000
execute store result storage math temp1[6] int 1 run scoreboard players add #temp5 int 1000
execute store result storage math temp1[7] int 1 run scoreboard players add #temp6 int 1000

#数字转字符串
data modify storage math math_display_json[0] set string storage math temp1[0] 1
data modify storage math math_display_json[1] set string storage math temp1[1] 1
data modify storage math math_display_json[2] set string storage math temp1[2] 1
data modify storage math math_display_json[3] set string storage math temp1[3] 1
data modify storage math math_display_json[4] set string storage math temp1[4] 1
data modify storage math math_display_json[5] set string storage math temp1[5] 1
data modify storage math math_display_json[6] set string storage math temp1[6] 1
data modify storage math math_display_json[7] set string storage math temp1[7] 1

#清除整个数组的前导0
execute if score #4.0 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 7 if score #4.1 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 6 if score #temp1 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 5 if score #temp2 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 4 if score #temp3 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 3 if score #temp4 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 2 if score #temp5 int matches 1000 run data remove storage math math_display_json[0]
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 1 if score #temp6 int matches 1000 run data modify storage math math_display_json set value ["0"]

data modify storage math temp1 set string storage math math_display_json[0] 0 2
execute if data storage math {temp1:"00"} run data modify storage math math_display_json[0] set string storage math math_display_json[0] 2
data modify storage math temp1 set string storage math math_display_json[0] 0 1
execute if data storage math {temp1:"0"} run data modify storage math math_display_json[0] set string storage math math_display_json[0] 1
execute store result score #stemp9 int run data get storage math math_display_json
execute if score #stemp9 int matches 1 if data storage math {math_display_json:[""]} run data modify storage math math_display_json set value ["0"]

#如果数组为负，则转为负数
data modify storage math math_display_json_is- set value ""
execute if score #is- int matches 1 run data modify storage math math_display_json_is- set value "-"


#tellraw @a [{"nbt":"math_display_json_is-","storage":"math"},{"nbt":"math_display_json[]","storage":"math","separator":{"text":","}}]