data remove storage math sstempd[0]
execute store result score #temp1 int run data get storage math sstempd[0]
execute if score #temp1 int matches 0 run function large_number:infinite_digit_multiply/del_leading_zeros