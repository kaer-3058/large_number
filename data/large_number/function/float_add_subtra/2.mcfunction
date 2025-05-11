#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math float_add_subtra.input1
data modify storage large_number:math temp2 set from storage large_number:math float_add_subtra.input2
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2
