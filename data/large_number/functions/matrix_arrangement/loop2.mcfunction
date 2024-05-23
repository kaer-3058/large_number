execute store result score #sstemp1 int run scoreboard players add #sstempm int 1
scoreboard players operation #sstemp1 int %= 2 const

execute if score #sstempa int matches 1.. run function large_number:matrix_arrangement/loop1

execute store result storage large_number:math temp1 double 0.001 run scoreboard players get #Matrix_arrangement.rsize int
scoreboard players remove #sstempb int 1
execute if score #sstempb int matches 1.. run scoreboard players operation #sstempa int = #Matrix_arrangement.Rows int
execute if score #sstempb int matches 1.. run function large_number:matrix_arrangement/macro2 with storage large_number:math
