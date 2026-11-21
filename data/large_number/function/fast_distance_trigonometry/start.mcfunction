##三角函数法快速测距

#算法来源：https://github.com/SuperSwordTW/Distance-Trig-Calc-3d

execute if score #dy large_number.int matches 0 run scoreboard players operation #dy large_number.int >< #dx large_number.int
execute if score #dy large_number.int matches 0 run scoreboard players operation #dy large_number.int >< #dz large_number.int

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:fast_distance_trigonometry/tp
execute store result score #distance large_number.int run function large_number:fast_distance_trigonometry/sine with storage large_number:math
scoreboard players operation #temp large_number.int = #dy large_number.int
scoreboard players operation #temp large_number.int /= 1000 const
scoreboard players operation #distance large_number.int *= #temp large_number.int
