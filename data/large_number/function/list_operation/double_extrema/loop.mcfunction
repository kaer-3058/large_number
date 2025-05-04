data modify storage large_number:math float_comparison_sizes.A set from storage large_number:math stempd[1]
function large_number:float_comparison_sizes/start
execute if data storage large_number:math {stempu:"max"} if data storage large_number:math float_comparison_sizes{output:"+"} run data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math stempd[1]
execute if data storage large_number:math {stempu:"min"} if data storage large_number:math float_comparison_sizes{output:"-"} run data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math stempd[1]

data remove storage large_number:math stempd[1]
execute if data storage large_number:math stempd[1] run function large_number:list_operation/double_extrema/loop
