data modify storage large_number:math float_comparison_sizes.A set from storage large_number:math stempd[1].a
function large_number:float_comparison_sizes/start
execute if data storage large_number:math float_comparison_sizes{output:"+"} run data modify storage large_number:math float_comparison_sizes.B set from storage large_number:math stempd[1].a
execute if data storage large_number:math float_comparison_sizes{output:"+"} store result score #stempd_order int run data get storage large_number:math stempd[1].b

data remove storage large_number:math stempd[1]
execute if data storage large_number:math stempd[1] run function large_number:linear_equations/double_extrema/loop1
