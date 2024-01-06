scoreboard players operation #store_#loga.b.tempinp int = #loga.b.tempinp int

execute if score #loga.b.tempinp int matches 1000000000..2147483647 run scoreboard players set #temp_ln_expon int 10
execute if score #loga.b.tempinp int matches 1000000000..2147483647 run scoreboard players operation #store_#loga.b.tempinp int /= 100 const
execute if score #loga.b.tempinp int matches 100000000..999999999 run scoreboard players set #temp_ln_expon int 9
execute if score #loga.b.tempinp int matches 100000000..999999999 run scoreboard players operation #store_#loga.b.tempinp int /= 10 const
execute if score #loga.b.tempinp int matches 10000000..99999999 run scoreboard players set #temp_ln_expon int 8
execute if score #loga.b.tempinp int matches 1000000..9999999 run scoreboard players set #temp_ln_expon int 7
execute if score #loga.b.tempinp int matches 1000000..9999999 run scoreboard players operation #store_#loga.b.tempinp int *= 10 const
execute if score #loga.b.tempinp int matches 100000..999999 run scoreboard players set #temp_ln_expon int 6
execute if score #loga.b.tempinp int matches 100000..999999 run scoreboard players operation #store_#loga.b.tempinp int *= 100 const
execute if score #loga.b.tempinp int matches 10001..99999 run scoreboard players set #temp_ln_expon int 5
execute if score #loga.b.tempinp int matches 10001..99999 run scoreboard players operation #store_#loga.b.tempinp int *= 1000 const

#备份除数列表
data modify storage math temp_listfront set from storage const e^1-21_list_front
data modify storage math temp_listbehind set from storage const e^1-21_list_behind
data modify storage math temp_listdivexpon set from storage const e^1-21_div_expon_list

function large_number:loga.b/div_loop

execute store result storage math temp int 1.0 run scoreboard players get #temp5 int
execute store result score #loga.b.tempdicimal int run function large_number:loga.b/1..10000 with storage math
