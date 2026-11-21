#loop
scoreboard players add #geometric_distribution.output large_number.int 1
execute unless predicate large_number:chance_any if score #geometric_distribution.output large_number.int < #geometric_distribution.times large_number.int run function large_number:random/geometric_distribution/loop1
