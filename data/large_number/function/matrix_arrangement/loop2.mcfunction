execute store result score #sstemp1 large_number.int run scoreboard players add #sstempm large_number.int 1
scoreboard players operation #sstemp1 large_number.int %= 2 const

execute if score #sstempa large_number.int matches 1.. run function large_number:matrix_arrangement/loop1

execute store result storage large_number:math temp1 double 0.001 run scoreboard players get #Matrix_arrangement.rsize large_number.int
scoreboard players remove #sstempb large_number.int 1
execute if score #sstempb large_number.int matches 1.. run scoreboard players operation #sstempa large_number.int = #Matrix_arrangement.Rows large_number.int
execute if score #sstempb large_number.int matches 1.. run function large_number:matrix_arrangement/macro2 with storage large_number:math
