data modify storage large_number:math float_comparison_sizes.A set from storage large_number:math stemp0[0]
data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math stemp0[1]
data modify storage large_number:math s0 set from storage large_number:math stemp0
data modify storage large_number:math s1 set from storage large_number:math stemp1
function large_number:float_comparison_sizes/start
data modify storage large_number:math stemp0 set from storage large_number:math s0
data modify storage large_number:math stemp1 set from storage large_number:math s1

execute if data storage large_number:math float_comparison_sizes{output:"-"} run function large_number:list_operation/sort/double_descending_order/if1

data modify storage large_number:math stemp1 append from storage large_number:math stemp0[0]
data remove storage large_number:math stemp0[0]
execute if data storage large_number:math stemp0[1] run function large_number:list_operation/sort/double_descending_order/loop2
