execute if score #fast_float_reciprocal.1Ea int matches 0 facing 0. ~1 ~ positioned ^ ^ ^.5 rotated ~180 ~ run tp ^ ^ ^.5
execute if score #fast_float_reciprocal.1Ea int matches -1 facing 0. ~.1 ~ positioned ^ ^ ^5 rotated ~180 ~ run tp ^ ^ ^5
execute if score #fast_float_reciprocal.1Ea int matches -2 facing 0. ~.01 ~ positioned ^ ^ ^50 rotated ~180 ~ run tp ^ ^ ^50
execute if score #fast_float_reciprocal.1Ea int matches -3 facing 0. ~.001 ~ positioned ^ ^ ^500 rotated ~180 ~ run tp ^ ^ ^500
execute if score #fast_float_reciprocal.1Ea int matches -4 facing 0. ~.0001 ~ positioned ^ ^ ^5000 rotated ~180 ~ run tp ^ ^ ^5000
execute if score #fast_float_reciprocal.1Ea int matches -5 facing 0. ~.00001 ~ positioned ^ ^ ^50000 rotated ~180 ~ run tp ^ ^ ^50000
execute if score #fast_float_reciprocal.1Ea int matches -6 facing 0. ~.000001 ~ positioned ^ ^ ^500000 rotated ~180 ~ run tp ^ ^ ^500000
data modify storage large_number:math fast_float_reciprocal.output set from entity @s Pos[1]
tp .0 .0 .0
