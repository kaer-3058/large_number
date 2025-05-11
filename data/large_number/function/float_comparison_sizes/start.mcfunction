##浮点数比大小

#data modify storage large_number:math float_comparison_sizes.A set value 6.74503
#data modify storage large_number:math float_comparison_sizes.B set value 6.74502
#A 比较 B，"+"为更大，"-"为更小，"="为相等

data modify storage large_number:math temp_compar_a set from storage large_number:math float_comparison_sizes.A
data modify storage large_number:math temp_compar_b set from storage large_number:math float_comparison_sizes.B

data modify storage large_number:math stemp1 set string storage large_number:math temp_compar_a 0 1
data modify storage large_number:math stemp2 set string storage large_number:math temp_compar_b 0 1

execute unless data storage large_number:math {stemp1:"-"} if data storage large_number:math {stemp2:"-"} run data modify storage large_number:math float_comparison_sizes.output set value "+"
execute if data storage large_number:math {stemp1:"-"} unless data storage large_number:math {stemp2:"-"} run data modify storage large_number:math float_comparison_sizes.output set value "-"

scoreboard players set #temp1 int 0
execute if data storage large_number:math {stemp1:"-"} if data storage large_number:math {stemp2:"-"} run scoreboard players set #temp1 int 1
execute unless data storage large_number:math {stemp1:"-"} unless data storage large_number:math {stemp2:"-"} run scoreboard players set #temp1 int 1
execute if score #temp1 int matches 1 run function large_number:float_comparison_sizes/2
