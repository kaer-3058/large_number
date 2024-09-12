#使用弧长来计算粒子间隔
#圆心角=弧长*180/πr

scoreboard players operation #temp1 int = #archimedean_spiral.arc_size int
scoreboard players operation #temp1 int *= 180 const
execute store result storage large_number:math temp1 int .0000314159265358979323846 run scoreboard players get #temp_r int
execute store result score #temp_r int run data get storage large_number:math temp1
scoreboard players operation #temp1 int /= #temp_r int
execute if score #archimedean_spiral.arc_size int matches 1.. if score #temp1 int matches ..0 run scoreboard players set #temp1 int 1
execute if score #archimedean_spiral.arc_size int matches ..-1 if score #temp1 int matches 0.. run scoreboard players set #temp1 int -1
execute if score #archimedean_spiral.arc_size int matches 0 run scoreboard players set #temp1 int 0
scoreboard players operation #store_startθ int += #temp1 int
