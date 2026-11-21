scoreboard players add #temp2 large_number.int 4
scoreboard players remove #temp1 large_number.int 1461
execute if score #temp1 large_number.int matches 1461.. run function large_number:timestamp/loop.years_math
