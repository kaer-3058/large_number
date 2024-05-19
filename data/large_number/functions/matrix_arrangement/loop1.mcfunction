# {NoAI:1b,Tags:["matrix_arrangement.test1"],Passengers:[],PersistenceRequired:1b,NoGravity:1b}
tp @s ~ ~ ~
execute if score #sstemp1 int matches 0 run function large_number:matrix_arrangement/spider.macro with storage large_number:math
data modify storage large_number:math matrix_arrangement_X append from entity @s Pos[0]
data modify storage large_number:math matrix_arrangement_Z append from entity @s Pos[2]

execute store result storage large_number:math temp1 double 0.001 run scoreboard players get #Matrix_arrangement.csize int
execute store result storage large_number:math temp2 double 0.001 run scoreboard players get #Matrix_arrangement.tab int
scoreboard players remove #sstempa int 1
execute if score #sstempa int matches 1.. run function large_number:matrix_arrangement/macro1 with storage large_number:math
