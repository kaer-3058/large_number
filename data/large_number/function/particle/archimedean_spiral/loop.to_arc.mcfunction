#使用弧长来计算粒子间隔
#圆心角=弧长*180/πr

scoreboard players operation #temp1 large_number.int = #archimedean_spiral.arc_size large_number.int
scoreboard players operation #temp1 large_number.int *= 180 const
execute store result storage large_number:math temp1 int .0000314159265358979323846 run scoreboard players get #temp_r large_number.int
execute store result score #temp_r large_number.int run data get storage large_number:math temp1
scoreboard players operation #temp1 large_number.int /= #temp_r large_number.int
execute if score #archimedean_spiral.arc_size large_number.int matches 1.. if score #temp1 large_number.int matches ..0 run scoreboard players set #temp1 large_number.int 1
execute if score #archimedean_spiral.arc_size large_number.int matches ..-1 if score #temp1 large_number.int matches 0.. run scoreboard players set #temp1 large_number.int -1
execute if score #archimedean_spiral.arc_size large_number.int matches 0 run scoreboard players set #temp1 large_number.int 0
scoreboard players operation #store_startθ large_number.int += #temp1 large_number.int
