scoreboard players operation #temp10 int = #temp2 int
scoreboard players operation #temp10 int %= 4 const

scoreboard players add #temp2 int 1
execute unless score #temp10 int matches 0 if score #temp1 int matches 365.. run scoreboard players remove #temp1 int 365
execute if score #temp10 int matches 0 if score #temp1 int matches 366.. run scoreboard players remove #temp1 int 366

execute if score #temp1 int matches 365.. run function large_number:timestamp/loop.years_math2
