execute if score #uuid_list.4B int matches ..47483647 run scoreboard players remove #uuid_list.4A int 1
execute if score #uuid_list.4B int matches ..47483647 run scoreboard players add #uuid_list.4B int 100000000
scoreboard players remove #uuid_list.4B int 47483648
scoreboard players remove #uuid_list.4A int 21
scoreboard players operation #uuid_list.4A int *= 100000000 const
scoreboard players operation #uuid_list.4A int += #uuid_list.4B int
scoreboard players remove #uuid_list.4A int 2147483647
scoreboard players remove #uuid_list.4A int 1