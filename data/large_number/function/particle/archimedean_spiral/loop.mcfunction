scoreboard players operation #temp_r large_number.int = #store_startθ large_number.int
scoreboard players operation #temp_r large_number.int *= #archimedean_spiral.b large_number.int
scoreboard players operation #temp large_number.int = #archimedean_spiral.a large_number.int
scoreboard players operation #temp large_number.int *= 100 const
execute store result storage large_number:math temp1 double .00001 run scoreboard players operation #temp_r large_number.int += #temp large_number.int
execute store result storage large_number:math temp2 double .01 run scoreboard players get #store_startθ large_number.int
execute as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:particle/archimedean_spiral/macro1 with storage large_number:math

scoreboard players add #sstempd large_number.int 1
execute unless score #sstempd large_number.int > #archimedean_spiral.to_arc large_number.int run scoreboard players operation #store_startθ large_number.int += #archimedean_spiral.θ_size large_number.int
execute if score #sstempd large_number.int > #archimedean_spiral.to_arc large_number.int run function large_number:particle/archimedean_spiral/loop.to_arc

scoreboard players remove #store_loops large_number.int 1
execute if score #store_loops large_number.int matches 1.. run function large_number:particle/archimedean_spiral/loop
