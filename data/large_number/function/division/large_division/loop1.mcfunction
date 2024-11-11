data remove storage large_number:math temp1[0]
data remove storage large_number:math temp2[0]
execute store result score #temp1 int run data get storage large_number:math temp1[0]
execute store result score #temp2 int run data get storage large_number:math temp2[0]
execute if score #temp1 int = #temp2 int if data storage large_number:math temp1[0] run function large_number:division/large_division/loop1
