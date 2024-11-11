data remove storage large_number:math sstemp2[0]
execute store result score #temp1 int run data get storage large_number:math sstemp2[0]
execute if score #temp1 int matches 0 if data storage large_number:math sstemp2[1] run function large_number:division/large_list_div_const/del_leading_zeros
