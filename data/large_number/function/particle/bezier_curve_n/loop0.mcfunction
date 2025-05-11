#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempa0[0]
data modify storage large_number:math temp2 set from storage large_number:math temp_1c1x5s5_x
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math sstempa append from storage large_number:math temp1

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempb0[0]
data modify storage large_number:math temp2 set from storage large_number:math temp_1c1x5s5_y
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math sstempb append from storage large_number:math temp1

#浮点减法
data modify storage large_number:math temp1 set from storage large_number:math sstempc0[0]
data modify storage large_number:math temp2 set from storage large_number:math temp_1c1x5s5_z
data modify storage large_number:math stemp1 set string storage large_number:math temp2 0 1
execute if data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.1
execute unless data storage large_number:math {stemp1:"-"} run function large_number:float_comparison_sizes/float_sub_ope.2

data modify storage large_number:math sstempc append from storage large_number:math temp1

data remove storage large_number:math sstempa0[0]
data remove storage large_number:math sstempb0[0]
data remove storage large_number:math sstempc0[0]
execute if data storage large_number:math sstempa0[0] run function large_number:particle/bezier_curve_n/loop0
