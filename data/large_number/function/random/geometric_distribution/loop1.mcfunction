#loop
scoreboard players add #geometric_distribution.output int 1
execute unless predicate large_number:chance_any if score #geometric_distribution.output int < #geometric_distribution.times int run function large_number:random/geometric_distribution/loop1
