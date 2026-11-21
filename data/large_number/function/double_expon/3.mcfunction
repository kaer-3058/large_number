#对10E-3~0之间的数字进行读取
scoreboard players set #temp2 large_number.int 0
scoreboard players set #double_expon_output large_number.int 0
execute store result score #temp2 large_number.int run data get storage large_number:math double_expon_input 10
execute if score #temp2 large_number.int matches 1..9 run scoreboard players set #double_expon_output large_number.int -1
execute store result score #temp2 large_number.int run data get storage large_number:math double_expon_input 100
execute if score #temp2 large_number.int matches 1..9 run scoreboard players set #double_expon_output large_number.int -2
execute store result score #temp2 large_number.int run data get storage large_number:math double_expon_input 1000
execute if score #temp2 large_number.int matches 1..9 run scoreboard players set #double_expon_output large_number.int -3
