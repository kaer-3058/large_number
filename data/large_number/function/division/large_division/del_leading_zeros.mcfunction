data remove storage large_number:math div_1[0]
execute store result score #temp1 int run data get storage large_number:math div_1[0]
execute if score #temp1 int matches 0 if data storage large_number:math div_1[1] run function large_number:division/large_division/del_leading_zeros