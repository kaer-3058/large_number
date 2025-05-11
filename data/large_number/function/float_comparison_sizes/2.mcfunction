#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math temp_compar_a
data modify storage large_number:math temp2 set from storage large_number:math temp_compar_b
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

#给出结果
data modify storage large_number:math stempu set string storage large_number:math temp1 0 1
execute unless data storage large_number:math {stempu:"-"} run data modify storage large_number:math stempu set value "+"
data modify storage large_number:math temp1 set from storage large_number:math temp_compar_a
execute store success score #temp int run data modify storage large_number:math temp1 set from storage large_number:math temp_compar_b
execute if score #temp int matches 0 run data modify storage large_number:math stempu set value "="
data modify storage large_number:math float_comparison_sizes.output set from storage large_number:math stempu
