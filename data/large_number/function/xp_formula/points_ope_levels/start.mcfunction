##大数计算 - 经验总数逆推经验等级和经验余数
#反向经验公式：[√(72x-54215) +307] / 18 (x≥1758)
#经验公式是个一元二次方程，对其用求根公式反推，然后只保留x≥0的根，得到了这个反向经验公式
#理论上输入值不应大于 2.07526*10^19

#输入：data modify storage large_number:math xp_points_ope_levels.input set value [I;0,0,0,0,0]

execute store result score #xp_2.input[0] int run data get storage large_number:math xp_points_ope_levels.input[-5]
execute store result score #xp_2.input[1] int run data get storage large_number:math xp_points_ope_levels.input[-4]
execute store result score #xp_2.input[2] int run data get storage large_number:math xp_points_ope_levels.input[-3]
execute store result score #xp_2.input[3] int run data get storage large_number:math xp_points_ope_levels.input[-2]
execute store result score #xp_2.input[4] int run data get storage large_number:math xp_points_ope_levels.input[-1]

scoreboard players operation #storeT_xp_2.input[0] int = #xp_2.input[0] int
scoreboard players operation #storeT_xp_2.input[1] int = #xp_2.input[1] int
scoreboard players operation #storeT_xp_2.input[2] int = #xp_2.input[2] int
scoreboard players operation #storeT_xp_2.input[3] int = #xp_2.input[3] int
scoreboard players operation #storeT_xp_2.input[4] int = #xp_2.input[4] int

# 0..351
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 0 if score #storeT_xp_2.input[4] int matches 0..351 store result storage large_number:math xp_points_ope_levels.output_levels int 1 run function large_number:xp_formula/points_ope_levels/0..351

# 352..1757
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 0 if score #storeT_xp_2.input[4] int matches 352..1757 store result storage large_number:math xp_points_ope_levels.output_levels int 1 run function large_number:xp_formula/points_ope_levels/352..1757

scoreboard players set #mode int 0

# 1758..2982,6793
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 0 if score #storeT_xp_2.input[4] int matches 1758.. run scoreboard players set #mode int 1
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 1..2981 run scoreboard players set #mode int 1
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 2982 if score #storeT_xp_2.input[4] int matches ..6793 run scoreboard players set #mode int 1

# 2982,6794..138,8888,8888,9520
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 2982 if score #storeT_xp_2.input[4] int matches 6794.. run scoreboard players set #mode int 2
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 0 if score #storeT_xp_2.input[3] int matches 2983.. run scoreboard players set #mode int 2
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 0 if score #storeT_xp_2.input[2] int matches 1.. run scoreboard players set #mode int 2
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 1..137 run scoreboard players set #mode int 2
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 138 if score #storeT_xp_2.input[2] int matches ..8887 run scoreboard players set #mode int 2
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 138 if score #storeT_xp_2.input[2] int matches 8888 if score #storeT_xp_2.input[3] int matches ..8887 run scoreboard players set #mode int 2
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 138 if score #storeT_xp_2.input[2] int matches 8888 if score #storeT_xp_2.input[3] int matches 8888 if score #storeT_xp_2.input[4] int matches ..9520 run scoreboard players set #mode int 2

# 138888888889642..
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 138 if score #storeT_xp_2.input[2] int matches 8888 if score #storeT_xp_2.input[3] int matches 8888 if score #storeT_xp_2.input[4] int matches 9642.. run scoreboard players set #mode int 3
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 138 if score #storeT_xp_2.input[2] int matches 8888 if score #storeT_xp_2.input[3] int matches 8889.. run scoreboard players set #mode int 3
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 138 if score #storeT_xp_2.input[2] int matches 8889.. run scoreboard players set #mode int 3
execute if score #storeT_xp_2.input[0] int matches 0 if score #storeT_xp_2.input[1] int matches 139.. run scoreboard players set #mode int 3
execute if score #storeT_xp_2.input[0] int matches 1.. run scoreboard players set #mode int 3

execute if score #mode int matches 1 run function large_number:xp_formula/points_ope_levels/1758..29826793
execute if score #mode int matches 2 run function large_number:xp_formula/points_ope_levels/29826794..138888888889520
execute if score #mode int matches 3 run function large_number:xp_formula/points_ope_levels/138888888889521..
