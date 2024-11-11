data remove storage large_number:math sstempz[-1]
execute store result score #temp1 int run data get storage large_number:math sstempz[-1]
execute if score #temp1 int matches 0 if data storage large_number:math sstempz[-2] run function large_number:division/large_division/del_zero_2
