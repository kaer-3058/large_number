execute store result score #temp1 large_number.int run data get storage large_number:math temp1[0]
execute if score #temp1 large_number.int matches 1.. run function large_number:random/hypergeometric_distribution/loop2

scoreboard players add #sstemp.point large_number.int 1
data remove storage large_number:math temp1[0]
execute if data storage large_number:math temp1[0] run function large_number:random/hypergeometric_distribution/loop1
