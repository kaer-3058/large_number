##三角函数法快速测距

#算法来源：https://github.com/SuperSwordTW/Distance-Trig-Calc-3d

execute if score #dy int matches 0 run scoreboard players operation #dy int >< #dx int
execute if score #dy int matches 0 run scoreboard players operation #dy int >< #dz int

execute as b09e-44-fded-6-efa5ffffef64 run function large_number:fast_distance_trigonometry/tp
execute store result score #distance int run function large_number:fast_distance_trigonometry/sine with storage large_number:math
scoreboard players operation #temp int = #dy int
scoreboard players operation #temp int /= 1000 const
scoreboard players operation #distance int *= #temp int
