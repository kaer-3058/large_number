scoreboard players operation #temp10 large_number.int = #temp2 large_number.int
scoreboard players operation #temp10 large_number.int %= 4 const

scoreboard players add #temp2 large_number.int 1
execute unless score #temp10 large_number.int matches 0 if score #temp1 large_number.int matches 365.. run scoreboard players remove #temp1 large_number.int 365
execute if score #temp10 large_number.int matches 0 if score #temp1 large_number.int matches 366.. run scoreboard players remove #temp1 large_number.int 366

execute if score #temp1 large_number.int matches 365.. run function large_number:timestamp/loop.years_math2
