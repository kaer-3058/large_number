execute store success score #5.1 int run data modify storage large_number:math temp2[0].a set value "E"
execute store success score #5.2 int run data modify storage large_number:math temp2[1].a set value "E"
execute store success score #5.3 int run data modify storage large_number:math temp2[2].a set value "E"
execute store success score #5.4 int run data modify storage large_number:math temp2[3].a set value "E"

execute if score #5.1 int matches 0 run data modify storage large_number:math temp_expon set string storage large_number:math temp1 -4
execute if score #5.2 int matches 0 run data modify storage large_number:math temp_expon set string storage large_number:math temp1 -3
execute if score #5.3 int matches 0 run data modify storage large_number:math temp_expon set string storage large_number:math temp1 -2
execute if score #5.4 int matches 0 run data modify storage large_number:math temp_expon set string storage large_number:math temp1 -1
execute if score #5.1 int matches 0 run data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -5
execute if score #5.2 int matches 0 run data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -4
execute if score #5.3 int matches 0 run data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -3
execute if score #5.4 int matches 0 run data modify storage large_number:math temp1 set string storage large_number:math temp1 0 -2