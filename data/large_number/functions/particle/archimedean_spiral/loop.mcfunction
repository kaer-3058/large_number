scoreboard players operation #temp_r int = #store_startθ int
scoreboard players operation #temp_r int *= #archimedean_spiral.b int
scoreboard players operation #temp int = #archimedean_spiral.a int
scoreboard players operation #temp int *= 100 const
execute store result storage large_number:math temp1 double .00001 run scoreboard players operation #temp_r int += #temp int
execute store result storage large_number:math temp2 double .01 run scoreboard players get #store_startθ int
execute in minecraft:overworld as b09e-44-fded-6-efa5ffffef64 positioned .0 .0 .0 run function large_number:particle/archimedean_spiral/macro1 with storage large_number:math

scoreboard players add #sstempd int 1
execute unless score #sstempd int > #archimedean_spiral.to_arc int run scoreboard players operation #store_startθ int += #archimedean_spiral.θ_size int
execute if score #sstempd int > #archimedean_spiral.to_arc int run function large_number:particle/archimedean_spiral/loop.to_arc

scoreboard players remove #store_loops int 1
execute if score #store_loops int matches 1.. run function large_number:particle/archimedean_spiral/loop
