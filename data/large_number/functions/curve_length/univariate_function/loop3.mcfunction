data modify storage large_number:math stemp1 set from storage large_number:math sstemps[0]
execute store success score #temp1 int run data remove storage large_number:math sstemps[0]
execute if score #temp1 int matches 0 run function large_number:curve_length/univariate_function/loop3.if
execute if score #temp1 int matches 1 run function large_number:curve_length/univariate_function/macro5 with storage large_number:math
