execute store result score #u2 large_number.int run data get storage large_number:math temp1[-1]
execute store result score #v2 large_number.int run data get storage large_number:math temp2[-1]

execute store result storage large_number:math stemp2 int 1 run scoreboard players operation #u2 large_number.int -= #v2 large_number.int
data modify storage large_number:math temp9 prepend from storage large_number:math stemp2
