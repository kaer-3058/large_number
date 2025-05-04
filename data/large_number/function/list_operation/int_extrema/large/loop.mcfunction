execute store result storage large_number:math float_comparison_sizes_A double 1 run data get storage large_number:math stempd[1]

#为防止因记分板加减法的特性：int值溢出会向上/下溢出，例如-2147483647-7=2147483642，所以使用了浮点算法进行比较
function large_number:list_operation/int_extrema/large/float_comparison_sizes

execute if data storage large_number:math {stempu:"max"} if data storage large_number:math {float_comparison_sizes_output:"+"} run data modify storage large_number:math float_comparison_sizes_B set from storage large_number:math stempd[1]
execute if data storage large_number:math {stempu:"min"} if data storage large_number:math {float_comparison_sizes_output:"-"} run data modify storage large_number:math float_comparison_sizes_B set from storage large_number:math stempd[1]

data remove storage large_number:math stempd[1]
execute if data storage large_number:math stempd[1] run function large_number:list_operation/int_extrema/large/loop
