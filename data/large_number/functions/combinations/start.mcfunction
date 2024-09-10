##组合数

#从n个元素中选择k个元素的组合数
#scoreboard players set #combinations.n int 17
#scoreboard players set #combinations.k int 7

#n的范围是0~33

#特殊值判断
scoreboard players reset #sstemp1 int
execute if score #combinations.k int matches 0 run scoreboard players set #sstemp1 int 1
execute if score #combinations.k int matches 1 run scoreboard players operation #sstemp1 int = #combinations.n int
execute if score #combinations.k int = #combinations.n int run scoreboard players set #sstemp1 int 1
scoreboard players operation #store_combinations.k int = #combinations.k int
scoreboard players add #store_combinations.k int 1
execute if score #store_combinations.k int = #combinations.n int run scoreboard players operation #sstemp1 int = #combinations.n int
execute if score #sstemp1 int matches -2147483648.. run return run scoreboard players get #sstemp1 int


execute if score #combinations.n int matches 4 if score #combinations.k int matches 2 run return 6
execute if score #combinations.n int matches 5 if score #combinations.k int matches 2..3 run return 10

execute if score #combinations.n int matches 6 run return run function large_number:combinations/tree/6
execute if score #combinations.n int matches 7 run return run function large_number:combinations/tree/7
execute if score #combinations.n int matches 8 run return run function large_number:combinations/tree/8
execute if score #combinations.n int matches 9 run return run function large_number:combinations/tree/9
execute if score #combinations.n int matches 10 run return run function large_number:combinations/tree/10
execute if score #combinations.n int matches 11 run return run function large_number:combinations/tree/11
execute if score #combinations.n int matches 12 run return run function large_number:combinations/tree/12
execute if score #combinations.n int matches 13 run return run function large_number:combinations/tree/13
execute if score #combinations.n int matches 14 run return run function large_number:combinations/tree/14
execute if score #combinations.n int matches 15 run return run function large_number:combinations/tree/15
execute if score #combinations.n int matches 16 run return run function large_number:combinations/tree/16
execute if score #combinations.n int matches 17 run return run function large_number:combinations/tree/17
execute if score #combinations.n int matches 18 run return run function large_number:combinations/tree/18
execute if score #combinations.n int matches 19 run return run function large_number:combinations/tree/19
execute if score #combinations.n int matches 20 run return run function large_number:combinations/tree/20
execute if score #combinations.n int matches 21 run return run function large_number:combinations/tree/21
execute if score #combinations.n int matches 22 run return run function large_number:combinations/tree/22
execute if score #combinations.n int matches 23 run return run function large_number:combinations/tree/23
execute if score #combinations.n int matches 24 run return run function large_number:combinations/tree/24
execute if score #combinations.n int matches 25 run return run function large_number:combinations/tree/25
execute if score #combinations.n int matches 26 run return run function large_number:combinations/tree/26
execute if score #combinations.n int matches 27 run return run function large_number:combinations/tree/27
execute if score #combinations.n int matches 28 run return run function large_number:combinations/tree/28
execute if score #combinations.n int matches 29 run return run function large_number:combinations/tree/29
execute if score #combinations.n int matches 30 run return run function large_number:combinations/tree/30
execute if score #combinations.n int matches 31 run return run function large_number:combinations/tree/31
execute if score #combinations.n int matches 32 run return run function large_number:combinations/tree/32
execute if score #combinations.n int matches 33 run return run function large_number:combinations/tree/33

return fail
