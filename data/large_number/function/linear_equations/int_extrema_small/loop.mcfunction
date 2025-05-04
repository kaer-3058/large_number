execute store result score #float_comparison_sizes_A int run data get storage large_number:math stempd[1]

scoreboard players operation #float_comparison_sizes_A int -= #float_comparison_sizes_B int

execute if score #float_comparison_sizes_A int matches ..-1 store result score #float_comparison_sizes_B int run data get storage large_number:math stempd[1]

data remove storage large_number:math stempd[1]
execute if data storage large_number:math stempd[1] run function large_number:linear_equations/int_extrema_small/loop
