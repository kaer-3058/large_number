data modify storage large_number:math temp1 set value ""
data modify storage large_number:math temp1 set string storage large_number:math temp2 -1
execute unless data storage large_number:math {temp1:"."} run data modify storage large_number:math sstempf set string storage large_number:math temp2 -1
execute unless data storage large_number:math {temp1:"."} run data modify storage large_number:math temp2 set string storage large_number:math temp2 0 -1
execute store result score #sstemp1 int run data get storage large_number:math temp2
execute if score #sstemp1 int matches 1.. unless data storage large_number:math {temp1:"."} run function large_number:round_double/loop1
