##组合数

#从n个元素中选择k个元素的组合数
#scoreboard players set #combinations.n large_number.int 17
#scoreboard players set #combinations.k large_number.int 7

#n的范围是0~33

#function large_number:combinations/start

#特殊值判断
scoreboard players reset #sstemp1 large_number.int
execute if score #combinations.k large_number.int matches 0 run scoreboard players set #sstemp1 large_number.int 1
execute if score #combinations.k large_number.int matches 1 run scoreboard players operation #sstemp1 large_number.int = #combinations.n large_number.int
execute if score #combinations.k large_number.int = #combinations.n large_number.int run scoreboard players set #sstemp1 large_number.int 1
scoreboard players operation #store_combinations.k large_number.int = #combinations.k large_number.int
scoreboard players add #store_combinations.k large_number.int 1
execute if score #store_combinations.k large_number.int = #combinations.n large_number.int run scoreboard players operation #sstemp1 large_number.int = #combinations.n large_number.int
execute if score #sstemp1 large_number.int matches -2147483648.. run return run scoreboard players get #sstemp1 large_number.int

execute if score #combinations.n large_number.int matches 4 if score #combinations.k large_number.int matches 2 run return 6
execute if score #combinations.n large_number.int matches 5 if score #combinations.k large_number.int matches 2..3 run return 10

execute store result storage large_number:math temp int 1 run scoreboard players get #combinations.n large_number.int
execute if score #combinations.n large_number.int matches 6..33 run return run function large_number:combinations/index1 with storage large_number:math

return fail
