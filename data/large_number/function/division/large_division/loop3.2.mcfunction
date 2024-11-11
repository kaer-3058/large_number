execute store result score #u2 int run data get storage large_number:math temp1[-1]
execute store result score #v2 int run data get storage large_number:math temp2[-1]

execute store result storage large_number:math stemp2 int 1 run scoreboard players operation #u2 int -= #v2 int
data modify storage large_number:math temp9 prepend from storage large_number:math stemp2
