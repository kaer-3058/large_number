##数位显示

#data modify storage math math_display set value [I;0,0,0,0,0,0]

#data modify storage math math_display set value [I;9999,9999,9999,9999,9999,9999]

#取数
execute store result score #temp1 int run data get storage math math_display[0]
execute store result score #temp2 int run data get storage math math_display[1]
execute store result score #temp3 int run data get storage math math_display[2]
execute store result score #temp4 int run data get storage math math_display[3]
execute store result score #temp5 int run data get storage math math_display[4]
execute store result score #temp6 int run data get storage math math_display[5]

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


#去除前导0，模式1~9
scoreboard players set #digit_mode int 0
execute unless score #4.0 int matches 0 run scoreboard players set #digit_mode int 1
execute if score #4.0 int matches 0 unless score #4.1 int matches 0 run scoreboard players set #digit_mode int 2
execute if score #4.0 int matches 0 if score #4.1 int matches 0 unless score #temp1 int matches 0 run scoreboard players set #digit_mode int 3
execute if score #4.0 int matches 0 if score #4.1 int matches 0 if score #temp1 int matches 0 unless score #temp2 int matches 0 run scoreboard players set #digit_mode int 4
execute if score #4.0 int matches 0 if score #4.1 int matches 0 if score #temp1 int matches 0 if score #temp2 int matches 0 unless score #temp3 int matches 0 run scoreboard players set #digit_mode int 5
execute if score #4.0 int matches 0 if score #4.1 int matches 0 if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 unless score #temp4 int matches 0 run scoreboard players set #digit_mode int 6
execute if score #4.0 int matches 0 if score #4.1 int matches 0 if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 if score #temp4 int matches 0 unless score #temp5 int matches 0 run scoreboard players set #digit_mode int 7
execute if score #4.0 int matches 0 if score #4.1 int matches 0 if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 if score #temp4 int matches 0 if score #temp5 int matches 0 unless score #temp6 int matches 0 run scoreboard players set #digit_mode int 8
execute if score #4.0 int matches 0 if score #4.1 int matches 0 if score #temp1 int matches 0 if score #temp2 int matches 0 if score #temp3 int matches 0 if score #temp4 int matches 0 if score #temp5 int matches 0 if score #temp6 int matches 0 run scoreboard players set #digit_mode int 9


data modify storage math math_display_json set value [{a:'{"score":{"name":"#4.0","objective":"int"}}'},{a:'{"score":{"name":"#4.1","objective":"int"}}'},{a:'{"score":{"name":"#temp1","objective":"int"}}'},{a:'{"score":{"name":"#temp2","objective":"int"}}'},{a:'{"score":{"name":"#temp3","objective":"int"}}'},{a:'{"score":{"name":"#temp4","objective":"int"}}'},{a:'{"score":{"name":"#temp5","objective":"int"}}'},{a:'{"score":{"name":"#temp6","objective":"int"}}'}]

execute if score #digit_mode int matches 2.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 3.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 4.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 5.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 6.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 7.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 8.. run data remove storage math math_display_json[0]
execute if score #digit_mode int matches 9 run data modify storage math math_display_json set value [{a:'{"text":"0"}'}]

execute if score #digit_mode int matches 1 if score #4.1 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#4.1","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#4.1","objective":"int"}}]'
execute if score #digit_mode int matches 1 if score #4.1 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#4.1","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#4.1","objective":"int"}}]'
execute if score #digit_mode int matches ..2 if score #temp1 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp1","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#temp1","objective":"int"}}]'
execute if score #digit_mode int matches ..2 if score #temp1 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp1","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#temp1","objective":"int"}}]'
execute if score #digit_mode int matches ..3 if score #temp2 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp2","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#temp2","objective":"int"}}]'
execute if score #digit_mode int matches ..3 if score #temp2 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp2","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#temp2","objective":"int"}}]'
execute if score #digit_mode int matches ..4 if score #temp3 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp3","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#temp3","objective":"int"}}]'
execute if score #digit_mode int matches ..4 if score #temp3 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp3","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#temp3","objective":"int"}}]'
execute if score #digit_mode int matches ..5 if score #temp4 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp4","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#temp4","objective":"int"}}]'
execute if score #digit_mode int matches ..5 if score #temp4 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp4","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#temp4","objective":"int"}}]'
execute if score #digit_mode int matches ..6 if score #temp5 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp5","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#temp5","objective":"int"}}]'
execute if score #digit_mode int matches ..6 if score #temp5 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp5","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#temp5","objective":"int"}}]'
execute if score #digit_mode int matches ..7 if score #temp6 int matches 10..99 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp6","objective":"int"}}'}].a set value '[{"text":"0"},{"score":{"name":"#temp6","objective":"int"}}]'
execute if score #digit_mode int matches ..7 if score #temp6 int matches 0..9 run data modify storage math math_display_json[{a:'{"score":{"name":"#temp6","objective":"int"}}'}].a set value '[{"text":"00"},{"score":{"name":"#temp6","objective":"int"}}]'

execute if score #is- int matches 0 run data modify storage math math_display_json_string set value '{"nbt":"math_display_json[].a","storage":"math","interpret":true,"separator":{"text":","}}'
execute if score #is- int matches 1 run data modify storage math math_display_json_string set value '[{"text":"-"},{"nbt":"math_display_json[].a","storage":"math","interpret":true,"separator":{"text":","}}]'

#tellraw @a {"nbt":"math_display_json_string","storage":"math","interpret":true}
